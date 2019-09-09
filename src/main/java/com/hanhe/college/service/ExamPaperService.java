package com.hanhe.college.service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.albaba.tools.util.DateUtil;
import com.albaba.tools.util.IpUtil;
import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dao.*;
import com.hanhe.college.dto.ExamDTO;
import com.hanhe.college.dto.ExamPaperDTO;
import com.hanhe.college.dto.ExamPaperQuestionDTO;
import com.hanhe.college.entity.*;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.util.StringUtil;

/**
 * Created by Angelo on 2018/8/13.
 */
@Service
public class ExamPaperService {
	@Autowired
	private ExamMapper examMapper;
	@Autowired
	private ExamPaperMapper examPaperMapper;
	@Autowired
	private ExamPaperQuestionMapper examPaperQuestionMapper;
	@Autowired
	private UserTypeMapper userTypeMapper;
	@Autowired
	private ExamResultMapper examResultMapper;

	/**
	 * 试卷列表
	 */
	public List<ExamPaperDTO> list(long examId) {
		return examPaperMapper.list(examId);
	}

	/**
	 * 添加试卷
	 */
	@Transactional
	public long insert(long examId, String questionIds) {
		Exam exam = examMapper.selectByPrimaryKey(examId);
		Preconditions.checkNotNull(exam, "待添加试卷的试卷配置不存在");
		List<Long> questionIdList = StringUtil.splitToListLong(questionIds);
		if (exam.getTotalCount().intValue() != questionIdList.size()) {
			throw new ParamException("待添加试卷的总题数与配置要求的题数不符");
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
			int size = questionIdList.size();
			for (int i = 0; i < size; i++) {
				ExamPaperQuestion examPaperQuestion = ExamPaperQuestion.builder().examPaperId(examPaperId)
						.questionId(questionIdList.get(i)).questionNumber(i + 1).questionMark(exam.getPerMark())
						.build();
				paperQuestionList.add(examPaperQuestion);
			}
			examPaperQuestionMapper.batchInsert(paperQuestionList);
			examMapper.increaseSize(examId);
		}
		return examPaperId;
	}

	/**
	 * 删除试卷
	 */
	@Transactional
	public int delete(long id) {
		ExamPaper before = examPaperMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待删除的试卷不存在");
		ExamPaper after = ExamPaper.builder().id(id).state(Constants.DEFAULT_STATE_DELETE).build();
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		int result = examPaperMapper.updateByPrimaryKeySelective(after);
		if (result > 0) {
			examMapper.decreaseSize(before.getExamId());
		}
		return result;
	}

	/**
	 * 开始做题前验证权限、考试是否已有试卷
	 */
	public void checkExam(long examId) {
		Exam exam = examMapper.selectByPrimaryKey(examId);
		Preconditions.checkNotNull(exam, "待考试的考卷不存在");
		getExamPapers(exam);
	}

	/**
	 * 开始做题（随机获取试卷一份）
	 */
	public ExamPaperDTO getDetails(long examId) {
		Exam exam = examMapper.selectByPrimaryKey(examId);
		Preconditions.checkNotNull(exam, "待考试的考卷不存在");

		List<ExamPaper> examPapers = getExamPapers(exam);
		int index = (int) (Math.random() * examPapers.size());
		ExamPaper examPaper = examPapers.get(index);
		List<ExamPaperQuestionDTO> questionList = examPaperQuestionMapper.getByExamPaperId(examPaper.getId(), false);
		return ExamPaperDTO.adapt(examPaper, exam.getSetTime(), questionList);
	}

	private List<ExamPaper> getExamPapers(Exam exam) {
		Long userId = RequestHolder.getCurrentUserBean().getId();
		long userTypeId = exam.getUserTypeId();
		long uavTypeId = exam.getUavTypeId();
		// 考试内容为综测时，验证该课程大类自测是否均已通过
		if (exam.getType() == Constants.EXAM_TYPE_SYNTHETIC_TEST) {
			List<ExamDTO> examList = examMapper.getExamList(userTypeId, uavTypeId);
			List<ExamResult> results = examResultMapper.getResults(userTypeId, uavTypeId, userId);
			Map<Long, ExamResult> resultMap = results.stream()
					.collect(Collectors.toMap(ExamResult::getCourseCategoryId, examResult -> examResult));
			for (ExamDTO dto : examList) {
				Long categoryId = dto.getCourseCategoryId();
				if (categoryId != null) {
					if (resultMap.get(categoryId) == null) {
						throw new ParamException("尚有单元测试未通过，还无法参加综合测试");
					}
				}
			}
		} else {
			UserType userType = userTypeMapper.getByFlag(Constants.USER_TYPE_FLAG_JUNIOR);
			// 考试内容为教员课程时，验证该机型的学员综测是否已通过考试
			if (exam.getUserTypeId() != userType.getId().longValue()) {
				boolean passJunior = checkPass(userType.getId(), exam.getUavTypeId(),
						Constants.EXAM_TYPE_SYNTHETIC_TEST, userId);
				if (!passJunior) {
					throw new ParamException("请先通过" + exam.getUavType() + userType.getName() + "综合测试");
				}
			}
		}
		List<ExamPaper> examPapers = examPaperMapper.getByExamId(exam.getId());
		if (examPapers == null || examPapers.size() == 0) {
			throw new ParamException("待查看的考卷不存在");
		}
		return examPapers;
	}

	private boolean checkPass(Long userTypeId, Long uavTypeId, Integer type, Long userId) {
		return examResultMapper.count(userTypeId, uavTypeId, type, userId) > 0;
	}
}
