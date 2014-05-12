package com.chj.service.impl;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.dao.CommonDao;
import com.chj.dao.UserDao;
import com.chj.entity.AskOAuth;
import com.chj.entity.DepuGoods;
import com.chj.entity.Oauth;
import com.chj.entity.User;
import com.chj.entity.UserServer;
import com.chj.service.CommonManager;
import com.chj.service.UserManager;
import com.chj.util.MD5Util;
import com.chj.util.OAuthData;

@Service
@Transactional
public class CommonManagerImpl implements CommonManager {
	@Autowired
	CommonDao commonDao;

	@Override
	public void updateObjectBrowseCount(String table, String pkField,
			Long pkFieldValue, String countField) {
		HashMap map = new HashMap();
		map.put("table", table);
		map.put("pkField", pkField);
		map.put("pkFieldValue", pkFieldValue);
		map.put("countField", countField);
		
		commonDao.updateObjectBrowseCount(map);
	}
	
	@Override
	public Object addDepuGoods(HashMap depuProduct, DepuGoods depuGoods) {
					
		depuProduct.put("content", depuGoods.getDescription());
		depuProduct.put("productName", depuGoods.getName());
		depuProduct.put("productNumber", depuGoods.getId());
		
		String v=Integer.valueOf(depuGoods.getStatus())==1?"F":"T";		
		depuProduct.put("status", v);
		depuProduct.put("price", depuGoods.getCurrent_price());
		depuProduct.put("oprice", depuGoods.getOrigin_price());
		depuProduct.put("image", depuGoods.getImages());
		
		Date CreateTime=new Date(Long.valueOf(depuGoods.getUpdate_time()));
		depuProduct.put("CreateTime", CreateTime);
		
		HashMap product=commonDao.findProductInfo(depuProduct);
		
		Long productId=0L;
		if(product!=null&&product.size()>0){
			
			Date d=(Date) product.get("create_time");
			if(d.getTime()<Long.valueOf(depuGoods.getUpdate_time())){
				productId=(Long) product.get("product_id");
				depuProduct.put("productId", productId);
				commonDao.updateProductInfo(depuProduct);
			}
		}else{			
			productId=(Long) commonDao.addProductInfo(depuProduct);
			depuProduct.put("productId",productId);
			commonDao.addproductSkuInfo(depuProduct);
		}		
		return productId;
	}

	@Override
	public Object addProductCategory(HashMap category) {
		
		HashMap parentType =(HashMap) commonDao.queryShopType(category);
		Long categoryId=0L;
		
		if(parentType!=null&&parentType.size()>0){
			categoryId=(Long) parentType.get("product_shop_category_id");
			
			if(category.get("childenCategory")!=null){				
				category.put("parentId", categoryId);
				category.put("parentCategory", category.get("childenCategory"));
				HashMap childType =(HashMap) commonDao.queryShopType(category);
				
				if(childType==null||childType.size()<=0){
					categoryId= commonDao.InsertShopType(category);
				}else{
					categoryId= (Long)parentType.get("product_shop_category_id");
				}
			}
			
		}else{
			categoryId=commonDao.InsertShopType(category);
			
			if(category.get("childenCategory")!=null){
				category.put("parentId", categoryId);
				category.put("parentCategory", category.get("childenCategory"));
				categoryId= commonDao.InsertShopType(category);
			}			
		}
		return categoryId;
	}

	@Override
	public Oauth greateOauthClass(User user,String pointUrl,String state) {
		Oauth oauth=new Oauth();
		oauth.setUserId(user.getUserId());//1
		oauth.setPointUrl(pointUrl);
		oauth.setState(state);
		Date d=new Date();
		oauth.setOauthTime(d);//2
		String date = new SimpleDateFormat("HHmmss").format(d);		
		
		String userIdCode=null;
		String userNameCode=null;
		String token =null; 
		String code =null;
		try {
			code =  MD5Util.digest(date + OAuthData.FirstShopKey);
			userIdCode = MD5Util.digest(user.getUserId().toString()) + "@chjuser";			
			userNameCode= MD5Util.digest(user.getNickName()+"oauth")+"@chjuser";
			token=MD5Util.digest(String.valueOf(user.getUserId()+d.getTime())) + date;
		} catch (Exception e) {
			e.printStackTrace();
		}
		oauth.setCode(code);// 3
		oauth.setUserIdCode(userIdCode);//4
		oauth.setUserNameCode(userNameCode);//5
		oauth.setToken(token);//7
		oauth.setScope("A");//6
		oauth.setCodeIsUsed("F");
		Long authId=commonDao.greateOauthObjClass(oauth);
		if(authId>0){
			return oauth;
		}
		return null;	
	}

