package com.hanhe.college.param.admin;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/9.
 */
@Getter
@Setter
public class TrainingSiteParam {

    private Long id;

    @NotBlank(message = "网点管理员账号不能为空")
    @Length(min = 2, max = 50, message = "网点管理员长度需要在2-50个字符以内")
    private String adminAccount;

    @NotBlank(message = "网点管理员密码不能为空")
    @Length(min = 6, max = 32, message = "网点管理员密码长度需要在6-32个字符以内")
    private String adminPassword;

    @NotBlank(message = "培训点名称不能为空")
    @Length(min = 2, max = 80, message = "培训点名称长度需要在2-80个字符以内")
    private String name;

    @NotBlank(message = "开班名称不能为空")
    @Length(min = 2, max = 40, message = "开班名称长度需要在2-40个字符以内")
    private String className;

    @NotBlank(message = "省份不能为空")
    @Length(min = 2, max = 10, message = "省份名称长度需要在10个字符以内")
    private String province;

    @NotBlank(message = "城市不能为空")
    @Length(min = 2, max = 10, message = "城市名称长度需要在10个字符以内")
    private String city;

    private String district;

    @NotBlank(message = "详细地址不能为空")
    @Length(min = 2, max = 100, message = "城市名称长度需要在100个字符以内")
    private String address;

    @NotBlank(message = "培训类型不能为空")
    @Length(min = 2, max = 100, message = "培训类型长度需要在100个字符以内")
    private String trainingType;

    @NotBlank(message = "必须指定培训类型")
    @Pattern(regexp="^\\d+(\\,\\d+)*$", message = "权限格式有误")
    private String trainingTypeIds;

    @NotBlank(message = "开班开始时间不能为空")
    @Pattern(regexp="^[0-9]{4}-[0-9]{2}-[0-9]{2}$",message="开班开始时间格式不正确")
    private String trainingStartDate;

    @NotBlank(message = "开班结束时间不能为空")
    @Pattern(regexp="^[0-9]{4}-[0-9]{2}-[0-9]{2}$",message="开班结束时间格式不正确")
    private String trainingEndDate;

//    @NotBlank(message = "联系人姓名不能为空")
//    @Length(min = 2, max = 20, message = "联系人姓名长度需要在20个字符以内")
    private String contactName1;

//    @NotBlank(message = "联系方式不能为空")
//    @Length(min = 2, max = 20, message = "联系方式长度需要在20个字符以内")
    private String contactPhone1;

    private String contactName2;

    private String contactPhone2;

    private String contactName3;

    private String contactPhone3;

    @NotBlank(message = "优势说明不能为空")
    @Length(min = 2, max = 50000, message = "优势说明长度需要在2-50000个字符以内")
    private String advantage;

    @NotBlank(message = "培训说明不能为空")
    @Length(min = 2, max = 10000, message = "培训说明长度需要在2-10000个字符以内")
    private String trainingDescription;

    @NotBlank(message = "费用说明不能为空")
    @Length(min = 2, max = 500, message = "费用说明长度需要在2-500个字符以内")
    private String feeDescription;
}
