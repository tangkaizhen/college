package com.hanhe.college.dto;

import com.hanhe.college.entity.ExamPaperQuestion;
import com.hanhe.college.entity.ExamQuestion;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/23.
 */
@Getter
@Setter
public class ExamPaperQuestionDTO extends ExamPaperQuestion {

    private ExamQuestion examQuestion;

    private String userAnswer;
}
