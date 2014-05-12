package com.chj.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.chj.common.Commonparam;

/**
 * 订单评价
 */

public class OrderComment implements java.io.Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = 5871848598549262118L;
	private Long orderCommentId;
	private Long orderId;
	private Long userId;
	private String name;
	private Date createDate;//要求到货时间
	private String content;
	
	public Long getOrderCommentId() {
		return orderCommentId;
	}
	public void setOrderCommentId(Long orderCommentId) {
		this.orderCommentId = orderCommentId;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	

}