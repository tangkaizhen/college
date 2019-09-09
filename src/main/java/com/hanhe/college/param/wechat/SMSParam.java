package com.hanhe.college.param.wechat;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/9/4.
 */
@Getter
@Setter
public class SMSParam {

    @NotBlank(message = "微信用户标识不能为空")
    private String openid;

    @NotBlank(message = "手机号不能为空")
    @Pattern(regexp = "^1[3-9]\\d{9}+$",message="手机号格式不正确")
    private String phone;

    @NotNull(message = "验证码类型不能为空")
    @Min(value = 1, message = "验证码类型不合法")
    @Max(value = 2, message = "验证码类型不合法")
    private Integer type;

    @NotBlank(message = "图形验证码不能为空")
    @Length(min = 4, max = 4, message = "图形验证码必须是4位数字或字母")
    private String vCode;
}
