package com.chj.entity;

import java.util.Date;

/**
 * tb_askOAuth
 * OAuth2.0协议
 * 第三方登录信息保存
 * @author Administrator
 */
public class AskOAuth implements java.io.Serializable{
	private static final long serialVersionUID = 1L;

	/**
	 * 编号，主键
	 */
	private Long OAuthId;
	/**
	 * url
	 */
	private String redirectUrl;
	/**
	 * 用户设置的第三方信息获取权限
	 */
	private String scope;
	/**
	 * 防止伪造攻击
	 */
	private String state;
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
	private Date OAuthDate;
	/**
	 * 返回参数，有效期7天
	 * 按OAuthDate时间计算
	 */
	private String accessToken;
	/**
	 * 请求方标记
	 */
	private String clientSecret;
	/**
	 * 中文注释: 昵称
	 * 数据库中字段名 : nick_name
	 */
	private String nickName;
	/**
	 * 发送的userId
	 * 不是真正的，是发送给对方的
	 */
	private Long userId;
	
	public AskOAuth() {
		super();
	}
	
	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getOAuthId() {
		return OAuthId;
	}
	public void setOAuthId(Long oAuthId) {
		OAuthId = oAuthId;
	}
	public String getRedirectUrl() {
		return redirectUrl;
	}
	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
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
	public Date getOAuthDate() {
		return OAuthDate;
	}
	public void setOAuthDate(Date oAuthDate) {
		OAuthDate = oAuthDate;
	}
	public String getAccessToken() {
		return accessToken;
	}
	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}
	public String getClientSecret() {
		return clientSecret;
	}
	public void setClientSecret(String clientSecret) {
		this.clientSecret = clientSecret;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
}
