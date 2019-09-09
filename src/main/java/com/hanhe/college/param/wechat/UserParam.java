package com.hanhe.college.param.wechat;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * Created by Angelo on 2018/9/13.
 */
@Getter
@Setter
@ToString
public class UserParam {

    @NotNull(message = "必须指定用户")
    private Long id;
    @NotBlank(message = "真实姓名不能为空")
    @Length(min = 2, max = 20, message = "真实姓名长度需要在2-20个字符以内")
    private String name;

    private String headImg;
}
