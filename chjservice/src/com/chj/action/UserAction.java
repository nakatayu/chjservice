package com.chj.action;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
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

import com.chj.common.ChangeImage;
import com.chj.common.Commonparam;
import com.chj.common.HttpXmlUtil;
import com.chj.entity.ActivityPart;
import com.chj.entity.ActivityUserPart;
import com.chj.entity.CirclePart;
import com.chj.entity.ProductCollection;
import com.chj.entity.TopicPart;
import com.chj.entity.User;
import com.chj.entity.UserAddress;
import com.chj.entity.UserCollection;
import com.chj.service.CommunityManager;
import com.chj.service.ProductManager;
import com.chj.service.ShareManager;
import com.chj.service.UserManager;
import com.chj.util.JsonSqlDateValueProcessor;
import com.chj.util.MD5Util;
import com.json.BaseBean;
import com.json.JsonLableObject;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 用户相关
 * 
 * @author 赵瑞可
 * 
 */
@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "userAction.action", type = "redirect") })
public class UserAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3092716663430118811L;

	@Autowired
	UserManager userManager;
	@Autowired
	CommunityManager communityManager;
	@Autowired
	ProductManager productManager;
	@Autowired
	ShareManager shareManager;

	private String username, password;

	public void weblogin() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		User user1 = new User();

		password = MD5Util.digest(password);
		user1.setPhone(username);
		user1.setPassword(password);
		User user = (User) userManager.weblogin(user1);
		BaseBean bean = new BaseBean();
		if (user != null) {
			String ip = request.getRemoteAddr();
			userManager.updateUserLoginTime(user.getUserId(), ip);
			request.getSession().setAttribute("user", user);
			bean.setStatus(200);
			bean.setTotal(productManager.findUserCartItemListCount(user
					.getUserId()));
		} else {
			bean.setStatus(400);
			bean.setMsg("账号密码错误!");
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	public void weblogin1() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		User user1 = new User();

		password = MD5Util.digest(password);
		user1.setPhone(username);
		user1.setPassword(password);
		User user = (User) userManager.weblogin(user1);
		BaseBean bean = new BaseBean();
		if (user != null) {
			String ip = request.getRemoteAddr();
			userManager.updateUserLoginTime(user.getUserId(), ip);
			request.getSession().setAttribute("user1", user);
			bean.setStatus(200);
			bean.setTotal(productManager.findUserCartItemListCount(user
					.getUserId()));
		} else {
			bean.setStatus(400);
			bean.setMsg("账号密码错误!");
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	/**
	 * 获取购物车数量
	 * 
	 * @throws Exception
	 */
	public void findUserCartItemCount() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		User user = (User) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		if (user != null) {
			bean.setStatus(200);
			bean.setTotal(productManager.findUserCartItemListCount(user
					.getUserId()));
		} else {
			bean.setStatus(400);
			bean.setMsg("请登录!");
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void webloginOut() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();

		request.getSession().setAttribute("user", null);
		bean.setStatus(200);

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 获取验证码
	 */
	private String phonenum;
	private Integer register;
	public void findPhoneCode() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		User user = (User) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			if (phonenum == null && user != null) {
				phonenum = user.getPhone();
			}

			Long result = (Long) userManager.findUserCountByUniqueField(
					"phone", phonenum);	
			if (result == 0){//不存在该手机号
				if(register==1){
					Object object = null;
					Pattern p = Pattern
							.compile("^((0?1[358]\\d{9})|((0(10|2[1-3]|[3-9]\\d{2}))?[1-9]\\d{6,7}))$");
					Matcher m = p.matcher(phonenum);
					if ((m.matches()) == true) {
						object = userManager.findPhoneCode(phonenum);
						if (object != null) {
							HttpXmlUtil.send(phonenum, "您的验证码:" + object.toString());
							bean.setStatus(200);
						} else {
							bean.setMsg("验证码出错!");
						}
					} else {
						bean.setMsg("手机号码有误!");
					}
				}
				else{
					bean.setStatus(400);
					bean.setMsg("手机号码尚未注册!");
				}
				
			}
			else{
				if(register==1){
					bean.setStatus(300);
					bean.setMsg("手机号码已注册!");
				}
				else{
					bean.setStatus(200);
					bean.setMsg("手机号码已注册!");
				}
				
			}
			

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 验证码检验
	 * 
	 * @throws Exception
	 */
	private String code;

	public void checkPhoneCode() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		try {
			Object object = userManager.checkPhoneCode(phonenum, code);
			if (object.toString().equals("T")) {
				bean.setStatus(200);
			} else {
				bean.setStatus(400);
				bean.setMsg("验证码不正确!");
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void resetUserPassword() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		try {
			Object object = userManager.checkPhoneCode(phonenum, code);
			if (object.toString().equals("T")) {
				HashMap param = new HashMap();
				param.put("phonenum", phonenum);
				param.put("password", MD5Util.digest(password));
				userManager.resetUserPassword(param);
				bean.setStatus(200);

			} else {
				bean.setStatus(400);
				bean.setMsg("验证码不正确!");
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 邀请码验证
	 * 
	 * @throws Exception
	 */
	public void checkUserGetCode() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		try {
			Object object = userManager.checkUserGetCode(code);
			if (object.toString().equals("T")) {
				bean.setStatus(200);
				request.getSession().setAttribute("code", code);
			} else {
				bean.setStatus(400);
				bean.setMsg("邀请码已用或不正确!");
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	private String uniqueField;
	private String fieldValue;

	public void findUserByUniqueField() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			Long result = (Long) userManager.findUserCountByUniqueField(
					uniqueField, fieldValue);

			if (result == 0)
				bean.setStatus(200);// 不存该用户
			else {
				bean.setStatus(400);// 存在该用户
				bean.setMsg("已经使用!");
			}

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 用户注册
	 * 
	 * @throws Exception
	 */
	private String email, nickname;

	public void registerUser() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {

			User user = (User) userManager.findUserByUniqueField("phone",
					phonenum);
			if (user == null) {
				user = (User) userManager.findUserByUniqueField("email", email);
				if (user == null) {
					Object object = userManager.checkPhoneCode(phonenum, code);
					if (object.toString().equals("T")) {
						password = MD5Util.digest(password);
						Long result = (Long) userManager.registerUser(phonenum,
								email, nickname, password);
						user = (User) userManager.findUserByUniqueField(
								"user_id", result.toString());
						if (result > 0) {
							bean.setStatus(200);
							request.getSession().setAttribute("user", user);

							/** 邀请码绑定 */
							String oldCode = (String) request.getSession()
									.getAttribute("code");
							if (code != null && code.equals(oldCode)) {
								request.getSession().removeAttribute("code");
								userManager.updateTbCodeTable(code,
										user.getUserId());
							}
							/** 邀请码绑定 */
						} else {
							bean.setStatus(400);// 存在该用户
							bean.setMsg("注册失败!");
						}
					} else {
						bean.setStatus(400);// 存在该用户
						bean.setMsg("验证码不正确!");
					}

				} else {
					bean.setStatus(400);// 存在该用户
					bean.setMsg("邮箱已注册!");
				}
			}

			else {
				bean.setStatus(400);// 存在该用户
				bean.setMsg("存在该手机号!");
			}

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	private User userParam;

	/**
	 * 修改个人资料
	 * 
	 * @throws Exception
	 */
	public void updateUserInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			userParam.setUserId(user1.getUserId());
			userManager.updateUserInfo(userParam);
			user1 = (User) userManager.findUserByUniqueField("user_id", user1
					.getUserId().toString());
			request.getSession().setAttribute("user", user1);

			bean.setStatus(200);

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	private File headImg;
	private String headImgFileName;

	/**
	 * 修改头像
	 * 
	 * @throws Exception
	 */
	public void userHeadImgUpload() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			String path = "";
			long max = 1024 * 150;

			if (this.headImg != null) {
				int length = 0;
				try {
					FileInputStream fis = new FileInputStream(headImg);
					try {
						length = fis.available();
					} catch (IOException e1) {
						e1.printStackTrace();
					}
				} catch (FileNotFoundException e2) {
					e2.printStackTrace();
				}
				if (max >= length) {

					String newfilename = Commonparam
							.makeNewFileName(headImgFileName);
					String targetFolder = Commonparam.headImage
							+ Commonparam.makeYearMonth(new Date());
					String absolute = Commonparam.getKeyValue("imageStorePath")
							+ targetFolder;
					File absoluteFolder = new File(absolute);
					if (!absoluteFolder.exists()) {
						absoluteFolder.mkdirs();
					}

					BufferedImage icon = ImageIO.read(this.headImg);
					BufferedImage rounded = ChangeImage.makeRoundedCorner(icon,
							icon.getWidth());
					ImageIO.write(rounded, "png", new File(absolute + "/"
							+ newfilename));

					path = targetFolder + newfilename;
					user1.setHeadPicture(path);

					userManager.updateUserHeadImg(user1);
					request.getSession().setAttribute("user", user1);
					bean.setStatus(200);
					bean.setMsg(path);
				} else {
					bean.setStatus(400);
					bean.setMsg("图片大小应控制在150K内!");
				}

			} else {
				bean.setMsg("请选择图片!");
			}

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 修改用户密码,昵称
	 * 
	 * @throws Exception
	 */
	private String nickName, passwordOld;

	public void updateUserPassword() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			passwordOld = MD5Util.digest(passwordOld);
			if (!user1.getPassword().equals(passwordOld)) {
				bean.setStatus(400);
				bean.setMsg("旧密码不正确!");
			} else {
				password = MD5Util.digest(password);
				user1.setPassword(password);
				userManager.updateUserPassword(user1);
				request.getSession().setAttribute("user", user1);
				bean.setStatus(200);
			}

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 修改用户标签分类选择
	 * 
	 * @throws Exception
	 */
	private Integer labelType;

	public void updateUserLableType() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {

			User user1 = (User) request.getSession().getAttribute("user");
			user1.setLableType(labelType.toString());
			userManager.updateUserLableType(user1);
			request.getSession().setAttribute("user", user1);
			bean.setStatus(200);

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 标签列表
	 * 
	 * @throws Exception
	 */
	public void findLableList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			List<JsonLableObject> lableList = userManager.findLableList(user1);

			bean.setStatus(200);
			bean.setRows(lableList);

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public String word;

	public void KeywordFliter() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);

		BaseBean baseBean = new BaseBean();
		try {
			List<String> result = userManager.KeywordFliter(word);
			baseBean.setRows(result);
			baseBean.setStatus(200);
		} catch (Exception e) {
			baseBean.setStatus(400);
			baseBean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(baseBean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 用户添加标签页面
	 * 
	 * @throws Exception
	 */
	public void adduserTagPage() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		try {
			User user1 = (User) request.getSession().getAttribute("user");
			List<HashMap> lableList = communityManager.findAllTagList(user1);
			request.setAttribute("tagList", JSONArray.fromObject(lableList)
					.toString());

		} catch (Exception e) {
			e.getLocalizedMessage();
		}
		request.getRequestDispatcher("pages/personal_addtag.jsp").forward(
				request, response);
	}

	/**
	 * 添加用户标签
	 * 
	 * @throws Exception
	 */
	private String tagIds;

	public void addUserTag() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {

			User user1 = (User) request.getSession().getAttribute("user");
			userManager.addUserTag(user1, tagIds);

			bean.setStatus(200);

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 获取用户关注的标签
	 * 
	 * @throws Exception
	 */
	public void findUserLableList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {

			User user1 = (User) request.getSession().getAttribute("user");
			List<Map<String, Object>> map = userManager
					.findUserLableFirstList(user1);
			for (Map<String, Object> obj : map) {
				List<HashMap> tagSecond = userManager.findUserLableSecondList(
						user1, obj.get("tagId"));
				for (HashMap second : tagSecond) {
					second.put(
							"childTags",
							userManager.finduserThreelableList(user1,
									second.get("tagId")));
				}
				obj.put("childTags", tagSecond);
			}

			bean.setStatus(200);
			bean.setRows(map);

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 获取热门标签和所有分类标签
	 * 
	 * @throws Exception
	 */
	public void findAllAndHotLableList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {

			List<HashMap<String, Object>> rt = new ArrayList<HashMap<String, Object>>();
			HashMap<String, Object> hotTag = new HashMap<String, Object>();
			hotTag.put("tagName", "热门标签");
			hotTag.put("tagId", "0");
			hotTag.put("childTags", userManager.findHotLableList());
			rt.add(hotTag);

			List<Object> map = userManager.findAllLableTypeList();
			for (Object obj : map) {
				((Map<String, Object>) obj).put("childTags", userManager
						.findSecondLableList(((Map<String, Object>) obj)
								.get("tagId")));
				rt.add((HashMap<String, Object>) obj);
			}

			bean.setStatus(200);
			bean.setRows(rt);

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 修改个人基本资料
	 * 
	 * @throws Exception
	 */
	public void updateUserBasicInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			userParam.setUserId(user1.getUserId());
			userManager.updateUserBasicInfo(userParam);
			user1 = (User) userManager.findUserByUniqueField("user_id", user1
					.getUserId().toString());
			request.getSession().setAttribute("user", user1);

			bean.setStatus(200);

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 修改详细资料
	 * 
	 * @throws Exception
	 */
	public void updateUserDetailInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			userParam.setUserId(user1.getUserId());
			userParam.setRealname(userParam.getFirstName()
					+ userParam.getLastName());
			if (user1.getHeadPicture() == null
					|| user1.getHeadPicture().trim().length() == 0
					|| user1.getHeadPicture().contains("head_")) {
				if (!user1.getSex().equals(userParam.getSex())) {
					if (userParam.getSex().equals("W")) {
						userParam
								.setHeadPicture("/upload/headimage/head_woman.png");
					} else {
						userParam
								.setHeadPicture("/upload/headimage/head_man.png");
					}
				}
			}
			userManager.updateUserDetailInfo(userParam);
			user1 = (User) userManager.findUserByUniqueField("user_id", user1
					.getUserId().toString());
			request.getSession().setAttribute("user", user1);

			bean.setStatus(200);
			bean.setMsg(user1.getHeadPicture());

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void findUserAllLableList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {

			User user1 = (User) request.getSession().getAttribute("user");
			List<Object> map = userManager.findUserAllLableList(user1
					.getUserId());

			bean.setStatus(200);
			bean.setRows(map);

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void delUserTags() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			int rt = userManager.delUserTags(user1, tagIds);
			if (rt > 0)
				bean.setStatus(200);
			else {
				bean.setStatus(400);
				bean.setMsg("删除失败!");
			}

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 添加用户地址
	 * 
	 * @throws Exception
	 */
	private UserAddress userAddress;

	public void insertUserAddress() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			if (userAddress.getChildArea() == null) {
				userAddress.setChildArea("");
			}
			userAddress.setChildArea(userAddress.getChildArea()
					+ userAddress.getAddressDetail());
			userAddress.setUserId(user1.getUserId());

			Long rt = userManager.insertUserAddress(userAddress);
			if (rt > 0)
				bean.setStatus(200);
			else {
				bean.setStatus(400);
				bean.setMsg("删除失败!");
			}

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 设置默认地址
	 * 
	 * @throws Exception
	 */
	public void settingAddressSelected() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null) {
				bean.setStatus(400);
				bean.setMsg("请登录!");
			} else {
				HashMap map = new HashMap();
				map.put("userId", user.getUserId());
				map.put("addressId", addressId);
				int rt = userManager.settingAddressSelected(map);
				if (rt > 0)
					bean.setStatus(200);
				else {
					bean.setStatus(400);
					bean.setMsg("设置失败!");
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
	 * 地址区域列表
	 * 
	 * @throws Exception
	 */
	public void loadAreaList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {

			List<HashMap> rt = userManager.loadAreaListFirst();
			for (HashMap map : rt) {
				map.put("childList",
						userManager.findAreaThree(map.get("areaId")));
			}

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
	 * 加载用户地址列表
	 * 
	 * @throws Exception
	 */
	public void loadUserAddress() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");

			List<Object> rt = userManager.loadUserAddress(user1);
			if (rt.size() > 0) {
				bean.setStatus(200);
				bean.setRows(rt);
			} else {
				bean.setStatus(400);
				bean.setMsg("没有数据!");
			}

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 删除用户地址
	 * 
	 * @throws Exception
	 */
	private String addressId;

	public void deleteUserAddress() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			UserAddress userAddress = new UserAddress();
			userAddress.setUserId(user1.getUserId());
			userAddress.setAddressId(Long.valueOf(addressId));

			int rt = userManager.deleteUserAddress(userAddress);
			if (rt > 0) {
				bean.setStatus(200);
				bean.setRows(rt);
			} else {
				bean.setStatus(400);
				bean.setMsg("没有数据!");
			}

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	private String cardNo;

	/**
	 * 绑定杉德卡卡号
	 * 
	 * @throws Exception
	 */
	public void bindSandCardInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		User user = (User) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			if (user != null) {
				Object object = userManager.checkPhoneCode(user.getPhone(),
						code);
				if (object.toString().equals("F")) {
					bean.setStatus(400);
					bean.setMsg("验证码不正确!");
				} else {
					Long u = userManager.selectUserCard(cardNo);
					if (u > 0) {
						bean.setMsg("此一卡通卡号已被绑定！");
						bean.setStatus(400);
					} else {
						user.setShandCardno(cardNo);
						int rt = userManager.updateShandCardno(user);
						if (rt > 0) {
							bean.setStatus(200);
							bean.setRows(rt);
						} else {
							bean.setStatus(400);
							bean.setMsg("没有数据!");
						}
					}
				}
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void unbindSandCard() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		User user = (User) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			if (user != null) {
				user.setShandCardno("");
				userManager.updateShandCardno(user);
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	private Integer page, size;

	public void findUserfriend() throws Exception {
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
			List<HashMap> myfriend = (List<HashMap>) userManager
					.findUserfriend(param);
			for (HashMap map : myfriend) {
				if (map.get("nick_name") == null) {
					map.put("nick_name", map.get("email"));
				}
				if (map.get("called") == null) {
					map.put("called", map.get("nick_name"));
				}
				if (map.get("info") == null) {
					map.put("info", "没有简介！");
				}
			}
			bean.setRows(myfriend);
			bean.setStatus(200);
			bean.setTotal(userManager.findUserfriendCount(param));
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		System.out.println(json);
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	/**
	 * 用户收藏对象
	 * 
	 * @throws Exception
	 */
	private String objectId;
	private String type, doType;

	/**
	 * 用户收藏
	 * 
	 * @throws Exception
	 */
	public void collectionUserRestarant() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			if (user1 == null) {
				bean.setStatus(400);
				bean.setMsg("请登录!");
			} else {
				UserCollection userCollection = new UserCollection();
				userCollection.setObjectId(Long.valueOf(objectId));
				userCollection.setType(Integer.valueOf(type));
				userCollection.setDoType("1");
				userCollection.setUserId(user1.getUserId());

				HashMap map = new HashMap();
				map.put("userId", user1.getUserId());
				map.put("objectId", objectId);
				map.put("type", type);
				map.put("doType", 1);

				if (userManager.findUserCollectCount(map) <= 0) {
					if (userManager.saveCollectionUser(userCollection) > 0) {
						bean.setStatus(200);
						bean.setMsg("收藏成功！");
					} else {
						bean.setStatus(400);
						bean.setMsg("收藏失败！");
					}
				} else {
					bean.setStatus(200);
					bean.setMsg("已收藏！");
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
	 * 用户分享
	 * 
	 * @throws Exception
	 */
	public void shareObjectUser() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			if (user1 == null) {
				bean.setStatus(400);
				bean.setMsg("请登录!");
			} else {
				UserCollection userCollection = new UserCollection();
				userCollection.setObjectId(Long.valueOf(objectId));
				userCollection.setType(Integer.valueOf(type));
				userCollection.setDoType("2");
				userCollection.setUserId(user1.getUserId());

				int rt = userManager.saveCollectionUser(userCollection);
				if (rt > 0)
					bean.setStatus(200);
				else {
					bean.setStatus(400);
					bean.setMsg("分享失败!");
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
	 * 我的主页
	 * 
	 * @throws Exception
	 */

	/*
	 * public void userMainInfo () throws Exception {
	 * 
	 * HttpServletResponse response = (HttpServletResponse) ActionContext
	 * .getContext().get(ServletActionContext.HTTP_RESPONSE); HttpServletRequest
	 * request = (HttpServletRequest) ActionContext
	 * .getContext().get(ServletActionContext.HTTP_REQUEST);
	 * 
	 * List<HashMap> tagList = null ;
	 * 
	 * 
	 * request.setAttribute("tagList", tagList);
	 * 
	 * request.getRequestDispatcher("pages/myhome.jsp").forward(request,
	 * response);
	 * 
	 * }
	 */

	/**
	 * userTopic话题
	 * 
	 * @throws Exception
	 */
	private String userTopic, timeSpace, tagList;

	public void findUserTopic() throws Exception {

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
			param.put("userTopic", userTopic);
			if (timeSpace != null && timeSpace.trim().length() > 0
					&& !timeSpace.trim().equals("null")) {
				param.put("timeSpace", Integer.valueOf(timeSpace));
			}
			if (tagList != null && tagList.trim().length() > 0) {
				Commonparam.tagListParam(param, tagList);
			}

			List<TopicPart> topicList = (List<TopicPart>) userManager
					.findUserTopic(param);
			for (TopicPart part : topicList) {

				Object nickname = userManager.findUserNickNameImage(user1
						.getUserId());
				if (nickname != null)
					part.setUserInfo(nickname);

			}
			bean.setRows(topicList);
			bean.setStatus(200);
			bean.setTotal(userManager.findUserTopicCount(param));

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	private String topicId;

	/**
	 * userTopic话题delete
	 * 
	 * @throws Exception
	 */
	public void deleteUserTopic() throws Exception {

		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("userId", user1.getUserId());
			param.put("topicId", topicId);
			Integer j = (Integer) userManager.delecteUserTopic(param);
			if (j > 0)
				bean.setStatus(200);
			else {
				bean.setStatus(400);
				bean.setMsg("删除失败!");
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 添加用户为好友
	 * 
	 * @throws Exception
	 */
	private String friendId;

	public void addUserFriend() throws Exception {

		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			if (user1 == null) {
				bean.setStatus(400);
				bean.setMsg("请登录!");
			} else {
				HashMap<String, Object> param = new HashMap<String, Object>();
				param.put("userId", user1.getUserId());
				param.put("friendId", Long.valueOf(friendId));
				if (type == null || type.equals("0")) {

					userManager.addUserFriend(param);
				} else {

					userManager.deleteUserFriend(param);
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

	/**
	 * 用户参加和创建的活动
	 * 
	 * @throws Exception
	 */
	private String userActivity;

	public void findUserActivityList() throws Exception {

		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			if (user1 == null) {
				bean.setStatus(400);
				bean.setMsg("请登录!");
			} else {
				HashMap<String, Object> param = new HashMap<String, Object>();
				param.put("userId", user1.getUserId());
				param.put("size", size);
				param.put("startIndex", (page - 1) * size);
				param.put("order", order);
				param.put("orderType", orderType);
				param.put("userActivity", userActivity);
				if (timeSpace != null && timeSpace.trim().length() > 0
						&& !timeSpace.trim().equals("null")) {
					param.put("timeSpace", Integer.valueOf(timeSpace));
				}
				if (tagList != null && tagList.trim().length() > 0) {
					Commonparam.tagListParam(param, tagList);
				}
				List<ActivityUserPart> list = userManager
						.findUserActivityList(param);
				for (ActivityUserPart part : list) {
					part.setQrcodePath(userManager.findActivityQrcodePath(
							part.getActivityId(), user1.getUserId()));
				}

				bean.setStatus(200);
				bean.setRows(list);
				bean.setTotal(userManager.findUserActivityListCount(param));
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 下载二维码
	 * 
	 * @throws Exception
	 */
	private String activityName, activityId;

	public void checkUserDouwloadQrcode() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean base = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			HashMap qrcodepathStatus = communityManager.findActivityUserQrcode(
					Long.valueOf(activityId), user1.getUserId());
			String status = qrcodepathStatus.get("status").toString().trim();
			if (!status.equals("3")) {
				base.setStatus(400);
				if (status.equals("1") || status.equals("2"))
					base.setMsg("您的信息尚未通过审核!");
				if (status.equals("4"))
					base.setMsg("您已退出该活动!");
				if (status.equals("5"))
					base.setMsg("您已被踢出该活动!");

			} else {
				base.setStatus(200);
			}

		} catch (Exception e) {
			base.setStatus(400);
			base.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(base).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void dowloadQrcode() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean base = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			HashMap qrcodepathStatus = communityManager.findActivityUserQrcode(
					Long.valueOf(activityId), user1.getUserId());
			String status = qrcodepathStatus.get("status").toString().trim();
			if (!status.equals("3")) {
				base.setStatus(400);
				if (status.equals("1") || status.equals("2"))
					base.setMsg("您的信息尚未通过审核!");
				if (status.equals("4"))
					base.setMsg("您已退出该活动!");
				if (status.equals("5"))
					base.setMsg("您已被踢出该活动!");
				String json = JSONObject.fromObject(base).toString();
				response.getOutputStream().write(json.getBytes("UTF-8"));
			} else {
				String path = Commonparam.getKeyValue("imageStorePath");
				File absoluteFolder = new File(path + File.separator
						+ qrcodepathStatus.get("qrcodePath"));
				// File absoluteFolder = new
				// File(path+"/"+"upload/product/qrcode.png");
				response.reset();
				response.setContentType("application/x-msdownload");
				response.setCharacterEncoding("utf-8");
				if (activityName.length() > 10) {
					activityName = activityName.substring(0, 10);
				}
				activityName = new String(activityName.getBytes(), "ISO-8859-1");

				response.addHeader("Content-Disposition",
						"attachment;filename=" + activityName + ".png");

				OutputStream os = response.getOutputStream();
				InputStream is = new FileInputStream(absoluteFolder);
				byte[] buff = new byte[1024];
				while (true) {
					int readed = is.read(buff);
					if (readed == -1) {
						break;
					}
					byte[] temp = new byte[readed];
					System.arraycopy(buff, 0, temp, 0, readed);
					os.write(temp);
				}
				is.close();
				os.close();
			}

		} catch (Exception e) {

		}

	}

	/**
	 * 用户收藏列表
	 * 
	 * @throws Exception
	 */
	private int circlePage, actPage, topicPage, proPage, restaPage, dotype;

	public void findUserCollection() throws Exception {

		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			if (user1 == null) {
				bean.setStatus(400);
				bean.setMsg("请登录!");
			} else {

				HashMap map = new HashMap();
				map.put("size", 4);
				map.put("startIndex", (circlePage - 1) * 4);
				map.put("userId", user1.getUserId());
				map.put("dotype", dotype);
				List<UserCollection> circleList = userManager
						.findUserCollectionCircle(map);
				for (UserCollection circle : circleList) {
					circle.setCirclePart(communityManager
							.findCirclePartById(circle.getObjectId()));

				}
				map.put("size", 3);
				map.put("startIndex", (circlePage - 1) * 3);
				List<UserCollection> proList = userManager
						.findUserCollectionProduct(map);
				for (UserCollection collection : proList) {
					ProductCollection productCollection = communityManager
							.findProductCollectionPartById(collection
									.getObjectId());
					if (productCollection != null) {
						productCollection.setProductInfo(productManager
								.findProductInfoById(productCollection
										.getProductId()));
						productCollection.setSku(productManager
								.findSkuByShopProductId(productCollection
										.getCompanyShopProductId()));
						productCollection.setTagList(productManager
								.findProductTagsByProductId(productCollection
										.getProductId()));
						collection.setProPart(productCollection);
					}

				}
				List<UserCollection> shopList = productManager
						.findUserCollectionShop(map);
				for (UserCollection collection : shopList) {
					if (collection.getShopInfo() != null) {
						HashMap<String, Object> param1 = new HashMap<String, Object>();
						param1.put("userId", 0);
						param1.put("companyShopId", collection.getObjectId());
						collection.getShopInfo().put("tagList",
								productManager.findShopTagsByShopId(param1));
					}
				}

				map.put("size", 2);
				map.put("startIndex", (actPage - 1) * 2);
				map.put("userId", user1.getUserId());
				List<UserCollection> activityList = userManager
						.findUserCollectionActivity(map);
				if (user1 != null) {
					for (UserCollection circle : activityList) {
						circle.setActivityPart(communityManager
								.findActivityPartById(circle.getObjectId()));
						if (circle.getActivityPart() != null
								&& circle.getActivityPart().getActivityId() != null) {
							circle.getActivityPart().setHasAdd(
									communityManager.findActivityUserCount(
											circle.getActivityPart()
													.getActivityId(), user1
													.getUserId()));
							if (circle.getActivityPart().getIsQrcode() != null
									&& circle.getActivityPart().getIsQrcode()
											.equals("T")) {
								circle.getActivityPart().setHasQrcode(
										communityManager.findHasQrcodeCount(
												circle.getActivityPart()
														.getActivityId(), user1
														.getUserId()));
							}
						}

					}
				}

				List<UserCollection> topicList = userManager
						.findUserCollectionTopic(map);
				for (UserCollection circle : topicList) {
					if (circle.getTopicPart() != null) {
						circle.getTopicPart().setUserInfo(
								communityManager.findUserInfoById(circle
										.getTopicPart().getUserId()));
					}
				}
				HashMap result = new HashMap();
				result.put("circleList", circleList);
				result.put("activityList", activityList);
				result.put("topicList", topicList);
				result.put("proList", proList);
				result.put("shopList", shopList);

				bean.setStatus(200);
				bean.setRows(result);
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 用户好友的活动,圈子,话题
	 * 
	 * @throws Exception
	 */
	public void findUserFriendInfo() throws Exception {

		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			if (user1 == null) {
				bean.setStatus(400);
				bean.setMsg("请登录!");
			} else {

				HashMap map = new HashMap();
				map.put("size", 3);
				map.put("startIndex", (circlePage - 1) * 3);
				map.put("userId", user1.getUserId());

				List<CirclePart> circleList = userManager
						.findUserFriendCircleList(map);
				for (CirclePart circle : circleList) {
					Object image = userManager
							.findUserImage(circle.getUserId());
					if (image != null)
						circle.setHeadPicture(image.toString());
				}

				List<ActivityPart> activityList = userManager
						.findUserFriendActivityList(map);
				for (ActivityPart circle : activityList) {
					circle.setUserInfo(userManager.findUserNickNameImage(circle
							.getCreateUserId()));
				}
				List<TopicPart> topicList = userManager
						.findUserFriendTopicList(map);
				for (TopicPart circle : topicList) {
					circle.setUserInfo(userManager.findUserNickNameImage(circle
							.getUserId()));
				}
				HashMap result = new HashMap();
				result.put("circleList", circleList);
				result.put("activityList", activityList);
				result.put("topicList", topicList);

				if (circlePage == 1) {
					map.put("size", 6);
					map.put("startIndex", 0);
					map.put("myUserId", user1.getUserId());
					map.put("orderType", "time");
					map.put("userCircle", 0);// 我参与的
					List<CirclePart> myCircle = userManager
							.findMyjoinCircle(map);

					map.put("size", 12);
					map.put("startIndex", 0);
					List<HashMap> myfriend = (List<HashMap>) userManager
							.findUserfriend(map);
					for (HashMap friend : myfriend) {
						if (friend.get("nick_name") == null) {
							friend.put("nick_name", map.get("email"));
						}
						if (friend.get("called") == null) {
							friend.put("called", map.get("nick_name"));
						}
					}
					result.put("myCircle", myCircle);
					result.put("myFriend", myfriend);

					List<Object> tagList = userManager
							.findUserAllLableList(user1.getUserId());
					result.put("tagList", tagList);
				}

				bean.setStatus(200);
				bean.setRows(result);
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	private String userId;

	public void findUserFriendHomeInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String page = "pages/myhome_friend.jsp";
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			if (user1 == null || userId == null) {
				page = "common/404.jsp";
				if (userId == null)
					request.setAttribute("error", "请选择用户!");
				if (user1 == null)
					request.setAttribute("error", "请登录!");
			} else {
				User userFriend = (User) userManager.findUserByUniqueField(
						"user_id", userId);
				HashMap param = new HashMap();
				param.put("userId", user1.getUserId());
				param.put("friendId", userId);
				userFriend.setIsFriend(userManager.findIsFriend(param));

				request.setAttribute("userFriend", userFriend);
				List<Object> tagList = userManager.findUserAllLableList(Long
						.valueOf(userId));
				request.setAttribute("tagList", tagList);

			}

		} catch (Exception e) {
			page = "common/404.jsp";
			request.setAttribute("error", e.getLocalizedMessage());
		}
		request.getRequestDispatcher(page).forward(request, response);

	}

	/**
	 * 好友主页的最新活动，话题，圈子
	 * 
	 * @throws Exception
	 */
	public void findUserFriendHomeInfoList() throws Exception {

		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			if (user1 == null || userId == null) {
				if (userId == null)
					bean.setMsg("请选择用户!");
				if (user1 == null)
					bean.setMsg("请登录!");
				bean.setStatus(400);
			} else {

				HashMap map = new HashMap();
				map.put("size", 3);
				map.put("startIndex", (circlePage - 1) * 3);
				map.put("userId", userId);

				List<CirclePart> circleList = userManager
						.findUserFriendHomeCircleList(map);
				for (CirclePart circle : circleList) {
					Object image = userManager
							.findUserImage(circle.getUserId());
					if (image != null)
						circle.setHeadPicture(image.toString());
				}

				List<ActivityPart> activityList = userManager
						.findUserFriendHomeActivityList(map);
				for (ActivityPart circle : activityList) {
					circle.setUserInfo(userManager.findUserNickNameImage(circle
							.getCreateUserId()));
				}
				List<TopicPart> topicList = userManager
						.findUserFriendHomeTopicList(map);
				for (TopicPart circle : topicList) {
					circle.setUserInfo(userManager.findUserNickNameImage(circle
							.getUserId()));
				}
				HashMap result = new HashMap();
				result.put("circleList", circleList);
				result.put("activityList", activityList);
				result.put("topicList", topicList);

				bean.setStatus(200);
				bean.setRows(result);
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 个人消息
	 * 
	 * @throws Exception
	 */
	public void findUserUserMsgList() throws Exception {

		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			if (user1 == null) {
				if (user1 == null)
					bean.setMsg("请登录!");
				bean.setStatus(400);
			} else {

				HashMap map = new HashMap();
				map.put("size", size);
				map.put("startIndex", (page - 1) * size);
				map.put("userId", user1.getUserId());

				List<HashMap> circleList = userManager.findUserUserMsgList(map);
				for (HashMap circle : circleList) {
					Object senduserId = circle.get("sendUserId");
					if (senduserId != null) {
						Object image = userManager.findUserNickNameImage(Long
								.valueOf(senduserId.toString()));
						if (image != null) {
							circle.put("fromUserInfo", image);
						}
					}
				}
				bean.setStatus(200);
				bean.setRows(circleList);
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class,
				new JsonSqlDateValueProcessor("yyyy-MM-dd HH:mm:ss"));
		String json = JSONObject.fromObject(bean, jsonConfig).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 用户回复消息
	 * 
	 * @throws Exception
	 */
	private String title, content, recieveUserId;

	public void addUserComment() throws Exception {

		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user1 = (User) request.getSession().getAttribute("user");
			if (user1 == null) {
				if (user1 == null)
					bean.setMsg("请登录!");
				bean.setStatus(400);
			} else {

				HashMap map = new HashMap();
				map.put("sendUserId", user1.getUserId());
				if (recieveUserId != null && recieveUserId.trim().length() > 0) {
					map.put("recieveUserId", recieveUserId);
				}
				map.put("type", "1");
				map.put("status", "F");
				map.put("content", content);
				map.put("sendDate", new Date());
				map.put("title", title);

				Integer rt = userManager.addUserComment(map);
				if (rt > 0)
					bean.setStatus(200);
				else {
					bean.setStatus(400);
					bean.setMsg("添加失败!");
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
	 * 首页查询跳转
	 * 
	 * @throws Exception
	 */
	public void turnSearchResult() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		request.getSession().setAttribute("keyword", keyword);
		request.getRequestDispatcher("pages/personal_search.jsp").forward(
				request, response);
	}

	/**
	 * 首页查询结果
	 * 
	 * @throws Exception
	 */
	private String keyword, orderType, order;

	public void findSearchResult() throws Exception {

		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			if (keyword == null && keyword.trim().length() == 0) {
				bean.setStatus(400);
				bean.setMsg("请输入关键字!");
			} else {
				request.getSession().setAttribute("keyword", keyword);
				HashMap map = new HashMap();
				map.put("keyword", keyword);
				map.put("size", size);
				map.put("startIndex", size * (page - 1));
				map.put("orderType", orderType);
				map.put("order", order);

				List<HashMap> circleList = userManager.findCircleByKeyword(map);
				List<HashMap> topicList = userManager.findTopicByKeyword(map);
				List<HashMap> activityList = userManager
						.findActivityByKeyword(map);

				List<HashMap> proList = productManager
						.findProductByKeyword(map);
				for (HashMap companyProduct : proList) {
					companyProduct.put("sku", productManager
							.findSkuByShopProductId(companyProduct
									.get("company_shop_product_id")));
				}

				List<HashMap> shopList = productManager
						.findCompanyShopByKeyword(map);

				List<HashMap> serviceList = shareManager
						.findServiceByKeyword(map);
				List<HashMap> companyList = shareManager
						.findCompanyByKeyword(map);

				HashMap rt = new HashMap();
				rt.put("circleList", circleList);
				rt.put("topicList", topicList);
				rt.put("activityList", activityList);
				rt.put("proList", proList);
				rt.put("shopList", shopList);
				rt.put("serviceList", serviceList);
				rt.put("companyList", companyList);

				bean.setStatus(200);
				bean.setRows(rt);
			}
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class,
				new JsonSqlDateValueProcessor("yyyy.MM.dd"));

		String json = JSONObject.fromObject(bean, jsonConfig).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	String circleId, status;

	/**
	 * 圈子成员查询
	 * 
	 * @throws Exception
	 */
	public void findTheCirclePerple() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap map = new HashMap();
			map.put("circleId", circleId);
			map.put("status", status);
			map.put("size", size);
			map.put("startIndex", (page - 1) * size);
			List<HashMap> userList = (List<HashMap>) userManager
					.findTheCirclePerple(map);
			if (userList.size() > 0) {
				bean.setStatus(200);
				bean.setRows(userList);
			} else {
				bean.setMsg("没有所属成员！");
			}
			bean.setTotal(userManager.findTheCirclePerpleCount(map));
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		System.out.println(json);
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 加入圈子成员
	 * 
	 * @throws Exception
	 */
	public void updateCirclePerple() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			userManager.updateCirclePerple(userId, status, circleId);
			bean.setStatus(200);

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		System.out.println(json);
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	String circleRole;

	/**
	 * 添加圈子管理员
	 * 
	 * @throws Exception
	 */
	public void nsetCircleManager() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			Object o = userManager.nsetCircleManager(userId, circleRole,
					circleId);
			if (o == null) {
				bean.setStatus(200);
			} else {
				bean.setMsg(o.toString());
			}

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		System.out.println(json);
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 圈子管理员查询
	 * 
	 * @throws Exception
	 */
	public void selectCircleManager() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			List<HashMap> userList = (List<HashMap>) userManager
					.selectCircleManager(circleRole, circleId);

			if (userList.size() > 0) {
				bean.setStatus(200);
				bean.setRows(userList);
				bean.setTotal(userList.size());
			} else {
				bean.setStatus(400);
				bean.setMsg("没有所属管理员！");
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		System.out.println(json);
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 圈主或活动发起人信息查询
	 * 
	 * @throws Exception
	 */
	public void findTheCircleHeader() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {

			User u = (User) userManager
					.findUserByUniqueField("user_id", userId);
			bean.setStatus(200);
			bean.setRows(u);

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 发圈子站内信
	 * 
	 * @throws Exception
	 */
	public void sendTheCircleMessage() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		User user = (User) request.getSession().getAttribute("user");
		try {
			if (user == null) {
				bean.setStatus(400);
				bean.setMsg("未登录！");
			} else {
				HashMap map = new HashMap();
				map.put("sendUserId", user.getUserId());
				map.put("title", title);
				map.put("content", content);
				map.put("circleId", circleId);
				map.put("type", 1);
				map.put("sendDate", new Date());
				map.put("status", "F");
				userManager.createCircleMessage(map);
				bean.setStatus(200);
			}

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		System.out.println(json);
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 活动成员查询
	 * 
	 * @throws Exception
	 */
	public void examineTheMemberMeth() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap map = new HashMap();
			map.put("activityId", activityId);
			map.put("status", status);
			map.put("size", size);
			map.put("startIndex", (page - 1) * size);
			List<HashMap> userList = (List<HashMap>) userManager
					.examineTheMemberMeth(map);
			if (userList.size() > 0) {
				bean.setStatus(200);
				bean.setRows(userList);
			} else {
				bean.setMsg("没有所属成员！");
			}
			bean.setTotal(userManager.examineTheMemberMethCount(map));
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		System.out.println(json);
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	String signIn;

	/**
	 * 活动成员签到、未签到查询
	 * 
	 * @throws Exception
	 */
	public void signInTheMemberMeth() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap map = new HashMap();
			map.put("activityId", activityId);
			map.put("signIn", signIn);
			map.put("columnName", "is_sign_in");
			map.put("size", size);
			map.put("startIndex", (page - 1) * size);
			List<HashMap> userList = (List<HashMap>) userManager
					.signInTheMemberMeth(map);
			if (userList.size() > 0) {
				bean.setStatus(200);
				bean.setRows(userList);
			} else {
				bean.setMsg("没有所属成员！");
			}
			bean.setTotal(userManager.signInTheMemberMethCount(map));
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		System.out.println(json);
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 活动人员状态修改
	 * 
	 * @throws Exception
	 */
	public void updateActivityPerple() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			userManager.updateActivityPerple(activityId, userId, status);

			bean.setStatus(200);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		System.out.println(json);
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 发送活动站内信
	 * 
	 * @throws Exception
	 */
	public void sendTheActivityMessage() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		User user = (User) request.getSession().getAttribute("user");
		try {
			if (user == null) {
				bean.setStatus(400);
				bean.setMsg("未登录！");
			} else {
				HashMap map = new HashMap();
				map.put("sendUserId", user.getUserId());
				map.put("title", title);
				map.put("content", content);
				map.put("activityId", activityId);
				map.put("type", 1);
				map.put("sendDate", new Date());
				map.put("status", "F");
				userManager.createActivityMessage(map);
				bean.setStatus(200);
			}

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void checkMemberCredentials() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		User user = (User) request.getSession().getAttribute("user");
		try {
			if (user == null) {
				response.getWriter().print("用户没有登录！");
			} else {
				Long activityUserId = communityManager.findActivityUserId(Long
						.valueOf(activityId));
				if (user.getUserId().equals(activityUserId)) {
					HashMap map = new HashMap();
					map.put("userId", Long.valueOf(userId));
					map.put("activityId", Long.valueOf(activityId));
					map.put("type", 2);
					map.put("doType", 2);
					HashMap userCard = (HashMap) userManager
							.findCredentialsCredentials(map);
					if (userCard != null) {
						userCard.put("userName", userManager
								.findUserNickNameImage(Long.valueOf(userId)));
						request.setAttribute("userCard", userCard);
					}
				} else {
					response.getWriter().print("用户没有查看权限！");
				}
				request.getRequestDispatcher("pages/personal_card_check.jsp")
						.forward(request, response);
			}
		} catch (Exception e) {
			response.getWriter().print(e.getLocalizedMessage());
		}

	}

	/**
	 * 我附近的
	 * 
	 * @throws Exception
	 */
	public void findMyLocation() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		User user = (User) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			if (user != null) {
				HashMap latlng = userManager.findUserLocation(user.getUserId());
				if (latlng != null) {
					bean.setStatus(200);
					bean.setRows(latlng);
				} else {
					bean.setStatus(400);
					bean.setMsg("获取个人位置失败!");
				}
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setRows(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public String getSignIn() {
		return signIn;
	}

	public void setSignIn(String signIn) {
		this.signIn = signIn;
	}

	public String getCircleRole() {
		return circleRole;
	}

	public void setCircleRole(String circleRole) {
		this.circleRole = circleRole;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public String getUniqueField() {
		return uniqueField;
	}

	public void setUniqueField(String uniqueField) {
		this.uniqueField = uniqueField;
	}

	public String getFieldValue() {
		return fieldValue;
	}

	public void setFieldValue(String fieldValue) {
		this.fieldValue = fieldValue;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public String getEmail() {
		return email;
	}

	public String getUserActivity() {
		return userActivity;
	}

	public void setUserActivity(String userActivity) {
		this.userActivity = userActivity;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public File getHeadImg() {
		return headImg;
	}

	public void setHeadImg(File headImg) {
		this.headImg = headImg;
	}

	public String getHeadImgFileName() {
		return headImgFileName;
	}

	public void setHeadImgFileName(String headImgFileName) {
		this.headImgFileName = headImgFileName;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTagIds() {
		return tagIds;
	}

	public void setTagIds(String tagIds) {
		this.tagIds = tagIds;
	}

	public String getPasswordOld() {
		return passwordOld;
	}

	public void setPasswordOld(String passwordOld) {
		this.passwordOld = passwordOld;
	}

	public String getRecieveUserId() {
		return recieveUserId;
	}

	public void setRecieveUserId(String recieveUserId) {
		this.recieveUserId = recieveUserId;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getNickName() {
		return nickName;
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

	public void setContent(String content) {
		this.content = content;
	}

	public String getFriendId() {
		return friendId;
	}

	public void setFriendId(String friendId) {
		this.friendId = friendId;
	}

	public String getActivityName() {
		return activityName;
	}

	public int getCirclePage() {
		return circlePage;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setCirclePage(int circlePage) {
		this.circlePage = circlePage;
	}

	public String getDoType() {
		return doType;
	}

	public void setDoType(String doType) {
		this.doType = doType;
	}

	public int getActPage() {
		return actPage;
	}

	public void setActPage(int actPage) {
		this.actPage = actPage;
	}

	public int getTopicPage() {
		return topicPage;
	}

	public void setTopicPage(int topicPage) {
		this.topicPage = topicPage;
	}

	public int getProPage() {
		return proPage;
	}

	public void setProPage(int proPage) {
		this.proPage = proPage;
	}

	public int getRestaPage() {
		return restaPage;
	}

	public void setRestaPage(int restaPage) {
		this.restaPage = restaPage;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Integer getLabelType() {
		return labelType;
	}

	public String getObjectId() {
		return objectId;
	}

	public void setObjectId(String objectId) {
		this.objectId = objectId;
	}

	public String getType() {
		return type;
	}

	public String getUserTopic() {
		return userTopic;
	}

	public void setUserTopic(String userTopic) {
		this.userTopic = userTopic;
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

	public void setType(String type) {
		this.type = type;
	}

	public void setLabelType(Integer labelType) {
		this.labelType = labelType;
	}

	public User getUserParam() {
		return userParam;
	}

	public void setUserParam(User userParam) {
		this.userParam = userParam;
	}

	public UserAddress getUserAddress() {
		return userAddress;
	}

	public String getAddressId() {
		return addressId;
	}

	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}

	public void setUserAddress(UserAddress userAddress) {
		this.userAddress = userAddress;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
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

	public void setSize(Integer size) {
		this.size = size;
	}

	public String getTopicId() {
		return topicId;
	}

	public void setTopicId(String topicId) {
		this.topicId = topicId;
	}

	public int getDotype() {
		return dotype;
	}

	public void setDotype(int dotype) {
		this.dotype = dotype;
	}

	public String getCircleId() {
		return circleId;
	}

	public void setCircleId(String circleId) {
		this.circleId = circleId;
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

	public Integer getRegister() {
		return register;
	}

	public void setRegister(Integer register) {
		this.register = register;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

}
