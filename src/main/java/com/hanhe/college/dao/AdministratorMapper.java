package com.hanhe.college.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanhe.college.dto.MomentDTO;
import com.hanhe.college.entity.Administrator;

public interface AdministratorMapper {
	int deleteByPrimaryKey(Long id);

	int insert(Administrator record);

	int insertSelective(Administrator record);

	Administrator selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(Administrator record);

	int updateByPrimaryKey(Administrator record);

	Administrator getByName(String name);

	List<Administrator> getByType(int type);

	int countByName(@Param("id") Long id, @Param("name") String name, @Param("nickname") String nickname);

	List<Administrator> schools();

	List<MomentDTO> moments(long id);

	List<Administrator> getByFlag(@Param("flag") int flag);

    Administrator getByTrainingSiteId(@Param("trainingSiteId") long trainingSiteId);
}