package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.entity.UavType;

public interface UavTypeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(UavType record);

    int insertSelective(UavType record);

    UavType selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UavType record);

    int updateByPrimaryKey(UavType record);

    List<UavType> getAll();

    List<UavType> getAvailable();

    int countByName(@Param("id") Long id, @Param("name") String name);

    int getCount();
}