package com.hanhe.college.dto;

import java.util.Map;

import org.springframework.beans.BeanUtils;

import com.hanhe.college.entity.ExamQuestion;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * Created by Angelo on 2018/8/13.
 */
@Getter
@Setter
@ToString
@Deprecated
public class ExamQuestionDTO extends ExamQuestion {
    private String userTypeName;

    private String uavTypeName;

    private String courseCategoryName;

    public static ExamQuestionDTO adapt(ExamQuestion examQuestion, Map<Long, String> userTypeMap, Map<Long, String> uavTypeMap, Map<Long, String> courseCategoryMap) {
        ExamQuestionDTO dto = new ExamQuestionDTO();
        BeanUtils.copyProperties(examQuestion, dto);
        dto.setUserTypeName(userTypeMap.get(examQuestion.getUserTypeId()));
        dto.setUavTypeName(uavTypeMap.get(examQuestion.getUavTypeId()));
        dto.setCourseCategoryName(examQuestion.getCourseCategoryId() == null ? "" : courseCategoryMap.get(examQuestion.getCourseCategoryId()));
        return dto;
    }
}
