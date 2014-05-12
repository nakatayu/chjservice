package com.chj.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.chj.common.Commonparam;

public class ActivityPart implements Serializable{
	
	
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
	private Integer moneynum;//费用
	private Date enrollBeginTime;//报名开始时间
	private Date enrollEndTime;//报名结束时间
	private String payType; //付款方式
	private String moneyDetail;//费用明细
	private String traffic;//交通推荐
	private String lat;
	private String lng;
	private String activityUserStatus;
	private Long companyId;
	private Integer examineResult;
	
	private Long commentCount;//话题数
	private Long userCount;
	private List<HashMap> tagList;
	private Long hasAdd;//是否已加入到该活动	
	private Long hasQrcode;//是否已订票,即生成二维码
	private String param;//其它参数
	private Date chinaBeginTime;
	private Object userInfo;
	
	
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
	public String getCreateTime() {
		if(this.createTime!=null){
			return Commonparam.Date2Str(this.createTime);
		}
		return "";
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
	public Integer getMoneynum() {
		return moneynum;
	}
	public void setMoneynum(Integer moneynum) {
		this.moneynum = moneynum;
	}
	public String getEnrollBeginTime() {
		if(this.enrollBeginTime !=null){
			return Commonparam.Date2Str(this.enrollBeginTime);
		}
		return "";
	}
	public void setEnrollBeginTime(Date enrollBeginTime) {
		this.enrollBeginTime = enrollBeginTime;
	}
	public String getEnrollEndTime() {
		if(this.enrollEndTime !=null){
			return Commonparam.Date2Str(this.enrollEndTime);
		}
		return "";
	}
	public void setEnrollEndTime(Date enrollEndTime) {
		this.enrollEndTime = enrollEndTime;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public String getMoneyDetail() {
		return moneyDetail;
	}
	public void setMoneyDetail(String moneyDetail) {
		this.moneyDetail = moneyDetail;
	}
	public String getTraffic() {
		return traffic;
	}
	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
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
	public Long getHasAdd() {
		return hasAdd;
	}
	public void setHasAdd(Long hasAdd) {
		this.hasAdd = hasAdd;
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
	public Long getHasQrcode() {
		return hasQrcode;
	}
	public void setHasQrcode(Long hasQrcode) {
		this.hasQrcode = hasQrcode;
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
	
	public Object getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(Object userInfo) {
		this.userInfo = userInfo;
	}
	public String getActivityUserStatus() {
		return activityUserStatus;
	}
	public void setActivityUserStatus(String activityUserStatus) {
		this.activityUserStatus = activityUserStatus;
	}
	public Long getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}
	public Integer getExamineResult() {
		return examineResult;
	}
	public void setExamineResult(Integer examineResult) {
		this.examineResult = examineResult;
	}
	
}
