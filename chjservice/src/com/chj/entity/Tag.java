package com.chj.entity;

import java.sql.Timestamp;
import java.util.Date;

/**
 * tb_tag 
 */

public class Tag  implements java.io.Serializable {


    // Fields    

	/**
	 * 标签编号
	 */
     private Long tagId;
 	/**
 	 * 标签名称
 	 */
     private String tagName;
 	/**
 	 * 标签详细注释
 	 */
     private String createAccount;
 	/**
 	 * 标签创建时间
 	 */
     private Date createDate;
 	/**
 	 * 
 	 */
     private Long clickCount;
 	/**
 	 * 
 	 */
     private Long parentId;


    // Constructors

    /** default constructor */
    public Tag() {
    }

    
    /** full constructor */
    public Tag(String tagName, String createAccount, Timestamp createDate, Long clickCount, Long parentId) {
        this.tagName = tagName;
        this.createAccount = createAccount;
        this.createDate = createDate;
        this.clickCount = clickCount;
        this.parentId = parentId;
    }

   
    // Property accessors

    public Long getTagId() {
        return this.tagId;
    }
    
    public void setTagId(Long tagId) {
        this.tagId = tagId;
    }

    public String getTagName() {
        return this.tagName;
    }
    
    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public String getCreateAccount() {
        return this.createAccount;
    }
    
    public void setCreateAccount(String createAccount) {
        this.createAccount = createAccount;
    }

    public Date getCreateDate() {
        return this.createDate;
    }
    
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Long getClickCount() {
        return this.clickCount;
    }
    
    public void setClickCount(Long clickCount) {
        this.clickCount = clickCount;
    }

    public Long getParentId() {
        return this.parentId;
    }
    
    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

}