package com.chj.entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * 购物车项目表
 */

public class CartItem  implements java.io.Serializable {


    // Fields    


     private Long cartItemId;
     private Long productSkuId;
     private String price;
     private Date createTime;
     private Integer qty;
     private Long userId;
     private Long productId;
     private Long shopId;
     private String oldPrice;
 	private Long companyShopProductId;
 	private Long companyShopProductSkuId;
     private Object product;
     private Object sku;
     /**
      * 是否收藏
      */
     private Object isCollection; 
     /**
      * 附加属性列表
      */
     private Object appendInfo;  
     
    // Constructors

    /** default constructor */
    public CartItem() {
    }

	public Long getCartItemId() {
		return cartItemId;
	}

	public void setCartItemId(Long cartItemId) {
		this.cartItemId = cartItemId;
	}

	public Long getProductSkuId() {
		return productSkuId;
	}

	public void setProductSkuId(Long productSkuId) {
		this.productSkuId = productSkuId;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}


	public Integer getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Long getShopId() {
		return shopId;
	}

	public void setShopId(Long shopId) {
		this.shopId = shopId;
	}

	public String getOldPrice() {
		return oldPrice;
	}

	public void setOldPrice(String oldPrice) {
		this.oldPrice = oldPrice;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Object getProduct() {
		return product;
	}

	public void setProduct(Object product) {
		this.product = product;
	}

	public Object getSku() {
		return sku;
	}

	public void setSku(Object sku) {
		this.sku = sku;
	}

	public Object getIsCollection() {
		return isCollection;
	}

	public void setIsCollection(Object isCollection) {
		this.isCollection = isCollection;
	}

	public Long getCompanyShopProductSkuId() {
		return companyShopProductSkuId;
	}

	public void setCompanyShopProductSkuId(Long companyShopProductSkuId) {
		this.companyShopProductSkuId = companyShopProductSkuId;
	}

	public Long getCompanyShopProductId() {
		return companyShopProductId;
	}

	public void setCompanyShopProductId(Long companyShopProductId) {
		this.companyShopProductId = companyShopProductId;
	}


	public Object getAppendInfo() {
		return appendInfo;
	}

	public void setAppendInfo(Object appendInfo) {
		this.appendInfo = appendInfo;
	}

    
}