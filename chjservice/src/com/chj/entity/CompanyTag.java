package com.chj.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: Richard
 * Date: 13-11-5
 * Time: 下午5:02
 * To change this template use File | Settings | File Templates.
 */
public class CompanyTag implements Serializable {
	private Long companyTagId;
	private Long companyId;
	private Long tagId;
	private String status;
	private Date addTime;

	public Long getCompanyTagId() {
		return companyTagId;
	}

	public void setCompanyTagId(Long companyTagId) {
		this.companyTagId = companyTagId;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public Long getTagId() {
		return tagId;
	}

	public void setTagId(Long tagId) {
		this.tagId = tagId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
}
