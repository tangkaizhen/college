package com.hanhe.college.service;

import java.util.*;
import java.util.stream.Collectors;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.albaba.tools.util.DateUtil;
import com.google.common.base.Joiner;
import com.google.common.base.Preconditions;
import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dao.*;
import com.hanhe.college.dto.ExamPaperQuestionDTO;
import com.hanhe.college.dto.ExamResultDTO;
import com.hanhe.college.entity.Exam;
import com.hanhe.college.entity.ExamPaper;
import com.hanhe.college.entity.ExamRecord;
import com.hanhe.college.entity.ExamResult;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.param.wechat.ExamParam;
import com.hanhe.college.util.BeanValidator;
import com.hanhe.college.util.StringUtil;

/**
 * Created by Angelo on 2018/8/20.
 */
@Service
public class ExamResultService {
    @Autowired
    private ExamMapper examMapper;
    @Autowired
    private ExamResultMapper examResultMapper;
    @Autowired
    private ExamRecordMapper examRecordMapper;
    @Autowired
    private ExamPaperMapper examPaperMapper;
    @Autowired
    private ExamPaperQuestionMapper examPaperQuestionMapper;

    /**
     * 提交考卷，返回考试结果
     */
    public ExamResultDTO answer(ExamParam param) {
        // 参数校验
        BeanValidator.check(param);
        long examPaperId = param.getExamPaperId();
        ExamPaper examPaper = examPaperMapper.selectByPrimaryKey(examPaperId);
        Preconditions.checkNotNull(examPaper, "所提交的试题不存在");
        Exam exam = examMapper.selectByPrimaryKey(examPaper.getExamId());
        Preconditions.checkNotNull(exam, "系统异常，当前考试不存在");
        if (param.getCostTime() > exam.getSetTime() * 60) {
            throw new ParamException("考试所用时间超过指定时间");
        }
        // 答题内容整理
        // 1-A,2-AB,3-,4-BCD
        String records = param.getRecords();
        List<String> recordList = StringUtil.splitToList(records);
        Map<Long, String> recordMap = Maps.newHashMap();
        for (String record : recordList) {
            List<String> temp = Splitter.on("-").splitToList(record);
            if (temp.size() == 2) {
                recordMap.put(Long.valueOf(temp.get(0)), temp.get(1));
            }
        }

        // 获取所做试卷题目及正确答案
        List<ExamPaperQuestionDTO> paperQuestionDTOList = examPaperQuestionMapper.getByExamPaperId(examPaperId, true);
		Map<Long, ExamPaperQuestionDTO> paperQuestionDTOMap = paperQuestionDTOList.stream().collect(
				Collectors.toMap(ExamPaperQuestionDTO::getQuestionId, examPaperQuestionDTO -> examPaperQuestionDTO));
//        Map<Long, ExamPaperQuestionDTO> paperQuestionDTOMap = new HashMap<Long, ExamPaperQuestionDTO>();
//        for(ExamPaperQuestionDTO dto : paperQuestionDTOList) {
//        	paperQuestionDTOMap.put(dto.getQuestionId(), dto);
//        }
        		
        Set<Long> userQuestionIds = recordMap.keySet();
        Set<Long> questionIds = new HashSet(paperQuestionDTOMap.keySet());

        // 检测试卷题目与所提交题目内容是否一致
        boolean isMatch = false;
        if (questionIds.size() == userQuestionIds.size()) {
            questionIds.removeAll(userQuestionIds);
            if (CollectionUtils.isEmpty(questionIds)) {
                isMatch = true;
            }
        }
        if (!isMatch) {
            throw new ParamException("试题提交内容不匹配");
        }

        // 计算考试结果
        int totalNum = paperQuestionDTOList.size();
        int passNum = 0, failNum = 0, noneNum = 0, score= 0;
        List<ExamRecord> examRecordList = Lists.newArrayList();
        List<Integer> unpassQuestionNumbers = Lists.newArrayList();
        List<ExamPaperQuestionDTO> unpassQuestionList = Lists.newArrayList();
        for (Long questionId : recordMap.keySet()) {
            String answer = recordMap.get(questionId);
            ExamPaperQuestionDTO dto = paperQuestionDTOMap.get(questionId);
            ExamRecord examRecord = ExamRecord.builder().questionId(questionId).answer(answer).build();
            if (dto != null) {
                boolean pass = false;

                String rightAnswer = dto.getExamQuestion().getAnswer();
                if (rightAnswer.equalsIgnoreCase(answer)) {
                    passNum++;
                    score += dto.getQuestionMark();
                    examRecord.setFlag(Constants.EXAM_RESULT_FLAG_PASS);
                    pass = true;
                } else if (StringUtils.isEmpty(answer)) {
                    noneNum++;
                    examRecord.setFlag(Constants.EXAM_RESULT_FLAG_NONE);
                } else {
                    failNum++;
                    examRecord.setFlag(Constants.EXAM_RESULT_FLAG_FAIL);
                }
                if (!pass) {
                    dto.setUserAnswer(answer);
                    unpassQuestionNumbers.add(dto.getQuestionNumber());
                    unpassQuestionList.add(dto);
                }
                examRecordList.add(examRecord);
            }
        }
        if (passNum + failNum + noneNum < totalNum) {
            noneNum = totalNum - passNum - failNum;
        }
        // 错误题目题号按顺序排序后，拼接成以“、”相隔的字符串
        String unpassQuestions = Joiner.on("、").join(unpassQuestionNumbers.stream().sorted().collect(Collectors.toList()));
        ExamResult examResult = ExamResult.builder().userId(param.getUserId()).examId(exam.getId())
                .userTypeId(exam.getUserTypeId()).uavTypeId(exam.getUavTypeId()).examPaperId(examPaperId)
                .courseCategoryId(exam.getCourseCategoryId()).type(exam.getType())
                .costTime(param.getCostTime()).totalNum(totalNum).passNum(passNum).failNum(failNum).noneNum(noneNum)
                .score(score).unpassQuestions(unpassQuestions).success(!(score < exam.getPassMark().intValue()))
                .createTime(DateUtil.getNow()).build();
        examResultMapper.insertSelective(examResult);
        long examResultId = examResult.getId();
        examRecordList.stream().forEach(examRecord -> examRecord.setExamResultId(examResultId));
        int result = examRecordMapper.batchInsert(examRecordList);
        if (result > 0) {
            // 按试题顺序排序
            unpassQuestionList = unpassQuestionList.stream().sorted(Comparator.comparing(ExamPaperQuestionDTO::getQuestionNumber)).collect(Collectors.toList());
            // 返回考试结果及错误试题
            return ExamResultDTO.adapt(examResult, unpassQuestionList);
        }
        return null;
    }

    public static void main(String[] args) {
//        List<String> a = Splitter.on("-").splitToList("1");
        String[] a = "1-".split("-");
        System.out.println(Arrays.toString(a));
    }
}
