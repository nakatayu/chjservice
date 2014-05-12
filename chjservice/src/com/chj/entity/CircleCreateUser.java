package com.chj.entity;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.chj.common.Commonparam;

/**
 * 圈子创建人信息
 */

public class CircleCreateUser implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8083247482763042177L;
	
	private String nickName;
	private Long userId;
	private String headPicture;
	private String info;
	private String activeValue;
	private String sincerityValue;
	
	private Long hasAdd;//是否已加好友
	
	public Long getHasAdd() {
		return hasAdd;
	}
	public void setHasAdd(Long hasAdd) {
		this.hasAdd = hasAdd;
	}
	
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getHeadPicture() {
		return headPicture;
	}
	public void setHeadPicture(String headPicture) {
		this.headPicture = headPicture;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getActiveValue() {
		return activeValue;
	}
	public void setActiveValue(String activeValue) {
		this.activeValue = activeValue;
	}
	public String getSincerityValue() {
		return sincerityValue;
	}
	public void setSincerityValue(String sincerityValue) {
		this.sincerityValue = sincerityValue;
	}

}