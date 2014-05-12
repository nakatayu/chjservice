package com.chj.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.chj.entity.CartItem;
import com.chj.entity.CirclePart;
import com.chj.entity.CompanyShop;
import com.chj.entity.CompanyShopProductSku;
import com.chj.entity.Order;
import com.chj.entity.OrderComment;
import com.chj.entity.OrderFlow;
import com.chj.entity.OrderItem;
import com.chj.entity.OrderItemAppend;
import com.chj.entity.Product;
import com.chj.entity.ProductSku;
import com.chj.entity.User;
import com.chj.entity.UserServer;
import com.chj.service.CommonManager;
import com.chj.service.ProductManager;
import com.chj.service.UserManager;
import com.chj.util.ExceptionMyself;
import com.chj.util.JsonDateValueProcessor;
import com.chj.util.StaticConstant;
import com.json.BaseBean;
import com.json.JsonLableObject;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 产品相关
 * 
 * @author 赵瑞可
 * 
 */
@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "productAction.action", type = "redirect") })
public class ProductAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -927180801561378661L;
	@Autowired
	ProductManager productManager;

	@Autowired
	UserManager userManager;

	@Autowired
	CommonManager commonManager;

	/**
	 * 便捷首页 促销商品和推广商品,商品分类
	 * 
	 * @throws Exception
	 */
	public void findProductByFunction() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		User user = (User) request.getSession().getAttribute("user");
		try {
			int size = 4;
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("maxNum", size);
			if (user == null)
				param.put("userId", 0);
			else
				param.put("userId", user.getUserId());
			param.put("functionType", StaticConstant.FUNCTION_TYPE[0]);
			List<HashMap> cuxiaoList = productManager
					.findProductByFunction(param);
			if (cuxiaoList.size() < size) {// 列表不足
				if (user == null) {// 用户未登陆
					param.put("maxNum", size - cuxiaoList.size());
					param.put("userId", -1);
					String ids = "";
					for (HashMap map : cuxiaoList) {
						ids += map.get("companyShopProductId") + ",";
					}

					if (ids.length() > 0) {
						ids = ids.substring(0, ids.length() - 1);
					}
					param.put("ids", ids);
					cuxiaoList.addAll(productManager
							.findProductByFunction(param));
				} else {
					param.put("maxNum", size - cuxiaoList.size());
					param.put("userId", 0);
					cuxiaoList.addAll(productManager
							.findProductByFunction(param));
					if (cuxiaoList.size() < size) {// 列表不足
						param.put("maxNum", size - cuxiaoList.size());
						param.put("userId", -1);
						String ids = "";
						for (HashMap map : cuxiaoList) {
							ids += map.get("companyShopProductId") + ",";
						}

						if (ids.length() > 0) {
							ids = ids.substring(0, ids.length() - 1);
						}
						param.put("ids", ids);
						cuxiaoList.addAll(productManager
								.findProductByFunction(param));
					}
				}
			}
			size = 4;
			param.put("maxNum", size);
			if (user == null)
				param.put("userId", 0);
			else
				param.put("userId", user.getUserId());
			param.put("functionType", StaticConstant.FUNCTION_TYPE[1]);
			List<HashMap> tuiguangList = productManager
					.findProductByFunction(param);
			if (tuiguangList.size() < size) {// 列表不足
				if (user == null) {// 用户未登陆
					param.put("maxNum", size - tuiguangList.size());
					param.put("userId", -1);
					String ids = "";
					for (HashMap map : tuiguangList) {
						ids += map.get("companyShopProductId") + ",";
					}

					if (ids.length() > 0) {
						ids = ids.substring(0, ids.length() - 1);
					}
					param.put("ids", ids);
					tuiguangList.addAll(productManager
							.findProductByFunction(param));
				} else {
					param.put("maxNum", size - tuiguangList.size());
					param.put("userId", 0);
					tuiguangList.addAll(productManager
							.findProductByFunction(param));
					if (tuiguangList.size() < size) {// 列表不足
						param.put("maxNum", size - tuiguangList.size());
						param.put("userId", -1);
						String ids = "";
						for (HashMap map : tuiguangList) {
							ids += map.get("companyShopProductId") + ",";
						}

						if (ids.length() > 0) {
							ids = ids.substring(0, ids.length() - 1);
						}
						param.put("ids", ids);
						tuiguangList.addAll(productManager
								.findProductByFunction(param));
					}
				}
			}
			size = 4;
			param.put("maxNum", size);
			if (user == null)
				param.put("userId", 0);
			else
				param.put("userId", user.getUserId());
			param.put("functionType", StaticConstant.FUNCTION_TYPE[2]);
			List<HashMap> categoryList = productManager
					.findProductByFunction(param);
			if (categoryList.size() < size) {// 列表不足
				if (user == null) {// 用户未登陆
					param.put("maxNum", size - categoryList.size());
					param.put("userId", -1);
					String ids = "";
					for (HashMap map : categoryList) {
						ids += map.get("companyShopProductId") + ",";
					}

					if (ids.length() > 0) {
						ids = ids.substring(0, ids.length() - 1);
					}
					param.put("ids", ids);
					categoryList.addAll(productManager
							.findProductByFunction(param));
				} else {
					param.put("maxNum", size - categoryList.size());
					param.put("userId", 0);
					categoryList.addAll(productManager
							.findProductByFunction(param));
					if (categoryList.size() < size) {// 列表不足
						param.put("maxNum", size - categoryList.size());
						param.put("userId", -1);
						String ids = "";
						for (HashMap map : categoryList) {
							ids += map.get("companyShopProductId") + ",";
						}

						if (ids.length() > 0) {
							ids = ids.substring(0, ids.length() - 1);
						}
						param.put("ids", ids);
						categoryList.addAll(productManager
								.findProductByFunction(param));
					}
				}
			}

			for (HashMap companyProduct : cuxiaoList) {
				companyProduct.put("sku", productManager
						.findSkuByShopProductId(companyProduct
								.get("companyShopProductId")));
				companyProduct.put("name", productManager
						.findProductName(companyProduct.get("productId")));
				companyProduct.put("image", productManager
						.findProductImage(companyProduct.get("productId")));
			}
			for (HashMap tuiguang : tuiguangList) {
				tuiguang.put("sku", productManager
						.findSkuByShopProductId(tuiguang
								.get("companyShopProductId")));
				tuiguang.put("name", productManager.findProductName(tuiguang
						.get("productId")));
				tuiguang.put("image", productManager.findProductImage(tuiguang
						.get("productId")));
			}
			for (HashMap companyProduct : categoryList) {
				companyProduct.put("sku", productManager
						.findSkuByShopProductId(companyProduct
								.get("companyShopProductId")));
				companyProduct.put("name", productManager
						.findProductName(companyProduct.get("productId")));
				companyProduct.put("image", productManager
						.findProductImage(companyProduct.get("productId")));
			}
			HashMap map = new HashMap();
			map.put("cuxiao", cuxiaoList);
			map.put("tuiguang", tuiguangList);
			map.put("categoryList", categoryList);
			bean.setStatus(200);
			bean.setRows(map);

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 商品详情
	 * 
	 * @throws Exception
	 */
	private String productId;

	public void findProductDetail() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		String page = "pages/convenient_productdetail.jsp";
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (productId == null) {
				request.setAttribute("error", "请选择商品!");
				page = "common/404.jsp";
			} else {
				Product product = productManager.findProductDetail(productId);
				commonManager.updateObjectBrowseCount("tb_product",
						"product_id", Long.valueOf(productId), "browse_count");

				product.setCompanyShopProductId(Long
						.valueOf(companyShopProductId));
				if (user == null) {
					product.setIsCollection(0);
				} else {
					product.setIsCollection(productManager
							.findUserCollectObject(user.getUserId(),
									companyShopProductId,
									StaticConstant.OBJECT_TYPE[4]));
				}
				String selCount = productManager.findProductSellCount(Long
						.valueOf(companyShopProductId));
				if (selCount != null) {
					product.setSellCount(Double.valueOf(selCount).intValue()
							+ "");
				} else
					product.setSellCount("0");

				List dd = productManager.findProductImageList(product
						.getProductId());
				product.setImgList(dd);
				if (dd.size() > 0) {
					product.setImage(dd.get(0));
				}
				product.setShopInfo(productManager
						.findCompanyShopInfo(companyShopId));
				product.setAllAttrList(productManager
						.findAllAttrList(companyShopProductId));
				product.setSku(productManager.findProductSku(Long
						.valueOf(companyShopProductSkuId)));
				List<HashMap> selectedSkuAttr = productManager
						.findProductSelectedSkuAttrAndAttrValueList(companyShopProductSkuId);
				product.setSelectedSkuAttr(JSONArray
						.fromObject(selectedSkuAttr).toString());

				List<CompanyShopProductSku> skuList = productManager
						.findAllSkuList(companyShopProductId);
				for (CompanyShopProductSku sku : skuList) {
					sku.setAttributeValueId(productManager
							.findAttributeValueId(sku.getProductSkuId()));
					sku.setSku(productManager.findProductSkuById(sku
							.getProductSkuId()));
				}
				product.setAllSkuList(JSONArray.fromObject(skuList).toString());

				List<HashMap> proTuiGuang = productManager
						.findCompanyShopTuiguang(Long.valueOf(companyShopId));
				for (HashMap companyProduct : proTuiGuang) {
					companyProduct.put("sku", productManager
							.findSkuByShopProductId(companyProduct
									.get("companyShopProductId")));
					companyProduct.put("image", productManager
							.findProductImage(companyProduct.get("productId")));
				}

				request.setAttribute("proTuiGuang", proTuiGuang);
				request.setAttribute("product", product);
				Object tagList = productManager
						.findProductTagsByProductId(product.getProductId());
				request.setAttribute("tagList", tagList);
				request.setAttribute("companyShopId", companyShopId);
				request.setAttribute("areaList", productManager
						.findShopAreaByShopId(Long.valueOf(companyShopId)));
				request.setAttribute("type", type);
				request.setAttribute("statusMsg",
						JSONArray.fromObject(productManager.findShopStatus()));
			}

		} catch (Exception e) {
			request.setAttribute("error", e.getLocalizedMessage());
			e.printStackTrace();
			page = "common/404.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * 便捷首页--品牌列表
	 * 
	 * @throws Exception
	 */
	public void findBrandTop4List() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		User user = (User) request.getSession().getAttribute("user");
		try {
			int size = 4;
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("maxNum", size);
			if (user == null)
				param.put("userId", 0);
			else
				param.put("userId", user.getUserId());
			List<HashMap> restaurantList = productManager
					.findBrandTop4List(param);
			if (restaurantList.size() < size) {// 列表不足
				if (user == null) {// 用户未登陆
					param.put("maxNum", size - restaurantList.size());
					param.put("userId", -1);
					String ids = "";
					for (HashMap map : restaurantList) {
						ids += map.get("companyId") + ",";
					}

					if (ids.length() > 0) {
						ids = ids.substring(0, ids.length() - 1);
					}
					param.put("ids", ids);
					restaurantList.addAll(productManager
							.findBrandTop4List(param));
				} else {
					param.put("maxNum", size - restaurantList.size());
					param.put("userId", 0);
					restaurantList.addAll(productManager
							.findBrandTop4List(param));
					if (restaurantList.size() < size) {// 列表不足
						param.put("maxNum", size - restaurantList.size());
						param.put("userId", -1);
						String ids = "";
						for (HashMap map : restaurantList) {
							ids += map.get("companyId") + ",";
						}

						if (ids.length() > 0) {
							ids = ids.substring(0, ids.length() - 1);
						}
						param.put("ids", ids);
						restaurantList.addAll(productManager
								.findBrandTop4List(param));
					}
				}
			}

			bean.setStatus(200);
			bean.setRows(restaurantList);
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	/**
	 * 更多品牌
	 * 
	 * @throws Exception
	 */
	private String timeSpace, tagList;

	public void findBrandMoreList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("size", size);
			param.put("startIndex", (page - 1) * size);
			param.put("keyword", keyword);

			if (timeSpace != null && timeSpace.trim().length() > 0) {
				param.put("timeSpace", Integer.valueOf(timeSpace));
			}
			if (tagList != null && tagList.trim().length() > 0) {
				Commonparam.tagListParam(param, tagList);
			}
			List<HashMap> restaurantList = productManager
					.findBrandMoreList(param);

			bean.setStatus(200);
			bean.setRows(restaurantList);
			bean.setTotal(productManager.findBrandMoreListCount(param));
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	/**
	 * 便捷首页--用户相关的/推广的/普通的餐厅列表
	 * 
	 * @throws Exception
	 */
	public void findRestaurantList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		User user = (User) request.getSession().getAttribute("user");
		try {
			int size = 4;
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("maxNum", size);
			if (user == null)
				param.put("userId", 0);
			else
				param.put("userId", user.getUserId());
			List<HashMap> restaurantList = productManager
					.findRestaurantList(param);
			if (restaurantList.size() < size) {// 列表不足
				if (user == null) {// 用户未登陆，推广店铺不足
					param.put("maxNum", size - restaurantList.size());
					param.put("userId", -1);// 普通商店
					String ids = "";
					for (HashMap map : restaurantList) {
						ids += map.get("companyShopId") + ",";
					}
					if (ids.length() > 0) {
						ids = ids.substring(0, ids.length() - 1);
					}
					param.put("ids", ids);
					restaurantList.addAll(productManager
							.findRestaurantList(param));
				} else {
					param.put("maxNum", size - restaurantList.size());
					param.put("userId", 0);
					restaurantList.addAll(productManager
							.findRestaurantList(param));
					if (restaurantList.size() < size) {// 列表不足
						param.put("maxNum", size - restaurantList.size());
						param.put("userId", -1);
						String ids = "";
						for (HashMap map : restaurantList) {
							ids += map.get("companyShopId") + ",";
						}
						if (ids.length() > 0) {
							ids = ids.substring(0, ids.length() - 1);
						}
						param.put("ids", ids);
						restaurantList.addAll(productManager
								.findRestaurantList(param));
					}
				}
			}
			for (HashMap restaurant : restaurantList) {
				HashMap<String, Object> param1 = new HashMap<String, Object>();
				if (user == null)
					param1.put("userId", 0);
				else
					param1.put("userId", user.getUserId());
				param1.put("companyShopId", restaurant.get("companyShopId"));
				List<HashMap> tagList = productManager
						.findShopTagsByShopId(param1);
				param1.put("userId", 0);
				String ids = "";
				for (HashMap map : tagList) {
					ids += map.get("tagId") + ",";
				}
				if (ids.length() > 0)
					ids = ids.substring(0, ids.length() - 1);
				param1.put("ids", ids);
				tagList.addAll(productManager.findShopTagsByShopId(param1));
				restaurant.put("tagList", tagList);
			}

			bean.setStatus(200);
			bean.setRows(restaurantList);
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	/**
	 * 便捷首页--商品分类列表
	 * 
	 * @throws Exception
	 */
	public void findProductByCategory() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			List<HashMap> productList = productManager.findProductByCategory();
			for (HashMap product : productList) {
				product.put("sku", productManager
						.findSkuByShopProductId(product
								.get("companyShopProductId")));
				product.put("image", productManager.findProductImage(product
						.get("productId")));

			}
			bean.setStatus(200);
			bean.setRows(productList);
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	/**
	 * 便捷首页--感兴趣的商品
	 * 
	 * @throws Exception
	 */
	public void findProductByUserTag() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user != null) {
				List<HashMap> tuiguangList = productManager
						.findProductByuserTag(user);
				for (HashMap product : tuiguangList) {
					product.put("sku", productManager
							.findSkuByShopProductId(product
									.get("companyShopProductId")));
					product.put("image", productManager
							.findProductImage(product.get("productId")));
					product.put("tagList", productManager
							.findProductTagsByProductId(product
									.get("productId")));
					product.put("commentCount", productManager
							.findProductCommentCount(product
									.get("companyShopProductId")));
				}
				bean.setStatus(200);
				bean.setRows(tuiguangList);
			} else {
				bean.setStatus(300);// 用户未登录
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 商品推广列表/促销列表
	 * 
	 * @throws Exception
	 */
	private String keyword, functionType;
	private Integer page, size;

	public void findProductTuiguangList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("size", size);
			param.put("startIndex", (page - 1) * size);
			param.put("keyword", keyword);
			param.put("functionType", functionType);

			if (timeSpace != null && timeSpace.trim().length() > 0) {
				param.put("timeSpace", Integer.valueOf(timeSpace));
			}
			if (tagList != null && tagList.trim().length() > 0) {
				Commonparam.tagListParam(param, tagList);
			}

			List<HashMap> tuiguangList = productManager
					.findProductTuiguangList(param);
			for (HashMap product : tuiguangList) {
				product.put("sku", productManager
						.findSkuByShopProductId(product
								.get("companyShopProductId")));
				product.put("image", productManager.findProductImage(product
						.get("productId")));
			}
			bean.setStatus(200);
			bean.setRows(tuiguangList);
			bean.setTotal(productManager.findProductTuiguangListCount(param));

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 用户感兴趣的商品
	 * 
	 * @throws Exception
	 */
	public void findProductInterestList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null) {
				bean.setStatus(400);
				bean.setMsg("请登陆!");
			} else {
				HashMap<String, Object> param = new HashMap<String, Object>();
				param.put("size", size);
				param.put("startIndex", (page - 1) * size);
				param.put("keyword", keyword);
				param.put("userId", user.getUserId());

				List<HashMap> tuiguangList = productManager
						.findProductInterestList(param);
				for (HashMap product : tuiguangList) {
					product.put("sku", productManager
							.findSkuByShopProductId(product
									.get("companyShopProductId")));
					product.put("image", productManager
							.findProductImage(product.get("productId")));
				}
				bean.setStatus(200);
				bean.setRows(tuiguangList);
				bean.setTotal(productManager
						.findProductInterestListCount(param));
			}
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 更多餐厅 size,page,keyword,
	 * 
	 * @throws Exception
	 */
	private String categoryId, areaThirdId, sendTime, consumptionPer,
			sendPrice, cardPay, deliverOk;

	public void findRestarauntMoreList() throws Exception {
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
			if (keyword != null && keyword.trim().length() > 0)
				param.put("keyword", keyword);
			if (categoryId != null && categoryId.trim().length() > 0)
				param.put("categoryId", categoryId);
			if (areaThirdId != null && areaThirdId.trim().length() > 0)
				param.put("areaThirdId", areaThirdId);
			if (sendTime != null && sendTime.trim().length() > 0)
				param.put("sendTime", sendTime);
			if (consumptionPer != null && consumptionPer.trim().length() > 0)
				param.put("consumptionPer", consumptionPer);
			if (sendPrice != null && sendPrice.trim().length() > 0)
				param.put("sendPrice", sendPrice);
			if (cardPay != null && cardPay.trim().length() > 0)
				param.put("cardPay", cardPay);

			if (timeSpace != null && timeSpace.trim().length() > 0) {
				param.put("timeSpace", Integer.valueOf(timeSpace));
			}
			if (tagList != null && tagList.trim().length() > 0) {
				Commonparam.tagListParam(param, tagList);
			}
			if (deliverOk != null && deliverOk.trim().length() > 0) {
				param.put("deliverOk", deliverOk);
			}

			List<HashMap> tuiguangList = productManager
					.findRestarauntMoreList(param);
			for (HashMap restaurant : tuiguangList) {
				HashMap<String, Object> param1 = new HashMap<String, Object>();
				param1.put("userId", 0);
				param1.put("companyShopId", restaurant.get("companyShopId"));
				restaurant.put("tagList",
						productManager.findShopTagsByShopId(param1));
				if (user != null)
					restaurant.put("isCollection", productManager
							.findUserCollectObject(user.getUserId(),
									restaurant.get("companyShopId"),
									StaticConstant.OBJECT_TYPE[0]));
				else
					restaurant.put("isCollection", -1);
				restaurant.put("sellCount", productManager
						.findShopMonthCount(restaurant.get("companyShopId")));
				// restaurant.put("yuding", StaticConstant.IS_WORK[0]);
			}
			bean.setStatus(200);
			bean.setRows(tuiguangList);
			bean.setTotal(productManager.findRestarauntMoreListCount(param));

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		System.out.println(json);
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 店铺分类和配送区域
	 * 
	 * @throws Exception
	 */
	public void findSendAreaList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("area", productManager.findSendAreaList());
			map.put("category", productManager.findRestaraurantCategory());
			bean.setStatus(200);
			bean.setRows(map);

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 店铺详情
	 * 
	 * @throws Exception
	 */
	private String companyShopId;

	public void findRestarauntDetail() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		String page = "pages/convenient_resta_detail.jsp";
		User user = (User) request.getSession().getAttribute("user");
		try {

			if (companyShopId == null) {
				request.setAttribute("error", "请选择店铺!");
				page = "common/404.jsp";
			} else {

				CompanyShop restaraunt = productManager
						.findRestarauntDetail(companyShopId);
				if (restaraunt.getStatus().intValue() == 2
						&& restaraunt.getExamineResult().intValue() == 3) {
					request.setAttribute("error", "该店铺信息已更新，正在等待审核!");
					page = "common/404.jsp";
				} else {

					restaraunt.setCategoryName(productManager
							.findCategoryName(restaraunt.getCategoryId()));
					if (user == null) {
						restaraunt.setIsCollection(0L);

					} else {
						restaraunt.setIsCollection(productManager
								.findUserCollectObject(user.getUserId(),
										restaraunt.getCompanyShopId(),
										StaticConstant.OBJECT_TYPE[0]));

					}
					request.setAttribute("restaraunt", restaraunt);
					HashMap<String, Object> param1 = new HashMap<String, Object>();
					param1.put("userId", 0);
					param1.put("companyShopId", restaraunt.getCompanyShopId());
					request.setAttribute("tagList",
							productManager.findShopTagsByShopId(param1));
					request.setAttribute("areaList",
							productManager.findShopAreaByShopId(restaraunt
									.getCompanyShopId()));
					commonManager.updateObjectBrowseCount("tb_company_shop",
							"company_shop_id", Long.valueOf(companyShopId),
							"browse_count");
					request.setAttribute("statusMsg", JSONArray
							.fromObject(productManager.findShopStatus()));

				}
			}
		} catch (Exception e) {
			request.setAttribute("error", e.getLocalizedMessage());
			page = "common/404.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * 店铺下的产品分类
	 * 
	 * @throws Exception
	 */
	public void findRestarauntProduct() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();

		try {
			User user = (User) request.getSession().getAttribute("user");
			if (companyShopId == null) {
				bean.setMsg("请选择店铺!");
				bean.setStatus(400);
			} else {
				
				List<HashMap> map = productManager
						.findRestarauntProductCategory(companyShopId,companyId);
				for (HashMap category : map) {
					List<HashMap> pro = productManager
							.findProductByShopSelfCategory(
									category.get("proShopCategoryId"),
									companyShopId,companyId);
					for (HashMap product : pro) {
						product.put("image", productManager
								.findProductImage(product.get("productId")));
						product.put("sku", productManager
								.findSkuByShopProductId(product
										.get("companyShopProductId")));
						product.put("tagList", productManager
								.findProductTagsByProductId(product
										.get("productId")));
						if (user != null)
							product.put(
									"isCollection",
									productManager.findUserCollectObject(
											user.getUserId(),
											product.get("companyShopProductId"),
											StaticConstant.OBJECT_TYPE[4]));

						else
							product.put("isCollection", -1);

						String selCount = productManager
								.findProductSellCount(Long.valueOf(product.get(
										"companyShopProductId").toString()));
						if (selCount != null) {
							product.put("sellCount", Double.valueOf(selCount)
									.intValue());
						} else
							product.put("sellCount", 0);

					}
					category.put("productList", pro);
				}
				bean.setStatus(200);
				bean.setRows(map);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			bean.setStatus(400);
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 用户添加商品到购物车,不含附加属性
	 * 
	 * @throws Exception
	 */
	private String skuId, price, oldPrice, qty;
	private String companyShopProductSkuId, companyShopProductId;

	public void addUserCart() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();

		try {
			User user = (User) request.getSession().getAttribute("user");
			if (price == null || companyShopId == null || user == null
					|| skuId == null || productId == null
					|| companyShopProductSkuId == null
					|| companyShopProductId == null) {
				if (user == null)
					bean.setMsg("请登录!");
				if (companyShopId == null)
					bean.setMsg("请选择店铺!");
				if (productId == null)
					bean.setMsg("请选择商品!");
				if (price == null)
					bean.setMsg("请选择价格!");
				bean.setStatus(400);
			} else {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("productSkuId", skuId);
				map.put("companyShopId", companyShopId);
				map.put("userId", user.getUserId());
				map.put("productId", productId);
				map.put("price", Double.valueOf(price));
				map.put("oldPrice", Double.valueOf(oldPrice));
				map.put("createTime", new Date());
				map.put("companyShopProductId", companyShopProductId);
				map.put("companyShopProductSkuId", companyShopProductSkuId);
				if (qty != null && qty.trim().length() > 0) {
					map.put("qty", Integer.valueOf(qty));
				} else {
					map.put("qty", 1);
				}

				CartItem cartitem = productManager.findUserCartItem(map);

				ProductSku sku = (ProductSku) productManager
						.findProductSku(Long.valueOf(map.get(
								"companyShopProductSkuId").toString()));
				if (cartitem == null
						|| Double.valueOf(sku.getStock()) >= cartitem.getQty()) {
					Long cardItemId = productManager.addUserCart(map);
					bean.setStatus(200);
				} else {
					bean.setStatus(400);
					bean.setMsg("已超过存量!");
				}

			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			bean.setStatus(400);
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 加入到购物车,数量手输入
	 * 
	 * @throws Exception
	 */
	public void addUserCartQtyInput() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();

		try {
			User user = (User) request.getSession().getAttribute("user");
			if (price == null || companyShopId == null || user == null
					|| skuId == null || productId == null
					|| companyShopProductSkuId == null
					|| companyShopProductId == null) {
				if (user == null)
					bean.setMsg("请登录!");
				if (companyShopId == null)
					bean.setMsg("请选择店铺!");
				if (productId == null)
					bean.setMsg("请选择商品!");
				if (price == null)
					bean.setMsg("请选择价格!");
				bean.setStatus(400);
			} else {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("productSkuId", skuId);
				map.put("companyShopId", companyShopId);
				map.put("userId", user.getUserId());
				map.put("productId", productId);
				map.put("price", Double.valueOf(price));
				map.put("oldPrice", Double.valueOf(oldPrice));
				map.put("createTime", new Date());
				map.put("companyShopProductId", companyShopProductId);
				map.put("companyShopProductSkuId", companyShopProductSkuId);
				if (qty != null && qty.trim().length() > 0) {
					map.put("qty", Integer.valueOf(qty));
				} else {
					map.put("qty", 1);
				}

				CartItem cartitem = productManager.findUserCartItem(map);

				ProductSku sku = (ProductSku) productManager
						.findProductSku(Long.valueOf(map.get(
								"companyShopProductSkuId").toString()));
				if (cartitem == null
						|| Double.valueOf(sku.getStock()) >= cartitem.getQty()) {
					Long cardItemId = productManager.addUserCart(map);
					bean.setStatus(200);
				} else {
					bean.setStatus(400);
					bean.setMsg("已超过存量!");
				}

			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			bean.setStatus(400);
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 购物车列表
	 * 
	 * @throws Exception
	 */
	public void findUserCartList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		String page = "pages/personal_cart.jsp";
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null) {
				request.setAttribute("error", "请登录!");
				page = "common/404.jsp";
			} else {
				List<HashMap> shopList = productManager
						.findUserCartShopList(user.getUserId());
				for (HashMap shop : shopList) {
					HashMap map = new HashMap();
					map.put("userId", user.getUserId());
					map.put("shopId", shop.get("companyShopId"));

					List<CartItem> cartList = productManager.findCartItem(map);
					for (CartItem item : cartList) {

						HashMap pro = productManager.findProductCartInfo(item
								.getProductId());
						if (pro == null)
							continue;
						pro.put("image", productManager.findProductImage(item
								.getProductId()));
						item.setProduct(pro);
						item.setSku(productManager.findProductSkuById(item
								.getProductSkuId()));
						if (user == null) {
							item.setIsCollection(0);

						} else {
							item.setIsCollection(productManager
									.findUserCollectObject(user.getUserId(),
											item.getCompanyShopProductId(),
											StaticConstant.OBJECT_TYPE[4]));

						}

						// 以下是副属性添加
						List<HashMap<String, Object>> appendList = (List<HashMap<String, Object>>) productManager
								.findCartAppendItem(item.getCartItemId());

						if (appendList.size() > 0) {
							HashMap<String, Object> mapComent = new HashMap<String, Object>();

							Float pricei = Float.valueOf(item.getPrice());
							Float oldpricei = Float.valueOf(item.getOldPrice());
							StringBuffer sb = new StringBuffer("");
							StringBuffer sb1 = new StringBuffer("");
							int count = 0;
							for (HashMap<String, Object> map1 : appendList) {
								if ("T".equals(map1.get("isCheckbox"))) {
									Float fprice = Float.valueOf(map1.get(
											"price").toString());
									Float fqty = Float.valueOf(map1.get("qty")
											.toString());
									pricei += fprice * fqty;
									oldpricei += fprice * fqty;
									// if(map1.get("parentName")!=null){
									// sb.append(map1.get("parentName")).append("：<br/>");
									// }
									// sb.append(map1.get("name")).append("：").append("单价(").append(fprice).append(")");
									// sb.append("×").append("数量(").append(fqty).append(") = ").append(fprice*fqty).append("<br/>");
									//
									// }else
									// if("F".equals(map1.get("isCheckbox"))){
									// sb1.append(map1.get("parentName")).append("：").append(map1.get("name")).append("<br/>");
									if (count % 2 == 0 && count != 0)
										sb.append("<br/>" + map1.get("name"));
									else if (count % 2 == 1)
										sb.append("/" + map1.get("name"));
									else
										sb.append(map1.get("name"));
									sb.append("*").append(fqty).append(" ￥")
											.append(fprice * fqty);
									count++;

								} else if ("F".equals(map1.get("isCheckbox"))) {
									sb1.append(map1.get("parentName"))
											.append("：")
											.append(map1.get("name"))
											.append("<br/>");

								}
							}
							mapComent.put("multiSelDetails", sb.toString());
							mapComent.put("SingleSelDetails", sb1.toString());

							item.setPrice(pricei.toString());
							item.setOldPrice(oldpricei.toString());
							item.setAppendInfo(mapComent);
						}

					}
					shop.put("cartProductList", cartList);
				}
				request.setAttribute("cartList", shopList);
				request.setAttribute("statusMsg",
						JSONArray.fromObject(productManager.findShopStatus()));
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getLocalizedMessage());
			page = "common/404.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	public void findUserOrder() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		String gotopage = "pages/personal_order.jsp";
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null) {
				request.setAttribute("error", "请登录!");
				gotopage = "common/404.jsp";
			} else {

			}
		} catch (Exception e) {
			request.setAttribute("error", e.getLocalizedMessage());
			gotopage = "common/404.jsp";
		}
		request.getRequestDispatcher(gotopage).forward(request, response);
	}

	/**
	 * 用户订单列表
	 * 
	 * @throws Exception
	 */
	private String payStatus, type;

	public void findUserOrderList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		String gotopage = "pages/personal_order.jsp";
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null) {
				bean.setMsg("请登录!");
				bean.setStatus(400);
			} else {
				HashMap<String, Object> param = new HashMap<String, Object>();
				param.put("size", size);
				param.put("startIndex", (page - 1) * size);
				param.put("userId", user.getUserId());
				param.put("type", type);

				List<Order> orderList = productManager.findUserOrderList(param);
				for (Order order : orderList) {
					order.setShopName(productManager.findShopName(order
							.getShopId()));
					if (order.getPayStatus().equals("2")
							&& order.getStatus().equals("5")) {// 订单已付款且交易完成
						order.setProductCommentCount(productManager
								.findProductCommentCountByOrderid(order
										.getOrderId()));
					}
					List<OrderItem> itemList = productManager
							.findUserOrderItem(order.getOrderId());

					for (OrderItem item : itemList) {
						HashMap pro = productManager.findProductCartInfo(item
								.getProductId());

						pro.put("image", productManager.findProductImage(item
								.getProductId()));

						// pro.put("isComment", productManager
						// .findProductCommentCountByUserId(
						// item.getOrderItemId(),
						// item.getCompanyShopProductId(),
						// user.getUserId()));

						item.setProduct(pro);
						item.setSku(productManager.findProductSku(item
								.getCompanyShopProductSkuId()));
						// 附加属性信息
						List<OrderItemAppend> appendList = (List<OrderItemAppend>) productManager
								.findOrderAppendItem(item.getOrderItemId());

						if (appendList.size() > 0) {
							HashMap<String, Object> mapComent = new HashMap<String, Object>();
							StringBuffer sb = new StringBuffer("");
							StringBuffer sb1 = new StringBuffer("");
							int count = 0;

							for (OrderItemAppend map1 : appendList) {
								if (map1.getAppendInfo() == null) {
									continue;
								}
								if ("T".equals(map1.getAppendInfo().get(
										"isCheckbox"))) {
									Float fprice = Float.valueOf(map1
											.getPrice());
									Float fqty = Float.valueOf(map1.getQty());
									if (count % 2 == 0 && count != 0)
										sb.append("<br/>"
												+ map1.getAppendInfo().get(
														"name"));
									else if (count % 2 == 1)
										sb.append("/"
												+ map1.getAppendInfo().get(
														"name"));
									else
										sb.append(map1.getAppendInfo().get(
												"name"));
									sb.append("*").append(fqty).append(" ￥")
											.append(fprice * fqty);
									count++;

								} else if ("F".equals(map1.getAppendInfo().get(
										"isCheckbox"))) {
									sb1.append(map1.getParentName())
											.append("：")
											.append(map1.getAppendInfo().get(
													"name")).append("<br/>");
								}
							}
							mapComent.put("multiSelDetails", sb.toString());
							mapComent.put("SingleSelDetails", sb1.toString());
							item.setAppendInfo(mapComent);
						} else {
							HashMap<String, Object> mapComent = new HashMap<String, Object>();
							mapComent.put("multiSelDetails", "");
							mapComent.put("SingleSelDetails", "");
							item.setAppendInfo(mapComent);
						}
					}
					order.setOrderItemList(itemList);
				}
				bean.setRows(orderList);
				bean.setStatus(200);
				bean.setTotal(productManager.findUserOrderListCount(param));
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			bean.setStatus(400);
		}

		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class,
				new JsonDateValueProcessor("yyyy-MM-dd hh:mm:ss"));

		String json = JSONObject.fromObject(bean, jsonConfig).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 订单下商品列表
	 * 
	 * @throws Exception
	 */

	public void findOrderProductList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		String gotopage = "pages/convenient_product_comment.jsp";
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null || orderId == null) {
				gotopage = "common/error.jsp";
				if (user == null)
					request.setAttribute("error", "请登录!");
				if (orderId == null)
					request.setAttribute("error", "请选择订单!");
			} else {
				Order order = (Order) productManager.findOrderById(orderId);
				order.setShopName(productManager.findShopName(order.getShopId()));
				List<OrderItem> itemList = productManager
						.findUserOrderItem(Long.valueOf(orderId));
				for (OrderItem item : itemList) {
					// product_id=428, name=拿铁咖啡, product_number=282002
					HashMap pro = productManager.findProductCartInfo(item
							.getProductId());

					pro.put("image", productManager.findProductImage(item
							.getProductId()));

					item.setProduct(pro);
					item.setSku(productManager.findProductSku(item
							.getCompanyShopProductSkuId()));

				}
				request.setAttribute("order", order);
				request.setAttribute("orderProductList", itemList);
			}

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			bean.setStatus(400);
		}
		request.getRequestDispatcher(gotopage).forward(request, response);

	}

	/**
	 * 获取店铺的付款方式和是否支持外送
	 * 
	 * @throws Exception
	 */
	public void findShopPayTypeAndisDeliver() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();

		try {
			User user = (User) request.getSession().getAttribute("user");
			if (companyShopId == null) {
				if (companyShopId == null)
					bean.setMsg("请选择店铺!");
				bean.setStatus(400);
			} else {
				HashMap map = productManager
						.findShopPayTypeAndisDeliver(companyShopId);
				bean.setStatus(200);
				bean.setRows(map);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			bean.setStatus(400);
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 用户取消自己的订单,即删除
	 * 
	 * @throws Exception
	 */
	private String orderId;

	public void cancelUserOrder() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();

		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null) {
				bean.setMsg("请登录!");
				bean.setStatus(400);
			} else {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("userId", user.getUserId());
				map.put("orderId", Long.valueOf(orderId));
				int rt = productManager.cancelUserOrder(map);
				if (rt > 0)
					bean.setStatus(200);
				else {
					bean.setStatus(400);
				}
				bean.setMsg("取消订单失败!");

			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			bean.setStatus(400);
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	private String status;
	private String money;
	private String shopId;
	private String name;
	private String address;
	private String phone;
	private String payType;
	private String sendType;// 送货方式
	private String sendCost;
	private String serviceCost;
	private String total;
	private String info;
	private String cart;// 购物车列表

	/**
	 * 创建订单
	 * 
	 * @throws Exception
	 */
	private Long userId;
	private Long areaId;

	public void createOrder() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();

		try {
			User user = (User) request.getSession().getAttribute("user");
			if (userId != null) {
				user = userManager.findUserById(userId);
			}
			if (user == null || address == null || shopId == null
					|| cart == null) {
				bean.setStatus(400);
				if (address == null) {
					bean.setMsg("您选择配送地址!");
				}
				if (shopId == null) {
					bean.setMsg("您选择商品!");
				}
				if (user == null) {
					bean.setMsg("请登录!");
				}
				if (cart == null) {
					bean.setMsg("您选择商品!");
				}
			} else {
				boolean flag = true;
				if (sendType != null && sendType.equals("1")) {// 配送方式
					Long areaCount = userManager.findUserAreaShopArea(shopId,
							user.getUserId(), areaId);
					if (areaCount.longValue() == 0) {
						bean.setStatus(400);
						bean.setMsg("您的配送地址不在该商铺的配送范围之内!");
						flag = false;
					} else {
						flag = true;
					}

				}
				JSONArray cartArray = JSONArray.fromObject(cart);
				if (Long.valueOf(shopId) == 192) {
					for (int i = 0; i < cartArray.size(); i++) {
						JSONObject obj1 = cartArray.getJSONObject(i);
						if (obj1.getString("productId").equals(
								Commonparam.getKeyValue("productId").trim())) {
							if (Integer.valueOf(obj1.getString("qty")) > 1) {
								bean.setStatus(400);
								bean.setMsg("活动期间，"
										+ obj1.getString("name").trim()
										+ "商品每人限购一次，每次限购一个。");
								flag = false;
								break;
							} else {
								Integer obj = (Integer) productManager
										.checkProduct(
												Commonparam.getKeyValue(
														"productId").trim(),
												user);
								if (obj == 2) {
									bean.setStatus(400);
									bean.setMsg("活动期间，"
											+ obj1.getString("name").trim()
											+ "商品每人限购一次，每次限购一个。你已将其加入订单中，请您完成订单或取消！");
									flag = false;
									break;
								}
							}
						}
					}
				}

				if (flag) {
					Order order = new Order();
					if (address != null) {
						address = address.replaceAll("&nbsp;", "");
					}
					order.setMoney(money);
					order.setName(name);
					order.setOrderTime(new Date());
					order.setPayType(payType);
					order.setPhone(phone);
					order.setSendCost(sendCost);
					if (sendTime != null && sendTime.trim().length() > 0)
						order.setSendDate(Commonparam
								.StringtoMiddleDate(sendTime));
					if (sendType != null && sendType.equals("1")) {// 配送方式
						order.setAddress(address);
					} else {
						order.setAddress("");
					}
					order.setSendType(sendType);
					order.setServiceCost("0");
					order.setShopId(Long.valueOf(shopId));
					order.setStatus(String
							.valueOf(StaticConstant.ORDER_STATUS[0]));
					order.setTotal((Double.valueOf(money) + Double
							.valueOf(sendCost)) + "");
					order.setUserId(user.getUserId());
					order.setPayStatus(StaticConstant.ORDER_PAY_STATUS[0] + "");
					order.setInfo(info);
					order.setOrderDay(Commonparam.Date2ShortStr(new Date()));
					System.out.println(JSONObject.fromObject(order));
					Long orderId = productManager.createUserOrdedr(user, order,
							cartArray);
					if (orderId > 0) {
						bean.setStatus(200);
						bean.setMsg("订单生成成功!");
					}
				}
			}

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			bean.setStatus(400);
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 订单物流信息
	 * 
	 * @throws Exception
	 */
	public void findOrderFlow() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		String gotopage = "pages/personal_order_flow.jsp";
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null || orderId == null) {
				if (user == null)
					request.setAttribute("error", "请登录!");
				if (orderId == null)
					request.setAttribute("error", "请选择订单!");
				gotopage = "common/404.jsp";
			} else {
				List<OrderFlow> list = productManager.findOrderFlow(orderId);
				request.setAttribute("order",
						productManager.findOrderById(orderId));
				request.setAttribute("flowList", list);
			}
		} catch (Exception e) {
			request.setAttribute("error", e.getLocalizedMessage());
			gotopage = "common/404.jsp";
		}
		request.getRequestDispatcher(gotopage).forward(request, response);
	}

	public void findOrderComment() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		String gotopage = "pages/personal_order_comment.jsp";
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null || orderId == null) {
				if (user == null)
					request.setAttribute("error", "请登录!");
				if (orderId == null)
					request.setAttribute("error", "请选择订单!");
				gotopage = "common/404.jsp";
			} else {
				List<OrderComment> list = productManager
						.findOrderComment(orderId);
				request.setAttribute("order",
						productManager.findOrderById(orderId));
				request.setAttribute("commentList", list);
			}
		} catch (Exception e) {
			request.setAttribute("error", e.getLocalizedMessage());
			gotopage = "common/404.jsp";
		}
		request.getRequestDispatcher(gotopage).forward(request, response);
	}

	/**
	 * 评价订单
	 * 
	 * @throws Exception
	 */
	private String content;

	public void saveOrderComment() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();

		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null || orderId == null) {
				if (user == null)
					bean.setMsg("请登录!");
				if (orderId == null)
					bean.setMsg("请选择订单!");
				bean.setStatus(400);
			} else {
				OrderComment orderComment = new OrderComment();
				orderComment.setContent(content);
				orderComment.setCreateDate(new Date());
				orderComment.setUserId(user.getUserId());
				orderComment.setOrderId(Long.valueOf(orderId));
				if (user.getRealname() != null
						&& user.getRealname().trim().length() > 0)
					orderComment.setName(user.getRealname());
				else if (user.getEmail() != null
						&& user.getRealname().trim().length() > 0)
					orderComment.setName(user.getEmail());
				else if (user.getPhone() != null
						&& user.getPhone().trim().length() > 0)
					orderComment.setName(user.getPhone());

				productManager.saveOrderComment(orderComment);
				bean.setStatus(200);

			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			bean.setStatus(400);
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 取消订单
	 * 
	 * @throws Exception
	 */
	public void cancelCarProduct() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();

		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null) {
				if (user == null)
					bean.setMsg("请登录!");
				bean.setStatus(400);
			} else {

				productManager.cancelCarProduct(user.getUserId(), cart);
				bean.setStatus(200);

			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			bean.setStatus(400);
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 星巴克——附近店铺查询
	 * 
	 * @throws Exception
	 */
	public void findnearbyShop() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> param = new HashMap<String, Object>();

			param.put("size", size);
			param.put("startIndex", (page - 1) * size);
			param.put("companyId", companyId);
			List<HashMap> nearbyshop = productManager.findnearbyShop(param);
			for (HashMap map : nearbyshop) {
				List<HashMap> areaes = productManager.findnearbyShopArea(map
						.get("company_shop_id"));
				StringBuffer sb = new StringBuffer(" ");
				for (HashMap area : areaes) {
					sb.append(area.get("area_name")).append("/");
				}
				map.put("area", sb.substring(0, sb.length() - 1).toString()
						.trim());
			}
			bean.setRows(nearbyshop);
			bean.setStatus(200);
			bean.setTotal(productManager.findnearbyShopCount(param));

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(bean).toString();
		System.out.println(json);
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 获取商品评论
	 * 
	 * @throws Exception
	 */
	public void loadProductComment() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("size", size);
			param.put("startIndex", (page - 1) * size);
			param.put("companyShopProductId",
					Long.valueOf(companyShopProductId));

			List<HashMap> commentList = productManager
					.loadProductComment(param);
			for (HashMap map : commentList) {
				map.put("userImage",
						userManager.findUserImage(map.get("userId")));
				map.put("userName", userManager.findUserName(map.get("userId")));
			}
			bean.setRows(commentList);
			bean.setStatus(200);
			bean.setTotal(productManager.findProductCommentCount(Long
					.valueOf(companyShopProductId)));

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 跳转到地图界面
	 * 
	 * @throws Exception
	 */
	public void turntomap() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		String page = "pages/convenient_map.jsp";
		try {

			request.setAttribute("keyword", keyword);
		} catch (Exception e) {
			request.setAttribute("error", e.getLocalizedMessage());
			page = "common/404.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * 加载地图店铺信息
	 * 
	 * @throws Exception
	 */
	private Double latmin, latmax, lngmin, lngmax;

	public void loadResturauntMap() throws Exception {
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
			if (keyword != null && keyword.trim().length() > 0)
				param.put("keyword", keyword);
			if (categoryId != null && categoryId.trim().length() > 0)
				param.put("categoryId", categoryId);
			if (areaThirdId != null && areaThirdId.trim().length() > 0)
				param.put("areaThirdId", areaThirdId);
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

			List<HashMap> tuiguangList = productManager
					.findRestarauntMapList(param);
			for (HashMap restaurant : tuiguangList) {
				HashMap<String, Object> param1 = new HashMap<String, Object>();
				param1.put("userId", 0);
				param1.put("companyShopId", restaurant.get("companyShopId"));
				restaurant.put("tagList",
						productManager.findShopTagsByShopId(param1));
				if (user != null)
					restaurant.put("isCollection", productManager
							.findUserCollectObject(user.getUserId(),
									restaurant.get("companyShopId"),
									StaticConstant.OBJECT_TYPE[0]));
				else
					restaurant.put("isCollection", -1);
				restaurant.put("sellCount", 444);
				restaurant.put("yuding", StaticConstant.IS_WORK[0]);
				if (restaurant.get("deliverOk") != null
						&& (restaurant.get("deliverOk").equals("T") || restaurant
								.get("deliverOk").equals("TF"))) {
					restaurant.put("areaList", Collections.EMPTY_LIST);
				} else {
					restaurant.put("areaList", productManager
							.findShopAreaList(restaurant.get("companyShopId")));
				}

			}
			bean.setStatus(200);
			bean.setRows(tuiguangList);
			bean.setTotal(productManager.findRestarauntMapListCount(param));

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 地图查询的区域和一级分类
	 * 
	 * @throws Exception
	 */
	public void findAreaAndCategoryList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {

			// 所在区域
			List<HashMap> mapList = (List<HashMap>) productManager
					.findSendAreaList();
			// 所属分类
			List<HashMap> categoryList = (List<HashMap>) productManager
					.findCategoryFirstList();
			HashMap map = new HashMap();
			map.put("area", mapList);
			map.put("category", categoryList);

			bean.setRows(map);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 星巴克店铺详情
	 * 
	 * @throws Exception
	 */
	public void findnearbyShop1() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("companyShopId", companyShopId);
			param.put("companyId", companyId);

			HashMap<String, Object> map = productManager.findnearbyShop1(param);

			String str = (String) map.get("pay_type");
			if (str != null && str.trim().length() > 0) {
				String[] ss = str.split(",");

				StringBuffer sb1 = new StringBuffer();
				for (String s : ss) {
					sb1.append(
							StaticConstant.PAY_TYPE_VALUE[Integer.valueOf(s
									.trim()) - 1]).append("/");
				}
				String sbb = sb1.substring(0, sb1.length() - 1).toString();
				map.put("pay_type", sbb);

			} else {
				map.put("pay_type", "未知");
			}

			int time = (Integer) map.get("send_time");
			if (time > 1) {
				map.put("send_time", StaticConstant.SEND_TIME_VALUE[time - 1]);
			} else {
				map.put("send_time", "未知");
			}

			bean.setRows(map);
			bean.setStatus(200);
			commonManager.updateObjectBrowseCount("tb_company_shop",
					"company_shop_id", Long.valueOf(companyShopId),
					"browse_count");
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void sbuxShopInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		User user = (User) request.getSession().getAttribute("user");
		String returnpagejsp = "pages/selectstores.jsp";

		try {
			if (user == null || companyShopId==null) {
				if(user==null)
					request.setAttribute("error", "请登录！");
				if(companyShopId==null)
					request.setAttribute("error", "请选择店铺!");
				returnpagejsp = "common/404.jsp";
			} else {
				HashMap<String, Object> param = new HashMap<String, Object>();
				param.put("companyShopId", companyShopId);
				param.put("companyId", companyId);
				HashMap<String, Object> map = productManager
						.findnearbyShop1(param);
				List<HashMap> areaes = productManager.findnearbyShopArea(map
						.get("company_shop_id"));
				StringBuffer sb = new StringBuffer(" ");
				for (HashMap area : areaes) {
					sb.append(area.get("area_name")).append("/");
				}
				map.put("area", sb.substring(0, sb.length() - 1).toString()
						.trim());
				String str = (String) map.get("pay_type");
				if (str != null && str.trim().length() > 0) {
					String[] ss = str.split(",");
					StringBuffer sb1 = new StringBuffer();
					for (String s : ss) {
						sb1.append(
								StaticConstant.PAY_TYPE_VALUE[Integer.valueOf(s
										.trim()) - 1]).append("/");
					}
					String sbb = sb1.substring(0, sb1.length() - 1).toString();
					map.put("pay_type", sbb);
				} else {
					map.put("pay_type", "未知");
				}
				int time = (Integer) map.get("send_time");
				if (time > 1) {
					map.put("send_time",
							StaticConstant.SEND_TIME_VALUE[time - 1]);
				} else {
					map.put("send_time", "未知");
				}
				request.setAttribute("shopInfo", map);

				System.out.println(JSONObject.fromObject(map));
				commonManager.updateObjectBrowseCount("tb_company_shop",
						"company_shop_id", Long.valueOf(companyShopId),
						"browse_count");
			}
		} catch (Exception e) {
			request.setAttribute("error", e.getLocalizedMessage());
			returnpagejsp = "common/404.jsp";
		}
		request.getRequestDispatcher(returnpagejsp).forward(request, response);
	}

	String productType;

	/**
	 * 星巴克商品查询
	 * 
	 * @throws Exception
	 */

	public void findSBUXShopProduct2() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap param = new HashMap();
			param.put("companyId", companyId);
			param.put("companyShopId", companyShopId);

			List<HashMap> category = productManager
					.findSBUXProductCategory(param);
			param.put("productShopCategory", category);

			HashMap mm = productManager.findnearbyShop1(param);
			param.put("shopName", mm.get("name"));
			param.put("sendCost", mm.get("deliver_money"));
			param.put("deliverOk", mm.get("deliver_ok"));
			param.put("statusMsg",
					JSONArray.fromObject(productManager.findShopStatus()));

			bean.setRows(param);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void findSBUXShopProduct1() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {

			HashMap param = new HashMap();
			param.put("companyId", companyId);
			param.put("companyShopId", companyShopId);
			param.put("productShopCategoryId", productType);

			List<HashMap> productList = productManager
					.findSBUXProductInfo(param);
			for (HashMap map1 : productList) {
				param.put("shopProductId", map1.get("company_shop_product_id"));
				param.put("productAttributeId",
						map1.get("product_attribute_id"));
				List<HashMap> attrvallist = (List<HashMap>) productManager
						.findAttrValSku(param);
				map1.put("shopProduct", attrvallist);
				map1.put("productImg",
						productManager.findProductImage(map1.get("product_id")));
			}
			param.put("productAttrInfo", productList);
			param.remove("shopProductId");
			param.remove("productAttributeId");
			bean.setRows(param);
			bean.setStatus(200);
		} catch (Exception e) {
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 星巴克产品定制
	 * 
	 * @throws Exception
	 */
	public void selfSetProduct() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();

		try {
			HashMap param = new HashMap();
			param.put("companyId", companyId);
			param.put("productId", productId);
			param.put("shopId", companyShopId);
			param.put("shopProductId", companyShopProductId);

			HashMap attrmap = (HashMap) productManager
					.findSelfMadeProduct(param);

			HashMap m = new HashMap();
			m.put("companyId", companyId);
			m.put("companyShopId", companyShopId);
			HashMap mm = productManager.findnearbyShop1(m);
			param.put("shopName", mm.get("name"));
			param.put("sendCost", mm.get("deliver_money"));
			param.put("deliverOk", mm.get("deliver_ok"));
			param.put("statusMsg",
					JSONArray.fromObject(productManager.findShopStatus()));

			param.put("productImg",
					productManager.findProductImage(Long.valueOf(productId)));

			param.put("productAttributeId", Integer.valueOf(attrmap.get(
					"product_attribute_id").toString()));
			List<HashMap> attrvallist = (List<HashMap>) productManager
					.findAttrValSku(param);
			attrmap.put("attrVal", attrvallist);
			param.put("proAttribute", attrmap);

			List<HashMap> parentApppend = (List<HashMap>) productManager
					.findParentAppendName(param);

			List<HashMap> radionNme = new ArrayList<HashMap>();
			List<HashMap> checkbocName = new ArrayList<HashMap>();
			for (HashMap map : parentApppend) {
				String s = (String) map.get("is_ckeckbox");
				param.put("parentId", map.get("append_id"));
				List<HashMap> childenApppend = (List<HashMap>) productManager
						.findChildenAppendName(param);
				if (childenApppend.size() > 0) {
					map.put("appendName", childenApppend);
					if ("T".equals(s.trim())) {
						checkbocName.add(map);
					} else if ("F".equals(s.trim())) {
						radionNme.add(map);
					}
				}
			}
			param.put("radioName", radionNme);
			param.put("checkboxName", checkbocName);
			bean.setRows(param);
			bean.setStatus(200);

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	String appendInfo;

	/**
	 * 星巴克购物车添加
	 * 
	 * @throws Exception
	 */
	public void addUserProductCart() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();

		try {
			User user = (User) request.getSession().getAttribute("user");
			if (price == null || companyShopId == null || user == null
					|| skuId == null || productId == null
					|| companyShopProductSkuId == null
					|| companyShopProductId == null) {
				if (user == null)
					bean.setMsg("请登录!");
				if (companyShopId == null)
					bean.setMsg("请选择店铺!");
				if (productId == null)
					bean.setMsg("请选择商品!");
				if (price == null)
					bean.setMsg("请选择价格!");
				bean.setRows(400);
			} else {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("productSkuId", skuId);
				map.put("companyShopId", companyShopId);
				map.put("userId", user.getUserId());
				map.put("productId", productId);
				map.put("price", Double.valueOf(price));
				map.put("oldPrice", Double.valueOf(oldPrice));
				map.put("createTime", new Date());
				map.put("companyShopProductId", companyShopProductId);
				map.put("companyShopProductSkuId", companyShopProductSkuId);

				if (qty != null && qty.trim().length() > 0) {
					map.put("qty",
							Integer.valueOf(qty) > 0 ? Integer.valueOf(qty) : 1);
				} else {
					map.put("qty", 1);
				}
				if (appendInfo != null && appendInfo.trim().length() > 0) {
					List<HashMap<String, Object>> appendList = (List<HashMap<String, Object>>) JSONArray
							.toCollection(JSONArray.fromObject(appendInfo),
									java.util.HashMap.class);
					Long cardItemId = (Long) productManager.addUserCartMenu(
							map, appendList);
					bean.setStatus(200);
				} else {
					Long t = (Long) productManager.addUserCartMenuI(map);
					if (t > 0) {
						bean.setStatus(200);
					}
				}
			}

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 星巴克推荐商品
	 * 
	 * @throws Exception
	 */
	public void findProductInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("size", size);
			param.put("startIndex", (page - 1) * size);
			param.put("companyId", companyId);
			param.put("companyShopId", companyShopId);
			List<HashMap> list = (List<HashMap>) productManager
					.findRecommendProduct(param);
			bean.setRows(list);
			bean.setStatus(200);
			HashMap map = (HashMap) productManager
					.findCompanyShopInfo(companyShopId);
			bean.setAppend(map.get("result").toString());
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 星巴克立即购买信息
	 * 
	 * @throws Exception
	 */
	public void addUserAndProduct() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		User user = (User) request.getSession().getAttribute("user");
		try {

			if (user == null || address == null || companyShopId == null) {
				bean.setStatus(400);
			} else {
				boolean flag = true;
				if (sendType != null && sendType.equals("1")) {// 配送方式
					Long areaCount = userManager.findUserAreaShopArea(shopId,
							user.getUserId(), areaId);
					if (areaCount.longValue() == 0) {
						bean.setStatus(400);
						bean.setMsg("您的配送地址不在该商铺的配送范围之内!");
						flag = false;
					} else {
						flag = true;
					}
				}

				if (flag) {

					if (productId.equals(Commonparam.getKeyValue("productId")
							.trim())) {
						if (Integer.valueOf(qty) > 1) {
							bean.setStatus(400);
							bean.setMsg("活动期间，该商品每人限购一次，每次限购一个。");
							flag = false;
						} else {
							Integer obj = (Integer) productManager
									.checkProduct(productId, user);
							if (obj == 2) {
								bean.setStatus(400);
								bean.setMsg("活动期间，该商品每人限购一次，每次限购一个。你已将其加入订单中，请您完成订单或取消！");
								flag = false;
							}
						}
					}

					Order order = new Order();

					order.setPhone(phone);
					order.setAddress(address);
					order.setName(name);
					order.setOrderTime(new Date());
					order.setPayType(payType);
					order.setMoney(money);
					order.setSendCost(sendCost);

					if (sendTime != null && sendTime.trim().length() > 0)
						order.setSendDate(Commonparam.StringtoDate(sendTime));
					order.setSendType(sendType);
					order.setServiceCost("0");
					order.setShopId(Long.valueOf(companyShopId));

					order.setStatus(String
							.valueOf(StaticConstant.ORDER_STATUS[0]));
					order.setTotal((Double.valueOf(money) + Double
							.valueOf(sendCost)) + "");
					order.setUserId(user.getUserId());
					order.setPayStatus(StaticConstant.ORDER_PAY_STATUS[0] + "");
					order.setInfo(info);
					order.setOrderDay(Commonparam.Date2ShortStr(new Date()));

					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("productSkuId", skuId);
					map.put("companyShopId", companyShopId);
					map.put("userId", user.getUserId());
					map.put("productId", productId);
					map.put("price", Double.valueOf(price));
					map.put("createTime", new Date());
					map.put("companyShopProductId", companyShopProductId);
					map.put("companyShopProductSkuId", companyShopProductSkuId);
					if (qty != null && qty.trim().length() > 0) {
						map.put("qty",
								Integer.valueOf(qty) > 0 ? Integer.valueOf(qty)
										: 1);
					} else {
						map.put("qty", 1);
					}
					List<HashMap<String, Object>> appendList = null;
					if (appendInfo != null && appendInfo.trim().length() > 0) {
						appendList = (List<HashMap<String, Object>>) JSONArray
								.toCollection(JSONArray.fromObject(appendInfo),
										java.util.HashMap.class);
					}
					Long orderId = (Long) productManager.creatOnceOrder(user,
							order, map, appendList);
					if (orderId > 0) {

						bean.setStatus(200);
						bean.setRows(orderId);
					} else {
						bean.setStatus(400);
						bean.setRows("下单失败!");
					}

				}
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	private long companyShopPageIndex;
	private long companyShopPageSize;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	private long companyId;

	public void findCooperatorShopByCompanyId() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);

		BaseBean baseBean = new BaseBean();
		try {
			Long beginIndex;
			Long endIndex;
			beginIndex = (companyShopPageIndex - 1) * companyShopPageSize + 1;
			endIndex = companyShopPageIndex * companyShopPageSize;
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("companyId", companyId);
			param.put("beginIndex", beginIndex);
			param.put("endIndex", endIndex);
			List<HashMap> shopList = productManager
					.findCooperatorShopByCompanyId(param);

			for (HashMap shop : shopList) {
				List<HashMap> areaList = productManager
						.findCompanyShopAreaByShopId((Long) shop
								.get("companyShopId"));
				shop.put("areaList", areaList);
			}

			baseBean.setStatus(200);
			baseBean.setRows(shopList);

		} catch (Exception e) {
			baseBean.setStatus(400);
			baseBean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(baseBean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 二级分类商品搜索
	 * 
	 * @throws Exception
	 */
	private String color;

	public void findProductCategorySecondList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String page = "pages/convenient_categories_more.jsp";
		try {
			List<HashMap> categoryList = productManager
					.findProductCategorySecondList(categoryId);

			Object categoryInfo = productManager
					.findCategoryImagePath(categoryId);
			request.setAttribute("categorySecond", categoryList);
			request.setAttribute("categoryInfo", categoryInfo);
			request.setAttribute("categoryId", categoryId);
			request.setAttribute("color", color);

		} catch (Exception e) {
			page = "common/404.jsp";
			request.setAttribute("error", e.getLocalizedMessage());
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * 产品2级分类搜索
	 * 
	 * @throws Exception
	 */
	private String parentId;

	public void findProductByCategoryId() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);

		BaseBean baseBean = new BaseBean();
		try {
			HashMap map = new HashMap();
			if (categoryId != null && categoryId.trim().length() > 0)
				map.put("categoryId", Long.valueOf(categoryId));
			if (parentId != null && parentId.trim().length() > 0)
				map.put("parentId", Long.valueOf(parentId));
			map.put("size", size);
			map.put("startIndex", (page - 1) * size);
			List<HashMap> productList = productManager
					.findProductListByCategoryId(map);
			for (HashMap product : productList) {
				product.put("productInfo", productManager
						.findProductInfoById(Long.valueOf(product.get(
								"productId").toString())));
				product.put("sku", productManager
						.findSkuByShopProductId(product
								.get("companyShopProductId")));
				product.put("image", productManager.findProductImage(product
						.get("productId")));

			}
			baseBean.setStatus(200);
			baseBean.setRows(productList);
			baseBean.setTotal(productManager
					.findProductListByCategoryIdCount(map));

		} catch (Exception e) {
			baseBean.setStatus(400);
			baseBean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(baseBean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 一级分类商品
	 * 
	 * @throws Exception
	 */
	public void findProductByFirstCategory() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		User user = (User) request.getSession().getAttribute("user");
		BaseBean baseBean = new BaseBean();
		try {
			HashMap map = new HashMap();
			map.put("size", size);
			map.put("startIndex", (page - 1) * size);
			List<HashMap> productList = productManager
					.findProductCategoryFirstList(map);
			for (HashMap product : productList) {
				HashMap param = new HashMap();
				param.put("size", 3);
				param.put("startIndex", 0);
				param.put("parentId", product.get("productCategoryId"));

				List<HashMap> productListList = productManager
						.findProductListByCategoryId(param);
				for (HashMap product0 : productListList) {
					product0.put("productInfo", productManager
							.findProductInfoById(Long.valueOf(product0.get(
									"productId").toString())));
					product0.put("sku", productManager
							.findSkuByShopProductId(product0
									.get("companyShopProductId")));
					product0.put("image", productManager
							.findProductImage(product0.get("productId")));

				}
				product.put("proList", productListList);

			}
			baseBean.setStatus(200);
			baseBean.setRows(productList);

		} catch (Exception e) {
			baseBean.setStatus(400);
			baseBean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(baseBean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 订单商品评论
	 */
	private String orderItemId;

	public void findOrderProductComment() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		User user = (User) request.getSession().getAttribute("user");
		String page = "pages/personal_order_product_comment.jsp";
		try {
			if (user == null) {
				page = "common/404.jsp";
				request.setAttribute("error", "请登陆!");
			} else {
				request.setAttribute("productId", productId);
				request.setAttribute("companyShopProductId",
						companyShopProductId);
				request.setAttribute("orderItemId", orderItemId);
				request.setAttribute("name", name);

			}

		} catch (Exception e) {
			page = "common/404.jsp";
			request.setAttribute("error", e.getLocalizedMessage());
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * 商品评论
	 * 
	 * @throws Exception
	 */
	private String star;

	public void saveOrderProductComment() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		User user = (User) request.getSession().getAttribute("user");
		BaseBean baseBean = new BaseBean();
		try {
			HashMap map = new HashMap();
			map.put("userId", user.getUserId());
			map.put("productId", productId);
			map.put("companyShopProductId", companyShopProductId);
			map.put("orderItemId", orderItemId);
			map.put("content", content);
			map.put("commentTime", new Date());
			if (star != null && star.trim().length() > 0) {
				Integer star1 = Integer.valueOf(star.trim());
				if (star1 > 5)
					star1 = 5;
				map.put("star", star1);
			} else {
				map.put("star", 1);
			}

			Long rt = productManager.saveOrderProductComment(map);
			if (rt > 0)
				baseBean.setStatus(200);
			else {
				baseBean.setStatus(200);
				baseBean.setMsg("评论失败!");
			}

		} catch (Exception e) {
			baseBean.setStatus(400);
			baseBean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(baseBean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 首页商品推广
	 * 
	 * @throws Exception
	 */
	public void findFirstPromote() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		try {
			HashMap map = new HashMap();
			List<HashMap> productList = productManager
					.findFirstPromoteProduct(map);
			for (HashMap product : productList) {
				product.put("productInfo", productManager
						.findProductInfoById(Long.valueOf(product.get(
								"product_id").toString())));
				product.put("sku", productManager
						.findSkuByShopProductId(product
								.get("company_shop_product_id")));
				product.put("image", productManager.findProductImage(product
						.get("product_id")));
			}
			bean.setRows(productList);
			bean.setStatus(200);

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 立即购买
	 * 
	 * @throws Exception
	 */
	private String productName;

	public void buyProductNow() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		User user = (User) request.getSession().getAttribute("user");
		String page = "pages/personal_cart_now.jsp";
		try {
			if (user == null) {
				page = "common/404.jsp";
				request.setAttribute("error", "请登陆!");
			} else {

				HashMap shopInfo = productManager
						.findShopNameAndDeliver(companyShopId);
				Double total = (Integer.valueOf(qty) * Double.valueOf(price));
				Double totaltotal = Integer.valueOf(shopInfo
						.get("deliverMoney").toString()) + total;

				request.setAttribute("shopInfo", shopInfo);
				request.setAttribute("productName", productName);

				HashMap skuInfo = productManager.findProductSkuInfo(skuId);
				request.setAttribute("skuInfo", skuInfo);
				request.setAttribute("companyShopProductSkuId",
						companyShopProductSkuId);
				request.setAttribute("qty", qty);
				request.setAttribute("skuId", skuId);
				request.setAttribute("price", price);
				request.setAttribute("total", total);
				request.setAttribute("totaltotal", totaltotal);

				request.setAttribute("oldPrice", oldPrice);
				request.setAttribute("productId", productId);
				request.setAttribute("companyShopId", companyShopId);
				request.setAttribute("companyShopProductId",
						companyShopProductId);

			}

		} catch (Exception e) {
			page = "common/404.jsp";
			request.setAttribute("error", e.getLocalizedMessage());
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * 德普商品店铺分类
	 * 
	 * @throws Exception
	 */
	public void findDepuShopCategory() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap param = new HashMap();
			param.put("companyShopId", companyShopId);
			List list = (List) productManager.findDepuShopCategory(param);
			bean.setRows(list);
			bean.setStatus(200);

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	Integer levelRank;

	/**
	 * 德普商品信息
	 * 
	 * @throws Exception
	 */
	public void findDepuShopProductList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap param = new HashMap();
			param.put("companyShopId", companyShopId);
			param.put("categoryId", categoryId);

			List list = (List) productManager.queryTheDepuProduct(param,
					levelRank);

			bean.setRows(list);
			bean.setStatus(200);

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 线上支付
	 * 
	 * @throws Exception
	 */
	public void operatorMoney() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null) {
				bean.setMsg("请登录!");
				bean.setStatus(400);
			} else {
				Order order = (Order) productManager.findOrderById(orderId);
				Long shopId = order.getShopId();
				if (shopId == 198) {
					/*
					 * List<OrderItem> itemList = productManager
					 * .findUserOrderItem(order.getOrderId());
					 * 
					 * for (OrderItem item : itemList) { HashMap pro =
					 * productManager.findProductCartInfo(item .getProductId());
					 * 
					 * item.setProduct(pro);
					 * item.setSku(productManager.findProductSku(item
					 * .getCompanyShopProductSkuId())); }
					 * order.setOrderItemList(itemList);
					 */
					bean.setTotal(1);
				} else {
					bean.setTotal(2);
				}
				bean.setRows(order);
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			bean.setStatus(400);
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	String orderNo;

	public void operatorMoneyCheck() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			Order order = (Order) productManager.findOrderById(orderId);
			/*
			 * List<OrderItem> itemList = productManager.findUserOrderItem(order
			 * .getOrderId());
			 * 
			 * for (OrderItem item : itemList) { HashMap pro =
			 * productManager.findProductCartInfo(item .getProductId());
			 * 
			 * item.setProduct(pro);
			 * item.setSku(productManager.findProductSku(item
			 * .getCompanyShopProductSkuId())); }
			 * order.setOrderItemList(itemList);
			 */
			bean.setRows(order);
			bean.setStatus(200);

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			bean.setStatus(400);
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void findOrderNum() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();

		if (Commonparam.getOrderMaxNum() == 0) {
			Commonparam.setOrderMaxNum(productManager
					.findOrderFlowNo(Commonparam.Date2ShortStr(new Date())));
		}
		Commonparam.setOrderMaxNum(Commonparam.getOrderMaxNum() + 1);
		response.getOutputStream().write(
				(Commonparam.getOrderMaxNum() + "").getBytes("UTF-8"));
	}

	public void checkProduct() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		User user = (User) request.getSession().getAttribute("user");
		try {
			if (user != null) {
				Object obj = productManager.checkProduct(productId, user);
				bean.setRows(obj);
				bean.setStatus(200);
			} else {
				bean.setMsg("用户未登录！");
				bean.setStatus(400);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			bean.setStatus(400);
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public long getCompanyShopPageIndex() {
		return companyShopPageIndex;
	}

	public void setCompanyShopPageIndex(long companyShopPageIndex) {
		this.companyShopPageIndex = companyShopPageIndex;
	}

	public long getCompanyShopPageSize() {
		return companyShopPageSize;
	}

	public void setCompanyShopPageSize(long companyShopPageSize) {
		this.companyShopPageSize = companyShopPageSize;
	}

	public long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(long companyId) {
		this.companyId = companyId;
	}

	public String getAppendInfo() {
		return appendInfo;
	}

	public void setAppendInfo(String appendInfo) {
		this.appendInfo = appendInfo;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getKeyword() {
		return keyword;
	}

	public Integer getPage() {
		return page;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getSize() {
		return size;
	}

	public String getType() {
		return type;
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

	public void setSize(Integer size) {
		this.size = size;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getFunctionType() {
		return functionType;
	}

	public ProductManager getProductManager() {
		return productManager;
	}

	public void setProductManager(ProductManager productManager) {
		this.productManager = productManager;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	public String getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(String orderItemId) {
		this.orderItemId = orderItemId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	public String getSendPrice() {
		return sendPrice;
	}

	public void setSendPrice(String sendPrice) {
		this.sendPrice = sendPrice;
	}

	public Double getLatmin() {
		return latmin;
	}

	public void setLatmin(Double latmin) {
		this.latmin = latmin;
	}

	public Double getLatmax() {
		return latmax;
	}

	public void setLatmax(Double latmax) {
		this.latmax = latmax;
	}

	public Double getLngmin() {
		return lngmin;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public void setLngmin(Double lngmin) {
		this.lngmin = lngmin;
	}

	public Double getLngmax() {
		return lngmax;
	}

	public void setLngmax(Double lngmax) {
		this.lngmax = lngmax;
	}

	public String getCardPay() {
		return cardPay;
	}

	public void setCardPay(String cardPay) {
		this.cardPay = cardPay;
	}

	public String getAreaThirdId() {
		return areaThirdId;
	}

	public void setAreaThirdId(String areaThirdId) {
		this.areaThirdId = areaThirdId;
	}

	public String getConsumptionPer() {
		return consumptionPer;
	}

	public void setConsumptionPer(String consumptionPer) {
		this.consumptionPer = consumptionPer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCompanyShopId() {
		return companyShopId;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getOldPrice() {
		return oldPrice;
	}

	public void setOldPrice(String oldPrice) {
		this.oldPrice = oldPrice;
	}

	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPayType() {
		return payType;
	}

	public String getCompanyShopProductSkuId() {
		return companyShopProductSkuId;
	}

	public void setCompanyShopProductSkuId(String companyShopProductSkuId) {
		this.companyShopProductSkuId = companyShopProductSkuId;
	}

	public String getCompanyShopProductId() {
		return companyShopProductId;
	}

	public void setCompanyShopProductId(String companyShopProductId) {
		this.companyShopProductId = companyShopProductId;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getSendType() {
		return sendType;
	}

	public void setSendType(String sendType) {
		this.sendType = sendType;
	}

	public String getSendCost() {
		return sendCost;
	}

	public void setSendCost(String sendCost) {
		this.sendCost = sendCost;
	}

	public String getServiceCost() {
		return serviceCost;
	}

	public void setServiceCost(String serviceCost) {
		this.serviceCost = serviceCost;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public void setCompanyShopId(String companyShopId) {
		this.companyShopId = companyShopId;
	}

	public void setFunctionType(String functionType) {
		this.functionType = functionType;
	}

	public String getCart() {
		return cart;
	}

	public void setCart(String cart) {
		this.cart = cart;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public Integer getLevelRank() {
		return levelRank;
	}

	public void setLevelRank(Integer levelRank) {
		this.levelRank = levelRank;
	}

	public String getDeliverOk() {
		return deliverOk;
	}

	public void setDeliverOk(String deliverOk) {
		this.deliverOk = deliverOk;
	}

	public Long getAreaId() {
		return areaId;
	}

	public void setAreaId(Long areaId) {
		this.areaId = areaId;
	}

}
