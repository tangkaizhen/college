package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.entity.ExamResult;

public interface ExamResultMapper {
	int deleteByPrimaryKey(Long id);

	int insert(ExamResult record);

	int insertSelective(ExamResult record);

	ExamResult selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(ExamResult record);

	int updateByPrimaryKey(ExamResult record);

	int count(@Param("userTypeId") Long userTypeId, @Param("uavTypeId") Long uavTypeId, @Param("type") Integer type,
			@Param("userId") long userId);

	List<ExamResult> getResults(@Param("userTypeId") long userTypeId, @Param("uavTypeId") long uavTypeId,
			@Param("userId") long userId);

	List<ExamResult> getResults4Users(@Param("userIds") String userIds);
}