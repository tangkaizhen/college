package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.entity.Guideline;

public interface GuidelineMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Guideline record);

    int insertSelective(Guideline record);

    Guideline selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Guideline record);

    int updateByPrimaryKey(Guideline record);

    List<Guideline> getAll();

    int countByName(@Param("id") Long id, @Param("title") String name);
}