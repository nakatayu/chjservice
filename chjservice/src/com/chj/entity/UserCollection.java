package com.chj.entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;

/**
 * 
 */

public class UserCollection  implements java.io.Serializable {


    /**
	 * 
	 */
	private static final long serialVersionUID = -329923207741285915L;
	// Fields    
     private Long userId;
     private Long objectId;
     private Integer type;
     private Date createTime;
     private String doType;
     
     private CirclePart circlePart;// 1:店铺 2:圈子3：活动4话题 5：商品
     private ActivityPart activityPart;// 1:店铺 2:圈子3：活动4话题 5：商品
     private TopicPart topicPart;// 1:店铺 2:圈子3：活动4话题 5：商品
     private ProductCollection proPart;// 1:店铺 2:圈子3：活动4话题 5：商品
     private HashMap shopInfo;

    /** default constructor */
    public UserCollection() {
    }


	public Long getUserId() {
		return userId;
	}


	public void setUserId(Long userId) {
		this.userId = userId;
	}


	public Long getObjectId() {
		return objectId;
	}


	public void setObjectId(Long objectId) {
		this.objectId = objectId;
	}


	public Integer getType() {
		return type;
	}


	public void setType(Integer type) {
		this.type = type;
	}


	public Date getCreateTime() {
		return createTime;
	}


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}



	public CirclePart getCirclePart() {
		return circlePart;
	}


	public void setCirclePart(CirclePart circlePart) {
		this.circlePart = circlePart;
	}


	public ActivityPart getActivityPart() {
		return activityPart;
	}


	public void setActivityPart(ActivityPart activityPart) {
		this.activityPart = activityPart;
	}


	public TopicPart getTopicPart() {
		return topicPart;
	}


	public void setTopicPart(TopicPart topicPart) {
		this.topicPart = topicPart;
	}


	public ProductCollection getProPart() {
		return proPart;
	}


	public void setProPart(ProductCollection proPart) {
		this.proPart = proPart;
	}


	public HashMap getShopInfo() {
		return shopInfo;
	}


	public void setShopInfo(HashMap shopInfo) {
		this.shopInfo = shopInfo;
	}


	public String getDoType() {
		return doType;
	}


	public void setDoType(String doType) {
		this.doType = doType;
	}

    
}