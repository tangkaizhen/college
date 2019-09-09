package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.dto.AdminRoleDTO;
import com.hanhe.college.entity.AdminRole;

public interface AdminRoleMapper {
    int deleteByPrimaryKey(Long id);

    int insert(AdminRole record);

    int insertSelective(AdminRole record);

    AdminRole selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(AdminRole record);

    int updateByPrimaryKey(AdminRole record);

    int deleteByAdminId(@Param("adminId") long adminId);

    int batchInsert(@Param("adminRoleList")List<AdminRole> adminRoleList);

    List<Long> getByAdminId(@Param("adminId") long adminId);

    List<AdminRoleDTO> getRoleNamesByAdminIdList(@Param("adminIdList") List<Long> adminIdList);
}