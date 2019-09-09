package com.hanhe.college.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = {"id"})
public class Administrator {
    private Long id;

    private Long trainingSiteId;

    private String name;

    private String nickname;
    @JsonIgnore
    private String password;

    private Integer type;

    private String headImg;

    private String bannerImg;

    private String headIcon;

    private String headImgSrc;

    private String bannerImgSrc;

    private String label;

    private String resume;

    private String details;

    private Integer flag;

    private Integer state;
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Date updateTime;
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd")
    private Date interactTime;

    private String interactTitle;

    private Date stickTime;

    private String operator;
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Date operateTime;
    @JsonIgnore
    private String operateIp;

    private String roleNames;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getHeadImg() {
        return headImg;
    }

    public void setHeadImg(String headImg) {
        this.headImg = headImg == null ? null : headImg.trim();
    }

    public String getBannerImg() {
        return bannerImg;
    }

    public void setBannerImg(String bannerImg) {
        this.bannerImg = bannerImg == null ? null : bannerImg.trim();
    }

    public String getHeadIcon() {
        return headIcon;
    }

    public void setHeadIcon(String headIcon) {
        this.headIcon = headIcon == null ? null : headIcon.trim();
    }

    public String getHeadImgSrc() {
        return headImgSrc;
    }

    public void setHeadImgSrc(String headImgSrc) {
        this.headImgSrc = headImgSrc == null ? null : headImgSrc.trim();
    }

    public String getBannerImgSrc() {
        return bannerImgSrc;
    }

    public void setBannerImgSrc(String bannerImgSrc) {
        this.bannerImgSrc = bannerImgSrc == null ? null : bannerImgSrc.trim();
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label == null ? null : label.trim();
    }

    public String getResume() {
        return resume;
    }

    public void setResume(String resume) {
        this.resume = resume == null ? null : resume.trim();
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details == null ? null : details.trim();
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getInteractTime() {
        return interactTime;
    }

    public void setInteractTime(Date interactTime) {
        this.interactTime = interactTime;
    }

    public String getInteractTitle() {
        return interactTitle;
    }

    public void setInteractTitle(String interactTitle) {
        this.interactTitle = interactTitle == null ? null : interactTitle.trim();
    }

    public Date getStickTime() {
        return stickTime;
    }

    public void setStickTime(Date stickTime) {
        this.stickTime = stickTime;
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

    public String getRoleNames() {
        return roleNames;
    }

    public void setRoleNames(String roleNames) {
        this.roleNames = roleNames;
    }
}