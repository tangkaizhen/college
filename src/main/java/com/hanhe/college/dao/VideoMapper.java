package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.entity.Video;

public interface VideoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Video record);

    int insertSelective(Video record);

    Video selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Video record);

    int updateByPrimaryKey(Video record);

    List<Video> list(@Param("uavTypeId") Long uavTypeId);

    int isExist(@Param("uavTypeId") long uavTypeId);

    int increaseReadSize(@Param("id") long id);

    List<Video> selectByKeyword(@Param("keyword") String keyword);
}