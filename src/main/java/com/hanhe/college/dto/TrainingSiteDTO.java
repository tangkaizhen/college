package com.hanhe.college.dto;

import java.util.List;

import com.hanhe.college.entity.TrainingSite;
import com.hanhe.college.entity.TrainingType;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/25.
 */
@Getter
@Setter
public class TrainingSiteDTO extends TrainingSite {

    private List<TrainingType> trainingTypeList;
}
