package com.chj.entity;

import java.sql.Timestamp;

public class UserCircle  implements java.io.Serializable {


    // Fields    

     private Long userCircleId;
     /**
      * 用户编号
      */
     private Long userId;
     /**
      * 圈子编号
      */
     private Long circleId;
     
     private String status;
     private Timestamp applyTime;
     private String message;
     private Timestamp exitTime;
     private String type;


    // Constructors

    /** default constructor */
    public UserCircle() {
    }

	/** minimal constructor */
    public UserCircle(Long userId, Long circleId) {
        this.userId = userId;
        this.circleId = circleId;
    }
    
    /** full constructor */
    public UserCircle(Long tbUser, Long circleId, String status, Timestamp applyTime, String message, Timestamp exitTime, String type) {
        this.userId = userId;
        this.circleId = circleId;
        this.status = status;
        this.applyTime = applyTime;
        this.message = message;
        this.exitTime = exitTime;
        this.type = type;
    }

   
    // Property accessors

    public Long getUserCircleId() {
        return this.userCircleId;
    }
    
    public void setUserCircleId(Long userCircleId) {
        this.userCircleId = userCircleId;
    }

    public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getCircleId() {
		return circleId;
	}

	public void setCircleId(Long circleId) {
		this.circleId = circleId;
	}

	public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getApplyTime() {
        return this.applyTime;
    }
    
    public void setApplyTime(Timestamp applyTime) {
        this.applyTime = applyTime;
    }

    public String getMessage() {
        return this.message;
    }
    
    public void setMessage(String message) {
        this.message = message;
    }

    public Timestamp getExitTime() {
        return this.exitTime;
    }
    
    public void setExitTime(Timestamp exitTime) {
        this.exitTime = exitTime;
    }

    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
   








}