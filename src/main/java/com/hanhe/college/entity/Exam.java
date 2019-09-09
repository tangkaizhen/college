package com.hanhe.college.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = {"id"})
public class Exam {
    private Long id;

    private Long adminId;

    private Long userTypeId;

    private Long uavTypeId;

    private Long courseCategoryId;

    private String userType;

    private String uavType;

    private String courseCategory;

    private String name;

    private Integer type;

    private Integer perMark;

    private Integer totalCount;

    private Integer totalMark;

    private Integer passMark;

    private Integer singleCount;

    private Integer singleMark;

    private Integer multiCount;

    private Integer multiMark;

    private Integer judgeCount;

    private Integer judgeMark;

    private Integer setTime;

    private Integer size;

    private Integer state;

    private String operator;

    private Date operateTime;

    private String operateIp;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getAdminId() {
        return adminId;
    }

    public void setAdminId(Long adminId) {
        this.adminId = adminId;
    }

    public Long getUserTypeId() {
        return userTypeId;
    }

    public void setUserTypeId(Long userTypeId) {
        this.userTypeId = userTypeId;
    }

    public Long getUavTypeId() {
        return uavTypeId;
    }

    public void setUavTypeId(Long uavTypeId) {
        this.uavTypeId = uavTypeId;
    }

    public Long getCourseCategoryId() {
        return courseCategoryId;
    }

    public void setCourseCategoryId(Long courseCategoryId) {
        this.courseCategoryId = courseCategoryId;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType == null ? null : userType.trim();
    }

    public String getUavType() {
        return uavType;
    }

    public void setUavType(String uavType) {
        this.uavType = uavType == null ? null : uavType.trim();
    }

    public String getCourseCategory() {
        return courseCategory;
    }

    public void setCourseCategory(String courseCategory) {
        this.courseCategory = courseCategory == null ? null : courseCategory.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getPerMark() {
        return perMark;
    }

    public void setPerMark(Integer perMark) {
        this.perMark = perMark;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getTotalMark() {
        return totalMark;
    }

    public void setTotalMark(Integer totalMark) {
        this.totalMark = totalMark;
    }

    public Integer getPassMark() {
        return passMark;
    }

    public void setPassMark(Integer passMark) {
        this.passMark = passMark;
    }

    public Integer getSingleCount() {
        return singleCount;
    }

    public void setSingleCount(Integer singleCount) {
        this.singleCount = singleCount;
    }

    public Integer getSingleMark() {
        return singleMark;
    }

    public void setSingleMark(Integer singleMark) {
        this.singleMark = singleMark;
    }

    public Integer getMultiCount() {
        return multiCount;
    }

    public void setMultiCount(Integer multiCount) {
        this.multiCount = multiCount;
    }

    public Integer getMultiMark() {
        return multiMark;
    }

    public void setMultiMark(Integer multiMark) {
        this.multiMark = multiMark;
    }

    public Integer getJudgeCount() {
        return judgeCount;
    }

    public void setJudgeCount(Integer judgeCount) {
        this.judgeCount = judgeCount;
    }

    public Integer getJudgeMark() {
        return judgeMark;
    }

    public void setJudgeMark(Integer judgeMark) {
        this.judgeMark = judgeMark;
    }

    public Integer getSetTime() {
        return setTime;
    }

    public void setSetTime(Integer setTime) {
        this.setTime = setTime;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator == null ? null : operator.trim();
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }

    public String getOperateIp() {
        return operateIp;
    }

    public void setOperateIp(String operateIp) {
        this.operateIp = operateIp == null ? null : operateIp.trim();
    }
}