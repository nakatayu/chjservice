package com.chj.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.chj.common.Commonparam;

/**
 * 订单信息
 */

public class Order implements java.io.Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = -3646351696686343620L;
	private Long orderId;
	private String flowNo;
	private Long userId;
	private Date orderTime;//订单创建时间
	private String status;
	private String money;
	private Long shopId;
	private String name;
	private String address;
	private String phone;
	private String payType;
	private String sendType;//送货方式
	private String sendCost;
	private String serviceCost;
	private String total;
	private Date sendDate;//要求到货时间
	private String info;
	private String orderDay;
	private String payStatus;
	
	private List<OrderItem> orderItemList;
	
	private String shopName;
	private Long productCommentCount;//商品评论总数
	
	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public String getFlowNo() {
		return flowNo;
	}

	public void setFlowNo(String flowNo) {
		this.flowNo = flowNo;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getOrderTime() {
		if(this.orderTime!=null){
			return Commonparam.Date2Str(this.orderTime);
		}
		return "";
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public Long getShopId() {
		return shopId;
	}

	public void setShopId(Long shopId) {
		this.shopId = shopId;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getSendType() {
		return sendType;
	}

	public void setSendType(String sendType) {
		this.sendType = sendType;
	}

	public String getSendCost() {
		return sendCost;
	}

	public void setSendCost(String sendCost) {
		this.sendCost = sendCost;
	}

	public String getServiceCost() {
		return serviceCost;
	}

	public void setServiceCost(String serviceCost) {
		this.serviceCost = serviceCost;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public Order() {
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public List<OrderItem> getOrderItemList() {
		return orderItemList;
	}

	public void setOrderItemList(List<OrderItem> orderItemList) {
		this.orderItemList = orderItemList;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	public String getOrderDay() {
		return orderDay;
	}

	public void setOrderDay(String orderDay) {
		this.orderDay = orderDay;
	}

	public Long getProductCommentCount() {
		return productCommentCount;
	}

	public void setProductCommentCount(Long productCommentCount) {
		this.productCommentCount = productCommentCount;
	}

}