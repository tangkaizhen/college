package com.hanhe.college.param.admin;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/1.
 */
@Getter
@Setter
public class AdminParam {
	private Long id;

	@NotBlank(message = "账号不能为空")
	@Length(min = 2, max = 50, message = "账号长度需要在2-50个字符以内")
	private String name;

	@NotBlank(message = "昵称不能为空")
	@Length(min = 2, max = 20, message = "昵称长度需要在2-20个字符以内")
	private String nickname;

	@NotBlank(message = "密码不能为空")
	@Length(min = 6, max = 32, message = "密码长度需要在6-32个字符以内")
	private String password;

	@NotBlank(message = "必须指定权限模块")
    @Pattern(regexp="^\\d+(\\,\\d+)*$", message = "权限格式有误")
	private String roleIds;

}
