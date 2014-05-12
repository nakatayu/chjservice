package com.chj.entity;

import java.io.Serializable;

public class UserServer implements Serializable {

	private static final long serialVersionUID = -5644129905541930843L;

	private Long id;
	private String userName;
	private String passWord;
	
	public UserServer() {
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

}