package com.hanhe.college.param.admin;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/13.
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ExamQuestionParam {

    private Long id;

    @NotNull(message = "身份不能为空")
    private Long userTypeId;

    @NotNull(message = "机型不能为空")
    private Long uavTypeId;

    @NotNull(message = "课程类别不能为空")
    private Long courseCategoryId;

    @NotNull(message = "题目类型不能为空")
    @Min(value = 1, message = "题目类型不合法")
    @Max(value = 3, message = "题目类型不合法")
    private Integer type;

    @NotBlank(message = "试题题目不能为空")
    @Length(min = 1, max = 300, message = "试题题目长度需要在300个字符以内")
    private String question;

    @NotBlank(message = "选项A不能为空")
    @Length(min = 1, max = 200, message = "选项A长度需要在200个字符以内")
    private String option1;

    @NotBlank(message = "选项B不能为空")
    @Length(min = 1, max = 200, message = "选项B长度需要在200个字符以内")
    private String option2;

    @NotBlank(message = "选项C不能为空")
    @Length(min = 1, max = 200, message = "选项C长度需要在200个字符以内")
    private String option3;

    @NotBlank(message = "选项D不能为空")
    @Length(min = 1, max = 200, message = "选项D长度需要在200个字符以内")
    private String option4;

    @NotBlank(message = "答案不能为空")
    @Pattern(regexp="^A?B?C?D?[A-D]+$",message="答案格式不正确")
    @Length(min = 1, max = 4, message = "答案长度需要在4个字符以内")
    private String answer;
}
