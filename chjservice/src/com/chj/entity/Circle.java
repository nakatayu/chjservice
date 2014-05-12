package com.chj.entity;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.chj.common.Commonparam;

/**
 * TbCircle entity. @author MyEclipse Persistence Tools
 */

public class Circle implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	// Fields
	/** 
	 * 中文注释 : 圈子
	 * 约束 : pk
	 * 数据库中字段名 : circle_id
	 * 数据库中类型类型 : bigint
	 * 数据库中类型长度 : 
	 * 注释 : 
	 */
	private Long circleId;
	/** 
	 * 中文注释 : name
	 * 约束 : not null
	 * 数据库中字段名 : name
	 * 数据库中类型类型 : varchar
	 * 数据库中类型长度 : 63
	 * 注释 : 
	 */
	private String name;
	/** 
	 * 中文注释 : 创建人账号
	 * 约束 : 
	 * 数据库中字段名 : user_id
	 * 数据库中类型类型 : bigint
	 * 数据库中类型长度 : 
	 * 注释 : 如果是普通用户创建则不为空
	 */
	private Long userId;
	/** 
	 * 中文注释 : 创建时间
	 * 约束 : 
	 * 数据库中字段名 : create_time
	 * 数据库中类型类型 : datetime
	 * 数据库中类型长度 : 
	 * 注释 : 
	 */
	private Date createTime;
	/** 
	 * 中文注释 : 圈子级别
	 * 约束 : 
	 * 数据库中字段名 : level
	 * 数据库中类型类型 : varchar
	 * 数据库中类型长度 : 2
	 * 注释 : 
	 */
	private String level;
	/** 
	 * 中文注释 : 状态
	 * 约束 : 
	 * 数据库中字段名 : status
	 * 数据库中类型类型 : varchar
	 * 数据库中类型长度 : 2
	 * 注释 : 
	 */
	private String status;
	/** 
	 * 中文注释 : 类型
	 * 约束 : 
	 * 数据库中字段名 : type
	 * 数据库中类型类型 : varchar
	 * 数据库中类型长度 : 2
	 * 注释 : 1企业/2普通
	 */
	private String type;
	/** 
	 * 中文注释 : 圈子内容
	 * 约束 : 
	 * 数据库中字段名 : circle_content
	 * 数据库中类型类型 : varchar
	 * 数据库中类型长度 : 255
	 * 注释 : 
	 */
	private String circleContent;
	private String summary;//摘要
	
	/**
	 * 圈子浏览次数
	 */
	private Long circleViews;
	/**
	 * 创建圈子图片
	 */
	private String circleImage;
	/**
	 * 加入用户是否需要审核
	 */
	private String isCheck;
	private Integer examineResult;
	private Long companyId;
	
	private Long topicCount;
	private Long userCount;
	private List<HashMap> tagList;
	private Long hasAdd;//是否已加入到该圈子
	private String circleUserStatus;//圈子用户状态
	private String nickName;
	private Long isCollection;
	
	// Constructors

	private String  param;//其它参数
	
	public List<HashMap> getTagList() {
		return tagList;
	}

	public void setTagList(List<HashMap> tagList) {
		this.tagList = tagList;
	}

	/** default constructor */
	public Circle() {
	}

	/** minimal constructor */
	public Circle(String name, Long userId) {
		this.name = name;
		this.userId = userId;
	}

	/** full constructor */
	
	// Property accessors

	public Long getCircleId() {
		return this.circleId;
	}

	public Circle(Long circleId, String name, Long userId, Date createTime,
			String level, String status, String type, String circleContent,
			String jionUser, Long circleViews, String circleImage) {
		super();
		this.circleId = circleId;
		this.name = name;
		this.userId = userId;
		this.createTime = createTime;
		this.level = level;
		this.status = status;
		this.type = type;
		this.circleContent = circleContent;
		this.circleViews = circleViews;
		this.circleImage = circleImage;
	}
	
	public String getCircleImage() {
		return circleImage;
	}

	public void setCircleImage(String circleImage) {
		this.circleImage = circleImage;
	}

	public void setCircleId(Long circleId) {
		this.circleId = circleId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getCreateTime() {
		if(this.createTime !=null){
			return Commonparam.Date2Str(this.createTime);
		}
		return "";
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getLevel() {
		return this.level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCircleContent() {
		return this.circleContent;
	}

	public void setCircleContent(String circleContent) {
		this.circleContent = circleContent;
	}

	public Long getCircleViews() {
		return circleViews;
	}

	public void setCircleViews(Long circleViews) {
		this.circleViews = circleViews;
	}

	public Long getUserCount() {
		return userCount;
	}

	public void setUserCount(Long userCount) {
		this.userCount = userCount;
	}

	public Long getHasAdd() {
		return hasAdd;
	}

	public void setHasAdd(Long hasAdd) {
		this.hasAdd = hasAdd;
	}

	public String getIsCheck() {
		return isCheck;
	}

	public void setIsCheck(String isCheck) {
		this.isCheck = isCheck;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}


	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public Long getTopicCount() {
		return topicCount;
	}

	public void setTopicCount(Long topicCount) {
		this.topicCount = topicCount;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Long getIsCollection() {
		return isCollection;
	}

	public void setIsCollection(Long isCollection) {
		this.isCollection = isCollection;
	}

	public Integer getExamineResult() {
		return examineResult;
	}

	public void setExamineResult(Integer examineResult) {
		this.examineResult = examineResult;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getCircleUserStatus() {
		return circleUserStatus;
	}

	public void setCircleUserStatus(String circleUserStatus) {
		this.circleUserStatus = circleUserStatus;
	}

}