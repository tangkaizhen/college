package com.hanhe.college.param.wechat;

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
public class CommentParam {

    @NotNull(message = "必须指定用户")
    private Long userId;

    @NotNull(message = "必须指定文章")
    private Long articleId;

    @NotNull(message = "必须指定专家")
    private Long expertId;

    @NotBlank(message = "留言不可以为空")
    @Length(min = 1, max = 600, message = "留言长度必须在600字以内")
    private String comment;

    private String image;
}
