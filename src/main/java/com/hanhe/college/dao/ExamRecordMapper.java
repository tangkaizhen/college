package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.entity.ExamRecord;

public interface ExamRecordMapper {
	int deleteByPrimaryKey(Long id);

	int insert(ExamRecord record);

	int insertSelective(ExamRecord record);

	ExamRecord selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(ExamRecord record);

	int updateByPrimaryKey(ExamRecord record);

	int batchInsert(@Param("examRecordList") List<ExamRecord> examRecordList);
}