package com.hanhe.college.param.admin;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/6.
 */
@Getter
@Setter
public class ArticleParam {
    private Long id;

    @NotNull(message = "必须指定专家")
    private Long expertId;

    @NotNull(message = "必须指定知识类型")
    private Long categoryId;

    @NotBlank(message = "作者不能为空")
    @Length(min = 1, max = 20, message = "作者长度需要20个字符以内")
    private String author;

    @NotBlank(message = "标题不能为空")
    @Length(min = 2, max = 80, message = "标题长度需要在2-80个字符以内")
    private String title;

    @NotBlank(message = "内容不能为空")
    @Length(min = 2, max = 50000, message = "内容长度需要在2-50000个字符以内")
    private String content;

    @NotBlank(message = "封面不能为空")
    private String coverImg;
}
