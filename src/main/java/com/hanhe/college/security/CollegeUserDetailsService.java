package com.hanhe.college.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.hanhe.college.dao.AdministratorMapper;
import com.hanhe.college.dao.RoleMapper;
import com.hanhe.college.entity.Administrator;
import com.hanhe.college.entity.Role;

import lombok.extern.slf4j.Slf4j;

/**
 * Created by Angelo on 2018/7/26.
 */
@Slf4j
@Service
public class CollegeUserDetailsService implements UserDetailsService {

    @Autowired
    private AdministratorMapper administratorMapper;
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Administrator administrator = administratorMapper.getByName(username);
        if (administrator != null) {
            List<Role> roles = roleMapper.getAllRolesByAdminId(administrator.getId());
            List<GrantedAuthority> grantedAuthorities = new ArrayList<>();
            for (Role role : roles) {
                GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(role.getRole());
                //1：此处将权限信息添加到 GrantedAuthority 对象中，在后面进行全权限验证时会使用GrantedAuthority 对象。
                grantedAuthorities.add(grantedAuthority);
            }
            log.info("admin: " + administrator.getName());
            return new User(administrator.getName(), administrator.getPassword(), grantedAuthorities);
        } else {
            throw new UsernameNotFoundException("admin: " + username + " do not exist!");
        }
    }
}
