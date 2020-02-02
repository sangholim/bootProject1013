package com.pro1.user.vo;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@Entity(name = "user")
@Table(name = "USER")
@DynamicUpdate
@JsonSerialize
public class UserVO extends CommonUserVO {

    private String addrPlace;
    
    private String mailNum;
    
    private String phoneNumber;
    
    private String country;
    
    private String city;
    
    private String photoPath;
    
    private long createDate;
    
    private long modifyDate;
    
    private String gender;
    
    private String birthday;

    public String getGender() {
	return gender;
    }

    public void setGender(String gender) {
	this.gender = gender;
    }

    public String getBirthday() {
	return birthday;
    }

    public void setBirthday(String birthday) {
	this.birthday = birthday;
    }

    public String getAddrPlace() {
	return addrPlace;
    }

    public void setAddrPlace(String addrPlace) {
	this.addrPlace = addrPlace;
    }

    public String getMailNum() {
	return mailNum;
    }

    public void setMailNum(String mailNum) {
	this.mailNum = mailNum;
    }

    public String getPhoneNumber() {
	return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
	this.phoneNumber = phoneNumber;
    }

    public String getCountry() {
	return country;
    }

    public void setCountry(String country) {
	this.country = country;
    }

    public String getCity() {
	return city;
    }

    public void setCity(String city) {
	this.city = city;
    }

    public String getPhotoPath() {
	return photoPath;
    }

    public void setPhotoPath(String photoPath) {
	this.photoPath = photoPath;
    }

    public long getCreateDate() {
	return createDate;
    }

    public void setCreateDate(long createDate) {
	this.createDate = createDate;
    }

    public long getModifyDate() {
	return modifyDate;
    }

    public void setModifyDate(long modifyDate) {
	this.modifyDate = modifyDate;
    }

    @Override
    public String toString() {

	return "id: " + id;
    }

}
