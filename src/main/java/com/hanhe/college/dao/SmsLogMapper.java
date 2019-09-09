package com.hanhe.college.dao;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.entity.SmsLog;

public interface SmsLogMapper {
    int deleteByPrimaryKey(Long id);

    int insert(SmsLog record);

    int insertSelective(SmsLog record);

    SmsLog selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SmsLog record);

    int updateByPrimaryKey(SmsLog record);

    SmsLog getCheckCode(@Param("phone") String phone, @Param("type") int type);

    int getRecentCount(@Param("phone") String phone);

    int getCount(@Param("phone") String phone, @Param("type") int type);

    int getIpCount(@Param("ip") String ip);
}