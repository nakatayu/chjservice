package com.chj.action;

import cn.eavic.framework.web.BaseAction;

import com.chj.common.Commonparam;
import com.chj.entity.User;
import com.chj.service.CommunityManager;
import com.chj.service.ProductManager;
import com.chj.service.ShareManager;
import com.chj.util.StaticConstant;

import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created with IntelliJ IDEA.
 * User: Richard
 * Date: 13-10-23
 * Time: 上午11:40
 * To change this template use File | Settings | File Templates.
 */
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "shareAction.action", type = "redirect") })
public class ShareAction extends ActionSupport {
	private static final long serialVersionUID = -3006428240642866461L;
	@Autowired
	ShareManager shareManager;

	@Autowired
	ProductManager productManager;

	/**
	 * 共享漕河泾--获取服务信息
	 */
	String serviceType;
	Long serviceId;
	Long beginindex;
	Long endindex;
	Long companyId;
	Long companyPageSize;
	Long companyPageIndex;
	Long companyServicePageIndex;
	Long companyServicePageSize;
	Long userId;
	private String tagList, timeSpace;

	public void findServiceMoreList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean baseBean = new BaseBean();
		User user = (User) request.getSession().getAttribute("user");

		try {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("serviceType", serviceType);
			param.put("beginindex", beginindex);
			param.put("endindex", endindex);
			if (timeSpace != null && timeSpace.trim().length() > 0) {
				param.put("timeSpace", Integer.valueOf(timeSpace));
			}
			if (tagList != null && tagList.trim().length() > 0) {
				Commonparam.tagListParam(param, tagList);
			}
			List<HashMap> serviceList = shareManager.findServiceMoreList(param);
			for (HashMap hashMap : serviceList) {
				Long sid = (Long) hashMap.get("service_id");
				HashMap<String, Object> param1 = new HashMap<String, Object>();
				if (user == null)
					param1.put("userId", 0);
				else
					param1.put("userId", user.getUserId());
				param1.put("serviceId", sid);
				List<HashMap> tagList = shareManager
						.findServiceTagListByServiceId(param1);

				if (tagList.size() < 2) {
					if (user != null)
						param1.put("userId", 0);
					String ids = "";
					for (HashMap map : tagList) {
						ids += map.get("tag_id") + ",";
					}
					if (ids.length() > 0)
						ids = ids.substring(0, ids.length() - 1);
					param1.put("ids", ids);

					tagList.addAll(shareManager
							.findServiceTagListByServiceId(param1));

				}
				hashMap.put("tagList", tagList);
			}

			baseBean.setStatus(200);
			baseBean.setRows(serviceList);
			if (beginindex == 1) {
				baseBean.setTotal(shareManager.findServiceMoreListCount(param));
			}
		} catch (Exception e) {
			baseBean.setStatus(400);
			baseBean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(baseBean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 用户感兴趣的服务优惠送，若未登录取后台推荐，若都没有去普通的
	 * 
	 * @throws Exception
	 */
	public void findUserServiceList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean baseBean = new BaseBean();
		User user = (User) request.getSession().getAttribute("user");
		try {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("serviceType", serviceType);
			if (serviceType.equals("4")) {
				param.put("maxNum", 1);
			} else {
				param.put("maxNum", 2);
			}
			if (user == null)
				param.put("userId", 0);
			else
				param.put("userId", user.getUserId());
			int maxNum = Integer.valueOf(param.get("maxNum").toString());
			List<HashMap> serviceList = shareManager.findUserServiceList(param);
			if (serviceList.size() < maxNum) {// 列表不足
				if (user == null) {// 用户未登陆
					param.put("maxNum", maxNum - serviceList.size());
					param.put("userId", -1);
					String ids = "";
					for (HashMap map : serviceList) {
						ids += map.get("service_id") + ",";
					}
					if (ids.length() > 0)
						ids = ids.substring(0, ids.length() - 1);
					param.put("ids", ids);
					serviceList.addAll(shareManager.findUserServiceList(param));
				} else {
					param.put("maxNum", maxNum - serviceList.size());
					param.put("userId", 0);
					serviceList.addAll(shareManager.findUserServiceList(param));
					if (serviceList.size() < maxNum) {// 列表不足
						param.put("maxNum", maxNum - serviceList.size());
						param.put("userId", -1);
						String ids = "";
						for (HashMap map : serviceList) {
							ids += map.get("service_id") + ",";
						}
						if (ids.length() > 0)
							ids = ids.substring(0, ids.length() - 1);
						param.put("ids", ids);
						serviceList.addAll(shareManager
								.findUserServiceList(param));
					}
				}
			}

			for (HashMap hashMap : serviceList) {
				Long sid = (Long) hashMap.get("service_id");
				HashMap<String, Object> param1 = new HashMap<String, Object>();
				if (user == null)
					param1.put("userId", 0);
				else
					param1.put("userId", user.getUserId());
				param1.put("serviceId", sid);
				List<HashMap> tagList = shareManager
						.findServiceTagListByServiceId(param1);
				if (tagList.size() < 2) {
					if (user != null) {
						param1.put("userId", 0);
						String ids = "";
						for (HashMap map : tagList) {
							ids += map.get("tag_id") + ",";
						}
						if (ids.length() > 0)
							ids = ids.substring(0, ids.length() - 1);
						param1.put("ids", ids);

						tagList.addAll(shareManager
								.findServiceTagListByServiceId(param1));
					}
				}
				hashMap.put("tagList", tagList);
			}

			baseBean.setStatus(200);
			baseBean.setRows(serviceList);
		} catch (Exception e) {
			baseBean.setStatus(400);
			baseBean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(baseBean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void findServiceMoreListByUserId() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean baseBean = new BaseBean();
		User user = (User) request.getSession().getAttribute("user");

		try {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("userId", userId);
			param.put("beginindex", beginindex);
			param.put("endindex", endindex);

			List<HashMap> serviceList = shareManager
					.findServiceMoreListByUserId(param);

			for (HashMap hashMap : serviceList) {
				Long sid = (Long) hashMap.get("service_id");
				HashMap<String, Object> param1 = new HashMap<String, Object>();
				if (user == null)
					param1.put("userId", 0);
				else
					param1.put("userId", user.getUserId());
				param1.put("serviceId", sid);
				List<HashMap> tagList = shareManager
						.findServiceTagListByServiceId(param1);
				hashMap.put("tagList", tagList);
			}

			baseBean.setStatus(200);
			baseBean.setRows(serviceList);
		} catch (Exception e) {
			baseBean.setStatus(400);
			baseBean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(baseBean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	private Integer page;

	public void findServiceDetailByServiceId() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean baseBean = new BaseBean();
		User loginUser = (User) request.getSession().getAttribute("user");
		try {
			HashMap serviceDetail = null;
			if (serviceId != null) {
				serviceDetail = shareManager
						.findServiceDetailByServiceId(serviceId);
				if (serviceDetail == null) {
					baseBean.setStatus(400);
					baseBean.setMsg("未查询到数据!");
				} else {
					// update seeCount

					//
					// Long preServiceId = new Long(0);
					// Long nextServiceId = new Long(0);
					//
					// List<HashMap> ranks =
					// shareManager.findRankByServiceType(serviceId);
					// for (HashMap hash : ranks) {
					// if (ranks.size() > 1) {
					// if (hash.get("service_id").equals(serviceId)) {
					// for (HashMap h : ranks) {
					// Long ar = (Long) h.get("rank");
					// Long br = (Long) hash.get("rank");
					// Long s = (Long) h.get("service_id");
					// if ((ar + 1) == (br)) {
					// preServiceId = s;
					// } else if (ar - 1 == br) {
					// nextServiceId = s;
					// }
					// }
					// }
					// }
					// }
					//
					// serviceDetail.put("preServiceId", preServiceId);
					// serviceDetail.put("nextServiceId", nextServiceId);
				}

			} else {
				if (page != null) {

					HashMap<String, Object> param = new HashMap<String, Object>();
					param.put("serviceType", serviceType);
					param.put("beginindex", page);
					param.put("endindex", page + 1);
					if (timeSpace != null && timeSpace.trim().length() > 0) {
						param.put("timeSpace", Integer.valueOf(timeSpace));
					}
					if (tagList != null && tagList.trim().length() > 0) {
						Commonparam.tagListParam(param, tagList);
					}
					List<HashMap> serviceList = shareManager
							.findServiceMoreList(param);
					if (serviceList.size() > 0) {
						Long cserviceIdTemp = (Long) serviceList.get(0).get(
								"service_id");
						serviceDetail = shareManager
								.findServiceDetailByServiceId(cserviceIdTemp);
					}
				}
			}
			if (serviceDetail != null) {
				shareManager.updateServcieSeeCount(Long.valueOf(serviceDetail
						.get("service_id").toString()));
				HashMap<String, Object> param1 = new HashMap<String, Object>();
				param1.put("userId", 0);
				param1.put("serviceId", serviceDetail.get("service_id"));
				List<HashMap> tagList = shareManager
						.findServiceTagListByServiceId(param1);

				serviceDetail.put("tagList", tagList);
				if (serviceDetail.get("company_id") != null) {
					HashMap company = (HashMap) productManager
							.findCompanyName(Long.valueOf(serviceDetail.get(
									"company_id").toString()));
					if (company != null) {
						serviceDetail.put("nick_name", company.get("name"));
						serviceDetail.put("head_picture", company.get("logo"));
					} else {
						serviceDetail.put("nick_name", "");
						serviceDetail.put("head_picture", "");
					}

				} else if (serviceDetail.get("user_id") != null) {
					HashMap user = productManager.findUserNickName(Long
							.valueOf(serviceDetail.get("user_id").toString()));
					if (user != null) {
						serviceDetail.put("nick_name", user.get("nickName"));
						serviceDetail.put("head_picture",
								user.get("headPicture"));
					} else {
						serviceDetail.put("nick_name", "");
						serviceDetail.put("head_picture", "");
					}

				} else {
					serviceDetail.put("nick_name", "");
					serviceDetail.put("head_picture", "");
				}
				baseBean.setStatus(200);
				baseBean.setRows(serviceDetail);
			} else {
				baseBean.setStatus(400);
				baseBean.setMsg("未找到服务信息!");
			}

		} catch (Exception e) {
			baseBean.setStatus(400);
			baseBean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(baseBean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void findServiceTagListByServiceId() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean baseBean = new BaseBean();
		User loginUser = (User) request.getSession().getAttribute("user");

		try {
			HashMap<String, Object> param1 = new HashMap<String, Object>();
			param1.put("userId", 0);
			param1.put("serviceId", serviceId);
			List<HashMap> taglist = shareManager
					.findServiceTagListByServiceId(param1);

			baseBean.setStatus(200);
			baseBean.setRows(taglist);
		} catch (Exception e) {
			baseBean.setStatus(400);
			baseBean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(baseBean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void findCooperatorList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);

		BaseBean baseBean = new BaseBean();

		try {
			Long beginIndex;
			Long endIndex;
			beginIndex = ((companyPageIndex - 1) * companyPageSize) + 1;
			endIndex = companyPageIndex * companyPageSize;

			HashMap<String, Long> param = new HashMap<String, Long>();
			param.put("beginIndex", beginIndex);
			param.put("endIndex", endIndex);

			List<HashMap> cooperatorList = shareManager
					.findCooperatorList(param);

			for (HashMap cooperator : cooperatorList) {
				List<HashMap> tagList = shareManager
						.findCompanyTagList(((Long) cooperator.get("companyId")));
				cooperator.put("tagList", tagList);
			}

			baseBean.setStatus(200);
			baseBean.setRows(cooperatorList);
		} catch (Exception e) {
			baseBean.setStatus(400);
			baseBean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(baseBean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void findCooperatorDetailByCompanyId() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean baseBean = new BaseBean();
		User user = (User) request.getSession().getAttribute("user");
		try {
			HashMap cooperatorDetail = shareManager
					.findCooperatorDetailByCompanyId(companyId);
			shareManager.updateCompanyBrowseCount(companyId);
			if (user == null) {
				cooperatorDetail.put("isCollection", 0);
			} else {
				cooperatorDetail.put("isCollection", productManager
						.findUserCollectObject(user.getUserId(), companyId,
								StaticConstant.OBJECT_TYPE[6]));
			}

			List<HashMap> tagList = shareManager.findCompanyTagList(companyId);
			cooperatorDetail.put("tagList", tagList);

			baseBean.setStatus(200);
			baseBean.setRows(cooperatorDetail);
		} catch (Exception e) {
			baseBean.setStatus(400);
			baseBean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(baseBean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void findCooperatorServiceByCompanyId() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);

		BaseBean baseBean = new BaseBean();

		try {
			Long beginIndex;
			Long endIndex;
			beginIndex = ((companyServicePageIndex - 1) * companyServicePageSize) + 1;
			endIndex = companyServicePageIndex * companyServicePageSize;

			HashMap<String, Long> param = new HashMap<String, Long>();
			param.put("companyId", companyId);
			param.put("beginIndex", beginIndex);
			param.put("endIndex", endIndex);

			List<HashMap> serviceList = shareManager
					.findCompanyServiceList(param);

			baseBean.setStatus(200);
			baseBean.setRows(serviceList);
		} catch (Exception e) {
			baseBean.setStatus(400);
			baseBean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(baseBean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	public Long getEndindex() {
		return endindex;
	}

	public void setEndindex(Long endindex) {
		this.endindex = endindex;
	}

	public Long getBeginindex() {
		return beginindex;
	}

	public void setBeginindex(Long beginindex) {
		this.beginindex = beginindex;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public Long getCompanyPageSize() {
		return companyPageSize;
	}

	public void setCompanyPageSize(Long companyPageSize) {
		this.companyPageSize = companyPageSize;
	}

	public Long getCompanyPageIndex() {
		return companyPageIndex;
	}

	public void setCompanyPageIndex(Long companyPageIndex) {
		this.companyPageIndex = companyPageIndex;
	}

	public Long getCompanyServicePageIndex() {
		return companyServicePageIndex;
	}

	public void setCompanyServicePageIndex(Long companyServicePageIndex) {
		this.companyServicePageIndex = companyServicePageIndex;
	}

	public Long getCompanyServicePageSize() {
		return companyServicePageSize;
	}

	public void setCompanyServicePageSize(Long companyServicePageSize) {
		this.companyServicePageSize = companyServicePageSize;
	}

	public Long getServiceId() {
		return serviceId;
	}

	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}

	public String getTagList() {
		return tagList;
	}

	public void setTagList(String tagList) {
		this.tagList = tagList;
	}

	public String getTimeSpace() {
		return timeSpace;
	}

	public void setTimeSpace(String timeSpace) {
		this.timeSpace = timeSpace;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}
}
