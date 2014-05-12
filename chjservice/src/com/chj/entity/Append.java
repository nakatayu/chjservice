package com.chj.entity;

import java.io.Serializable;

public class Append implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4859221024853419789L;
	private Long appendId;
	private String name;
	private Double price;
	private Long parentId;
	private Long companyId;
	
	private java.util.List<Append> childs;

	public Long getAppendId() {
		return appendId;
	}

	public void setAppendId(Long appendId) {
		this.appendId = appendId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public java.util.List<Append> getChilds() {
		return childs;
	}

	public void setChilds(java.util.List<Append> childs) {
		this.childs = childs;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((appendId == null) ? 0 : appendId.hashCode());
		result = prime * result + ((childs == null) ? 0 : childs.hashCode());
		result = prime * result
				+ ((companyId == null) ? 0 : companyId.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result
				+ ((parentId == null) ? 0 : parentId.hashCode());
		result = prime * result + ((price == null) ? 0 : price.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Append other = (Append) obj;
		if (appendId == null) {
			if (other.appendId != null)
				return false;
		} else if (!appendId.equals(other.appendId))
			return false;
		if (childs == null) {
			if (other.childs != null)
				return false;
		} else if (!childs.equals(other.childs))
			return false;
		if (companyId == null) {
			if (other.companyId != null)
				return false;
		} else if (!companyId.equals(other.companyId))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (parentId == null) {
			if (other.parentId != null)
				return false;
		} else if (!parentId.equals(other.parentId))
			return false;
		if (price == null) {
			if (other.price != null)
				return false;
		} else if (!price.equals(other.price))
			return false;
		return true;
	}


}
