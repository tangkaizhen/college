package com.hanhe.college.param.admin;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/8.
 */
@Getter
@Setter
public class VideoParam {

    private Long id;

    @NotNull(message = "必须指定视频类型")
    private Long uavTypeId;

    @NotBlank(message = "视频名称不能为空")
    @Length(min = 2, max = 40, message = "视频名称长度需要在2-40个字符以内")
    private String name;

//    @NotBlank(message = "视频不能为空")
//    @Length(min = 2, max = 2048, message = "视频URL长度需要在2-2048个字符以内")
    private String videoUrl;

    @NotBlank(message = "视频封面不能为空")
//    @Length(min = 2, max = 255, message = "视频封面图片URL需要在255个字符以内")
    private String image;

    @NotBlank(message = "视频简介不能为空")
    @Length(min = 2, max = 50000, message = "视频简介长度需要在2-50000个字符以内")
    private String introduction;
}
