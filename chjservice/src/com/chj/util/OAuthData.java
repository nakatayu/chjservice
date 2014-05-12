package com.chj.util;

public interface OAuthData {
	/**
	 * 一号店
	 * 分配给第三方的key,对应字段client_id
	 */
	public static final String FirstShopKey="2EAC3A62D94FAC4D5745642E96AD14D8";
	/**
	 * 一号店
	 * 分配给第三方的secret，对应字段client_secret
	 */
	public static final String FirstShopSecret="9943F4FFFF4E2DFE8D7F68E6CAA9DC90";
	/**
	 * 响应类型及参数，对应字段reponse_type
	 */
	public static final String ResponseType="code";
	/**
	 * 响应类型及参数，对应字段grant_type
	 */
	public static final String GrantType="authorization_code";
	
}
