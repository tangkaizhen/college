package com.hanhe.college.param.wechat;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


/**
 * Created by Angelo on 2018/7/19.
 */
@Getter
@Setter
@ToString
public class RegisterParam {
    @NotBlank(message = "微信用户标识不能为空")
    private String openid;
    
    @NotBlank(message = "真实姓名不能为空")
	@Length(min = 2, max = 20, message = "真实姓名长度需要在2-20个字符以内")
    private String name;

    @NotBlank(message = "手机号不能为空")
    @Pattern(regexp="^[1][1-9][0-9]{9}$", message = "手机号格式有误")
    private String phone;

//    @NotBlank(message = "密码不能为空")
//    @Length(min = 6, max = 32, message = "密码长度需要在32个字符以内")
//    private String password;

    @NotBlank(message = "验证码不能为空")
    @Pattern(regexp="^[0-9]{6}$", message = "验证码必须是6位数字")
    private String checkCode;
}
