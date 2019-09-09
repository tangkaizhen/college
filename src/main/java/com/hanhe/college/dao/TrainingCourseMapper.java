package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.entity.TrainingCourse;

public interface TrainingCourseMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TrainingCourse record);

    int insertSelective(TrainingCourse record);

    TrainingCourse selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TrainingCourse record);

    int updateByPrimaryKey(TrainingCourse record);

    List<TrainingCourse> getAll();

    int countByName(@Param("id") Long id, @Param("name") String name);
}