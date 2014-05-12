package com.chj.entity;

import java.util.Date;

public class CircleTag  implements java.io.Serializable {


    // Fields    

     private Long circleId;
     private Long tagId;
     private String status;
     private Date addTime;


    // Constructors

    /** default constructor */
    public CircleTag() {
    }

    
    /** full constructor */
    public CircleTag(Long circleId, Long tagId, String status, Date addTime) {
        this.circleId = circleId;
        this.tagId = tagId;
        this.status = status;
        this.addTime = addTime;
    }

   
    

    public Long getCircleId() {
        return this.circleId;
    }
    
    public void setCircleId(Long circleId) {
        this.circleId = circleId;
    }

    public Long getTagId() {
        return this.tagId;
    }
    
    public void setTagId(Long tagId) {
        this.tagId = tagId;
    }

    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }

    public Date getAddTime() {
        return this.addTime;
    }
    
    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }
   








}