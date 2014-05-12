package com.sand.crypto;
/**
 * 杉德卡用户信息对照
 * @author Administrator
 *
 */
public class SandMinUser {
	
	private String payMode;
	private String payInstrument;
	private String cardNo;;
	private String personName;
	private String idType;
	private String idNo;	
 
	public SandMinUser() {
		super();
	}
	
	public String getPayMode() {
		return payMode;
	}
	public void setPayMode(String payMode) {
		this.payMode = payMode;
	}
	public String getPayInstrument() {
		return payInstrument;
	}
	public void setPayInstrument(String payInstrument) {
		this.payInstrument = payInstrument;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getPersonName() {
		return personName;
	}
	public void setPersonName(String personName) {
		this.personName = personName;
	}
	public String getIdType() {
		return idType;
	}
	public void setIdType(String idType) {
		this.idType = idType;
	}
	public String getIdNo() {
		return idNo;
	}
	public void setIdNo(String idNo) {
		this.idNo = idNo;
	}
	
}
