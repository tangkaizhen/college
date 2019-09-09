package com.hanhe.college.param.admin;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/7/31.
 */
@Getter
@Setter
public class CourseCatrgoryParam {

    private Long id;

    @NotNull(message = "必须指定身份")
    private Long userTypeId;

    @NotNull(message = "必须指定机型")
    private Long uavTypeId;

    @NotBlank(message = "课程名称不可以为空")
    @Length(min = 2, max = 80, message = "课程名称长度需要在2-80个字之间")
    private String name;
}
