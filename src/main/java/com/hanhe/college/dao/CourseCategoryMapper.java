package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.dto.CourseCategoryDTO;
import com.hanhe.college.entity.CourseCategory;

public interface CourseCategoryMapper {
	int deleteByPrimaryKey(Long id);

	int insert(CourseCategory record);

	int insertSelective(CourseCategory record);

	CourseCategory selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(CourseCategory record);

	int updateByPrimaryKey(CourseCategory record);

	List<CourseCategory> getAll();

	List<CourseCategory> getAvailable();

	int countByName(@Param("id") Long id, @Param("userTypeId") Long userTypeId, @Param("uavTypeId") Long uavTypeId,
			@Param("name") String name);

	List<CourseCategory> getCourseCategories(@Param("userTypeId") long userTypeId, @Param("uavTypeId") long uavTypeId);

	List<CourseCategoryDTO> getCourseCategoryList(@Param("userTypeId") long userTypeId,
			@Param("uavTypeId") long uavTypeId);

	CourseCategoryDTO getDetails(@Param("id") long id);

	int isExist(@Param("userTypeId") Long userTypeId, @Param("uavTypeId") Long uavTypeId);
}