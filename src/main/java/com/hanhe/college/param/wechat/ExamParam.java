package com.hanhe.college.param.wechat;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/23.
 */
@Getter
@Setter
public class ExamParam {

    @NotNull(message = "必须指定用户")
    private Long userId;

    @NotNull(message = "必须指定试卷")
    private Long examPaperId;

    @NotNull(message = "必须指定考试所用时间")
    private Integer costTime;

    @NotBlank(message = "做题记录不可以为空")
    private String records;
}
