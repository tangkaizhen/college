package com.hanhe.college.dto;

import com.hanhe.college.entity.Exam;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/22.
 */
@Getter
@Setter
public class ExamDTO extends Exam {

	private boolean passExam;

}
