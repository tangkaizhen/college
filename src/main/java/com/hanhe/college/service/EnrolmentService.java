package com.hanhe.college.service;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import com.google.common.collect.Maps;
import com.hanhe.college.dto.ExamResultDTO;
import com.hanhe.college.entity.*;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;

import com.albaba.tools.util.DateUtil;
import com.github.pagehelper.PageHelper;
import com.google.common.base.Joiner;
import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dao.*;
import com.hanhe.college.dto.EnrolmentDTO;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.param.wechat.EnrolmentParam;
import com.hanhe.college.util.BeanValidator;

/**
 * Created by Angelo on 2018/8/24.
 */
@Service
public class EnrolmentService {
    @Autowired
    private EnrolmentMapper enrolmentMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private TrainingSiteMapper trainingSiteMapper;
    @Autowired
    private TrainingSiteTypeMapper trainingSiteTypeMapper;
    @Autowired
    private TrainingTypeMapper trainingTypeMapper;
    @Autowired
    private ExamResultMapper examResultMapper;
    @Autowired
    private ExamMapper examMapper;

    /**
     * 培训报名
     */
    public int enroll(EnrolmentParam param) {
        BeanValidator.check(param);

        long userId = param.getUserId();
        long trainingSiteId = param.getTrainingSiteId();
        long trainingTypeId = param.getTrainingTypeId();

        TrainingSite trainingSite = trainingSiteMapper.selectByPrimaryKey(trainingSiteId);
        Preconditions.checkNotNull(trainingSite, "待报名的培训网点不存在");
        if (DateUtil.isExpired(trainingSite.getTrainingEndDate())) {
            throw new ParamException("已过开班结束时间，暂无法报名");
        }
        User user = userMapper.selectByPrimaryKey(userId);
        Preconditions.checkNotNull(user, "用户不存在");
        if (isExist(userId, trainingTypeId)) {
            throw new ParamException("已报名过该培训类型的培训，请勿重复报名");
        }
        if (!isEnrollAvailable(userId, trainingSiteId)) {
            throw new ParamException("已报名过该网点，请勿重复报名");
        }
        // 暂去除考试通过限制
//        if (!isAvailable(userId, trainingSiteId, trainingTypeId)) {
//            throw new ParamException("必须通过相应的综合考试，方可报名");
//        }

        TrainingType trainingType = trainingTypeMapper.selectByPrimaryKey(trainingTypeId);

        Enrolment enrolment = Enrolment.builder().userId(param.getUserId()).trainingSiteId(param.getTrainingSiteId())
                .trainingTypeId(trainingTypeId).trainingType(trainingType.getName()).name(user.getName()).phone(user
                .getPhone()).state(Constants.DEFAULT_STATE_NORMAL).createTime(DateUtil.getNow()).build();
        return enrolmentMapper.insertSelective(enrolment);
    }

    /**
     * 用户报名记录
     */
    public List<EnrolmentDTO> getEnrolments(long userId) {
        List<Enrolment> enrolments = enrolmentMapper.getEnrolments(userId);
        return adapt(enrolments);
    }

    /**
     * 报名人员
     */
    public List<EnrolmentDTO> list(String province, Long trainingSiteId, Integer pageNum, Integer pageSize) {
        if ("全部".equals(province)) {
            province = null;
        }
        if (pageNum == null) {
            pageNum = Constants.DEFAULT_PAGE_NUM;
        }
        if (pageSize == null) {
            pageSize = Constants.DEFAULT_PAGE_SIZE;
        }
        PageHelper.startPage(pageNum, pageSize);
        List<EnrolmentDTO> enrolments = enrolmentMapper.list(province, trainingSiteId);

        // 显示用户各考试科目近5次成绩
        Set<Long> userIds = enrolments.stream().map(enrolment -> enrolment.getUserId())
                .collect(Collectors.toSet());
        List<ExamResult> examResults = examResultMapper.getResults4Users(Joiner.on(",").join(userIds));
        Map<Long, MultiValueMap<String, Integer>> userMap = Maps.newHashMap();
        Map<Long, Exam> examMap = Maps.newHashMap();
        for (ExamResult examResult : examResults) {
            Long userId = examResult.getUserId();
            Long examId = examResult.getExamId();
            MultiValueMap<String, Integer> userExamResults = userMap.get(userId);
            Exam exam = examMap.get(examId);
            if (exam == null) {
                exam = examMapper.selectByPrimaryKey(examId);
                if (exam != null) {
                    examMap.put(examId, exam);
                } else {
                    continue;
                }
            }
            if (userExamResults == null) {
                userExamResults = new LinkedMultiValueMap<>();
                userMap.put(userId, userExamResults);
            }
            String key = exam.getUavType()+ exam.getUserType();
            if (CollectionUtils.isEmpty(userExamResults.get(key)) || userExamResults.get(key).size() < 5) {
                userExamResults.add(key, examResult.getScore());
            }
        }
        for (EnrolmentDTO enrolment : enrolments) {
            Long userId = enrolment.getUserId();
            enrolment.setUserExamResults(userMap.get(userId));
        }
        return enrolments;
    }

    /**
     * 添加备注
     */
    public int saveSpare(long id, String spare) {
        if (StringUtils.isEmpty(spare)) {
            throw new ParamException("备注不能为空");
        }
        Enrolment before = enrolmentMapper.selectByPrimaryKey(id);
        Preconditions.checkNotNull(before, "待备注的报名记录不存在");

        Enrolment after = Enrolment.builder().id(id).spare(spare).build();
        return enrolmentMapper.updateByPrimaryKeySelective(after);
    }

    /**
     * 删除报名人员
     */
    public int delete(long id) {
        Enrolment before = enrolmentMapper.selectByPrimaryKey(id);
        Preconditions.checkNotNull(before, "待删除的报名人员不存在");
        Enrolment after = Enrolment.builder().id(id).state(Constants.DEFAULT_STATE_DELETE).build();
        return enrolmentMapper.updateByPrimaryKeySelective(after);
    }

    private List<EnrolmentDTO> adapt(List<Enrolment> enrolments) {
    	List<EnrolmentDTO> dtoList= Lists.newArrayList();
        List<Long> trainingSiteIds = enrolments.stream().map(enrolment -> enrolment.getTrainingSiteId()).collect(Collectors.toList());
        if (trainingSiteIds != null && trainingSiteIds.size() > 0) {
        	List<TrainingSite> trainingSites = trainingSiteMapper.getByIds(Joiner.on(",").join(trainingSiteIds));
            Map<Long, TrainingSite> trainingSiteMap = trainingSites.stream().collect(Collectors.toMap(TrainingSite::getId, trainingSite -> trainingSite));
            for (Enrolment enrolment : enrolments) {
                dtoList.add(EnrolmentDTO.adapt(enrolment, trainingSiteMap));
            }
        }
        return dtoList;
    }

    public boolean isEnrollAvailable(long userId, long trainingSiteId){
        return enrolmentMapper.isAvailable(userId, trainingSiteId) == 0;
    }

    private boolean isAvailable(long userId, long trainingSiteId, long trainingTypeId) {
        return trainingSiteTypeMapper.isAvailable(userId, trainingSiteId, trainingTypeId) > 0;
    }

    private boolean isExist(long userId, long trainingTypeId) {
        return enrolmentMapper.isExist(userId, trainingTypeId) > 0;
    }
}
