package com.hanhe.college.dto;

import java.util.List;

import org.springframework.beans.BeanUtils;

import com.hanhe.college.entity.Administrator;
import com.hanhe.college.entity.Role;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/29.
 */
@Getter
@Setter
public class AdminDTO extends Administrator {

    private List<Role> roleList;

    public static AdminDTO adapt(Administrator administrator, List<Role> roleList) {
        AdminDTO dto = new AdminDTO();
        BeanUtils.copyProperties(administrator, dto);
        dto.setRoleList(roleList);
        return dto;
    }
}
