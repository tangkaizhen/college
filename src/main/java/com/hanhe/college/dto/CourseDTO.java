package com.hanhe.college.dto;

import org.springframework.beans.BeanUtils;

import com.hanhe.college.entity.Course;
import com.hanhe.college.entity.CourseCategory;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/9.
 */
@Getter
@Setter
public class CourseDTO extends Course {

    private Long userTypeId;

    private String userTypeName;

    private Long uavTypeId;

    private String uavTypeName;

    public static CourseDTO adapt(Course course, CourseCategory courseCategory) {
        CourseDTO dto = new CourseDTO();
        BeanUtils.copyProperties(course, dto);
        dto.setUserTypeId(courseCategory.getUserTypeId());
        dto.setUserTypeName(courseCategory.getUserType());
        dto.setUavTypeId(courseCategory.getUavTypeId());
        dto.setUavTypeName(courseCategory.getUavType());
        return dto;
    }
}
