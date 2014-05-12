package com.chj.entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * 商品
 */

public class ProductCollection  implements java.io.Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = 3290856289095545203L;
     private Long companyShopProductId;
     private Long  companyShopId;
     private Long  productId;
     
   
     private Object productInfo;//中间查询值browseCount,name;
     private String image;
     private Long commentCount;//中间查询值评论数
     private Object tagList;//中间查询值
     private Object sku;//中间查询值,当前sku
    
     
     public ProductCollection() {
     }
     
    public Long getProductId() {
		return productId;
	}

	public Long getCompanyShopProductId() {
		return companyShopProductId;
	}

	public void setCompanyShopProductId(Long companyShopProductId) {
		this.companyShopProductId = companyShopProductId;
	}

	public Long getCompanyShopId() {
		return companyShopId;
	}

	public void setCompanyShopId(Long companyShopId) {
		this.companyShopId = companyShopId;
	}



	public Long getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(Long commentCount) {
		this.commentCount = commentCount;
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

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Object getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(Object productInfo) {
		this.productInfo = productInfo;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

    
}