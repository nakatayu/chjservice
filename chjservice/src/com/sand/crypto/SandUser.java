package com.sand.crypto;
/**
 * 杉德卡用户信息对照
 * @author Administrator
 *
 */
public class SandUser {
	
	private String payMode;
	private String payInstrument;
	private String cardNo;;
	private String personName;
	private String idType;
	private String idNo;
	private String issueNo;
	private String gender;
	private String mobileNo;
	private String compAddr;
	private String houseAddr;
	private String homeTel;
	private String mailBox;
	public SandUser() {
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
	public String getIssueNo() {
		return issueNo;
	}
	public void setIssueNo(String issueNo) {
		this.issueNo = issueNo;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getCompAddr() {
		return compAddr;
	}
	public void setCompAddr(String compAddr) {
		this.compAddr = compAddr;
	}
	public String getHouseAddr() {
		return houseAddr;
	}
	public void setHouseAddr(String houseAddr) {
		this.houseAddr = houseAddr;
	}
	public String getHomeTel() {
		return homeTel;
	}
	public void setHomeTel(String homeTel) {
		this.homeTel = homeTel;
	}
	public String getMailBox() {
		return mailBox;
	}
	public void setMailBox(String mailBox) {
		this.mailBox = mailBox;
	}
}
