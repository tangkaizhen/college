package com.hanhe.college.param.admin;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/7/31.
 */
@Getter
@Setter
public class ConfigParam {

    private Long id;

    @NotBlank(message = "名称不可以为空")
    @Length(min = 2, max = 20, message = "名称长度需要在2-20个字之间")
    private String name;
}
