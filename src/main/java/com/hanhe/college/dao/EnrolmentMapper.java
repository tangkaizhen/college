package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.dto.EnrolmentDTO;
import com.hanhe.college.entity.Enrolment;

public interface EnrolmentMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Enrolment record);

    int insertSelective(Enrolment record);

    Enrolment selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Enrolment record);

    int updateByPrimaryKey(Enrolment record);

    int isExist(@Param("userId") long userId, @Param("trainingTypeId") long trainingTypeId);

    List<Enrolment> getEnrolments(@Param("userId") long userId);

    List<EnrolmentDTO> list(@Param("province") String province, @Param("trainingSiteId") Long trainSiteId);

    int isAvailable(@Param("userId") long userId, @Param("trainingSiteId") long trainingSiteId);
}