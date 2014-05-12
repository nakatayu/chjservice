package com.chj.entity;

import jxl.write.DateTime;

import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * User: Richard
 * Date: 13-10-25
 * Time: 下午2:59
 * To change this template use File | Settings | File Templates.
 */
public class ServiceTag implements Serializable {
	public Long serviceTagId;
	public Long serviceId;
	public Long tagId;
	public DateTime addTime;
	public String status;

	public Long getServiceTagId() {
		return serviceTagId;
	}

	public void setServiceTagId(Long serviceTagId) {
		this.serviceTagId = serviceTagId;
	}

	public Long getServiceId() {
		return serviceId;
	}

	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}

	public Long getTagId() {
		return tagId;
	}

	public void setTagId(Long tagId) {
		this.tagId = tagId;
	}

	public DateTime getAddTime() {
		return addTime;
	}

	public void setAddTime(DateTime addTime) {
		this.addTime = addTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
} 