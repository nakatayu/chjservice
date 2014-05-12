package com.chj.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 订单详细信息
 */

public class OrderItem implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7917021896643803790L;
	private Long orderItemId;
	private Long productSkuId;
	private Long orderId;
	private Long productId;
	private String qty;
	private String total;
	private String price;
	
	private Object product;
	private Object sku;
	
	private Long companyShopProductId;
	private Long companyShopProductSkuId;
	
	private String commentText;
	 /**
     * 附加属性列表
     */
    private Object appendInfo;	

	public Long getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(Long orderItemId) {
		this.orderItemId = orderItemId;
	}

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public OrderItem() {
	}

	public Long getProductSkuId() {
		return productSkuId;
	}

	public void setProductSkuId(Long productSkuId) {
		this.productSkuId = productSkuId;
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

	public Long getCompanyShopProductId() {
		return companyShopProductId;
	}

	public void setCompanyShopProductId(Long companyShopProductId) {
		this.companyShopProductId = companyShopProductId;
	}

	public Long getCompanyShopProductSkuId() {
		return companyShopProductSkuId;
	}

	public void setCompanyShopProductSkuId(Long companyShopProductSkuId) {
		this.companyShopProductSkuId = companyShopProductSkuId;
	}

	public Object getAppendInfo() {
		return appendInfo;
	}

	public void setAppendInfo(Object appendInfo) {
		this.appendInfo = appendInfo;
	}


	public String getCommentText() {
		return commentText;
	}

	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}

}