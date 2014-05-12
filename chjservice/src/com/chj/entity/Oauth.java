package com.chj.entity;

import java.io.Serializable;
import java.util.Date;

public class Oauth implements Serializable{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 编号，主键
	 */
	private Long oauthId;
	/**
	 * 发送的userId
	 * 不是真正的，是发送给对方的
	 */
	private Long userId;
	/**
	 * 发给对方的用户Id：userId
	 */
	private String userIdCode;
	/**
	 * 发给对方的用户名称：userName
	 */
	private String userNameCode;
	/**
	 * 用户设置的第三方信息获取权限
	 */
	private String scope;
	/**
	 * 返回参数，有效时间15分钟
	 * 只能使用一次
	 */
	private String code;
	/**
	 * code是否被使用
	 */
	private String codeIsUsed;
	/**
	 * code的创建时间
	 */
	private Date oauthTime;
	/**
	 * 返回参数，有效期7天,按oauthTime时间计算
	 */
	private String token;	
	private String pointUrl;	
	private String state;	
	
	public Oauth() {
		super();
	}
	 
	public Oauth(Long oauthId, Long userId, String userIdCode,
			String userNameCode, String scope, String code, String codeIsUsed,
			Date oauthTime, String token, String pointUrl, String state) {
		super();
		this.oauthId = oauthId;
		this.userId = userId;
		this.userIdCode = userIdCode;
		this.userNameCode = userNameCode;
		this.scope = scope;
		this.code = code;
		this.codeIsUsed = codeIsUsed;
		this.oauthTime = oauthTime;
		this.token = token;
		this.pointUrl = pointUrl;
		this.state = state;
	}

	public Long getOauthId() {
		return oauthId;
	}
	public void setOauthId(Long oauthId) {
		this.oauthId = oauthId;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getUserIdCode() {
		return userIdCode;
	}
	public void setUserIdCode(String userIdCode) {
		this.userIdCode = userIdCode;
	}
	public String getUserNameCode() {
		return userNameCode;
	}
	public void setUserNameCode(String userNameCode) {
		this.userNameCode = userNameCode;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCodeIsUsed() {
		return codeIsUsed;
	}
	public void setCodeIsUsed(String codeIsUsed) {
		this.codeIsUsed = codeIsUsed;
	}
	public Date getOauthTime() {
		return oauthTime;
	}
	public void setOauthTime(Date oauthTime) {
		this.oauthTime = oauthTime;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getPointUrl() {
		return pointUrl;
	}
	public void setPointUrl(String pointUrl) {
		this.pointUrl = pointUrl;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
		
}
