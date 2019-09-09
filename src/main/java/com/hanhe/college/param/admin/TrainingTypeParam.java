package com.hanhe.college.param.admin;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/7/31.
 */
@Getter
@Setter
public class TrainingTypeParam {

    private Long id;

    @NotNull(message = "必须指定身份")
    private Long userTypeId;

    @NotNull(message = "必须指定机型")
    private Long uavTypeId;

    @NotBlank(message = "类型名称不可以为空")
    @Length(min = 2, max = 20, message = "类型名称长度需要在2-20个字之间")
    private String name;
}
