package com.json;

public class JsonLableObject {

	private String tagName;
	private Long tagId;
	private Object child;
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public Long getTagId() {
		return tagId;
	}
	public void setTagId(Long tagId) {
		this.tagId = tagId;
	}
	public Object getChild() {
		return child;
	}
	public void setChild(Object child) {
		this.child = child;
	}
}
