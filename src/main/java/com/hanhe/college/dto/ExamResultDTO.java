package com.hanhe.college.dto;

import java.util.List;

import org.springframework.beans.BeanUtils;

import com.hanhe.college.entity.ExamResult;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/23.
 */
@Getter
@Setter
public class ExamResultDTO extends ExamResult {

	private List<ExamPaperQuestionDTO> questionList;

	public static ExamResultDTO adapt(ExamResult examResult, List<ExamPaperQuestionDTO> questionList) {
		ExamResultDTO dto = new ExamResultDTO();
		BeanUtils.copyProperties(examResult, dto);
		dto.setQuestionList(questionList);
		return dto;
	}
}
