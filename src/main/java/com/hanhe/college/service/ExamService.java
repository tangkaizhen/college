package com.hanhe.college.service;

import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.albaba.tools.util.DateUtil;
import com.albaba.tools.util.IpUtil;
import com.github.pagehelper.PageHelper;
import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dao.*;
import com.hanhe.college.dto.ExamDTO;
import com.hanhe.college.entity.*;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.param.admin.ExamParam;
import com.hanhe.college.util.BeanValidator;

/**
 * Created by Angelo on 2018/8/13.
 */
@Service
public class ExamService {
	@Autowired
	private ExamMapper examMapper;
	@Autowired
	private ExamPaperMapper examPaperMapper;
	@Autowired
	private UserTypeMapper userTypeMapper;
	@Autowired
	private UavTypeMapper uavTypeMapper;
	@Autowired
	private CourseCategoryMapper courseCategoryMapper;
	@Autowired
	private ExamResultMapper examResultMapper;
	@Autowired
	private ExamQuestionMapper examQuestionMapper;
	@Autowired
	private ExamPaperQuestionMapper examPaperQuestionMapper;

	/**
	 * 试卷配置列表
	 */
	public List<Exam> list(Long userTypeId, Long uavTypeId, Long courseCategoryId, Integer pageNum, Integer pageSize) {
		if (pageNum == null) {
			pageNum = Constants.DEFAULT_PAGE_NUM;
		}
		if (pageSize == null) {
			pageSize = Constants.DEFAULT_PAGE_SIZE;
		}
		PageHelper.startPage(pageNum, pageSize);
		return examMapper.list(userTypeId, uavTypeId, courseCategoryId);
	}

	/**
	 * 添加试卷配置
	 */
	public long insert(ExamParam param) {
		BeanValidator.check(param);
//		validate(param);
		if (checkExist(param.getId(), param.getUserTypeId(), param.getUavTypeId(), param.getCourseCategoryId(),
				param.getType())) {
			throw new ParamException("已存在相同类型的试卷");
		}
		UserType userType = userTypeMapper.selectByPrimaryKey(param.getUserTypeId());
		Preconditions.checkNotNull(userType, "指定的身份不存在");
		UavType uavType = uavTypeMapper.selectByPrimaryKey(param.getUavTypeId());
		Preconditions.checkNotNull(uavType, "指定的机型不存在");
		
		Long courseCategoryId = null;
		String courseCategoryName = null;
		if (param.getType() == Constants.EXAM_TYPE_SELF_TEST) {
			CourseCategory courseCategory = courseCategoryMapper.selectByPrimaryKey(param.getCourseCategoryId());
			Preconditions.checkNotNull(courseCategory, "指定的课程类别不存在");
			if (courseCategory.getUserTypeId().longValue() != param.getUserTypeId().longValue()
					|| courseCategory.getUavTypeId().longValue() != param.getUavTypeId().longValue()) {
				throw new ParamException("课程类别与指定的身份/机型不匹配");
			}
			courseCategoryId = param.getCourseCategoryId();
			courseCategoryName = courseCategory.getName();
		}
		int singleCount = param.getSingleCount();
		int multiCount = param.getMultiCount();
		int judgeCount = param.getJudgeCount();
		List<ExamQuestion> singleList = null;
		List<ExamQuestion> multiList = null;
		List<ExamQuestion> judgeList = null;
		if (singleCount > 0) {
			singleList = examQuestionMapper.list(Constants.QUESTION_TYPE_SINGLE, param.getUserTypeId(), param.getUavTypeId(), param.getCourseCategoryId());
			if (singleCount > singleList.size()) {
				throw new ParamException("当前题库中相应的单选题数不足" + singleCount + "个");
			}
		}
		if (multiCount > 0) {
			multiList = examQuestionMapper.list(Constants.QUESTION_TYPE_MULTIPLE, param.getUserTypeId(), param.getUavTypeId(), param.getCourseCategoryId());
			if (multiCount > multiList.size()) {
				throw new ParamException("当前题库中相应的多选题数不足" + multiCount + "个");
			}
		}
		if (judgeCount > 0) {
			judgeList = examQuestionMapper.list(Constants.QUESTION_TYPE_JUDGE, param.getUserTypeId(), param.getUavTypeId(), param.getCourseCategoryId());
			if (judgeCount > judgeList.size()) {
				throw new ParamException("当前题库中相应的判断题数不足" + judgeCount + "个");
			}
		}
		Integer totalCount = param.getTotalCount();
		Integer perMark = param.getPerMark();
		Integer passMark = param.getPassMark();
		if (totalCount == null) {
			totalCount = singleCount + multiCount + judgeCount;
		}
		if (perMark == null) {
			perMark = 1;
		}
		int totalMark = perMark * totalCount;
		if (passMark == null) {
			passMark = totalMark;
		}

		Exam exam = Exam.builder().userTypeId(param.getUserTypeId()).uavTypeId(param.getUavTypeId()).courseCategoryId(courseCategoryId)
				.userType(userType.getName()).uavType(uavType.getName()).type(param.getType()).courseCategory(courseCategoryName).name(param.getName())
				.singleCount(singleCount).multiCount(multiCount).judgeCount(judgeCount)
				.perMark(perMark).totalCount(totalCount).totalMark(totalMark)
				.passMark(passMark).setTime(param.getSetTime()).state(Constants.DEFAULT_STATE_NORMAL)
				.build();
		exam.setAdminId(RequestHolder.getCurrentUserBean().getId());
		exam.setOperator(RequestHolder.getCurrentUserBean().getName());
		exam.setOperateTime(DateUtil.getNow());
		exam.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		return saveExamAndGenerateExamPaper(exam, singleList, multiList, judgeList);
	}

