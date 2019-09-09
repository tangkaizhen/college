package com.hanhe.college.dto;

import java.util.List;

import com.hanhe.college.entity.Course;
import com.hanhe.college.entity.CourseCategory;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/20.
 */
@Getter
@Setter
public class CourseCategoryDTO extends CourseCategory {

    private boolean passExam;

    private boolean permitted;

    private List<Course> courseList;
}
