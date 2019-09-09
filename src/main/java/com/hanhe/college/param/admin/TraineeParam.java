package com.hanhe.college.param.admin;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/31.
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TraineeParam {

    private Long id;

    @NotBlank(message = "姓名不能为空")
    @Length(min = 1, max = 20, message = "姓名长度需要在20个字符以内")
    private String name;

    @NotBlank(message = "姓名拼音不能为空")
    @Length(min = 1, max = 60, message = "姓名拼音长度需要在60个字符以内")
    private String namePy;

    @NotBlank(message = "性别不能为空")
    @Pattern(regexp="^(男 Male|女 Female)?$",message="性别暂仅限[男 Male/女 Female")
    private String gender;

    @NotBlank(message = "出生日期不能为空")
    @Pattern(regexp="^[0-9]{4}-[0-9]{2}-[0-9]{2}$",message="出生日期格式不正确")
    private String birthDate;

    @NotBlank(message = "照片不能为空")
//    @Length(min = 1, max = 255, message = "照片URL长度需要在255个字符以内")
    private String pic;

    @NotBlank(message = "手机号不能为空")
    @Pattern(regexp="^[1][1-9][0-9]{9}$", message = "手机号格式有误")
    private String phone;

    @NotBlank(message = "户籍省份不能为空")
    @Length(min = 2, max = 10, message = "户籍省份名称长度需要在10个字符以内")
    private String province;

    @NotBlank(message = "户籍城市不能为空")
    @Length(min = 2, max = 10, message = "户籍城市名称长度需要在10个字符以内")
    private String city;

    private String district;

    @NotBlank(message = "户籍详细地址不能为空")
    @Length(min = 2, max = 100, message = "户籍详细地址长度需要在100个字符以内")
    private String address;

    @NotBlank(message = "收件人姓名不能为空")
    @Length(min = 1, max = 20, message = "收件人姓名长度需要在20个字符以内")
    private String addresseeName;

    @NotBlank(message = "收件人手机号不能为空")
    @Pattern(regexp="^[1][1-9][0-9]{9}$", message = "收件人手机号格式有误")
    private String addresseePhone;

    @NotBlank(message = "收件人省份不能为空")
    @Length(min = 2, max = 10, message = "收件人省份名称长度需要在10个字符以内")
    private String addresseeProvince;

    @NotBlank(message = "收件人城市不能为空")
    @Length(min = 2, max = 10, message = "收件人城市名称长度需要在10个字符以内")
    private String addresseeCity;

    private String addresseeDistrict;
    @NotBlank(message = "收件人详细地址不能为空")
    @Length(min = 2, max = 100, message = "收件人详细地址长度需要在100个字符以内")
    private String addresseeAddress;

    @NotBlank(message = "合格证编号为空")
    @Pattern(regexp="^[1-9]\\d{5}(18|19|20)?(\\d{2})((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([\\d|x|X]{1})$",message="合格证编号格式不正确")
    private String certicateNo;

    @NotBlank(message = "签发单位为空")
    @Length(min = 1, max = 20, message = "签发单位长度需要在20个字符以内")
    private String issueUnit;

    @NotBlank(message = "签发时间不能为空")
    @Pattern(regexp="^[0-9]{4}-[0-9]{2}-[0-9]{2}$",message="签发时间格式不正确")
    private String issueDate;

    @NotBlank(message = "有效期开始时间不能为空")
    @Pattern(regexp="^[0-9]{4}-[0-9]{2}-[0-9]{2}$",message="有效期开始时间格式不正确")
    private String validityStartDate;

    @NotBlank(message = "有效期结束时间不能为空")
    @Pattern(regexp="^[0-9]{4}-[0-9]{2}-[0-9]{2}$",message="有效期结束时间格式不正确")
    private String validityEndDate;

    @NotBlank(message = "合格证等级不能为空")
    @Length(min = 1, max = 50, message = "合格证等级长度需要在50个字符以内")
    private String rating;

    @NotBlank(message = "备注不能为空")
    @Length(min = 1, max = 20, message = "备注长度需要在20个字符以内")
    private String remarks;
}
