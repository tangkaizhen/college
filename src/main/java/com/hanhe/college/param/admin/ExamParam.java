package com.hanhe.college.param.admin;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/14.
 */
@Getter
@Setter
public class ExamParam {

    private Long id;

    @NotNull(message = "身份不能为空")
    private Long userTypeId;

    @NotNull(message = "机型不能为空")
    private Long uavTypeId;

    private Long courseCategoryId;

    @NotBlank(message = "试卷名称不能为空")
    @Length(min = 1, max = 20, message = "试题名称长度需要在20个字符以内")
    private String name;

    @NotNull(message = "试卷类型不能为空")
    @Min(value = 1, message = "试卷类型不合法")
    @Max(value = 2, message = "试卷类型不合法")
    private Integer type;

//    @NotNull(message = "每题分值不能为空")
//    @Min(value = 1, message = "每题分值不合法")
//    @Max(value = 10, message = "每题分值请控制在1-10分")
    private Integer perMark;

//    @NotNull(message = "试卷题数不能为空")
//    @Min(value = 1, message = "试卷题数不合法")
//    @Max(value = 100, message = "试卷题数请控制在1-100题")
    private Integer totalCount;

    @NotNull(message = "单选题数不能为空")
    @Min(value = 0, message = "单选题数不合法")
    @Max(value = 100, message = "单选题数请控制在100题以内")
    private Integer singleCount;

    @NotNull(message = "多选题数不能为空")
    @Min(value = 0, message = "多选题数不合法")
    @Max(value = 100, message = "多选题数请控制在100题以内")
    private Integer multiCount;

    @NotNull(message = "判断题数不能为空")
    @Min(value = 0, message = "判断题数不合法")
    @Max(value = 100, message = "判断题数请控制在100题以内")
    private Integer judgeCount;

//    @NotNull(message = "试卷总分不能为空")
//    @Min(value = 1, message = "试卷总分不合法")
//    @Max(value = 1000, message = "试卷总分分值过大，请控制在1-1000分")
//    private Integer totalMark;

//    @NotNull(message = "合格分值不能为空")
//    @Min(value = 1, message = "合格分值不合法")
//    @Max(value = 1000, message = "合格分值过大，请控制在1-1000分")
    private Integer passMark;

    @NotNull(message = "试卷时长不能为空")
    @Min(value = 1, message = "试卷时长不合法")
    @Max(value = 100, message = "试卷时长数值过大，请控制在100分钟以内")
    private Integer setTime;

//    public Integer getTotalMark() {
//        if (perMark != null && totalCount != null) {
//            return perMark * totalCount;
//        } else {
//            return 0;
//        }
//    }
}
