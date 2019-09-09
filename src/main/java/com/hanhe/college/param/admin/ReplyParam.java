package com.hanhe.college.param.admin;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/3.
 */
@Getter
@Setter
public class ReplyParam {

    @NotNull(message = "必须指定留言")
    private Long id;

    @NotBlank(message = "回复不可以为空")
    @Length(min = 2, max = 2000, message = "回复长度必须在2-2000字符以内")
    private String replyContent;

    @NotNull(message = "审核状态不能为空")
    @Min(value = 1, message = "审核状态不合法")
    @Max(value = 3, message = "审核状态不合法")
    private Integer state;
}
