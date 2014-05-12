package com.json;

public class BaseBean {

	private int status=400;
	private String msg;
	private Object rows;
	private Object total;
	private Object append;//附加属性
	public void setStatus(int status) {
		this.status = status;
	}
	public int getStatus() {
		return status;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getMsg() {
		return msg;
	}
	public Object getRows() {
		return rows;
	}
	public void setRows(Object rows) {
		this.rows = rows;
	}
	public Object getTotal() {
		return total;
	}
	public void setTotal(Object total) {
		this.total = total;
	}
	public Object getAppend() {
		return append;
	}
	public void setAppend(Object append) {
		this.append = append;
	}
}
