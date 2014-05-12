package com.chj.entity;

import java.sql.Timestamp;
import java.util.Date;

/**
 * 商品
 */

public class CompanyShop implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -2461749752726404917L;
	
	private Long companyShopId;
	private String name;
	private String address;
	private String email;
	private Long companyId;
	private Date registTime;
	private String logo;
	private String location;
	private Long categoryId;
	private Integer consumptionPer;// 人均消费
	private Integer orderField;
	private Integer starScore;
	private Integer sendTime;
	private Integer sendPrice;
	private String payType;
	private String linkman;
	private String linkmanTel;
	private String content;
	private Long areaFirstId;
	private Long areaSecondId;
	private String deliverOk;
	private String terminalOk;
	private String workTime;
	private String serviceTime;
	private Integer deliverMoney;
	private String categoryName;// 不需要对应数据库字段
	private Integer status;//1是创建申请2是修改申请3关闭申请
	private Integer examineResult;//1 审核通过2审核不通过3未审核
	
	private String lng;
	private String lat;
	private Long isCollection;
	
	public Long getCompanyShopId() {
		return companyShopId;
	}

	public void setCompanyShopId(Long companyShopId) {
		this.companyShopId = companyShopId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	/** default constructor */
	public CompanyShop() {
	}

	public Date getRegistTime() {
		return registTime;
	}

	public void setRegistTime(Date registTime) {
		this.registTime = registTime;
	}

	public Integer getConsumptionPer() {
		return consumptionPer;
	}

	public void setConsumptionPer(Integer consumptionPer) {
		this.consumptionPer = consumptionPer;
	}

	public Integer getStarScore() {
		return starScore;
	}

	public void setStarScore(Integer starScore) {
		this.starScore = starScore;
	}

	public Integer getSendTime() {
		return sendTime;
	}

	public void setSendTime(Integer sendTime) {
		this.sendTime = sendTime;
	}

	public Integer getSendPrice() {
		return sendPrice;
	}

	public void setSendPrice(Integer sendPrice) {
		this.sendPrice = sendPrice;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getLinkman() {
		return linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public String getLinkmanTel() {
		return linkmanTel;
	}

	public void setLinkmanTel(String linkmanTel) {
		this.linkmanTel = linkmanTel;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getAreaFirstId() {
		return areaFirstId;
	}

	public void setAreaFirstId(Long areaFirstId) {
		this.areaFirstId = areaFirstId;
	}

	public Long getAreaSecondId() {
		return areaSecondId;
	}

	public void setAreaSecondId(Long areaSecondId) {
		this.areaSecondId = areaSecondId;
	}

	public String getDeliverOk() {
		return deliverOk;
	}

	public void setDeliverOk(String deliverOk) {
		this.deliverOk = deliverOk;
	}

	public String getTerminalOk() {
		return terminalOk;
	}

	public void setTerminalOk(String terminalOk) {
		this.terminalOk = terminalOk;
	}

	public Integer getOrderField() {
		return orderField;
	}

	public void setOrderField(Integer orderField) {
		this.orderField = orderField;
	}

	public String getWorkTime() {
		return workTime;
	}

	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}

	public Integer getDeliverMoney() {
		return deliverMoney;
	}

	public void setDeliverMoney(Integer deliverMoney) {
		this.deliverMoney = deliverMoney;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getServiceTime() {
		return serviceTime;
	}

	public void setServiceTime(String serviceTime) {
		this.serviceTime = serviceTime;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public Long getIsCollection() {
		return isCollection;
	}

	public void setIsCollection(Long isCollection) {
		this.isCollection = isCollection;
	}

	public Integer getExamineResult() {
		return examineResult;
	}

	public void setExamineResult(Integer examineResult) {
		this.examineResult = examineResult;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}