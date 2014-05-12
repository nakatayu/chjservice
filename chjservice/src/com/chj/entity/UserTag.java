package com.chj.entity;

import java.sql.Timestamp;
import java.util.Date;

/**
 * 
 */

public class UserTag  implements java.io.Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -90604316380198690L;
	/**
     * 主键
     */
	 private Long userTagId;
	private Long userId;
     private Long tagId;
     private Date addTime;
     /**
      * 删除状态:T删除F未删除
      */
     private String status;
     
    public UserTag() {
    }

    public Long getUserTagId() {
		return userTagId;
	}

	public void setUserTagId(Long userTagId) {
		this.userTagId = userTagId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getTagId() {
		return tagId;
	}

	public void setTagId(Long tagId) {
		this.tagId = tagId;
	}

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}