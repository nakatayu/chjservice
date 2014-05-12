package com.chj.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.chj.entity.AskOAuth;
import com.chj.entity.Oauth;

@Repository
public class CommonDao extends BaseDao {

	public Object queryShopType(HashMap category) {
		Object list = this.getSqlMapClientTemplate().queryForObject(
				"DepuGoods.queryShopType", category);
		return list;
	}

	public Long InsertShopType(HashMap category) {

		Long id = (Long) this.getSqlMapClientTemplate().insert(
				"DepuGoods.InsertShopType", category);

		return id;
	}

	public void updateObjectBrowseCount(HashMap map) {
		this.getSqlMapClientTemplate().insert("User.updateObjectBrowseCount",
				map);
	}

	public Object addProductInfo(HashMap depuProduct) {

		Long productId = (Long) this.getSqlMapClientTemplate().insert(
				"DepuGoods.addProductInfo", depuProduct);
		return productId;
	}

	public HashMap findProductInfo(HashMap depuProduct) {

		HashMap product = (HashMap) this.getSqlMapClientTemplate()
				.queryForObject("DepuGoods.findProductInfo", depuProduct);
		return product;
	}

	public Object updateProductInfo(HashMap depuProduct) {
		this.getSqlMapClientTemplate().update("DepuGoods.updateProductInfo",
				depuProduct);
		this.getSqlMapClientTemplate().update("DepuGoods.updateProductSkuInfo",
				depuProduct);
		return null;
	}

	public void addproductSkuInfo(HashMap depuProduct) {
		Long productSkuId = (Long) this.getSqlMapClientTemplate().insert(
				"DepuGoods.addproductSku", depuProduct);
		Long shopProductId = (Long) this.getSqlMapClientTemplate().insert(
				"DepuGoods.addShopProduct", depuProduct);

		depuProduct.put("productSkuId", productSkuId);
		depuProduct.put("shopProductId", shopProductId);
		this.getSqlMapClientTemplate().insert("DepuGoods.addShopProductSku",
				depuProduct);
		if (depuProduct.get("image").toString().trim() != null) {
			this.getSqlMapClientTemplate().insert("DepuGoods.addProductImage",
					depuProduct);
		}
	}

	public Long InsertOauthClall(AskOAuth auth) {
		Long id = (Long) this.getSqlMapClientTemplate().insert(
				"AskOAuth.IntertOAuth", auth);
		return id;
	}

	public AskOAuth queryTheASKOAUthinfo(Map<String, Object> map) {
		AskOAuth auth = (AskOAuth) this.getSqlMapClientTemplate()
				.queryForObject("AskOAuth.selectToken", map);
		return auth;
	}

	public Integer updateTheCodrStatus(Map<String, Object> map) {
		Integer i = this.getSqlMapClientTemplate().update(
				"AskOAuth.updCodeUsed", map);
		return i;
	}

	public AskOAuth FindOAuthUser(HashMap<String, Object> map) {
		AskOAuth auth = (AskOAuth) this.getSqlMapClientTemplate()
				.queryForObject("AskOAuth.selectOAuth", map);
		return auth;
	}

	public int updateOrderStatus(HashMap map) {
		return this.getSqlMapClientTemplate().update("Order.updateOrderStatus",
				map);
	}

	public Long greateOauthObjClass(Oauth oauth) {
		Long oauthId = (Long) this.getSqlMapClientTemplate().insert(
				"Oauth.createOauthObject", oauth);
		return oauthId;
	}

	public Oauth grantOauthToken(HashMap<String, Object> map) {
		Oauth auth = (Oauth) this.getSqlMapClientTemplate()
				.queryForObject("Oauth.grantOauthToken", map);
		return auth;
	}

	public Integer updOauthToken(HashMap<String, Object> map) {		
		return this.getSqlMapClientTemplate().update("Oauth.updOauthToken",
				map);
	}

	public Oauth findOauthCodeUser(HashMap<String, Object> map) {
		
		Oauth auth = (Oauth) this.getSqlMapClientTemplate()
				.queryForObject("Oauth.grantOauthToken", map);
		return auth;		
	}

	public Integer updateOauthDate(Oauth oauth) {
		
		return this.getSqlMapClientTemplate()
				.update("Oauth.updateOauthDate", oauth);
	}

}
