package com.chj.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class ActivityPhoto implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5343984141537126506L;
	private Long activityPhotoId;
	private Long activityId;
	private Long uploadUserId;
	private Date uploadTime;
	private String fileName;
	private String filePath;
	private Integer deleteFlag;
	
	private String nickName;
	
	//用于图片管理时，用户与图片创建者之间的关系
	private String roleUserId;

	public Long getActivityPhotoId() {
		return activityPhotoId;
	}

	public void setActivityPhotoId(Long activityPhotoId) {
		this.activityPhotoId = activityPhotoId;
	}

	public Long getActivityId() {
		return activityId;
	}

	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}

	public Long getUploadUserId() {
		return uploadUserId;
	}

	public void setUploadUserId(Long uploadUserId) {
		this.uploadUserId = uploadUserId;
	}

	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getRoleUserId() {
		return roleUserId;
	}

	public void setRoleUserId(String roleUserId) {
		this.roleUserId = roleUserId;
	}
	
}
