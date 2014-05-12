package com.chj.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.chj.common.Commonparam;

/**
 * 订单物流信息
 */

public class OrderFlow implements java.io.Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = -545749193197999034L;
	
	private Long orderFlowId;
	private Long orderId;
	private Long userId;
	private String name;
	private Date createDate;//要求到货时间
	private String statusValue;
	public Long getOrderFlowId() {
		return orderFlowId;
	}
	public void setOrderFlowId(Long orderFlowId) {
		this.orderFlowId = orderFlowId;
	}
	public Long getOrderId() {
		return orderId;
	}
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCreateDate() {
		if(createDate !=null)
			return Commonparam.Date2Str(createDate);
		return "";
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getStatusValue() {
		return statusValue;
	}
	public void setStatusValue(String statusValue) {
		this.statusValue = statusValue;
	}
	

}