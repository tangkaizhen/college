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
public class Trainee {
    private Long id;

    private Long trainingSiteId;

    private String name;

    private String namePy;

    private String gender;

    private Date birthDate;

    private String pic;

    private String phone;

    private String province;

    private String city;

    private String district;

    private String address;

    private String addresseeName;

    private String addresseePhone;

    private String addresseeProvince;

    private String addresseeCity;

    private String addresseeDistrict;

    private String addresseeAddress;

    private String certicateNo;

    private String issueUnit;

    private Date issueDate;

    private Date validityStartDate;

    private Date validityEndDate;

    private String rating;

    private String remarks;

    private Integer state;

    private Date createTime;

    private String operator;

    private Date operateTime;

    private String operateIp;

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

    public String getNamePy() {
        return namePy;
    }

    public void setNamePy(String namePy) {
        this.namePy = namePy == null ? null : namePy.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic == null ? null : pic.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district == null ? null : district.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getAddresseeName() {
        return addresseeName;
    }

    public void setAddresseeName(String addresseeName) {
        this.addresseeName = addresseeName == null ? null : addresseeName.trim();
    }

    public String getAddresseePhone() {
        return addresseePhone;
    }

    public void setAddresseePhone(String addresseePhone) {
        this.addresseePhone = addresseePhone == null ? null : addresseePhone.trim();
    }

    public String getAddresseeProvince() {
        return addresseeProvince;
    }

    public void setAddresseeProvince(String addresseeProvince) {
        this.addresseeProvince = addresseeProvince == null ? null : addresseeProvince.trim();
    }

    public String getAddresseeCity() {
        return addresseeCity;
    }

    public void setAddresseeCity(String addresseeCity) {
        this.addresseeCity = addresseeCity == null ? null : addresseeCity.trim();
    }

    public String getAddresseeDistrict() {
        return addresseeDistrict;
    }

    public void setAddresseeDistrict(String addresseeDistrict) {
        this.addresseeDistrict = addresseeDistrict == null ? null : addresseeDistrict.trim();
    }

    public String getAddresseeAddress() {
        return addresseeAddress;
    }

    public void setAddresseeAddress(String addresseeAddress) {
        this.addresseeAddress = addresseeAddress == null ? null : addresseeAddress.trim();
    }

    public String getCerticateNo() {
        return certicateNo;
    }

    public void setCerticateNo(String certicateNo) {
        this.certicateNo = certicateNo == null ? null : certicateNo.trim();
    }

    public String getIssueUnit() {
        return issueUnit;
    }

    public void setIssueUnit(String issueUnit) {
        this.issueUnit = issueUnit == null ? null : issueUnit.trim();
    }

    public Date getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(Date issueDate) {
        this.issueDate = issueDate;
    }

    public Date getValidityStartDate() {
        return validityStartDate;
    }

    public void setValidityStartDate(Date validityStartDate) {
        this.validityStartDate = validityStartDate;
    }

    public Date getValidityEndDate() {
        return validityEndDate;
    }

    public void setValidityEndDate(Date validityEndDate) {
        this.validityEndDate = validityEndDate;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating == null ? null : rating.trim();
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
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