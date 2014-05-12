package com.chj.service;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import com.chj.entity.DepuGoods;
import com.chj.entity.Oauth;
import com.chj.entity.User;

public interface CommonManager {

	void updateObjectBrowseCount(String table, String pkField,
			Long pkFieldValue, String countField);

	Object addProductCategory(HashMap category);

	Object addDepuGoods(HashMap category, DepuGoods depuGoods);

	String CreateOAuthData(User user, String client_secret,
			String redirect_uri, String state, String scope);

	Map<String, Object> FindAccessToken(String client_secret, String code);

	Object FindOAuthUser(String access_token);

	Object updateOrderStatus(HashMap map);

	Oauth greateOauthClass(User user,String pointUrl,String state);

	HashMap<String, Object> grantOauthToken(String code);

	Oauth findOauthCodeUser(String access_token);

	Oauth findOauthUser(Long userId);

	Integer updateOauthDate(Oauth oauth);
	
}
