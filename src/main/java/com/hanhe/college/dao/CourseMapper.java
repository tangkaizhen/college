package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.dto.CourseDTO;
import com.hanhe.college.entity.Course;

public interface CourseMapper {
	int deleteByPrimaryKey(Long id);

	int insert(Course record);

	int insertSelective(Course record);

	Course selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(Course record);

	int updateByPrimaryKey(Course record);

	List<CourseDTO> list(@Param("userTypeId") Long userTypeId, @Param("uavTypeId") Long uavTypeId,
			@Param("courseCategoryId") Long courseCategoryId);

	int countByName(@Param("id") Long id, @Param("courseCategoryId") Long courseCategoryId,
			@Param("title") String name);

	List<Course> getByCategoryId(@Param("courseCategoryId") long courseCategoryId);

	int increaseStudySize(@Param("id") long id);

	int isExist(@Param("courseCategoryId") long courseCategoryId);
}