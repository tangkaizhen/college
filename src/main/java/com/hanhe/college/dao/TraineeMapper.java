package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.entity.Trainee;

public interface TraineeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Trainee record);

    int insertSelective(Trainee record);

    Trainee selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Trainee record);

    int updateByPrimaryKey(Trainee record);

    List<Trainee> list(@Param("province") String province, @Param("keyword") String keyword, @Param("trainingSiteId") Long trainingSiteId);

    List<Trainee> getByCerticateNo(@Param("certicateNo")String certicateNo);

    int batchInsert(@Param("traineeList") List<Trainee> traineeList);
}