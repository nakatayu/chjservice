package com.chj.entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * 商品
 */

public class Product  implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = -2461749752726404917L;
	private Long productId;
     private Long productCategoryId;
     private String name;
     private String brand;
     private String factory;
     private String place;
     private String feature;
     private String  summary;
     private String createTime;
     private Long createUserId;
     private String content;
     private Long lastEditUserId;
     private Long companyId;
     private Integer shareCount;
     private Integer starScore;
     private Long browseCount;
     private Object isCollection;//中间查询值
     private String sellCount;//中间查询值
     private Integer stock;//中间查询值
     private Object tagList;//中间查询值
     private Object sku;//中间查询值,当前sku
     private Object image;//中间查询值
     private Long companyShopProductId;
     private Object shopInfo;
     
     private String allSkuList;//商品所有sku,json
     private List<ProductAttribute> allAttrList;//商品所有属性
     private List<String> imgList;//详情图片列表
     private String selectedSkuAttr;
     public Product() {
     }
     
    public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Long getProductCategoryId() {
		return productCategoryId;
	}

	public void setProductCategoryId(Long productCategoryId) {
		this.productCategoryId = productCategoryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getFactory() {
		return factory;
	}

	public void setFactory(String factory) {
		this.factory = factory;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getFeature() {
		return feature;
	}

	public void setFeature(String feature) {
		this.feature = feature;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}


	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public Long getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(Long createUserId) {
		this.createUserId = createUserId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getLastEditUserId() {
		return lastEditUserId;
	}

	public void setLastEditUserId(Long lastEditUserId) {
		this.lastEditUserId = lastEditUserId;
	}

	public Integer getShareCount() {
		return shareCount;
	}

	public void setShareCount(Integer shareCount) {
		this.shareCount = shareCount;
	}

	public Integer getStarScore() {
		return starScore;
	}

	public void setStarScore(Integer starScore) {
		this.starScore = starScore;
	}

	public Object getIsCollection() {
		return isCollection;
	}

	public void setIsCollection(Object isCollection) {
		this.isCollection = isCollection;
	}

	public String getSellCount() {
		return sellCount;
	}

	public void setSellCount(String sellCount) {
		this.sellCount = sellCount;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public Object getTagList() {
		return tagList;
	}

	public void setTagList(Object tagList) {
		this.tagList = tagList;
	}


	public Object getSku() {
		return sku;
	}

	public void setSku(Object sku) {
		this.sku = sku;
	}

	public Object getImage() {
		return image;
	}

	public void setImage(Object image) {
		this.image = image;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public Long getCompanyShopProductId() {
		return companyShopProductId;
	}

	public void setCompanyShopProductId(Long companyShopProductId) {
		this.companyShopProductId = companyShopProductId;
	}

	public List<String> getImgList() {
		return imgList;
	}

	public void setImgList(List<String> imgList) {
		this.imgList = imgList;
	}

	public List<ProductAttribute> getAllAttrList() {
		return allAttrList;
	}

	public void setAllAttrList(List<ProductAttribute> allAttrList) {
		this.allAttrList = allAttrList;
	}

	public String getAllSkuList() {
		return allSkuList;
	}

	public void setAllSkuList(String allSkuList) {
		this.allSkuList = allSkuList;
	}

	public Long getBrowseCount() {
		return browseCount;
	}

	public void setBrowseCount(Long browseCount) {
		this.browseCount = browseCount;
	}

	public Object getShopInfo() {
		return shopInfo;
	}

	public void setShopInfo(Object shopInfo) {
		this.shopInfo = shopInfo;
	}

	public String getSelectedSkuAttr() {
		return selectedSkuAttr;
	}

	public void setSelectedSkuAttr(String selectedSkuAttr) {
		this.selectedSkuAttr = selectedSkuAttr;
	}

    
}