package com.hanhe.college.param.admin;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/9/2.
 */
@Getter
@Setter
public class PasswordParam {

    private Long id;

    @NotBlank(message = "原密码不能为空")
    @Length(min = 6, max = 32, message = "原密码长度需要在6-32个字符以内")
    private String password;

    @NotBlank(message = "新密码不能为空")
    @Length(min = 6, max = 32, message = "新密码长度需要在6-32个字符以内")
    private String newPassword;
}
