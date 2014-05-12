package com.chj.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import cn.eavic.framework.web.BaseAction;

import com.chj.common.Commonparam;
import com.chj.common.HttpGetMsg;
import com.chj.common.MatrixToImageWriter;
import com.chj.entity.Activity;
import com.chj.entity.ActivityComment;
import com.chj.entity.ActivityPart;
import com.chj.entity.ActivityPhoto;
import com.chj.entity.Circle;
import com.chj.entity.CircleCreateUser;
import com.chj.entity.CirclePart;
import com.chj.entity.CompanyShopProductSku;
import com.chj.entity.Product;
import com.chj.entity.Topic;
import com.chj.entity.TopicComment;
import com.chj.entity.TopicPart;
import com.chj.entity.User;
import com.chj.entity.UserServer;
import com.chj.service.CommonManager;
import com.chj.service.CommunityManager;
import com.chj.service.ProductManager;
import com.chj.service.UserManager;
import com.chj.util.JsonDateValueProcessor;
import com.chj.util.JsonSqlDateValueProcessor;
import com.chj.util.StaticConstant;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.json.BaseBean;
import com.json.JsonLableObject;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "communityAction.action", type = "redirect") })
public class CommunityAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4259430859146059011L;
	@Autowired
	CommunityManager communityManager;
	@Autowired
	UserManager userManager;
	@Autowired
	ProductManager productManager;
	@Autowired
	CommonManager commonManager;
	private SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	private String pagejsp, userId, companyId;

	private Double latmin, latmax, lngmin, lngmax;

	/**
	 * 地图查询活动
	 * 
	 * @throws Exception
	 */
	public void findActivityMapList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user = (User) request.getSession().getAttribute("user");

			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("size", size);
			param.put("startIndex", (page - 1) * size);
			// if (latmin != null && latmin > 0)
			// param.put("latmin", latmin);
			// if (latmax != null && latmax > 0)
			// param.put("latmax", latmax);
			// if (lngmin != null && lngmin > 0)
			// param.put("lngmin", lngmin);
			// if (lngmax != null && lngmax > 0)
			// param.put("lngmax", lngmax);

			param.put("latmin", 28.333);
			param.put("latmax", 38.333);
			param.put("lngmin", 110.1111);
			param.put("lngmax", 130.3333);

			List<HashMap> activityList = communityManager
					.findActivityMapList(param);

			bean.setStatus(200);
			bean.setRows(activityList);
			bean.setTotal(communityManager.findActivityMapListCount(param));

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class,
				new JsonSqlDateValueProcessor("yyyy:MM:dd HH:mm"));
		String json = JSONObject.fromObject(bean, jsonConfig).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 上传证件
	 * 
	 * @throws Exception
	 */
	private String objectId, doType, reason;
	private File uploadFile;
	private String uploadFileFileName;

	public void uploadPersonnalApplyCard() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null || objectId == null || type == null
					|| doType == null) {
				bean.setStatus(400);
				bean.setMsg("参数错误!");
			} else {

				String path = "";
				boolean flag = false;
				if (this.uploadFile != null) {
					int length = 0;
					try {
						FileInputStream fis = new FileInputStream(uploadFile);
						try {
							length = fis.available();
						} catch (IOException e1) {
							e1.printStackTrace();
						}
					} catch (FileNotFoundException e2) {
						e2.printStackTrace();
					}

					if (Commonparam.imageMax >= length) {
						String newfilename = Commonparam
								.makeNewFileName(uploadFileFileName);
						String targetFolder = Commonparam.cardImage
								+ Commonparam.makeYearMonth(new Date());
						String absolute = Commonparam
								.getKeyValue("imageStorePath") + targetFolder;

						Commonparam.makeFile(this.uploadFile, absolute,
								newfilename);

						path = targetFolder + newfilename;

						flag = true;
					} else {
						bean.setStatus(400);
						bean.setMsg("图片大小300K内!");
					}
				}
				if (flag) {
					HashMap map = new HashMap();
					map.put("reason", reason);
					map.put("objectId", objectId);
					map.put("type", type);
					map.put("doType", doType);
					map.put("createTime", new Date());
					map.put("userId", user.getUserId());
					map.put("filePath", path);

					int rt = communityManager.uploadPersonnalApplyCard(map,
							type);
					if (rt > 0)
						bean.setStatus(200);
				}

			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 活动照片上传
	 * 
	 * @throws Exception
	 */
	private String filePath;

	public void uploadActivityImage() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null || activityId == null || filePath == null) {
				bean.setStatus(400);
				bean.setMsg("参数错误!");
			} else {

				HashMap map = new HashMap();
				map.put("activityId", activityId);
				map.put("uploadUserId", user.getUserId());
				long count = communityManager.findActivityUserImageCount(map);
				if (count >= 10) {
					bean.setStatus(400);
					bean.setMsg("已达到最大限制图片数10!");
				} else {
					map.put("createTime", new Date());
					map.put("filePath", filePath);
					map.put("fileName", "");
					map.put("deleteFlag", "1");
					int rt = communityManager.uploadActivityImage(map);
					if (rt > 0)
						bean.setStatus(200);
					else {
						bean.setStatus(400);
						bean.setMsg("上传失败!");
					}
				}

			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 活动成员管理
	 * 
	 * @throws Exception
	 */
	public void turnpage() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		User user = (User) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		String page = "common/result.jsp";
		try {
			if (user != null) {

				// 发起人/企业
				if (companyId != null && companyId.trim().length() > 0) {
					HashMap companyInfo = communityManager
							.findCommunityCompanyInfo(Long.valueOf(companyId));
					request.setAttribute("companyInfo", companyInfo);
					request.setAttribute("companyId", companyId);
					request.setAttribute("isCheck", isCheck);
					page = "pages/" + pagejsp;
				} else {

					String status = communityManager.findActivityUserStatus(
							user.getUserId(), Long.valueOf(activityId));

					boolean flag = false;
					if (user.getUserId().toString().equals(userId)) {
						flag = true;
						page = "pages/" + pagejsp;
						request.setAttribute("actRoleId", "1");// 发起人
					} else {
						if (status == null || !status.equals("3")) {
							if (status != null)
								request.setAttribute("result",
										StaticConstant.ACTIVITY_ERROR[Integer
												.valueOf(status)]);
							else
								request.setAttribute("result",
										StaticConstant.ACTIVITY_ERROR[0]);

						} else {
							flag = true;
							request.setAttribute("actRoleId", "0");// 普通人员
						}

					}
					if (flag) {
						page = "pages/" + pagejsp;
						CircleCreateUser usercreate = communityManager
								.findCircleCreateUser(Long.valueOf(userId));
						request.setAttribute("activityCreateUser", usercreate);
					}
				}
				request.setAttribute("activityId", activityId);
				request.setAttribute("actUserId", userId);

			} else {
				// request.setAttribute("result", "请登录!");

				page = "pages/community_activity_member1.jsp";
				if (companyId != null && companyId.trim().length() > 0) {
					HashMap companyInfo = communityManager
							.findCommunityCompanyInfo(Long.valueOf(companyId));
					request.setAttribute("companyInfo", companyInfo);
					request.setAttribute("companyId", companyId);
					request.setAttribute("isCheck", isCheck);

				} else {

					CircleCreateUser usercreate = communityManager
							.findCircleCreateUser(Long.valueOf(userId));
					request.setAttribute("activityCreateUser", usercreate);

				}
				request.setAttribute("activityId", activityId);
				request.setAttribute("actUserId", userId);

			}

		} catch (Exception e) {
			request.setAttribute("result", e.getLocalizedMessage());
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * 圈子成员管理
	 * 
	 * @throws Exception
	 */
	public void turnpageCircleMember() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		User user = (User) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		String page = "common/result.jsp";
		try {
			if (user != null) {

				String status = communityManager.findCircleUserStatus(
						user.getUserId(), Long.valueOf(circleId));
				if (companyId != null && companyId.trim().length() > 0) {
					// 企业
					page = "pages/" + pagejsp;
					HashMap companyInfo = communityManager
							.findCommunityCompanyInfo(Long.valueOf(companyId));
					request.setAttribute("companyInfo", companyInfo);
					request.setAttribute("companyId", companyId);

					if (status == null || !status.equals("3")) {
						if (status != null)
							request.setAttribute("result",
									StaticConstant.CIRCLE_ERROR[Integer
											.valueOf(status)]);
						else
							request.setAttribute("result",
									StaticConstant.CIRCLE_ERROR[0]);

					} else {
						Integer role = communityManager.findCircleUserRole(
								user.getUserId(), Long.valueOf(circleId));
						if (role != null && role.intValue() == 1) {// 管理员
							request.setAttribute("actRoleId", "1");
						} else {// 审核通过
							request.setAttribute("actRoleId", "0");// 普通用户
						}
						page = "pages/" + pagejsp;

					}

				} else {

					if (user.getUserId().toString().equals(userId)) {
						request.setAttribute("actRoleId", "2");// 发起人
						page = "pages/" + pagejsp;
					} else {

						if (status == null || !status.equals("3")) {
							if (status != null)
								request.setAttribute("result",
										StaticConstant.CIRCLE_ERROR[Integer
												.valueOf(status)]);
							else
								request.setAttribute("result",
										StaticConstant.CIRCLE_ERROR[0]);
						} else {
							Integer role = communityManager.findCircleUserRole(
									user.getUserId(), Long.valueOf(circleId));
							if (role != null && role.intValue() == 1) {// 管理员
								request.setAttribute("actRoleId", "1");
							} else {// 审核通过
								request.setAttribute("actRoleId", "0");// 普通用户
							}
							page = "pages/" + pagejsp;

						}

					}

					CircleCreateUser usercreate = communityManager
							.findCircleCreateUser(Long.valueOf(userId));
					request.setAttribute("activityCreateUser", usercreate);

				}
				request.setAttribute("circleId", circleId);
				request.setAttribute("actUserId", userId);

			} else {
				// request.setAttribute("result", "请登录!");
				page = "pages/community_circle_member1.jsp";

				if (companyId != null && companyId.trim().length() > 0) {
					// 企业
					HashMap companyInfo = communityManager
							.findCommunityCompanyInfo(Long.valueOf(companyId));
					request.setAttribute("companyInfo", companyInfo);
					request.setAttribute("companyId", companyId);
				} else {
					CircleCreateUser usercreate = communityManager
							.findCircleCreateUser(Long.valueOf(userId));
					request.setAttribute("activityCreateUser", usercreate);

					request.setAttribute("circleId", circleId);
					request.setAttribute("actUserId", userId);
				}

			}

		} catch (Exception e) {
			request.setAttribute("result", e.getLocalizedMessage());
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * 首页圈子
	 * 
	 * @throws Exception
	 */
	public void findIndexCircle() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("size", 3);
			param.put("startIndex", 0);
			param.put("orderType", "time");
			param.put("order", "desc");

			List<CirclePart> circleNew = communityManager
					.findHomeCircleList(param);
			List<CirclePart> circleRecommend = communityManager
					.findCircleRecommendList(param);
			HashMap rt = new HashMap();
			rt.put("circleNew", circleNew);
			rt.put("circleRecommend", circleRecommend);

			bean.setStatus(200);
			bean.setRows(rt);

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 人脉社区首页
	 * 
	 * @throws Exception
	 */
	public void communityHome() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String page = "pages/community_index.jsp";
		User user = (User) request.getSession().getAttribute("user");
		try {

			List<ActivityPart> activityList = activityRecommend(user, request,
					null, 2);
			if (user != null) {
				for (ActivityPart circle : activityList) {
					if (user.getUserId() != null
							&& circle.getCreateUserId() != null
							&& user.getUserId().longValue() == circle
									.getCreateUserId().longValue()) {
						circle.setHasAdd(1L);
						circle.setHasQrcode(1L);
					} else {
						circle.setHasAdd(communityManager
								.findActivityUserCount(circle.getActivityId(),
										user.getUserId()));
						if (circle.getIsQrcode() != null
								&& circle.getIsQrcode().equals("T")) {
							circle.setHasQrcode(communityManager
									.findHasQrcodeCount(circle.getActivityId(),
											user.getUserId()));
						}
					}

				}
			}
			request.setAttribute("hotActivity", activityList);

			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("size", 2);
			param.put("startIndex", 0);
			param.put("order", "desc");
			param.put("orderType", "time");

			// 推荐圈子
			List<CirclePart> circleList = circleRecommend(user, request, null,
					6);
			if (user != null) {
				for (CirclePart circle : circleList) {
					circle.setHasAdd(communityManager.findCircleUserCount(
							circle.getCircleId(), user.getUserId()));
				}
			}
			request.setAttribute("hotCircle", circleList);

			// 热门话题
			List<TopicPart> topicList = topicRecommend(user, request, null, 6);
			request.setAttribute("hotTopic", topicList);

		} catch (Exception e) {
			page = "common/404.jsp";
			request.setAttribute("error", e.getLocalizedMessage());
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * 商圈标签
	 * 
	 * @throws Exception
	 */
	public void findLableListCircle() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String page = "pages/community_circlelist.jsp";
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			List<ActivityPart> activityRecommend = activityRecommend(user1,
					request, null, 3);
			request.setAttribute("activityRecommend", activityRecommend);
			Integer hotCircle = communityManager.findCircleHotNum();
			if (hotCircle == null) {
				hotCircle = 100;
			}
			request.setAttribute("circleHot", hotCircle);

		} catch (Exception e) {
			request.setAttribute("error", e.getLocalizedMessage());
		}

		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * 圈子列表
	 * 
	 * @throws Exception
	 */
	private String keyword, tagId;
	private Integer page, size;

	public void findCircleList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("size", size);
			param.put("startIndex", (page - 1) * size);
			param.put("order", order);
			param.put("orderType", orderType);
			if (keyword != null && keyword.trim().length() > 0)
				param.put("keyword", keyword);

			if (timeSpace != null && timeSpace.trim().length() > 0
					&& !timeSpace.trim().equals("null")) {
				param.put("timeSpace", Integer.valueOf(timeSpace));
			}
			if (tagList != null && tagList.trim().length() > 0) {
				Commonparam.tagListParam(param, tagList);
			}

			List<CirclePart> circleList = communityManager
					.findCircleList(param);
			User user = (User) request.getSession().getAttribute("user");
			if (user != null) {
				for (CirclePart circle : circleList) {
					circle.setHasAdd(communityManager.findCircleUserCount(
							circle.getCircleId(), user.getUserId()));
				}
			}

			bean.setStatus(200);
			bean.setRows(circleList);
			bean.setTotal(communityManager.findCircleListCount(param));

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 用户加入到圈子
	 * 
	 * @throws Exception
	 */
	private String circleId;

	public void addUserCircle() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null || circleId == null) {
				bean.setStatus(400);
				if (circleId == null)
					bean.setMsg("请选择圈子!");
				else
					bean.setMsg("请登录!");
			} else {
				Long userCount = communityManager.findCircleUserRemain(Long
						.valueOf(circleId));
				if(userCount==null){
					bean.setStatus(400);
					bean.setMsg("缺少圈子等级信息!");
				}
				else if (userCount > 0) {
					String status = communityManager.findCircleUserStatus(
							user.getUserId(), Long.valueOf(circleId));
					if (status != null) {
						HashMap activityUser = new HashMap();
						activityUser.put("userId", user.getUserId());
						activityUser.put("circleId", Long.valueOf(circleId));
						if (isCheck != null && isCheck.trim().equals("T")) {
							activityUser.put("status",
									StaticConstant.CIRCLE_USER_STATUS[0]);
						} else {
							activityUser.put("status",
									StaticConstant.CIRCLE_USER_STATUS[2]);

						}
						activityUser.put("circleRole",
								StaticConstant.CIRCLE_USER_ROLE[0]);
						communityManager.updateCircleUserStatus(activityUser);
					} else {
						HashMap map = new HashMap();
						map.put("circleId", Long.valueOf(circleId));
						map.put("userId", user.getUserId());
						map.put("time", new Date());
						if (isCheck != null && isCheck.trim().equals("T")) {
							map.put("status",
									StaticConstant.CIRCLE_USER_STATUS[0]);
						} else {
							map.put("status",
									StaticConstant.CIRCLE_USER_STATUS[2]);

						}
						map.put("circleRole",
								StaticConstant.CIRCLE_USER_ROLE[0]);
						communityManager.addUserCircle(map);
					}
					bean.setStatus(200);
				} else {
					bean.setStatus(400);
					bean.setMsg("已达到最大人数!");
				}

			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 申请关闭圈子
	 * 
	 * @throws Exception
	 */
	public void applyCloseCircle() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {

			User user = (User) request.getSession().getAttribute("user");
			if (user == null || circleId == null) {
				bean.setStatus(400);
				if (user == null)
					bean.setMsg("请登录取");
				if (circleId == null)
					bean.setMsg("请选择活动");
			} else {
				HashMap activityUser = new HashMap();
				activityUser.put("userId", user.getUserId());
				activityUser.put("circleId", Long.valueOf(circleId));
				int rt = communityManager.applyCloseCircle(activityUser);
				if (rt > 0) {
					bean.setStatus(200);
				} else {
					bean.setStatus(400);
					bean.setMsg("操作失败!");
				}
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 圈子详情
	 * 
	 * @throws Exception
	 */
	public void findCircleDetail() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		String page = "pages/community_circle.jsp";
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (circleId == null) {
				request.setAttribute("error", "请选择圈子!");
				page = "common/404.jsp";
			} else {
				Circle circle = communityManager.findCircleById(circleId);
				boolean flag = false;
				if ((circle.getStatus().equals("2") || circle.getStatus()
						.equals("4"))
						&& (circle.getExamineResult().intValue() == 3 || circle
								.getExamineResult().intValue() == 2)) {
					if (user != null
							&& circle.getUserId() != null
							&& circle.getUserId().toString()
									.equals(user.getUserId().toString())) {
						flag = true;
					} else {
						flag = false;
						if (circle.getStatus().equals("2"))
							request.setAttribute("error", "圈子信息正在维护!");
						if (circle.getStatus().equals("4"))
							request.setAttribute("error", "圈子已申请关闭!");
						page = "common/404.jsp";
					}

				} else {
					flag = true;
				}

				if (flag) {
					commonManager
							.updateObjectBrowseCount("tb_circle", "circle_id",
									Long.valueOf(circleId), "circle_views");
					if (user != null) {

						String status = communityManager.findCircleUserStatus(
								user.getUserId(), Long.valueOf(circleId));
						circle.setCircleUserStatus(status);
						circle.setIsCollection(productManager
								.findUserCollectObject(user.getUserId(),
										circle.getCircleId(),
										StaticConstant.OBJECT_TYPE[1]));
					} else {
						circle.setIsCollection(0L);
						circle.setCircleUserStatus(null);
					}
					circle.setCircleViews(circle.getCircleViews() + 1);
					request.setAttribute("circle", circle);
					HashMap param = new HashMap();
					param.put("size", 10);
					param.put("startIndex", 0);
					param.put("circleId", circle.getCircleId());
					request.setAttribute("circleUserList",
							communityManager.findCircleUserList(param));

					if (user != null) {
						// 推荐用户相关的圈子
						HashMap map = new HashMap();
						map.put("circleId", circle.getCircleId());
						map.put("userId", user.getUserId());
						map.put("size", 4);

						List<CirclePart> circleRecommendList = communityManager
								.findCircleRecommendForUser(map);
						if (circleRecommendList.size() == 0) {
							HashMap param1 = new HashMap();
							param1.put("size", 4);
							param1.put("startIndex", 0);
							param1.put("order", "desc");
							param1.put("orderType", "browse");
							circleRecommendList = communityManager
									.findCircleList(param1);

						}
						for (CirclePart circleRecommend : circleRecommendList) {
							circleRecommend
									.setCircleUserStatus(communityManager
											.findCircleUserStatus(user
													.getUserId(),
													circleRecommend
															.getCircleId()));

						}
						request.setAttribute("circleRecommend",
								circleRecommendList);
					} else {
						HashMap param1 = new HashMap();
						param1.put("size", 4);
						param1.put("startIndex", 0);
						param1.put("order", "desc");
						param1.put("orderType", "browse");
						List<CirclePart> circleRecommendList = communityManager
								.findCircleList(param1);

						for (CirclePart circleRecommend : circleRecommendList) {
							circleRecommend.setCircleUserStatus(null);

						}
						request.setAttribute("circleRecommend",
								circleRecommendList);
					}

					// 发起人/企业
					if (circle.getCompanyId() == null
							|| circle.getCompanyId() == 0) {
						CircleCreateUser usercreate = communityManager
								.findCircleCreateUser(circle.getUserId());
						if (user != null) {
							if (user.getUserId().longValue() == circle
									.getUserId().longValue()) {
								usercreate.setHasAdd(1L);
							} else
								usercreate.setHasAdd(communityManager
										.findCircleCreateUser(
												circle.getUserId(),
												user.getUserId()));
						} else {
							usercreate.setHasAdd(0L);
						}
						request.setAttribute("activityCreateUser", usercreate);
					} else {
						HashMap companyInfo = communityManager
								.findCommunityCompanyInfo(circle.getCompanyId());
						if (user != null) {
							companyInfo.put("isCollection", productManager
									.findUserCollectObject(user.getUserId(),
											circle.getCompanyId(),
											StaticConstant.OBJECT_TYPE[6]));
						} else {
							companyInfo.put("isCollection", 0);
						}
						if (companyInfo.get("companyInfo") != null) {
							companyInfo.put(
									"companyInfo",
									Commonparam.removerHTML(companyInfo.get(
											"companyInfo").toString()));
						}
						request.setAttribute("companyInfo", companyInfo);
					}

					// [topicId,topicName,createTime,topicContent(50)]
					request.setAttribute("circleTopic",
							communityManager.findTopicList(param));
					if (user != null) {
						if (circle.getUserId() != null) {
							if (user.getUserId().toString()
									.equals(circle.getUserId().toString())) {
								request.setAttribute("actRoleId", 2);// 发起人
							} else {
								String status = communityManager
										.findCircleUserStatus(user.getUserId(),
												Long.valueOf(circleId));
								if (status == null || !status.equals("3")) {
									if (status == null)
										request.setAttribute("actRoleId", null);
									else
										request.setAttribute("actRoleId", 0);// 普通成员
								} else {
									Integer role = communityManager
											.findCircleUserRole(
													user.getUserId(),
													Long.valueOf(circleId));
									if (role != null && role.intValue() == 1) {// 管理员
										request.setAttribute("actRoleId", "1");
									} else {// 未审核
										request.setAttribute("actRoleId", "0");// 普通用户
									}
								}
							}
						} else {
							String status = communityManager
									.findCircleUserStatus(user.getUserId(),
											Long.valueOf(circleId));
							if (status == null || !status.equals("3")) {
								if (status == null)
									request.setAttribute("actRoleId", null);
								else
									request.setAttribute("actRoleId", 0);// 普通成员
							} else {
								Integer role = communityManager
										.findCircleUserRole(user.getUserId(),
												Long.valueOf(circleId));
								if (role != null && role.intValue() == 1) {// 管理员
									request.setAttribute("actRoleId", "1");
								} else {// 未审核
									request.setAttribute("actRoleId", "0");// 普通用户
								}
							}
						}
					} else {
						request.setAttribute("actRoleId", null);
					}
				}
			}

		} catch (Exception e) {
			request.setAttribute("error", e.getLocalizedMessage());
			page = "common/404.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * 跳转到创建圈子界面
	 * 
	 * @throws Exception
	 */
	public void createCircle() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String page = "pages/personal_create_circle.jsp";
		try {

			User user1 = (User) request.getSession().getAttribute("user");
			if (user1 == null) {
				request.setAttribute("error", "请登陆!");
				page = "common/404.jsp";
			} else {
				if (circleId != null) {
					Circle circle = communityManager.findCircleById(circleId);
					if (circle == null
							|| !circle.getUserId().toString()
									.equals(user1.getUserId().toString())) {
						page = "common/404.jsp";
						request.setAttribute("error", "没有权限!");
					} else {
						List<String> cardImage = communityManager
								.findCircleUserCardImage(Long.valueOf(circleId));
						request.setAttribute("cardImage", cardImage);
						request.setAttribute("circle", circle);
					}

				}
				List<HashMap> lableList = communityManager.findAllTagList(null);
				request.setAttribute("tagList", JSONArray.fromObject(lableList)
						.toString());
				// type,num,info
				List<HashMap> levelList = communityManager
						.findCircleLevelList();
				request.setAttribute("levelList",
						JSONArray.fromObject(levelList).toString());

			}

		} catch (Exception e) {
			request.setAttribute("error", e.getLocalizedMessage());
			page = "common/404.jsp";
		}

		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * 创建圈子
	 */
	private String title, content, circleImage, isCheck, tagList;
	private String level, cardImage, circleCardImage;

	public void createCircleData() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {

			User user1 = (User) request.getSession().getAttribute("user");
			if (user1 == null) {
				bean.setMsg("请登陆!");
				bean.setStatus(400);
			} else {
				Circle circle = new Circle();
				if (circleId != null && circleId.trim().length() > 0) {
					circle.setCircleId(Long.valueOf(circleId));
				}
				circle.setSummary(summary);
				circle.setName(title);
				circle.setLevel(level);
				String bug = "<div style=\"top: 0px;\">﻿﻿</div>";
				content = content.replaceAll(bug, "");
				circle.setCircleContent(content);
				circle.setCircleImage(circleImage);
				circle.setCircleViews(0L);
				circle.setCreateTime(new Date());
				circle.setUserId(user1.getUserId());
				circle.setType(StaticConstant.CIRCLE_TYPE[0] + "");// 普通
				circle.setIsCheck(isCheck);
				if (circleId != null && circleId.trim().length() > 0) {
					circle.setStatus(StaticConstant.CIRCLE_STATUS[1] + "");
				} else {
					circle.setStatus(StaticConstant.CIRCLE_STATUS[0] + "");
				}
				circle.setExamineResult(StaticConstant.EXAMINE_RESULT[2]);
				circle.setParam(tagList);
				Long rt = communityManager.insertCircle(circle,
						circleCardImage, imgChanged);
				if (rt > 0) {
					bean.setStatus(200);
					if (circleId != null && circleId.trim().length() > 0) {
						bean.setMsg("修改成功,需要审核通过才能显示!");
					} else {
						bean.setMsg("创建成功,需要审核通过才能显示!");
					}
				} else {
					bean.setStatus(400);
					if (circleId != null && circleId.trim().length() > 0) {
						bean.setMsg("修改失败!");
					} else {
						bean.setMsg("添加失败!");
					}
				}

			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 跳转到创建话题界面
	 * 
	 * @throws Exception
	 */
	private String type;

	public void createTopic() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		String page = "pages/personal_create_topic.jsp";
		try {

			User user1 = (User) request.getSession().getAttribute("user");
			if (user1 == null || type == null || circleId == null) {
				if (user1 == null) {
					request.setAttribute("error", "请登陆!");
					page = "common/404.jsp";
				} else if (type == null
						|| (type.equals("1") && circleId == null)
						|| (type.equals("2") && activityId == null)) {// 创建圈子话题
					if (type.equals("1") && circleId == null)
						request.setAttribute("error", "请选择圈子!");
					// if (type.equals("2") && activityId == null)
					// request.setAttribute("error", "请选择活动!");
					page = "common/404.jsp";
				} else if (type != null && type.equals("0")) {
					boolean flag = false;
					if (topicId != null) {
						Topic topic = communityManager.findTopicById(topicId);
						if (topic == null
								|| !topic.getUserId().toString()
										.equals(user1.getUserId().toString())) {
							page = "common/404.jsp";
							request.setAttribute("error", "没有权限!");
						} else {
							flag = true;
							request.setAttribute("topicImageList",
									communityManager
											.findTopicImageList(topicId));
							request.setAttribute("topic", topic);
						}
					} else {
						flag = true;
					}
					if (flag) {
						List<HashMap> lableList = communityManager
								.findAllTagList(null);
						request.setAttribute("tagList",
								JSONArray.fromObject(lableList).toString());
						page = "pages/personal_create_topic.jsp";
					}

				} else {
					page = "common/404.jsp";
				}
			} else {

				Long circleUserId = communityManager
						.findCircleUserIdByCircleId(Long.valueOf(circleId));
				String status = communityManager.findCircleUserStatus(
						user1.getUserId(), Long.valueOf(circleId));

				boolean flag = false;

				if (circleUserId == null) {

					if ((status == null || !status.equals("3"))) {

						if (status != null)
							request.setAttribute("error",
									StaticConstant.ACTIVITY_ERROR[Integer
											.valueOf(status)]);
						else
							request.setAttribute("error",
									StaticConstant.ACTIVITY_ERROR[0]);
					} else {
						flag = true;
					}

				}
				if (circleUserId != null) {
					if (circleUserId.toString().equals(
							user1.getUserId().toString())) {
						flag = true;
					} else {
						if ((status == null || !status.equals("3"))) {

							if (status != null)
								request.setAttribute("error",
										StaticConstant.ACTIVITY_ERROR[Integer
												.valueOf(status)]);
							else
								request.setAttribute("error",
										StaticConstant.ACTIVITY_ERROR[0]);
						} else {
							flag = true;
						}
					}
				}

				if (!flag) {
					page = "common/404.jsp";

				} else {
					List<HashMap> lableList = communityManager
							.findAllTagList(null);
					request.setAttribute("tagList",
							JSONArray.fromObject(lableList).toString());
					request.setAttribute("circleId", circleId);
					page = "pages/personal_create_topic.jsp";
				}

				// request.setAttribute("activityId", activityId);
			}

		} catch (Exception e) {
			request.setAttribute("error", e.getLocalizedMessage());
			page = "common/404.jsp";
		}

		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * 创建话题
	 * 
	 * @throws Exception
	 */
	private String topicImage;// 图片列表####分割
	private String summary;// 摘要
	private String imgChanged;

	public void createTopicData() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {

			User user1 = (User) request.getSession().getAttribute("user");
			if (user1 == null) {
				bean.setMsg("请登陆!");
			} else {
				Topic circle = new Topic();
				if (topicId != null && topicId.trim().length() > 0) {
					circle.setTopicId(Long.valueOf(topicId));
				}
				String bug = "<div style=\"top: 0px;\">﻿﻿</div>";
				content = content.replaceAll(bug, "");
				circle.setTopicName(title);
				circle.setTopicContent(content);
				circle.setSummary(summary);
				circle.setTopicViews(0L);
				circle.setCreateTime(new Date());
				circle.setUserId(user1.getUserId());
				circle.setStatus(StaticConstant.TOPIC_STATUS[0] + "");
				circle.setExamineResult(StaticConstant.EXAMINE_RESULT[2]);
				if (circleId != null && circleId.trim().length() > 0) {
					circle.setCircleId(Long.valueOf(circleId));
					circle.setStatus(StaticConstant.TOPIC_STATUS[0] + "");
					circle.setExamineResult(StaticConstant.EXAMINE_RESULT[0]);
				} else {
					if (topicId != null && topicId.trim().length() > 0) {
						circle.setStatus(StaticConstant.TOPIC_STATUS[1] + "");
						circle.setExamineResult(StaticConstant.EXAMINE_RESULT[1]);
					} else {
						circle.setStatus(StaticConstant.TOPIC_STATUS[0] + "");
						circle.setExamineResult(StaticConstant.EXAMINE_RESULT[2]);
					}

				}

				Long rt = communityManager.insertTopic(circle, tagList,
						topicImage, imgChanged, request);
				if (rt > 0) {
					bean.setStatus(200);
					if (topicId != null && topicId.trim().length() > 0) {
						if (circleId != null && circleId.trim().length() > 0) {
							bean.setMsg("修改成功!");
						} else
							bean.setMsg("修改成功,需要审核通过才能显示!");
					} else {
						if (circleId != null && circleId.trim().length() > 0) {
							bean.setMsg("创建成功!");
						} else
							bean.setMsg("创建成功,需要审核通过才能显示!");
					}
				} else {
					bean.setStatus(400);
					if (topicId != null && topicId.trim().length() > 0) {
						bean.setMsg("修改失败!");
					} else {
						bean.setMsg("添加失败!");
					}
				}

			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 话题详情
	 * 
	 * @throws Exception
	 */
	private String topicId;

	public void circleTopicDetail() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String page = "pages/community_circle_topicdetail.jsp";
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (topicId == null) {
				request.setAttribute("error", "请选择话题!");
				page = "common/404.jsp";
			} else {
				Topic topic = communityManager.findTopicById(topicId);
				boolean flag = false;
				if (topic.getStatus().equals("2")
						&& (topic.getExamineResult().intValue() == 3 || topic
								.getExamineResult().intValue() == 2)) {
					if (circleId != null && circleId.trim().length() > 0
							&& Long.valueOf(circleId) > 0) {
						if (topic.getCircleId() != null
								&& topic.getCircleId().toString()
										.equals(circleId)) {
							flag = true;
						}
					} else {
						if (user != null
								&& topic.getUserId() != null
								&& topic.getUserId().toString()
										.equals(user.getUserId().toString())) {
							flag = true;
						} else {

							flag = false;
							if (topic.getStatus().equals("2"))
								request.setAttribute("error", "话题信息正在维护!");
							page = "common/404.jsp";
						}
					}

				} else {
					flag = true;
				}

				if (flag) {

					commonManager.updateObjectBrowseCount("tb_topic",
							"topic_id", Long.valueOf(topicId), "topic_views");
					if (user != null) {
						topic.setIsCollection(productManager
								.findUserCollectObject(user.getUserId(),
										topic.getTopicId(),
										StaticConstant.OBJECT_TYPE[3]));

					} else {
						topic.setIsCollection(0L);
					}

					HashMap param = new HashMap();
					param.put("size", 10);
					param.put("startIndex", 0);
					param.put("topicId", topicId);
					List<TopicComment> commentList = communityManager
							.findTopicComment(param);
					topic.setTopicViews(topic.getTopicViews() + 1);
					request.setAttribute("topic", topic);

					if (topic.getCompanyId() != null) {
						Long i = Long.parseLong(topic.getCompanyId());
						request.setAttribute("companyInfo",
								communityManager.findCommunityCompanyInfo(i));
					} else {
						request.setAttribute("userInfo", communityManager
								.findUserInfoById(topic.getUserId()));
					}
					request.setAttribute("commentList", commentList);
					request.setAttribute("topicImageList",
							communityManager.findTopicImageList(topicId));

					param.put("size", 2);
					param.put("order", "desc");
					param.put("orderType", "time");
					List<CirclePart> circleList = communityManager
							.findCircleList(param);
					if (user != null) {
						for (CirclePart circleRecommend : circleList) {
							circleRecommend
									.setCircleUserStatus(communityManager
											.findCircleUserStatus(user
													.getUserId(),
													circleRecommend
															.getCircleId()));

						}
					} else {
						for (CirclePart circleRecommend : circleList) {
							circleRecommend.setCircleUserStatus(null);

						}
					}

					request.setAttribute("hotCircle", circleList);
				}
			}

		} catch (Exception e) {
			request.setAttribute("error", e.getLocalizedMessage());
			page = "common/404.jsp";
		}
		request.setAttribute("circleId", circleId);
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * 添加话题评论
	 * 
	 * @throws Exception
	 */
	private String toUserId;

	public void addTopicComment() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null || topicId == null) {
				bean.setStatus(400);
				if (topicId == null)
					bean.setMsg("请选择话题!");
				else
					bean.setMsg("请登录!");
			} else {
				TopicComment map = new TopicComment();
				map.setTopicId(Long.valueOf(topicId));
				map.setUserId(user.getUserId());
				map.setCommentTime(new Date());
				map.setContent(content);
				map.setToContent(toContent);
				if (toUserId != null && toUserId.trim().length() > 0)
					map.setToUserId(Long.valueOf(toUserId));

				Long rt = communityManager.addTopicComment(map);
				if (rt > 0)
					bean.setStatus(200);
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	private String coumfiled, classics;// classics经典话题

	/**
	 * 话题列表
	 * 
	 * @throws Exception
	 */
	private String timeSpace;

	public void findTopicList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user = (User) request.getSession().getAttribute("user");
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("size", size);
			param.put("startIndex", (page - 1) * size);
			param.put("keyword", keyword);
			if (user != null)
				param.put("userId", user.getUserId());
			if (circleId != null)
				param.put("circleId", circleId);
			param.put("coumfiled", coumfiled);
			param.put("classics", classics);
			if (timeSpace != null && timeSpace.trim().length() > 0
					&& !timeSpace.trim().equals("null")) {
				param.put("timeSpace", Integer.valueOf(timeSpace));
			}
			if (tagList != null && tagList.trim().length() > 0) {
				Commonparam.tagListParam(param, tagList);
			}

			List<TopicPart> topicList = (List<TopicPart>) communityManager
					.findTopicList(param);

			bean.setStatus(200);
			bean.setRows(topicList);
			bean.setTotal(communityManager.findTopicListCount(param));

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 经典话题
	 * 
	 * @throws Exception
	 */
	public void findClassicTopicList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user = (User) request.getSession().getAttribute("user");

			List<TopicPart> topTopicList = (List<TopicPart>) communityManager
					.findClassicTopTopicList();

			HashMap<String, Object> param1 = new HashMap<String, Object>();
			param1.put("size", size);
			param1.put("startIndex", (page - 1) * size);
			List<TopicPart> topicList = (List<TopicPart>) communityManager
					.findClassicTopicList(param1);
			HashMap<String, Object> rt = new HashMap<String, Object>();
			bean.setStatus(200);
			rt.put("topTopic", topTopicList);
			rt.put("classicTopic", topicList);

			bean.setRows(rt);

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 删除话题
	 * 
	 * @throws Exception
	 */
	private String topicUserId;

	public void updateTopicDelete() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user = (User) request.getSession().getAttribute("user");
			HashMap param = new HashMap();
			param.put("userId", user.getUserId());
			param.put("topicId", topicId);

			boolean flag = false;
			if (userId != null
					&& userId.toString().equals(user.getUserId().toString())) {
				flag = true;
			} else {
				if (topicUserId.equals(user.getUserId().toString())) {
					flag = true;
				} else {
					String status = communityManager.findCircleUserStatus(
							user.getUserId(), Long.valueOf(circleId));

					Integer role = communityManager.findCircleUserRole(
							user.getUserId(), Long.valueOf(circleId));
					if (role != null && role.intValue() == 1) {// 管理员
						flag = true;
					} else {
						bean.setStatus(400);
						bean.setMsg("无权限!");
					}
				}

			}
			if (flag) {
				int rt = communityManager.updateTopicDelete(param);
				if (rt > 0)
					bean.setStatus(200);
				else {
					bean.setStatus(400);
					bean.setMsg("删除失败!");
				}
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 话题置顶
	 * 
	 * @throws Exception
	 */
	public void updateTopicTop() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user = (User) request.getSession().getAttribute("user");
			HashMap param = new HashMap();
			param.put("userId", user.getUserId());
			param.put("topicId", topicId);
			param.put("type", type);
			boolean flag = false;
			if (userId != null
					&& userId.toString().equals(user.getUserId().toString())) {
				flag = true;
			} else {
				String status = communityManager.findCircleUserStatus(
						user.getUserId(), Long.valueOf(circleId));
				if (status == null || !status.equals("3")) {
					bean.setStatus(400);
					bean.setMsg("无权限!");
				} else {
					Integer role = communityManager.findCircleUserRole(
							user.getUserId(), Long.valueOf(circleId));
					if (role != null && role.intValue() == 1) {// 管理员
						flag = true;
					}
				}
			}
			if (flag) {
				int rt = communityManager.updateTopicTop(param);
				if (rt > 0)
					bean.setStatus(200);
				else {
					bean.setStatus(400);
					bean.setMsg("置顶失败!");
				}
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 跳转到创建活动界面
	 * 
	 * @throws Exception
	 */
	public void createActivity() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String page = "pages/personal_create_activity.jsp";
		try {

			User user1 = (User) request.getSession().getAttribute("user");
			if (user1 == null || type == null || circleId == null) {
				if (user1 == null) {
					request.setAttribute("error", "请登陆!");
					page = "common/404.jsp";
				} else if (type == null
						|| (type.equals("1") && circleId == null)) {// 创建圈子活动
					request.setAttribute("error", "请选择圈子!");
					page = "common/404.jsp";
				} else if (type != null && type.equals("0")) {
					boolean flag = false;
					if (activityId != null) {
						Activity topic = communityManager
								.findActivityById(activityId);
						if (topic == null
								|| !topic.getCreateUserId().toString()
										.equals(user1.getUserId().toString())) {
							page = "common/404.jsp";
							request.setAttribute("error", "没有权限!");
						} else {
							flag = true;
							request.setAttribute("activity", topic);
						}
					} else {
						flag = true;
					}
					if (flag) {
						List<HashMap> lableList = communityManager
								.findAllTagList(null);
						request.setAttribute("tagList",
								JSONArray.fromObject(lableList).toString());
					}
				} else {
					page = "common/404.jsp";
				}
			} else {
				List<HashMap> lableList = communityManager.findAllTagList(null);
				request.setAttribute("tagList", JSONArray.fromObject(lableList)
						.toString());
				request.setAttribute("circleId", circleId);
			}

		} catch (Exception e) {
			request.setAttribute("error", e.getLocalizedMessage());
			page = "common/404.jsp";
		}

		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * 创建活动数据
	 * 
	 * @throws Exception
	 */
	private String joinType, userMax, activityImage, beginTime, endTime;
	private String isQrcode, isMoney, address, traffic;
	private String enrollBeginTime;// 报名开始时间
	private String enrollEndTime;// 报名结束时间
	private String payType; // 付款方式
	private String moneyDetail, moneynum;// 费用明细
	private String lng, lat;

	public void createActivityData() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {

			User user1 = (User) request.getSession().getAttribute("user");
			if (user1 == null) {
				bean.setMsg("请登陆!");
				bean.setStatus(400);
			} else {
				Activity circle = new Activity();
				if (activityId != null && activityId.trim().length() > 0) {
					circle.setActivityId(Long.valueOf(activityId));
				}
				circle.setIsMoney(isMoney);
				if (isMoney.equals("T")) {
					circle.setPayType(payType);
					circle.setMoneyDetail(moneyDetail);
					circle.setMoneynum(Integer.valueOf(moneynum));
				} else {
					circle.setPayType("");
					circle.setMoneyDetail("");
					circle.setMoneynum(0);
				}
				circle.setSummary(summary);
				circle.setBeginTime(fmt.parse(beginTime));
				if (endTime != null && endTime.trim().length() > 0) {
					circle.setEndTime(fmt.parse(endTime));
				}
				circle.setEnrollBeginTime(fmt.parse(enrollBeginTime));
				if (enrollEndTime != null && enrollEndTime.trim().length() > 0) {
					circle.setEnrollEndTime(fmt.parse(enrollEndTime));
				}
				circle.setAddress(address);
				circle.setIsQrcode(isQrcode);
				circle.setTitle(title);
				String bug = "<div style=\"top: 0px;\">﻿﻿</div>";
				content = content.replaceAll(bug, "");
				circle.setContent(content);
				circle.setActivityImage(activityImage);
				circle.setCreateTime(new Date());
				circle.setCreateUserId(user1.getUserId());
				circle.setJoinType(joinType);// 普通
				circle.setIsCheck(isCheck);
				circle.setStatus(StaticConstant.ACTIVITY_STATUS[0] + "");
				circle.setExamineResult(StaticConstant.EXAMINE_RESULT[2]);
				circle.setParam(tagList);
				circle.setUserMax(Long.valueOf(userMax));
				circle.setBrowseCount(0L);
				if (lat != null && lat.trim().length() > 0) {
					circle.setLat(lat);
				}
				if (lng != null && lng.trim().length() > 0) {
					circle.setLng(lng);
				}

				if (traffic != null && traffic.trim().length() > 0) {
					circle.setTraffic(traffic);
				} else {
					circle.setTraffic("");
				}

				if (circleId != null && circleId.trim().length() > 0) {
					circle.setCircleId(Long.valueOf(circleId));
				}

				Long rt = communityManager.createActivityData(circle);
				if (rt > 0) {
					bean.setStatus(200);
					if (activityId != null && activityId.trim().length() > 0) {
						bean.setMsg("修改成功,需要审核通过才能显示!");
					} else {
						bean.setMsg("创建成功,需要审核通过才能显示!");
					}
				} else {
					bean.setStatus(400);
					if (activityId != null && activityId.trim().length() > 0) {
						bean.setMsg("修改失败!");
					} else {
						bean.setMsg("添加失败!");
					}
				}

			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 活动列表
	 * 
	 * @throws Exception
	 */
	private String orderType, order;

	public void findHotActivityList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("size", size);
			param.put("startIndex", (page - 1) * size);
			param.put("order", order);
			param.put("orderType", orderType);
			if (keyword != null && keyword.trim().length() > 0)
				param.put("keyword", keyword);

			if (timeSpace != null && !timeSpace.trim().equals("null")
					&& timeSpace.trim().length() > 0) {
				param.put("timeSpace", Integer.valueOf(timeSpace));
			}
			if (tagList != null && tagList.trim().length() > 0) {
				Commonparam.tagListParam(param, tagList);
			}

			List<ActivityPart> circleList = communityManager
					.findTopActivityList(param);
			User user = (User) request.getSession().getAttribute("user");
			if (user != null) {
				for (ActivityPart circle : circleList) {
					circle.setHasAdd(communityManager.findActivityUserCount(
							circle.getActivityId(), user.getUserId()));

				}
			}

			bean.setStatus(200);
			bean.setRows(circleList);
			bean.setTotal(communityManager.findTopActivityListCount(param));

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 添加活动用户
	 * 
	 * @throws Exception
	 */
	private String activityId;

	public void addActivityUser() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {

			User user = (User) request.getSession().getAttribute("user");
			boolean flag = false;
			if (user != null) {

				// enroll_begin_time,enroll_end_time
				HashMap time = communityManager.findActivityEnrollTime(Long
						.valueOf(activityId));
				Long startTime = null, endTime = null, nowTime = (new Date())
						.getTime();
				if (time == null) {
					bean.setStatus(400);
					bean.setMsg("不在报名时间内!");
				} else {
					if (time.get("enroll_begin_time") != null) {
						startTime = ((java.sql.Timestamp) time
								.get("enroll_begin_time")).getTime();
					}
					if (time.get("enroll_end_time") != null) {
						endTime = ((java.sql.Timestamp) time
								.get("enroll_end_time")).getTime();
					}
					if (startTime != null && endTime != null
							&& nowTime >= startTime && nowTime <= endTime) {
						long userCount = communityManager
								.findActivityRemainUser(Long
										.valueOf(activityId));
						if (userCount > 0) {
							flag = true;
						} else {
							flag = false;
							bean.setStatus(400);
							bean.setMsg("已达到最大人数!");
						}
						if (flag) {

							HashMap cardParam = new HashMap();
							String path = "";

							String status = communityManager
									.findActivityUserStatus(user.getUserId(),
											Long.valueOf(activityId));
							if (status == null) {
								HashMap activityUser = new HashMap();
								activityUser.put("userId", user.getUserId());
								activityUser.put("activityId",
										Long.valueOf(activityId));
								if (isCheck != null
										&& isCheck.trim().equals("T")) {
									activityUser
											.put("status",
													StaticConstant.ACTIVITY_USER_STATUS[0]);

								} else {
									flag = true;
									activityUser
											.put("status",
													StaticConstant.ACTIVITY_USER_STATUS[2]);
								}
								if (this.uploadFile != null) {
									int length = 0;
									try {
										FileInputStream fis = new FileInputStream(
												uploadFile);
										try {
											length = fis.available();
										} catch (IOException e1) {
											e1.printStackTrace();
										}
									} catch (FileNotFoundException e2) {
										e2.printStackTrace();
									}

									if (Commonparam.imageMax >= length) {

										String newfilename = Commonparam
												.makeNewFileName(uploadFileFileName);
										String targetFolder = Commonparam.cardImage
												+ Commonparam
														.makeYearMonth(new Date());
										String absolute = Commonparam
												.getKeyValue("imageStorePath")
												+ targetFolder;

										Commonparam.makeFile(this.uploadFile,
												absolute, newfilename);

										path = targetFolder + newfilename;
										flag = true;

									} else {
										bean.setStatus(400);
										bean.setMsg("图片大小300K内!");
									}
								}
								if (flag) {

									cardParam.put("reason", reason);
									cardParam.put("objectId", activityId);
									cardParam.put("type", type);
									cardParam.put("doType", doType);
									cardParam.put("createTime", new Date());
									cardParam.put("userId", user.getUserId());
									cardParam.put("filePath", path);

									activityUser.put("createTime", new Date());
									if (isQrcode != null
											&& isQrcode.trim().equals("T")) {
										int width = 400;
										int height = 400;
										String format = "png";
										Hashtable hints = new Hashtable();
										hints.put(EncodeHintType.CHARACTER_SET,
												"utf-8");
										BitMatrix bitMatrix = new MultiFormatWriter()
												.encode((user.getUserId() + "-"
														+ activityId + "-" + (new Date())
														.getTime()),
														BarcodeFormat.QR_CODE,
														width, height, hints);
										String newfilename = user.getUserId()
												+ "-" + activityId + ".png";
										String targetFolder = Commonparam.qrcodefolder
												+ Commonparam
														.makeYearMonth(new Date());
										String absolute = Commonparam
												.getKeyValue("imageStorePath")
												+ targetFolder;
										File absoluteFolder = new File(absolute);
										if (!absoluteFolder.exists()) {
											absoluteFolder.mkdirs();
										}

										File outputFile = new File(absolute
												+ newfilename);
										MatrixToImageWriter.writeToFile(
												bitMatrix, format, outputFile);
										activityUser.put("qrcodePath",
												targetFolder + newfilename);

									}
									communityManager.addActivityUser(
											activityUser, cardParam);
									bean.setStatus(200);
								}

							} else {
								HashMap param = new HashMap();
								param.put("userId", user.getUserId());
								param.put("activityId",
										Long.valueOf(activityId));
								if (isCheck != null
										&& isCheck.trim().equals("T")) {
									param.put(
											"status",
											StaticConstant.ACTIVITY_USER_STATUS[0]);

								} else {
									flag = true;
									param.put(
											"status",
											StaticConstant.ACTIVITY_USER_STATUS[2]);
								}
								if (this.uploadFile != null) {
									int length = 0;
									try {
										FileInputStream fis = new FileInputStream(
												uploadFile);
										try {
											length = fis.available();
										} catch (IOException e1) {
											e1.printStackTrace();
										}
									} catch (FileNotFoundException e2) {
										e2.printStackTrace();
									}

									if (Commonparam.imageMax >= length) {

										String newfilename = Commonparam
												.makeNewFileName(uploadFileFileName);
										String targetFolder = Commonparam.cardImage
												+ Commonparam
														.makeYearMonth(new Date());
										String absolute = Commonparam
												.getKeyValue("imageStorePath")
												+ targetFolder;

										Commonparam.makeFile(this.uploadFile,
												absolute, newfilename);

										path = targetFolder + newfilename;
										flag = true;

									} else {
										bean.setStatus(400);
										bean.setMsg("图片大小300K内!");
									}
								}

								if (flag) {
									cardParam.put("reason", reason);
									cardParam.put("objectId", activityId);
									cardParam.put("type", type);
									cardParam.put("doType", doType);
									cardParam.put("createTime", new Date());
									cardParam.put("userId", user.getUserId());
									cardParam.put("filePath", path);

									communityManager.updateActivityUserStatus(
											param, cardParam);
									bean.setStatus(200);
								}
							}
						}

					} else {
						bean.setStatus(400);
						bean.setMsg("不在时间范围内!");
					}
				}

			} else {
				bean.setStatus(400);
				bean.setMsg("请登录!");
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg("加入失败!");
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 申请关闭活动
	 * 
	 * @throws Exception
	 */
	public void applyCloseActivity() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {

			User user = (User) request.getSession().getAttribute("user");
			if (user == null || activityId == null) {
				bean.setStatus(400);
				if (user == null)
					bean.setMsg("请登录取");
				if (activityId == null)
					bean.setMsg("请选择活动");
			} else {
				HashMap activityUser = new HashMap();
				activityUser.put("userId", user.getUserId());
				activityUser.put("activityId", Long.valueOf(activityId));
				int rt = communityManager.applyCloseActivity(activityUser);
				if (rt > 0) {
					bean.setStatus(200);
				} else {
					bean.setStatus(400);
					bean.setMsg("操作失败!");
				}
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 活动为用户产生二维码
	 * 
	 * @throws Exception
	 */
	public void generActivityQrcode() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {

			User user = (User) request.getSession().getAttribute("user");
			if (user == null || activityId == null) {
				bean.setStatus(400);
				if (user == null)
					bean.setMsg("请登录取");
				if (activityId == null)
					bean.setMsg("请选择活动1");
			} else {
				HashMap activityUser = new HashMap();
				activityUser.put("userId", user.getUserId());
				activityUser.put("activityId", Long.valueOf(activityId));

				int width = 400;
				int height = 400;
				String format = "png";
				Hashtable hints = new Hashtable();
				hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
				BitMatrix bitMatrix = new MultiFormatWriter()
						.encode((user.getUserId() + "-" + activityId + "-" + (new Date())
								.getTime()), BarcodeFormat.QR_CODE, width,
								height, hints);
				String path = request.getSession().getServletContext()
						.getRealPath(Commonparam.qrcodefolder);
				File absoluteFolder = new File(path);
				if (!absoluteFolder.exists()) {
					absoluteFolder.mkdirs();
				}

				String finename = user.getUserId() + "-" + activityId + ".png";
				File outputFile = new File(path + "/" + finename);
				MatrixToImageWriter.writeToFile(bitMatrix, format, outputFile);

				activityUser.put("qrcodePath", Commonparam.qrcodefolder + "/"
						+ finename);

				int rt = communityManager.generActivityQrcode(activityUser);
				if (rt > 0) {
					bean.setStatus(200);
				} else {
					bean.setStatus(400);
					bean.setMsg("操作失败!");
				}
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg("已生成二维码!");
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 活动详情
	 * 
	 * @throws Exception
	 */
	public void findActivityDetail() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		String page = "pages/community_activity.jsp";
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (activityId == null) {

				if (activityId == null)
					request.setAttribute("error", "请选择活动!");
				page = "common/404.jsp";
			} else {
				Activity activity = communityManager
						.findActivityById(activityId);
				boolean flag = false;
				if ((activity.getStatus().equals("2") || activity.getStatus()
						.equals("3"))
						&& (activity.getExamineResult().intValue() == 2 || activity
								.getExamineResult().intValue() == 3)) {
					if (user != null
							&& activity.getCreateUserId() != null
							&& user.getUserId()
									.toString()
									.equals(activity.getCreateUserId()
											.toString())) {// 发起人
						flag = true;
					} else {
						flag = false;
						if (activity.getStatus().equals("2"))
							request.setAttribute("error", "活动信息正在维护!");
						if (activity.getStatus().equals("3"))
							request.setAttribute("error", "活动已申请关闭!");
						page = "common/404.jsp";
					}

				} else {
					flag = true;
				}

				if (flag) {

					commonManager.updateObjectBrowseCount("tb_activity",
							"activity_id", Long.valueOf(activityId),
							"browse_count");
					if (user != null) {
						String status = communityManager
								.findActivityUserStatus(user.getUserId(),
										Long.valueOf(activityId));
						activity.setActivityUserStatus(status);
						activity.setIsCollection(productManager
								.findUserCollectObject(user.getUserId(),
										activity.getActivityId(),
										StaticConstant.OBJECT_TYPE[2]));
						activity.setIsSignIn(communityManager
								.findActivityUserIsSignIn(
										activity.getActivityId(),
										user.getUserId()));
					} else {
						activity.setActivityUserStatus(null);
						activity.setIsCollection(0L);
						activity.setIsSignIn("F");
					}
					activity.setBrowseCount(activity.getBrowseCount() + 1);
					request.setAttribute("activity", activity);
					HashMap param = new HashMap();
					param.put("size", 10);
					param.put("startIndex", 0);
					param.put("activityId", activity.getActivityId());
					request.setAttribute("circleUserList",
							communityManager.findActivityUserList(param));

					// 发起人/企业
					if (activity.getCompanyId() == null
							|| activity.getCompanyId() == 0) {
						CircleCreateUser usercreate = communityManager
								.findCircleCreateUser(activity
										.getCreateUserId());
						if (user != null) {
							if (user.getUserId().longValue() == activity
									.getCreateUserId().longValue()) {
								usercreate.setHasAdd(1L);
							} else
								usercreate.setHasAdd(communityManager
										.findCircleCreateUser(
												activity.getCreateUserId(),
												user.getUserId()));
						} else {
							usercreate.setHasAdd(0L);
						}
						request.setAttribute("activityCreateUser", usercreate);
					} else {
						HashMap companyInfo = communityManager
								.findCommunityCompanyInfo(activity
										.getCompanyId());
						if (companyInfo != null) {
							companyInfo.put(
									"companyInfo",
									Commonparam.removerHTML(companyInfo.get(
											"companyInfo").toString()));
							if (user != null) {
								companyInfo.put("isCollection", productManager
										.findUserCollectObject(
												user.getUserId(),
												activity.getCompanyId(),
												StaticConstant.OBJECT_TYPE[6]));
							} else {
								companyInfo.put("isCollection", 0);
							}
						}
						request.setAttribute("companyInfo", companyInfo);
					}

					// 推荐活动
					List<ActivityPart> activityRecommend = activityRecommend(
							user, request, Long.valueOf(activityId), 2);
					request.setAttribute("activityRecommend", activityRecommend);
					param.put("size", 4);
					param.put("startIndex", 0);
					param.put("activityId", Long.valueOf(activityId));
					request.setAttribute("activityImage",
							communityManager.findActivityImage(param));

					HashMap param1 = new HashMap();
					param.put("size", 10);
					param.put("startIndex", 0);
					param.put("activityId", activityId);
					request.setAttribute("commentList",
							communityManager.findActivityComment(param));
				}
			}

		} catch (Exception e) {
			request.setAttribute("error", e.getLocalizedMessage());
			page = "common/404.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * 用户标签相关的活动，推荐活动,人气活动
	 * 
	 * @param user
	 * @param request
	 * @param activityId
	 * @param size
	 */
	public List<ActivityPart> activityRecommend(User user,
			HttpServletRequest request, Long activityId, int size) {

		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("maxNum", size);
		if (user == null)
			param.put("userId", 0);
		else
			param.put("userId", user.getUserId());
		param.put("activityId", activityId);
		List<ActivityPart> activityRecommend = (List<ActivityPart>) communityManager
				.findActivityRecommend(param);
		if (activityRecommend.size() < size) {// 列表不足
			if (user == null) {// 用户未登陆
				param.put("maxNum", size - activityRecommend.size());
				param.put("userId", -1);
				String ids = "";
				for (ActivityPart map : activityRecommend) {
					ids += map.getActivityId() + ",";
				}
				if (activityId != null) {
					ids += activityId + ",";
				}
				if (ids.length() > 0) {
					ids = ids.substring(0, ids.length() - 1);
				}
				param.put("ids", ids);
				activityRecommend.addAll(communityManager
						.findActivityRecommend(param));
			} else {
				param.put("maxNum", size - activityRecommend.size());
				param.put("userId", 0);
				activityRecommend.addAll(communityManager
						.findActivityRecommend(param));
				if (activityRecommend.size() < size) {// 列表不足
					param.put("maxNum", size - activityRecommend.size());
					param.put("userId", -1);
					String ids = "";
					for (ActivityPart map : activityRecommend) {
						ids += map.getActivityId() + ",";
					}
					if (activityId != null) {
						ids += activityId + ",";
					}
					if (ids.length() > 0) {
						ids = ids.substring(0, ids.length() - 1);
					}
					param.put("ids", ids);
					activityRecommend.addAll(communityManager
							.findActivityRecommend(param));
				}
			}
		}

		for (ActivityPart activity : activityRecommend) {
			HashMap<String, Object> param1 = new HashMap<String, Object>();
			if (user == null)
				param1.put("userId", 0);
			else
				param1.put("userId", user.getUserId());
			param1.put("activityId", activity.getActivityId());
			List<HashMap> tagList = communityManager
					.findActivityAndUserTagList(param1);
			param1.put("userId", 0);
			String ids = "";
			for (HashMap map : tagList) {
				ids += map.get("tagId") + ",";
			}
			if (ids.length() > 0)
				ids = ids.substring(0, ids.length() - 1);
			param1.put("ids", ids);

			tagList.addAll(communityManager.findActivityAndUserTagList(param1));

			activity.setTagList(tagList);
		}
		return activityRecommend;

	}

	/**
	 * 用户标签相关的圈子，推荐圈子
	 * 
	 * @param user
	 * @param request
	 * @param activityId
	 * @param size
	 */
	public List<CirclePart> circleRecommend(User user,
			HttpServletRequest request, Long circleId, int size) {

		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("maxNum", size);
		if (user == null)
			param.put("userId", 0);
		else
			param.put("userId", user.getUserId());
		param.put("activityId", activityId);
		List<CirclePart> activityRecommend = communityManager
				.findCircleRecommend(param);
		if (activityRecommend.size() < size) {// 列表不足
			if (user == null) {// 用户未登陆
				param.put("maxNum", size - activityRecommend.size());
				param.put("userId", -1);
				String ids = "";
				for (CirclePart map : activityRecommend) {
					ids += map.getCircleId() + ",";
				}
				if (circleId != null) {
					ids += circleId + ",";
				}
				if (ids.length() > 0) {
					ids = ids.substring(0, ids.length() - 1);
				}
				param.put("ids", ids);
				activityRecommend.addAll(communityManager
						.findCircleRecommend(param));
			} else {
				param.put("maxNum", size - activityRecommend.size());
				param.put("userId", 0);
				activityRecommend.addAll(communityManager
						.findCircleRecommend(param));
				if (activityRecommend.size() < size) {// 列表不足
					param.put("maxNum", size - activityRecommend.size());
					param.put("userId", -1);
					String ids = "";
					for (CirclePart map : activityRecommend) {
						ids += map.getCircleId() + ",";
					}
					if (circleId != null) {
						ids += circleId + ",";
					}
					if (ids.length() > 0) {
						ids = ids.substring(0, ids.length() - 1);
					}
					param.put("ids", ids);
					activityRecommend.addAll(communityManager
							.findCircleRecommend(param));
				}
			}
		}

		for (CirclePart activity : activityRecommend) {
			HashMap<String, Object> param1 = new HashMap<String, Object>();
			if (user == null)
				param1.put("userId", 0);
			else
				param1.put("userId", user.getUserId());
			param1.put("circleId", activity.getCircleId());
			List<HashMap> tagList = communityManager
					.findCircleAndUserTagList(param1);
			param1.put("userId", 0);
			String ids = "";
			for (HashMap map : tagList) {
				ids += map.get("tagId") + ",";
			}
			if (ids.length() > 0)
				ids = ids.substring(0, ids.length() - 1);
			param1.put("ids", ids);

			tagList.addAll(communityManager.findCircleAndUserTagList(param1));

			activity.setTagList(tagList);
		}
		return activityRecommend;
	}

	/**
	 * 用户标签相关的话题，推荐话题
	 * 
	 * @param user
	 * @param request
	 * @param activityId
	 * @param size
	 */
	public List<TopicPart> topicRecommend(User user,
			HttpServletRequest request, Long topicId, int size) {

		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("maxNum", size);
		if (user == null)
			param.put("userId", 0);
		else
			param.put("userId", user.getUserId());
		param.put("topicId", topicId);
		List<TopicPart> topicRecommend = communityManager
				.findTopicRecommend(param);
		if (topicRecommend.size() < size) {// 列表不足
			if (user == null) {// 用户未登陆
				param.put("maxNum", size - topicRecommend.size());
				param.put("userId", -1);
				String ids = "";
				for (TopicPart map : topicRecommend) {
					ids += map.getTopicId() + ",";
				}
				if (topicId != null) {
					ids += topicId + ",";
				}
				if (ids.length() > 0) {
					ids = ids.substring(0, ids.length() - 1);
				}
				param.put("ids", ids);
				topicRecommend.addAll(communityManager
						.findTopicRecommend(param));
			} else {
				param.put("maxNum", size - topicRecommend.size());
				param.put("userId", 0);
				topicRecommend.addAll(communityManager
						.findTopicRecommend(param));
				if (topicRecommend.size() < size) {// 列表不足
					param.put("maxNum", size - topicRecommend.size());
					param.put("userId", -1);
					String ids = "";
					for (TopicPart map : topicRecommend) {
						ids += map.getTopicId() + ",";
					}
					if (topicId != null) {
						ids += topicId + ",";
					}
					if (ids.length() > 0) {
						ids = ids.substring(0, ids.length() - 1);
					}
					param.put("ids", ids);
					topicRecommend.addAll(communityManager
							.findTopicRecommend(param));
				}
			}
		}

		for (TopicPart topic : topicRecommend) {
			HashMap<String, Object> param1 = new HashMap<String, Object>();
			if (user == null)
				param1.put("userId", 0);
			else
				param1.put("userId", user.getUserId());
			param1.put("topicId", topic.getTopicId());
			List<HashMap> tagList = communityManager
					.findTopicAndUserTagList(param1);
			param1.put("userId", 0);
			String ids = "";
			for (HashMap map : tagList) {
				ids += map.get("tagId") + ",";
			}
			if (ids.length() > 0)
				ids = ids.substring(0, ids.length() - 1);
			param1.put("ids", ids);

			tagList.addAll(communityManager.findTopicAndUserTagList(param1));

			topic.setTagList(tagList);
		}
		return topicRecommend;
	}

	String productId, companyShopProductId;

	/**
	 * 添加商品评论
	 * 
	 * @throws Exception
	 */
	public void addProductComment() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null) {
				request.setAttribute("error", "请登陆!");
			}
			HashMap param = new HashMap();
			param.put("userId", user.getUserId());
			param.put("productId", productId);
			param.put("companyShopProductId", companyShopProductId);
			param.put("content", content);

			List<HashMap> comment = (List<HashMap>) communityManager
					.queryCommentCreatTime(param);
			if (comment != null && comment.size() > 0) {
				bean.setMsg("已评价！");
				bean.setRows(400);
			} else {
				communityManager.addProductComment(param);
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	Long productCommentId;

	/**
	 * 商品评论查询
	 * 
	 * @throws Exception
	 */
	public void selectProductComments() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap param = new HashMap();
			param.put("size", size);
			param.put("startIndex", (page - 1) * size);
			param.put("productId", productId);
			param.put("companyShopProductId", companyShopProductId);
			param.put("commentId", productCommentId);

			List<HashMap> productComment = (List<HashMap>) communityManager
					.selectProductComments(param);

			for (HashMap comment : productComment) {
				HashMap commentUser = (HashMap) userManager
						.findUserNickNameImage(comment.get("user_id"));
				comment.put("commentUser", commentUser);
				Date d = (Date) comment.get("comment_time");
				String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
						.format(d);
				comment.put("commentTime", date);
			}

			bean.setRows(productComment);
			bean.setStatus(200);

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 添加活动评论
	 * 
	 * @throws Exception
	 */
	private String toContent;

	public void addActivityComment() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null || activityId == null) {
				bean.setStatus(400);
				if (activityId == null)
					bean.setMsg("请选择活动!");
				else
					bean.setMsg("请登录!");
			} else {
				Long activityUserId = communityManager.findActivityUserId(Long
						.valueOf(activityId));

				String activityUserStatus = communityManager
						.findActivityUserStatus(user.getUserId(),
								Long.valueOf(activityId));
				boolean flag = false;

				if (activityUserId == null) {

					if ((activityUserStatus == null || !activityUserStatus
							.equals("3"))) {

						if (activityUserStatus != null)
							bean.setMsg(StaticConstant.ACTIVITY_ERROR[Integer
									.valueOf(activityUserStatus)]);
						else
							bean.setMsg(StaticConstant.ACTIVITY_ERROR[0]);
					} else {
						flag = true;
					}

				}
				if (activityUserId != null) {
					if (activityUserId.toString().equals(
							user.getUserId().toString())) {
						flag = true;
					} else {
						if ((activityUserStatus == null || !activityUserStatus
								.equals("3"))) {

							if (activityUserStatus != null)
								bean.setMsg(StaticConstant.ACTIVITY_ERROR[Integer
										.valueOf(activityUserStatus)]);
							else
								bean.setMsg(StaticConstant.ACTIVITY_ERROR[0]);
						} else {
							flag = true;
						}
					}
				}

				if (!flag) {

					bean.setStatus(400);

				} else {

					ActivityComment map = new ActivityComment();
					map.setActivityId(Long.valueOf(activityId));
					map.setUserId(user.getUserId());
					map.setCommentTime(new Date());
					map.setContent(content);
					if (toContent != null && toContent.trim().length() > 0) {
						map.setToContent(toContent);
					}

					if (toUserId != null && toUserId.trim().length() > 0)
						map.setToUserId(Long.valueOf(toUserId));

					Long rt = communityManager.addActivityComment(map);
					if (rt > 0)
						bean.setStatus(200);

				}

			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 用户退出活动
	 * 
	 * @throws Exception
	 */
	public void exitActivityUser() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null || activityId == null) {
				bean.setStatus(400);
				if (activityId == null)
					bean.setMsg("请选择活动!");
				else
					bean.setMsg("请登录!");
			} else {
				HashMap map = new HashMap();
				map.put("activityId", Long.valueOf(activityId));
				map.put("userId", user.getUserId());
				map.put("status", StaticConstant.ACTIVITY_USER_STATUS[3]);
				communityManager.updateActivityUserStatus(map, null);
				bean.setStatus(200);

			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 用户退出圈子
	 * 
	 * @throws Exception
	 */
	public void exitCircleUser() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null || circleId == null) {
				bean.setStatus(400);
				if (circleId == null)
					bean.setMsg("请选择活动!");
				else
					bean.setMsg("请登录!");
			} else {
				HashMap map = new HashMap();
				map.put("circleId", Long.valueOf(circleId));
				map.put("userId", user.getUserId());
				map.put("status", StaticConstant.CIRCLE_USER_STATUS[3]);
				map.put("circleRole", StaticConstant.CIRCLE_USER_ROLE[0]);
				communityManager.updateCircleUserStatus(map);
				bean.setStatus(200);

			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 用户签到活动
	 * 
	 * @throws Exception
	 */
	public void userSignInActivity() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null || activityId == null) {
				bean.setStatus(400);
				if (activityId == null)
					bean.setMsg("请选择活动!");
				else
					bean.setMsg("请登录!");
			} else {
				HashMap map = new HashMap();
				map.put("activityId", Long.valueOf(activityId));
				map.put("userId", user.getUserId());

				int rt = communityManager.userSignInActivity(map);
				if (rt > 0)
					bean.setStatus(200);
				else {
					bean.setStatus(400);
					bean.setMsg("签到失败!");
				}
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void findHeadPageActivity() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		BaseBean bean = new BaseBean();
		try {
			List<HashMap> activities = communityManager.findHeadPageActivity();

			bean.setStatus(200);
			bean.setRows(activities);
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 用户创建活动相册
	 * 
	 * @throws Exception
	 */
	private String imgList;

	public void uploadActivityUserAlbum() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null || activityId == null) {
				bean.setStatus(400);
				if (activityId == null)
					bean.setMsg("请选择活动!");
				else
					bean.setMsg("请登录!");
			} else {
				HashMap param = new HashMap();
				param.put("activityId", activityId);
				param.put("userId", user.getUserId());
				param.put("createTime", new Date());

				communityManager.uploadActivityUserAlbum(param, imgList);

				bean.setStatus(200);
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 活动图片查询
	 * 
	 * @throws Exception
	 */
	public void queryThePicture() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		User user = (User) request.getSession().getAttribute("user");
		try {
			HashMap map = new HashMap();
			map.put("activityId", activityId);
			map.put("size", size);
			map.put("startIndex", (page - 1) * size);
			List<ActivityPhoto> photos = (List<ActivityPhoto>) communityManager
					.findActivityImage(map);
			bean.setAppend(0);
			Long actUId = (Long) communityManager
					.findActCreUserById(activityId);

			if (user != null) {
				if (user.getUserId().equals(actUId)) {
					bean.setAppend(1);
				} else {
					Long i = communityManager.findActivityUserCount(
							Long.parseLong(activityId), user.getUserId());
					if (i > 0) {
						bean.setAppend(1);
					}
				}
			}
			if (photos.size() > 0) {
				for (ActivityPhoto photo : photos) {

					if (user == null) {
						photo.setRoleUserId("F");
					} else {

						if (user.getUserId().equals(actUId)) {
							photo.setRoleUserId("T");
						} else if (user.getUserId().equals(
								photo.getUploadUserId())) {
							photo.setRoleUserId("T");
						} else {
							photo.setRoleUserId("F");
						}
					}
				}
				bean.setRows(photos);
				bean.setStatus(200);
				bean.setTotal(communityManager
						.findActivityImageCount(activityId));
			} else {
				bean.setStatus(400);
				bean.setMsg("没有图片！");
			}
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class,
				new JsonSqlDateValueProcessor("yyyy/MM/dd HH:mm:ss"));
		String json = JSONObject.fromObject(bean, jsonConfig).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void updateThePicture() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null) {
				bean.setMsg("请登录!");
			} else {
				Long actUId = (Long) communityManager
						.findActCreUserById(activityId);
				if (user.getUserId().equals(actUId)) {
					communityManager.deletefromactImg(activityImage, null);
				} else {
					communityManager.deletefromactImg(activityImage,
							user.getUserId());
				}
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	private String actPhotoId;

	/**
	 * 活动相册评论
	 * 
	 * @throws Exception
	 */
	public void queryThePictureComment() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap param = new HashMap();
			param.put("size", 20);
			param.put("startIndex", 0);
			param.put("actPhotoId", actPhotoId);
			List list = (List) communityManager.queryPictureComment(param);
			if (list.size() > 0) {
				bean.setRows(list);
				bean.setStatus(200);
			} else
				bean.setMsg("还没有评论！");

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		System.out.println(json);
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	private String pictComId;// 图片评论编号对应actity_photo_comment_id

	public void addThePictureComment() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		User user = (User) request.getSession().getAttribute("user");
		try {
			if (user == null) {
				bean.setMsg("请登录！");
			} else {

				Long actUId = (Long) communityManager
						.findActCreUserById(activityId);
				Long i = communityManager.findIsActivityUser(
						Long.valueOf(activityId), user.getUserId());
				if (i > 0 || user.getUserId().equals(actUId)) {

					ActivityComment actCom = new ActivityComment();
					actCom.setContent(content);
					actCom.setActivityId(Long.valueOf(actPhotoId));
					actCom.setUserId(user.getUserId());
					actCom.setCommentTime(new Date());

					if (pictComId != null && pictComId.length() > 0) {
						HashMap map = (HashMap) communityManager
								.queryOnePictureComment(pictComId);
						if (actPhotoId.equals(map.get("activity_photo_id")
								.toString())) {
							actCom.setToContent(map.get("content").toString());
							actCom.setToUserId(Long.valueOf(map.get("user_id")
									.toString()));
							communityManager.addPictureOfActComment(actCom);
							bean.setStatus(200);
						} else {
							bean.setMsg("数据错误！");
						}
					} else {
						communityManager.addPictureOfActComment(actCom);
						bean.setStatus(200);
					}

				} else {
					bean.setMsg("只有活动成员可以评论！");
				}
			}
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		System.out.println(json);
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void qelectTopicArean() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap map = new HashMap();
			map.put("size", size);
			map.put("startIndex", 0);
			map.put("topicId", topicId);
			List list = (List) communityManager.finDelectTopicArean(map);
			bean.setRows(list);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		System.out.println(json);
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public String getPictComId() {
		return pictComId;
	}

	public void setPictComId(String pictComId) {
		this.pictComId = pictComId;
	}

	public String getActPhotoId() {
		return actPhotoId;
	}

	public String getObjectId() {
		return objectId;
	}

	public void setObjectId(String objectId) {
		this.objectId = objectId;
	}

	public String getDoType() {
		return doType;
	}

	public void setDoType(String doType) {
		this.doType = doType;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public void setActPhotoId(String actPhotoId) {
		this.actPhotoId = actPhotoId;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getPage() {
		return page;
	}

	public Integer getSize() {
		return size;
	}

	public String getTagId() {
		return tagId;
	}

	public void setTagId(String tagId) {
		this.tagId = tagId;
	}

	public SimpleDateFormat getFmt() {
		return fmt;
	}

	public void setFmt(SimpleDateFormat fmt) {
		this.fmt = fmt;
	}

	public String getTraffic() {
		return traffic;
	}

	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getLat() {
		return lat;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getEnrollBeginTime() {
		return enrollBeginTime;
	}

	public void setEnrollBeginTime(String enrollBeginTime) {
		this.enrollBeginTime = enrollBeginTime;
	}

	public String getEnrollEndTime() {
		return enrollEndTime;
	}

	public String getToContent() {
		return toContent;
	}

	public void setToContent(String toContent) {
		this.toContent = toContent;
	}

	public void setEnrollEndTime(String enrollEndTime) {
		this.enrollEndTime = enrollEndTime;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getMoneyDetail() {
		return moneyDetail;
	}

	public String getTimeSpace() {
		return timeSpace;
	}

	public void setTimeSpace(String timeSpace) {
		this.timeSpace = timeSpace;
	}

	public void setMoneyDetail(String moneyDetail) {
		this.moneyDetail = moneyDetail;
	}

	public String getMoneynum() {
		return moneynum;
	}

	public void setMoneynum(String moneynum) {
		this.moneynum = moneynum;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String getTopicUserId() {
		return topicUserId;
	}

	public void setTopicUserId(String topicUserId) {
		this.topicUserId = topicUserId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getCardImage() {
		return cardImage;
	}

	public void setCardImage(String cardImage) {
		this.cardImage = cardImage;
	}

	public String getTopicId() {
		return topicId;
	}

	public void setTopicId(String topicId) {
		this.topicId = topicId;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCircleImage() {
		return circleImage;
	}

	public void setCircleImage(String circleImage) {
		this.circleImage = circleImage;
	}

	public String getIsCheck() {
		return isCheck;
	}

	public String getTopicImage() {
		return topicImage;
	}

	public void setTopicImage(String topicImage) {
		this.topicImage = topicImage;
	}

	public void setIsCheck(String isCheck) {
		this.isCheck = isCheck;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTagList() {
		return tagList;
	}

	public String getToUserId() {
		return toUserId;
	}

	public String getIsQrcode() {
		return isQrcode;
	}

	public void setIsQrcode(String isQrcode) {
		this.isQrcode = isQrcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public String getIsMoney() {
		return isMoney;
	}

	public void setIsMoney(String isMoney) {
		this.isMoney = isMoney;
	}

	public String getJoinType() {
		return joinType;
	}

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getActivityImage() {
		return activityImage;
	}

	public void setActivityImage(String activityImage) {
		this.activityImage = activityImage;
	}

	public void setJoinType(String joinType) {
		this.joinType = joinType;
	}

	public String getUserMax() {
		return userMax;
	}

	public void setUserMax(String userMax) {
		this.userMax = userMax;
	}

	public String getPagejsp() {
		return pagejsp;
	}

	public void setPagejsp(String pagejsp) {
		this.pagejsp = pagejsp;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setToUserId(String toUserId) {
		this.toUserId = toUserId;
	}

	public void setTagList(String tagList) {
		this.tagList = tagList;
	}

	public String getCircleId() {
		return circleId;
	}

	public void setCircleId(String circleId) {
		this.circleId = circleId;
	}

	public String getSummary() {
		return summary;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getCompanyShopProductId() {
		return companyShopProductId;
	}

	public void setCompanyShopProductId(String companyShopProductId) {
		this.companyShopProductId = companyShopProductId;
	}

	public Long getProductCommentId() {
		return productCommentId;
	}

	public void setProductCommentId(Long productCommentId) {
		this.productCommentId = productCommentId;
	}

	public String getImgList() {
		return imgList;
	}

	public void setImgList(String imgList) {
		this.imgList = imgList;
	}

	public String getCoumfiled() {
		return coumfiled;
	}

	public void setCoumfiled(String coumfiled) {
		this.coumfiled = coumfiled;
	}

	public String getClassics() {
		return classics;
	}

	public void setClassics(String classics) {
		this.classics = classics;
	}

	public String getUploadFileFileName() {
		return uploadFileFileName;
	}

	public void setUploadFileFileName(String uploadFileFileName) {
		this.uploadFileFileName = uploadFileFileName;
	}

	public File getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(File uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getImgChanged() {
		return imgChanged;
	}

	public void setImgChanged(String imgChanged) {
		this.imgChanged = imgChanged;
	}

	public String getCircleCardImage() {
		return circleCardImage;
	}

	public void setCircleCardImage(String circleCardImage) {
		this.circleCardImage = circleCardImage;
	}

}
