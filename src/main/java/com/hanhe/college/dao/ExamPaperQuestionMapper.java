package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.dto.ExamPaperQuestionDTO;
import com.hanhe.college.entity.ExamPaperQuestion;

public interface ExamPaperQuestionMapper {
	int deleteByPrimaryKey(Long id);

	int insert(ExamPaperQuestion record);

	int insertSelective(ExamPaperQuestion record);

	ExamPaperQuestion selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(ExamPaperQuestion record);

	int updateByPrimaryKey(ExamPaperQuestion record);

	int batchInsert(@Param("paperQuestionList") List<ExamPaperQuestion> paperQuestionList);

	List<ExamPaperQuestionDTO> getByExamPaperId(@Param("examPaperId") long examPaperId,
                                                @Param("showAnswer") boolean showAnswer);
}