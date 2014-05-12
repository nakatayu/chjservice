package com.chj.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.chj.common.Commonparam;

public class TopicComment implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -9217457925099441202L;
	private Long topicCommentId;
	private Long topicId;
	private Long userId;
	private Date commentTime;
	private String content;
	private String toContent;
	
	private String headImage;
	private String nickName;
	private Long toUserId;//回复某人Id
	private String toNickName;//回复某人的昵称
	
	public TopicComment() {
		super();
	}

	public Long getTopicId() {
		return topicId;
	}

	public void setTopicId(Long topicId) {
		this.topicId = topicId;
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

	public Long getTopicCommentId() {
		return topicCommentId;
	}

	public void setTopicCommentId(Long topicCommentId) {
		this.topicCommentId = topicCommentId;
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

	public String getToContent() {
		return toContent;
	}

	public void setToContent(String toContent) {
		this.toContent = toContent;
	}

}
