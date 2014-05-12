package com.chj.entity;

import java.sql.Timestamp;
import java.util.Date;

/**
 * 用户地址
 */

public class UserAddress  implements java.io.Serializable {

     /**
	 * 
	 */
	private static final long serialVersionUID = -6506294850470150343L;
	public Long getAddressId() {
		return addressId;
	}

	public void setAddressId(Long addressId) {
		this.addressId = addressId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	private Long addressId;
	private Long userId;
     private String name;//联系人
     private String postCode;//邮编
     private String address;
     private String phone;
     private String parentArea;
     private String childArea;
     private String companyName;
     private String telephone;
     private Integer isSelected;//1否2是
     private Long areaId;//二级区域ID
     private String addressDetail;//二级详细地址
     
    public UserAddress() {
    }

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getParentArea() {
		return parentArea;
	}

	public void setParentArea(String parentArea) {
		this.parentArea = parentArea;
	}

	public String getChildArea() {
		return childArea;
	}

	public void setChildArea(String childArea) {
		this.childArea = childArea;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Integer getIsSelected() {
		return isSelected;
	}

	public void setIsSelected(Integer isSelected) {
		this.isSelected = isSelected;
	}

	public Long getAreaId() {
		return areaId;
	}

	public void setAreaId(Long areaId) {
		this.areaId = areaId;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

    
}