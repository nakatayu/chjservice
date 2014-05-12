package com.chj.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import cn.eavic.framework.web.BaseAction;

import com.chj.common.Commonparam;
import com.chj.entity.CirclePart;
import com.chj.entity.CircleTag;
import com.chj.entity.User;
import com.chj.service.CircleManager;
import com.chj.service.UserManager;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "circleAction.action", type = "redirect") })
public class CircleAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7348862585787118222L;
	@Autowired
	CircleManager circleManager;
	@Autowired
	UserManager userManager;
	private Integer page, size;
	private String order,orderType,timeSpace,tagList,userCircle;
	
	public void findUserCircle() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("userId", user1.getUserId());
			param.put("size", size);
			param.put("startIndex", (page - 1) * size);
			param.put("order", order);
			param.put("orderType", orderType);	
			param.put("userCircle", userCircle);	
			if(timeSpace!=null && timeSpace.trim().length()>0 && !timeSpace.trim().equals("null")){
				param.put("timeSpace",Integer.valueOf(timeSpace));
			}
			if(tagList!=null && tagList.trim().length()>0){
				Commonparam.tagListParam(param,tagList);
			}
			
			List<CirclePart> myCircle = (List<CirclePart>) circleManager.findUserCircle(param);
			
			bean.setRows(myCircle);
			bean.setStatus(200);
			bean.setTotal(circleManager.findUserCircleCount(param));
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		System.out.println(json);
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getSize() {
		return size;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public String getTimeSpace() {
		return timeSpace;
	}

	public void setTimeSpace(String timeSpace) {
		this.timeSpace = timeSpace;
	}

	public String getTagList() {
		return tagList;
	}

	public void setTagList(String tagList) {
		this.tagList = tagList;
	}

	public String getUserCircle() {
		return userCircle;
	}

	public void setUserCircle(String userCircle) {
		this.userCircle = userCircle;
	}

	public void setSize(Integer size) {
		this.size = size;
	}
}
