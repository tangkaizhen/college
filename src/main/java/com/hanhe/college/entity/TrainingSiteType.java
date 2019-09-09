package com.hanhe.college.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = {"id"})
public class TrainingSiteType {
    private Long id;

    private Long trainingSiteId;

    private Long trainingTypeId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getTrainingSiteId() {
        return trainingSiteId;
    }

    public void setTrainingSiteId(Long trainingSiteId) {
        this.trainingSiteId = trainingSiteId;
    }

    public Long getTrainingTypeId() {
        return trainingTypeId;
    }

    public void setTrainingTypeId(Long trainingTypeId) {
        this.trainingTypeId = trainingTypeId;
    }
}