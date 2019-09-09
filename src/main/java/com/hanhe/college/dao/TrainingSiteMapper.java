package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.entity.TrainingSite;

public interface TrainingSiteMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TrainingSite record);

    int insertSelective(TrainingSite record);

    TrainingSite selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TrainingSite record);

    int updateByPrimaryKey(TrainingSite record);

    List<TrainingSite> list(@Param("province") String province, @Param("trainingType") String trainingType);

    int countByName(@Param("id") Long id, @Param("name") String name);

    List<TrainingSite> getByIds(@Param("ids") String ids);
}