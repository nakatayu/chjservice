package com.chj.util;
/**
 * 杉德卡支付参数常量
 * @author Administrator
 *
 */
public interface SandCard {
	
	/**
	 * 协议版本
	 */
	public static final String version="01";
	
	/**
	 * 字符编码
	 */
	public static final String charset="UTF-8";
	
	/**
	 * 交易类型:0001：消费,0002：消费撤销 ,0003：退货,0004：交易查询
	 */
	public static final String[] trans_type=new String[]{"0001","0002","0003","0004"};
	
	/**
	 * 商户号,杉德多支付平台统一分配给接入商户的唯一代码, 一般为15位,如:888002148160001
	 */
	public static final String merchant_id="888002148160001";
	
	/**
	 * 交易币种,默认：156/人民币
	 */
	public static final String currency="156";
	
	/**
	 * 默认支付方式,支持以下方式支付类型：01：杉德卡,02：信用卡,03：储蓄卡,
	 * 04：充值卡,05：其它预付费卡,06：现金/刷卡支付,07：第三方支付
	 */
	public static final String[] pay_kind=new String[]{"01","02","03","04","05","06","07"};
	
	/**
	 * 签名类型,签名算法：默认RSA,	00：RSA ; 01：SHA-1
	 */
	public static final String[] sign_type=new String[]{"00","01"};
	
	/** 外部通讯代理应用_CHJ接口   */
	/**
	 * sign签名参数
	 */
	public static final String[] sign_value=new String[]{"824671395","571398246"};
	/**
	 * 协议版本
	 */
	public static final String outVersion="ver1.0.0";
	/**
	 * 字符编码
	 */
	public static final String outCharset="UTF-8";
	/**
	 * 应用接入编号,0001：CHJ漕河泾
	 */
	public static final String access_number="0001";
	/**
	 * 应用接入类型,0001：网站（default）0002：手机
	 */
	public static final String[] access_type={"0001","0002"};
	/**
	 * 业务类型,00010001：持卡人信息修改,00010002：持卡人信息查询
	 */
	public static final String[] business_type={"00010001","00010002"};
	/**
	 * 响应码
	 */
	public static final String[] response_code={"00010001","00010002"};
	/**
	 * 支付方式编码,PM001:网银
	 */
	public static final String payMode="PM001";
	/**
	 * 支付工具编码,PI001:杉德卡
	 */
	public static final String payInstrument="PI001";
	/**
	 * 签名类型,默认MD5
	 */
	public static final String outSign_type="MD5";
}
