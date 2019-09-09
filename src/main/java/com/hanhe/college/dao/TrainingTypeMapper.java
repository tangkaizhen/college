package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.entity.TrainingType;

public interface TrainingTypeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TrainingType record);

    int insertSelective(TrainingType record);

    TrainingType selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TrainingType record);

    int updateByPrimaryKey(TrainingType record);

    List<TrainingType> getAvailable();

    int countByName(@Param("id") Long id, @Param("name") String name);

    List<TrainingType> getByIds(@Param("ids") String ids);

    int isExist(@Param("userTypeId") Long userTypeId, @Param("uavTypeId") Long uavTypeId);
}