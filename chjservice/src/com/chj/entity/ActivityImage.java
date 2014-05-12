package com.chj.entity;

import java.io.Serializable;
import java.util.Date;

public class ActivityImage implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8365334745032151961L;
	private Long activityId;
	private String image;
	
	public Long getActivityId() {
		return activityId;
	}
	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
}
