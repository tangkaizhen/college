package com.hanhe.college.param.admin;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/9.
 */
@Getter
@Setter
public class TrainingCourseParam {

    private Long id;

    @NotBlank(message = "培训主题不能为空")
    @Length(min = 2, max = 40, message = "培训主题长度需要在2-40个字符以内")
    private String name;

    @NotBlank(message = "培训内容不能为空")
    @Length(min = 2, max = 50000, message = "培训内容长度需要在2-50000个字符以内")
    private String trainingContent;

    @NotBlank(message = "培训费用不能为空")
    @Length(min = 2, max = 1000, message = "培训费用长度需要在2-1000个字符以内")
    private String trainingFee;
}
