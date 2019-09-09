package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.dto.ExamDTO;
import com.hanhe.college.entity.Exam;

public interface ExamMapper {
	int deleteByPrimaryKey(Long id);

	int insert(Exam record);

	int insertSelective(Exam record);

	Exam selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(Exam record);

	int updateByPrimaryKey(Exam record);

	List<Exam> list(@Param("userTypeId") Long userTypeId, @Param("uavTypeId") Long uavTypeId,
			@Param("courseCategoryId") Long courseCategoryId);

	int checkExist(@Param("id") Long id, @Param("userTypeId") long userTypeId, @Param("uavTypeId") long uavTypeId,
			@Param("courseCategoryId") Long courseCategoryId, @Param("type") int type);

	List<ExamDTO> getExamList(@Param("userTypeId") long userTypeId, @Param("uavTypeId") long uavTypeId);

	int increaseSize(@Param("id") long id);

	int decreaseSize(@Param("id") long id);

	int isExist(@Param("userTypeId") Long userTypeId, @Param("uavTypeId") Long uavTypeId,
			@Param("courseCategoryId") Long courseCategoryId);
}