package com.hanhe.college.param.wechat;

import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/24.
 */
@Getter
@Setter
public class EnrolmentParam {

    @NotNull(message = "必须指定用户")
    private Long userId;

    @NotNull(message = "必须指定培训网点")
    private Long trainingSiteId;

    @NotNull(message = "必须指定培训类型")
    private Long trainingTypeId;
}
