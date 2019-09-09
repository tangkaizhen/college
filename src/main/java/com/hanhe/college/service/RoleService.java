package com.hanhe.college.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanhe.college.dao.RoleMapper;
import com.hanhe.college.entity.Role;

/**
 * Created by Angelo on 2018/8/29.
 */
@Service
public class RoleService {
	@Autowired
	private RoleMapper roleMapper;

	/**
	 * 权限列表
	 */
	public List<Role> getAvailable() {
		return roleMapper.getAvailable();
	}
}
