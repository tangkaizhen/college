package com.hanhe.college.dto;

import java.util.Map;

import org.springframework.beans.BeanUtils;

import com.hanhe.college.entity.Enrolment;
import com.hanhe.college.entity.TrainingSite;

import lombok.Getter;
import lombok.Setter;
import org.springframework.util.MultiValueMap;

/**
 * Created by Angelo on 2018/8/25.
 */
@Getter
@Setter
public class EnrolmentDTO extends Enrolment {

    private TrainingSite trainingSite;
    private MultiValueMap<String, Integer> userExamResults;

    public static EnrolmentDTO adapt(Enrolment enrolment, Map<Long, TrainingSite> trainingSiteMap) {
        EnrolmentDTO dto = new EnrolmentDTO();
        BeanUtils.copyProperties(enrolment, dto);
        dto.setTrainingSite(trainingSiteMap.get(enrolment.getTrainingSiteId()));
        return dto;
    }
}
