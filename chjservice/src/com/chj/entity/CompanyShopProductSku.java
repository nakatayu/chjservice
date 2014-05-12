package com.chj.entity;

import java.util.Date;
import java.util.List;
/**
 * 店铺产品具有的sku属性
 * @author Administrator
 *
 */
public class CompanyShopProductSku  implements java.io.Serializable {


  
     /**
	 * 
	 */
	private static final long serialVersionUID = 5252950819032949428L;
	private Long companyShopProductSkuId;
     private Long companyShopProductId;
     private String stock;
     private Long productSkuId;
     private ProductSku sku;
     
     private List<Long> attributeValueId;
     
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

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}

	public CompanyShopProductSku() {
    }

	public Long getProductSkuId() {
		return productSkuId;
	}

	public void setProductSkuId(Long productSkuId) {
		this.productSkuId = productSkuId;
	}

	public List<Long> getAttributeValueId() {
		return attributeValueId;
	}

	public void setAttributeValueId(List<Long> attributeValueId) {
		this.attributeValueId = attributeValueId;
	}

	public ProductSku getSku() {
		return sku;
	}

	public void setSku(ProductSku sku) {
		this.sku = sku;
	}

    
}