package com.hanhe.college.dto;

import com.hanhe.college.entity.UavType;
import com.hanhe.college.entity.UserType;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/30.
 */
@Getter
@Setter
public class ExamCategory {

	private long userTypeId;
	private String userTypeName;
	private long uavTypeId;
	private String uavTypeName;

    public static ExamCategory adapt(UserType userType, UavType uavType) {
        ExamCategory examCategory = new ExamCategory();
        examCategory.setUserTypeId(userType.getId());
        examCategory.setUserTypeName(userType.getName());
        examCategory.setUavTypeId(uavType.getId());
        examCategory.setUavTypeName(uavType.getName());
        return examCategory;
    }
}
