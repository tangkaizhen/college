package com.hanhe.college.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.dto.ExamPaperDTO;
import com.hanhe.college.entity.ExamPaper;

public interface ExamPaperMapper {
	int deleteByPrimaryKey(Long id);

	int insert(ExamPaper record);

	int insertSelective(ExamPaper record);

	ExamPaper selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(ExamPaper record);

	int updateByPrimaryKey(ExamPaper record);

	List<ExamPaperDTO> list(@Param("examId") long examId);

	int deleteByExamId(@Param("examId") long examId, @Param("operator") String operator, @Param("operateTime") Date operateTime,
			@Param("operateIp") String operateIp);

	List<ExamPaper> getByExamId(long examId);
}