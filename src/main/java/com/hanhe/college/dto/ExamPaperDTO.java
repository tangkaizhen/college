package com.hanhe.college.dto;

import java.util.List;

import org.springframework.beans.BeanUtils;

import com.hanhe.college.entity.ExamPaper;
import com.hanhe.college.entity.ExamQuestion;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/14.
 */
@Getter
@Setter
public class ExamPaperDTO extends ExamPaper {

	private int setTime;

	private List<ExamQuestion> questions;

	private List<ExamPaperQuestionDTO> questionList;

	public static ExamPaperDTO adapt(ExamPaper examPaper, int setTime, List<ExamPaperQuestionDTO> questionList) {
		ExamPaperDTO dto = new ExamPaperDTO();
		BeanUtils.copyProperties(examPaper, dto);
		dto.setSetTime(setTime);
		dto.setQuestionList(questionList);
		return dto;
	}
}
