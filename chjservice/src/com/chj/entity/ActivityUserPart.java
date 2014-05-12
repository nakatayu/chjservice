package com.chj.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.chj.common.Commonparam;

public class ActivityUserPart implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3142003040274980595L;
	private Long activityId;
	private Long createUserId;
	private Date createTime;
	private String status;
	private Long circleId;
	private String title;
	private String address;
	private String summary;
	private String activityImage;
	private String adminMessage;
	private String joinType;//活动类型1线下2线上
	private Date beginTime;
	private Date endTime;
	private Date lastEditTime;
	private Long updateUserId;
	private String isCheck;//用户参加该活动是否需要审核
	private Long userMax;//用户参加该活动是否需要审核
	private String isQrcode;//是否生成二维码签到
	private String isMoney;//是否收费
	private Long browseCount;
	
	private String qrcodePath;
	private Long commentCount;//话题数
	private Long userCount;
	private List<HashMap> tagList;
	private String param;//其它参数
	private Date chinaBeginTime;
	private String isSignIn;
	
	
	public Long getActivityId() {
		return activityId;
	}
	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}
	public Long getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(Long createUserId) {
		this.createUserId = createUserId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Long getCircleId() {
		return circleId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getJoinType() {
		return joinType;
	}
	public void setJoinType(String joinType) {
		this.joinType = joinType;
	}
	public Date getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public Date getLastEditTime() {
		return lastEditTime;
	}
	public void setLastEditTime(Date lastEditTime) {
		this.lastEditTime = lastEditTime;
	}
	
	public String getIsCheck() {
		return isCheck;
	}
	public void setIsCheck(String isCheck) {
		this.isCheck = isCheck;
	}
	public void setCircleId(Long circleId) {
		this.circleId = circleId;
	}
	public String getActivityImage() {
		return activityImage;
	}
	public void setActivityImage(String activityImage) {
		this.activityImage = activityImage;
	}
	public Long getUserMax() {
		return userMax;
	}
	public void setUserMax(Long userMax) {
		this.userMax = userMax;
	}
	public List<HashMap> getTagList() {
		return tagList;
	}
	public void setTagList(List<HashMap> tagList) {
		this.tagList = tagList;
	}
	
	public String getParam() {
		return param;
	}
	public void setParam(String param) {
		this.param = param;
	}
	public Long getUpdateUserId() {
		return updateUserId;
	}
	public void setUpdateUserId(Long updateUserId) {
		this.updateUserId = updateUserId;
	}
	public String getAdminMessage() {
		return adminMessage;
	}
	public void setAdminMessage(String adminMessage) {
		this.adminMessage = adminMessage;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getIsQrcode() {
		return isQrcode;
	}
	public void setIsQrcode(String isQrcode) {
		this.isQrcode = isQrcode;
	}
	public String getIsMoney() {
		return isMoney;
	}
	public void setIsMoney(String isMoney) {
		this.isMoney = isMoney;
	}
	public Long getUserCount() {
		return userCount;
	}
	public void setUserCount(Long userCount) {
		this.userCount = userCount;
	}
	
	public String getChinaBeginTime() {
		
		if(this.beginTime!=null){
			return Commonparam.Date2ChinaStr(this.beginTime);
		}
		return "";
	}
	public void setChinaBeginTime(Date chinaBeginTime) {
		this.chinaBeginTime = chinaBeginTime;
	}
	
	public Long getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(Long commentCount) {
		this.commentCount = commentCount;
	}
	public Long getBrowseCount() {
		return browseCount;
	}
	public void setBrowseCount(Long browseCount) {
		this.browseCount = browseCount;
	}
	public String getQrcodePath() {
		return qrcodePath;
	}
	public void setQrcodePath(String qrcodePath) {
		this.qrcodePath = qrcodePath;
	}
	public String getIsSignIn() {
		return isSignIn;
	}
	public void setIsSignIn(String isSignIn) {
		this.isSignIn = isSignIn;
	}
	
}
