package com.chj.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.chj.common.Commonparam;

public class ActivityComment implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7028234705056761219L;
	private Long activityCommentId;
	private Long activityId;
	private Long userId;
	private Date commentTime;
	private String content;
	private String toContent;
	private Long toUserId;//回复某人Id
	
	private String headImage;
	private String nickName;
	private String toNickName;//回复某人的昵称
	
	public ActivityComment() {
		super();
	}


	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}



	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getHeadImage() {
		return headImage;
	}

	public void setHeadImage(String headImage) {
		this.headImage = headImage;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	

	public String getCommentTime() {
		if(this.commentTime != null)
			return Commonparam.Date2Str(commentTime);
					
		return "";
	}

	public void setCommentTime(Date commentTime) {
		this.commentTime = commentTime;
	}

	public Long getToUserId() {
		return toUserId;
	}

	public void setToUserId(Long toUserId) {
		this.toUserId = toUserId;
	}

	public String getToNickName() {
		return toNickName;
	}

	public void setToNickName(String toNickName) {
		this.toNickName = toNickName;
	}


	public Long getActivityCommentId() {
		return activityCommentId;
	}


	public void setActivityCommentId(Long activityCommentId) {
		this.activityCommentId = activityCommentId;
	}


	public Long getActivityId() {
		return activityId;
	}


	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}


	public String getToContent() {
		return toContent;
	}


	public void setToContent(String toContent) {
		this.toContent = toContent;
	}

}
