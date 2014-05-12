package com.chj.entity;
/**
 * 对应表circle_comment
 * @author Administrator
 *
 */
public class CircleComment implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 评论编号
	 */
	private Long circleCommentId;
	/**
	 * 评论圈子编号
	 */
	private Long circleId;
	/**
	 * 评论人
	 */
	private Long userId;
	/**
	 * 评论创建时间
	 */
	private String commentTime;
	/**
	 * 评论内容
	 */
	private String connent;
	
	public CircleComment() {
		super();
	}
	public Long getCircleCommentId() {
		return circleCommentId;
	}
	public void setCircleCommentId(Long circleCommentId) {
		this.circleCommentId = circleCommentId;
	}
	public Long getCircleId() {
		return circleId;
	}
	public void setCircleId(Long circleId) {
		this.circleId = circleId;
	}
	public String getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(String commentTime) {
		this.commentTime = commentTime;
	}
	public String getConnent() {
		return connent;
	}
	public void setConnent(String connent) {
		this.connent = connent;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
}
