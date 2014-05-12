package com.sand.crypto;

public class SandVersion {
	private String sign_type;
	private String sign;
	private String version;
	private String charset;
	private String access_number="0001";
	private String business_type;
	private Object business_body;
	private String access_time;
	private String access_type;
	private String access_ip;
	public SandVersion() {
		super();
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
	public String getAccess_number() {
		return access_number;
	}
	public void setAccess_number(String access_number) {
		this.access_number = access_number;
	}
	public String getBusiness_type() {
		return business_type;
	}
	public void setBusiness_type(String business_type) {
		this.business_type = business_type;
	}
	public Object getBusiness_body() {
		return business_body;
	}
	public void setBusiness_body(Object business_body) {
		this.business_body = business_body;
	}
	public String getAccess_time() {
		return access_time;
	}
	public void setAccess_time(String access_time) {
		this.access_time = access_time;
	}
	public String getAccess_type() {
		return access_type;
	}
	public void setAccess_type(String access_type) {
		this.access_type = access_type;
	}
	public String getAccess_ip() {
		return access_ip;
	}
	public void setAccess_ip(String access_ip) {
		this.access_ip = access_ip;
	}
	
}
