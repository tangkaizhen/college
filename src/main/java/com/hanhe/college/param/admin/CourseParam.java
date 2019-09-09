package com.hanhe.college.param.admin;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/9.
 */
@Getter
@Setter
public class CourseParam {

    private Long id;

    @NotNull(message = "必须指定课程类型")
    private Long courseCategoryId;

    @NotBlank(message = "标题不能为空")
    @Length(min = 2, max = 30, message = "标题长度需要在2-30个字符以内")
    private String title;

    @NotBlank(message = "内容不能为空")
    @Length(min = 2, max = 50000, message = "内容长度需要在2-50000个字符以内")
    private String content;
}
