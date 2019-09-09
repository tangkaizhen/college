package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.entity.UserType;

public interface UserTypeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(UserType record);

    int insertSelective(UserType record);

    UserType selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserType record);

    int updateByPrimaryKey(UserType record);

    List<UserType> getAll();

    List<UserType> getAvailable();

    int countByName(@Param("id") Long id, @Param("name") String name);

    int getCount();

    UserType getByFlag(@Param("flag") int flag);
}