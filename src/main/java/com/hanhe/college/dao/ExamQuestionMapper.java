package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.entity.ExamQuestion;

public interface ExamQuestionMapper {
	int deleteByPrimaryKey(Long id);

	int insert(ExamQuestion record);

	int insertSelective(ExamQuestion record);

	ExamQuestion selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(ExamQuestion record);

	int updateByPrimaryKey(ExamQuestion record);

	List<ExamQuestion> list(@Param("type") Integer type, @Param("userTypeId") Long userTypeId,
			@Param("uavTypeId") Long uavTypeId, @Param("courseCategoryId") Long courseCategoryId);

	List<ExamQuestion> getByExamPaperId(@Param("examPaperId") long examPaperId);

    int batchInsert(@Param("examQuestionList") List<ExamQuestion> examQuestionList);

    int isExist(@Param("userTypeId") Long userTypeId, @Param("uavTypeId") Long uavTypeId,
				@Param("courseCategoryId") Long courseCategoryId);
}