	@Override
	public HashMap<String, Object> grantOauthToken(String code) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("code", code);
		Date dd = new Date();
		dd.setMinutes(dd.getMinutes() - 15);
		map.put("authTime", dd);		
		Oauth auth = commonDao.grantOauthToken(map);

		HashMap<String, Object> map2 = new HashMap<String, Object>();		
		if (auth != null) {
			if (auth.getCodeIsUsed().equals("F")) {
				map.put("codeIsUsed", "T");				
				Integer i = commonDao.updOauthToken(map);				
				if (i == 1) {
					map2.put("access_token", auth.getToken());
					Date d = auth.getOauthTime();
					d.setDate(d.getDate()+3);
					Long time=d.getTime();
					map2.put("expires_in", time);
				} else {
					map2.put("error", "500");
					map2.put("error_desc", "code error!");
				}
			} else {
				map2.put("error", "500");
				map2.put("error_desc", "code out of time!");
			}
		} else {
			map2.put("error", "400");
			map2.put("error_desc", "no data in database!");
		}
		return map2;
	}

	@Override
	public Oauth findOauthCodeUser(String access_token) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Date d = new Date();
		d.setMinutes(d.getMinutes()-60);
		map.put("authTime", d);
		map.put("token", access_token);
		Oauth auth =commonDao.findOauthCodeUser(map);
		return auth;
	}

	@Override
	public String CreateOAuthData(User user, String client_secret,
			String redirect_uri, String state, String scope){
		
		AskOAuth auth = new AskOAuth();
		auth.setUserId(user.getUserId());
		auth.setNickName(user.getNickName());// 1
		try {
			auth.setRedirectUrl(URLEncoder.encode(redirect_uri, "UTF-8"));// 2
		} catch (UnsupportedEncodingException e1) {			
			e1.printStackTrace();
		}
		Date d = new Date();
		auth.setOAuthDate(d);// 3
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(d);
		String code = com.chj.common.TestEncrypt.encrypt(date + OAuthData.FirstShopKey);
		auth.setCode(code);// 4
		auth.setCodeIsUsed("false");// 5
		String token = com.chj.common.TestEncrypt.encrypt(OAuthData.FirstShopSecret + date);
		auth.setAccessToken(token);// 6
		auth.setState(state);// 7
		if (scope == null || scope.equals("")) {
			auth.setScope("A");
		} else {
			auth.setScope(scope);// 8
		}
		auth.setClientSecret(client_secret);// 9
		
		Long authId=commonDao.InsertOauthClall(auth);
		String url = null;
		if (authId>0) {			
			try {
				url = redirect_uri + "?code=" + auth.getCode() + "&state="+URLEncoder.encode(auth.getState(),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		} else {
			url = redirect_uri + "?error=400&error_desc=database error!";
		}		
		return url;
	}

	@Override
	public Map<String, Object> FindAccessToken(String client_secret, String code) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("clientSecret", client_secret);
		map.put("code", code);
		Date dd = new Date();
		dd.setMinutes(dd.getMinutes() - 15);
		map.put("OAuthDate", dd);
		
		AskOAuth auth = (AskOAuth)commonDao.queryTheASKOAUthinfo(map);

		Map<String, Object> map2 = new HashMap<String, Object>();
		
		if (auth != null) {
			if (auth.getCodeIsUsed().equals("false")) {
				map.put("codeIsUsed", "true");
				
				Integer i = commonDao.updateTheCodrStatus(map);
				
				if (i == 1) {
					map2.put("access_token", auth.getAccessToken().trim());
					Date d = auth.getOAuthDate();
					d.setMinutes(d.getMinutes()+60);
					Long time=d.getTime();
					map2.put("expires_in", time);
				} else {
					map2.put("error", "500");
					map2.put("error_desc", "code error!");
				}
			} else {
				map2.put("error", "500");
				map2.put("error_desc", "code out of time!");
			}
		} else {
			map2.put("error", "400");
			map2.put("error_desc", "no data in database!");
		}
		return map2;
	}

	@Override
	public Object FindOAuthUser(String access_token) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Date d = new Date();
		d.setMinutes(d.getMinutes()-60);
		map.put("date", d);
		map.put("access_token", access_token);
		AskOAuth auth = (AskOAuth)commonDao.FindOAuthUser(map);
		return auth;
	}

	@Override
	public Object updateOrderStatus(HashMap map) {
		
		return commonDao.updateOrderStatus(map);
	}

	@Override
	public Oauth findOauthUser(Long userId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Date d = new Date();
		d.setDate(d.getDate()-3);
		map.put("authTime", d);
		map.put("userId", userId);
		return commonDao.findOauthCodeUser(map);
	}

	@Override
	public Integer updateOauthDate(Oauth oauth) {
		oauth.setOauthTime(new Date());
		oauth.setCodeIsUsed("F");
		return commonDao.updateOauthDate(oauth);
	}


}
