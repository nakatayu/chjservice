package com.chj.entity;

/**
 * 企业
 */

public class Company implements java.io.Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 4136765697356491596L;
	private Long companyId;
	private String name;
	private String address;
	private String email;
	private String logo;
	private String starScore;
	private String registDate;
	private String companyInfo;
	private Long browseCount;
	private String companyType;
	private String linkman;
	private String linkmanTel;
	private String companyURL;

	public Company() {
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getStarScore() {
		return starScore;
	}

	public void setStarScore(String starScore) {
		this.starScore = starScore;
	}

	public String getRegistDate() {
		return registDate;
	}

	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}

	public String getCompanyInfo() {
		return companyInfo;
	}

	public void setCompanyInfo(String companyInfo) {
		this.companyInfo = companyInfo;
	}

	public Long getBrowseCount() {
		return browseCount;
	}

	public void setBrowseCount(Long browseCount) {
		this.browseCount = browseCount;
	}

	public String getCompanyType() {
		return companyType;
	}

	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}

	public String getLinkman() {
		return linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public String getLinkmanTel() {
		return linkmanTel;
	}

	public void setLinkmanTel(String linkmanTel) {
		this.linkmanTel = linkmanTel;
	}

	public String getCompanyURL() {
		return companyURL;
	}

	public void setCompanyURL(String companyURL) {
		this.companyURL = companyURL;
	}

}