	@Transactional
	public long saveExamAndGenerateExamPaper(Exam exam, List<ExamQuestion> singleList, List<ExamQuestion> multiList, List<ExamQuestion> judgeList) {
		examMapper.insertSelective(exam);
		long examId = exam.getId();
		int singleCount = exam.getSingleCount();
		int multiCount = exam.getMultiCount();
		int judgeCount = exam.getJudgeCount();
		for (int i = 0; i < Constants.DEFAULT_EXAM_PAPER_NUM; i++) {
			List<ExamQuestion> questionList = Lists.newArrayList();
			// 随机打乱
			if (singleCount > 0) {
				Collections.shuffle(singleList);
				questionList.addAll(singleList.subList(0, singleCount));
			}
			if (multiCount > 0) {
				Collections.shuffle(multiList);
				questionList.addAll(multiList.subList(0, multiCount));
			}
			if (judgeCount > 0) {
				Collections.shuffle(judgeList);
				questionList.addAll(judgeList.subList(0, judgeCount));
			}


			ExamPaper examPaper = ExamPaper.builder().examId(examId).name(exam.getName())
					.state(Constants.DEFAULT_STATE_NORMAL).build();
			examPaper.setOperator(RequestHolder.getCurrentUserBean().getName());
			examPaper.setOperateTime(DateUtil.getNow());
			examPaper.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
			int result = examPaperMapper.insertSelective(examPaper);
			long examPaperId = examPaper.getId();
			if (result > 0) {
				List<ExamPaperQuestion> paperQuestionList = Lists.newArrayList();
				int size = questionList.size();
				for (int j = 0; j < size; j++) {
					ExamPaperQuestion examPaperQuestion = ExamPaperQuestion.builder().examPaperId(examPaperId)
							.questionId(questionList.get(j).getId()).questionNumber(j + 1).questionMark(exam.getPerMark())
							.build();
					paperQuestionList.add(examPaperQuestion);
				}
				examPaperQuestionMapper.batchInsert(paperQuestionList);
				examMapper.increaseSize(examId);
			}
		}
		return examId;
	}

	/**
	 * 删除试卷配置
	 */
	@Transactional
	public int delete(long id) {
		Exam before = examMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待删除的试卷配置不存在");
		Exam after = Exam.builder().id(id).state(Constants.DEFAULT_STATE_DELETE).build();
		String operator = RequestHolder.getCurrentUserBean().getName();
		Date now = DateUtil.getNow();
		String operateIp = IpUtil.getRemoteIp(RequestHolder.getCurrentRequest());
		after.setOperator(operator);
		after.setOperateTime(now);
		after.setOperateIp(operateIp);
		int result = examMapper.updateByPrimaryKeySelective(after);
		if (result > 0) {
			examPaperMapper.deleteByExamId(id, operator, now, operateIp);
		}
		return result;
	}

	/**
	 * 查看试卷配置详情
	 */
	public Exam getDetails(Long id) {
		Exam exam = examMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(exam, "待查看的试卷配置不存在");
		return exam;
	}


	/**
	 * 试卷配置参数是否合法
	 */
	private void validate(ExamParam param) {
		int perMark = param.getPerMark();
		int totalCount = param.getTotalCount();
		int passMark = param.getPassMark();
		int totalMark = perMark * totalCount;
		if (totalMark > 1000) {
			throw new ParamException("试卷总分数值过大，请控制在1000分以内");
		} else if (passMark > totalMark) {
			throw new ParamException("合格分值异常，请确保合格分值不大于当前试卷总分");
		}
	}

	private boolean checkExist(Long id, long userTypeId, long uavTypeId, Long courseCategoryId, int type) {
		return examMapper.checkExist(id, userTypeId, uavTypeId, courseCategoryId, type) > 0;
	}

	/**
	 * 考试配置列表（微信）
	 */
	public List<ExamDTO> getExamList(long userTypeId, long uavTypeId) {
		List<ExamDTO> examList = examMapper.getExamList(userTypeId, uavTypeId);
		Long userId = RequestHolder.getCurrentUserBean().getId();
		List<ExamResult> results = examResultMapper.getResults(userTypeId, uavTypeId, userId);
		Map<Long, ExamResult> resultMap = results.stream()
				.collect(Collectors.toMap(ExamResult::getCourseCategoryId, examResult -> examResult));
		for (ExamDTO dto : examList) {
			Long categoryId = dto.getCourseCategoryId();
			if (categoryId == null) {
				dto.setCourseCategory("综合测试");
				dto.setPassExam(checkPass(dto.getUserTypeId(), dto.getUavTypeId(), Constants.EXAM_TYPE_SYNTHETIC_TEST, userId));
			} else {
				if (resultMap.get(categoryId) != null) {
					dto.setPassExam(true);
				}
			}
		}
		return examList;
	}

	private boolean checkPass(Long userTypeId, Long uavTypeId, Integer type, Long userId) {
		return examResultMapper.count(userTypeId, uavTypeId, type, userId) > 0;
	}
}
