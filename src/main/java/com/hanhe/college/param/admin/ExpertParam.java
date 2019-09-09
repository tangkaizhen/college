package com.hanhe.college.param.admin;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/3.
 */
@Getter
@Setter
public class ExpertParam {
    private Long id;

    @NotBlank(message = "账号不能为空")
    @Length(min = 2, max = 50, message = "账号长度需要在2-50个字符以内")
    private String name;

    @NotBlank(message = "专家姓名不能为空")
    @Length(min = 2, max = 20, message = "专家姓名长度需要在2-20个字符以内")
    private String nickname;

    @NotBlank(message = "密码不能为空")
    @Length(min = 6, max = 32, message = "密码长度需要在6-32个字符以内")
    private String password;

    @NotBlank(message = "头像不能为空")
//    @Length(min = 2, max = 255, message = "头像URL需要在255个字符以内")
    private String headImg;

    @NotBlank(message = "横幅图像不能为空")
//    @Length(min = 2, max = 255, message = "横幅图像URL需要在255个字符以内")
    private String bannerImg;

    @NotBlank(message = "姓名标签不能为空")
    @Length(min = 2, max = 20, message = "姓名标签长度需要在2-20个字符以内")
    private String label;

    @NotBlank(message = "一句话简介不能为空")
    @Length(min = 2, max = 40, message = "一句话简介长度需要在2-40个字符以内")
    private String resume;

    @NotBlank(message = "详情介绍不能为空")
    @Length(min = 2, max = 10000, message = "详情介绍长度需要在2-10000个字符以内")
    private String details;

}
