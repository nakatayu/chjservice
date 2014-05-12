package com.chj.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class ActivityAlbum implements Serializable{
	
	
	/**
	 * 活动相册表
	 */
	private static final long serialVersionUID = -5343984141537126506L;
	private Long activityAlbumId;
	private Long activityId;
	private Long uploadUserId;
	private Date uploadTime;
	private String fileName;//首张图片
	private String filePath;//首张图片
	private Integer deleteFlag;
	
	private String nickName;

	
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

	public Long getActivityAlbumId() {
		return activityAlbumId;
	}

	public void setActivityAlbumId(Long activityAlbumId) {
		this.activityAlbumId = activityAlbumId;
	}

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
}
