package com.chj.entity;

import java.util.Date;


/**
 * 对应 tb_verify_message
 */

public class VerifyMessage implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	// Fields
	/**
	 * 中文注释: 
	 * 约束 : primary key
	 * 数据库中字段名 : verify_message_id
	 * 数据库中类型类型 : bigint
	 * 数据库中类型长度 : 
	 * 注释: 
	 */
	private Long verifyMessageId;
	/**
	 * 中文注释: 电话号码
	 * 约束 : not null
	 * 数据库中字段名 : phone
	 * 数据库中类型类型 : varchar2
	 * 数据库中类型长度 : 31
	 * 注释: 
	 */
	private String phone;
	/**
	 * 中文注释: message
	 * 约束 : 
	 * 数据库中字段名 : message
	 * 数据库中类型类型 : varchar2
	 * 数据库中类型长度 : 31
	 * 注释: 
	 */
	private String message;
	/**
	 * 中文注释: 创建时间
	 * 约束 : 
	 * 数据库中字段名 : create_time
	 * 数据库中类型类型 : datetime
	 * 数据库中类型长度 : 
	 * 注释: 
	 */
	private Date createTime;
	/**
	 * 中文注释: 失效时间
	 * 约束 : 
	 * 数据库中字段名 : fail_time
	 * 数据库中类型类型 : datetime
	 * 数据库中类型长度 : 
	 * 注释: 
	 */
	private Date failTime;
	/**
	 * 中文注释: 状态
	 * 约束 : 
	 * 数据库中字段名 : status
	 * 数据库中类型类型 : varchar2
	 * 数据库中类型长度 : 2
	 * 注释: 
	 */
	private String status;

	// Constructors

	/** default constructor */
	public VerifyMessage() {
	}

	/** minimal constructor */
	public VerifyMessage(String phone) {
		this.phone = phone;
	}

	public VerifyMessage(String phone, String message, Date failTime) {
		super();
		this.phone = phone;
		this.message = message;
		this.failTime = failTime;
	}

	/** full constructor */
	public VerifyMessage(String phone, String message, Date createTime,
			Date failTime, String status) {
		this.phone = phone;
		this.message = message;
		this.createTime = createTime;
		this.failTime = failTime;
		this.status = status;
	}

	// Property accessors

	public Long getVerifyMessageId() {
		return this.verifyMessageId;
	}

	public void setVerifyMessageId(Long verifyMessageId) {
		this.verifyMessageId = verifyMessageId;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMessage() {
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getFailTime() {
		return this.failTime;
	}

	public void setFailTime(Date failTime) {
		this.failTime = failTime;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}