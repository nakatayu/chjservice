package com.sand.crypto;

public class SandOrder {
	/**
	 *  签名类型 
	 */
	private String sign_type;
	/**
	 *  数字签名 
	 */
	private String sign;
	/**
	 *  协议版本
	 */
	private String version;
	/**
	 *  字符编码 
	 */
	private String charset;
	/**
	 *  交易类型 
	 */
	private String trans_type;
	/**
	 *  商户号  
	 */
	private String merchant_id;
	/**
	 *  商户简称 
	 */
	private String merchant_name;
	/**
	 *  商品描述 
	 */
	private String goods_content;
	/**
	 *  用户IP  
	 */
	private String custome_ip;
	/**
	 *  订单号 
	 */
	private String order_id;
	/**
	 *  系统内部订单号 
	 */
	private String sm_billno;
	/**
	 *  交易时间
	 */
	private String order_time;
	/**
	 *  交易金额 
	 */
	private String order_amount;
	/**
	 *  交易币种
	 */
	private String currency;
	/**
	 *  默认支付方式
	 */
	private String pay_kind;
	/**
	 *  前端通知URL
	 */
	private String front_url; 
	/**
	 *  后台通知URL
	 */
	private String back_url;
	/**
	 *  附加信息 
	 */
	private String merchant_attach;
	public SandOrder() {
		super();
		this.sign_type="00";
		this.version="01";
		this.charset="UTF-8";
	}
	
	public String getSign_type() {
		return sign_type;
	}
	public void setSign_type(String sign_type) {
		this.sign_type = sign_type;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getCharset() {
		return charset;
	}
	public void setCharset(String charset) {
		this.charset = charset;
	}
	public String getTrans_type() {
		return trans_type;
	}
	public void setTrans_type(String trans_type) {
		this.trans_type = trans_type;
	}
	public String getMerchant_id() {
		return merchant_id;
	}
	public void setMerchant_id(String merchant_id) {
		this.merchant_id = merchant_id;
	}
	public String getMerchant_name() {
		return merchant_name;
	}
	public void setMerchant_name(String merchant_name) {
		this.merchant_name = merchant_name;
	}
	public String getGoods_content() {
		return goods_content;
	}
	public void setGoods_content(String goods_content) {
		this.goods_content = goods_content;
	}
	public String getCustome_ip() {
		return custome_ip;
	}
	public void setCustome_ip(String custome_ip) {
		this.custome_ip = custome_ip;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getSm_billno() {
		return sm_billno;
	}
	public void setSm_billno(String sm_billno) {
		this.sm_billno = sm_billno;
	}
	public String getOrder_time() {
		return order_time;
	}
	public void setOrder_time(String order_time) {
		this.order_time = order_time;
	}
	public String getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(String order_amount) {
		this.order_amount = order_amount;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getPay_kind() {
		return pay_kind;
	}
	public void setPay_kind(String pay_kind) {
		this.pay_kind = pay_kind;
	}
	public String getFront_url() {
		return front_url;
	}
	public void setFront_url(String front_url) {
		this.front_url = front_url;
	}
	public String getBack_url() {
		return back_url;
	}
	public void setBack_url(String back_url) {
		this.back_url = back_url;
	}
	public String getMerchant_attach() {
		return merchant_attach;
	}
	public void setMerchant_attach(String merchant_attach) {
		this.merchant_attach = merchant_attach;
	}
	
}
