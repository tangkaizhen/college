package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.dto.TrainingTypeDTO;
import com.hanhe.college.entity.TrainingSiteType;

public interface TrainingSiteTypeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TrainingSiteType record);

    int insertSelective(TrainingSiteType record);

    TrainingSiteType selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TrainingSiteType record);

    int updateByPrimaryKey(TrainingSiteType record);

    void batchInsert(@Param("trainingSiteTypeList") List<TrainingSiteType> trainingSiteTypeList);

    List<Long> getByTrainingSiteId(@Param("trainingSiteId") long trainingSiteId);

    void deleteByTrainingSiteId(@Param("trainingSiteId") long trainingSiteId);

    List<TrainingTypeDTO> getAvailableTrainingTypes(@Param("trainingSiteId") long trainingSiteId, @Param("userId") long userId);

    int isAvailable(@Param("userId")long userId, @Param("trainingSiteId") long trainingSiteId, @Param("trainingTypeId") long trainingTypeId);

    int isExist(@Param("trainingTypeId") long trainingTypeId);
}