package com.chj.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;
import org.springframework.beans.factory.annotation.Autowired;

import cn.eavic.framework.web.BaseAction;

import com.chj.common.Commonparam;
import com.chj.common.HttpConnectUtil;
import com.chj.common.HttpGetMsg;
import com.chj.entity.Oauth;
import com.chj.entity.Order;
import com.chj.entity.OrderItem;
import com.chj.entity.ProductSku;
import com.chj.entity.User;
import com.chj.service.CommonManager;
import com.chj.service.CommunityManager;
import com.chj.service.ProductManager;
import com.chj.service.UserManager;
import com.chj.util.OAuthData;
import com.chj.util.SandCard;
import com.chj.util.StaticConstant;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sand.crypto.ByteUtil;
import com.sand.crypto.MessageDig;
import com.sand.crypto.SandAPICipher;
import com.sand.crypto.SandInterce;
import com.sand.crypto.SandMinUser;
import com.sand.crypto.SandOrder;
import com.sand.crypto.SandUser;
import com.sand.crypto.SandVersion;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "commonAction.action", type = "redirect") })
public class CommonAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3006428240642866461L;
	/**
	 * 德普订单接口url
	 */
	private static final String DepuOrderUrl = "http://www.depufamily.com/api/payapi.php?a=25bbdcd06c32d477f7fa1c3e4a91b032";
	/**
	 * 杉德卡用户信息查询,信息修改
	 */
	private static final String ShandUserQueryUrl = "http://payment-test.sandpay.com.cn/CAS/OpenApi/json/doServer";

	@Autowired
	CommonManager commonManager;
	@Autowired
	UserManager userManager;
	@Autowired
	ProductManager productManager;
	@Autowired
	CommunityManager communityManager;

	private String username, password;

	private String url;

	/**
	 * 天气预报
	 * 
	 * @throws Exception
	 */
	public void findWether() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		String json = HttpGetMsg.getUrl(url, "");
		JSONObject obj = JSONObject.fromObject(json);
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy年MM月dd");
		obj.put("date", fmt.format(new Date()));
		obj.put("week", Commonparam.findWeek());

		response.getOutputStream().write(obj.toString().getBytes("UTF-8"));
	}

	/**
	 * type:1首页右上角公告 type:4便捷首页3个广告 type:5品牌馆页面4个广告 type:6商品推广页面4个广告
	 * type:7优惠促销页面4个广告 type:8店铺详情页面1个广告 type:9店铺详情页面1个广告 type:10瞩目漕河泾页面1个广告
	 * 
	 * @throws IOException
	 */

	public void findAds() throws IOException {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<HashMap> list = new ArrayList<HashMap>();
		try {
			// linkAddress,title,path
			list = productManager.findAds(type);

		} catch (Exception e) {

		}
		String json = JSONArray.fromObject(list).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void findIndexAds() throws IOException {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			// linkAddress,title,path
			List<HashMap> list1 = productManager.findAds("1");
			// List<HashMap> list2 = productManager.findAds("2");
			List<HashMap> list3 = productManager.findAds("3");
			HashMap map = new HashMap();
			map.put("list1", list1);
			// map.put("list2", list2);
			map.put("list3", list3);

			bean.setStatus(200);
			bean.setRows(map);

		} catch (Exception e) {

		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void findWether1() throws IOException {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		HashMap<String, Object> map = new HashMap<String, Object>();
		BaseBean bean = new BaseBean();
		try {

			SimpleDateFormat fmt = new SimpleDateFormat("yyyy年MM月dd");

			String json = HttpGetMsg.getUrl(
					"http://www.weather.com.cn/data/cityinfo/101021200.html",
					"");
			JSONObject obj = JSONObject.fromObject(json);
			JSONObject infoObj = JSONObject.fromObject(obj
					.getString("weatherinfo"));
			String info = infoObj.getString("weather");
			map.put("info", infoObj.getString("weather"));
			map.put("date", fmt.format(new Date()));

			map.put("week", Commonparam.findWeek());
			map.put("temp1",
					infoObj.getString("temp1") + "/"
							+ infoObj.getString("temp2"));// 温度

			String image = "";
			if (info.indexOf('晴') != -1) {
				if (info.indexOf('云') != -1 || info.indexOf('阴') != -1)
					image = "w_sannyyuun.png";
				else
					image = "w_sunny.png";
			} else if (info.indexOf('雨') != -1) {
				if (info.indexOf('雷') != -1) {
					if (info.indexOf('云') != -1)
						image = "w_leirainyun.png";
					else
						image = "w_leirain.png";
				} else if (info.indexOf('中') != -1) {
					image = "w_middlerain.png";
				} else if (info.indexOf('小') != -1) {
					image = "w_littlerain.png";
				} else if (info.indexOf('雪') != -1) {
					image = "w_rainsnow.png";
				} else
					image = "w_rain.png";
			} else if (info.indexOf('雪') != -1) {
				if (info.indexOf('中') != -1)
					image = "w_middlesnow.png";
				else if (info.indexOf('小') != -1)
					image = "w_littlesnow.png";
				else
					image = "w_snow.png";
			} else if (info.indexOf('雾') != -1) {
				image = "w_fog.png";
			} else if (info.indexOf('云') != -1) {
				if (info.indexOf('多') != -1)
					image = "w_duoyun.png";
				else if (info.indexOf('风') != -1)
					image = "w_yunfeng.png";
				else if (info.indexOf('雷') != -1)
					image = "w_leirainyun.png";
				else
					image = "w_yun.png";
			} else if (info.indexOf('风') != -1) {
				if (info.indexOf('台') != -1)
					image = "w_taifeng.png";
				else
					image = "w_wind.png";
			} else if (info.indexOf('雷') != -1) {
				image = "w_lei.png";
			} else if (info.indexOf('阴') != -1) {
				image = "w_yun.png";
			} else {
				image = "w_yun.png";
			}
			map.put("image", image);
			bean.setStatus(200);
			bean.setMsg("获取天气信息成功!");
			bean.setRows(map);

		} catch (Exception e) {

		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	private File uploadFile;
	private String uploadFileFileName;
	private String type, activityId;

	public void uploadFile() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user = (User) request.getSession().getAttribute("user");

			String targetFolder = Commonparam.otherfolder;
			if (type.equals("topic")) {
				targetFolder = Commonparam.topicImage;
			} else if (type.equals("circle")) {
				targetFolder = Commonparam.circleImage;
			} else if (type.equals("activity")) {
				targetFolder = Commonparam.activityImage;
			} else if (type.equals("actcontent")) {

				targetFolder = Commonparam.actcontentImage;
			} else if (type.equals("card")) {
				targetFolder = Commonparam.cardImage;
			}
			boolean flag = true;
			if (type.equals("actcontent")) {
				HashMap map = new HashMap();
				map.put("activityId", activityId);
				map.put("uploadUserId", user.getUserId());
				long count = communityManager.findActivityUserImageCount(map);
				if (count >= 10) {
					flag = false;
					bean.setStatus(400);
					bean.setMsg("已达到最大限制图片数10!");
				} else {
					flag = true;
				}
			}
			if (flag) {

				String path = "";

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
						targetFolder = targetFolder
								+ Commonparam.makeYearMonth(new Date());
						String absolute = Commonparam
								.getKeyValue("imageStorePath") + targetFolder;

						Commonparam.makeFile(uploadFile, absolute, newfilename);
						path = targetFolder + newfilename;
						bean.setStatus(200);
						bean.setMsg(path);
					} else {
						bean.setStatus(400);
						bean.setMsg("图片大小300K内!");
					}

				} else {
					bean.setStatus(400);
					bean.setMsg("请选择图片!");
				}
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			bean.setStatus(400);
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	String upliadFilePath;

	public void deleteUploadFile() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {

			if (this.upliadFilePath != null) {
				upliadFilePath = "/"
						+ upliadFilePath.substring(upliadFilePath
								.indexOf("upload"));
				String path = Commonparam.getKeyValue("imageStorePath")
						+ upliadFilePath;
				File file = new File(path);
				if (file.exists()) {
					file.delete();
				}
				bean.setStatus(200);
				bean.setMsg(path);
			} else {
				bean.setStatus(400);
				bean.setMsg("请选择图片!");
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			bean.setStatus(400);
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	String user;
	String id;
	private File filedata;
	private String filedataFileName;

	public void uploadHtmlFile() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		HashMap rt = new HashMap();
		try {

			org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper ff = (MultiPartRequestWrapper) request;
			String[] filenames = ff.getFileNames("filedata");
			File[] files = ff.getFiles("filedata");
			filedataFileName = filenames[0];
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy/MM");
			String ext = filedataFileName.substring(
					filedataFileName.lastIndexOf("."),
					filedataFileName.length());

			String newfilename = Commonparam.makeNewFileName(filedataFileName);
			String targetFolder = Commonparam.htmlfolder
					+ Commonparam.makeYearMonth(new Date());
			String absolute = Commonparam.getKeyValue("imageStorePath")
					+ targetFolder;

			File absoluteFolder = new File(absolute);
			if (!absoluteFolder.exists()) {
				absoluteFolder.mkdirs();
			}

			BufferedInputStream fileIn = new BufferedInputStream(
					new FileInputStream(files[0]));

			File file = new File(absolute + "/" + newfilename);
			BufferedOutputStream fileOut = new BufferedOutputStream(
					new FileOutputStream(file));

			byte[] buf = new byte[1024];
			while (true) {
				// 读取数据
				int bytesIn = fileIn.read(buf, 0, 1024);
				if (bytesIn == -1) {
					break;
				} else {
					fileOut.write(buf, 0, bytesIn);
				}
			}

			fileOut.flush();
			fileOut.close();
			long length = file.length();
			ext = ext.toLowerCase();
			if (ext.contains("jpg") || ext.contains("jpeg")
					|| ext.contains("png") || ext.contains("gif")) {
				if (Commonparam.imageMax >= length) {

					rt.put("err", "");
					rt.put("msg", Commonparam.getKeyValue("imagepath")
							+ targetFolder + newfilename);
				} else {
					rt.put("err", "图片大小在300K内!");
					rt.put("msg", "图片大小在300K内!");
				}
			} else if (ext.contains("mp3") || ext.contains("mp4")
					|| ext.contains("avi")) {
				if (Commonparam.videoMax >= length) {
					Properties prop = new Properties();
					InputStream in = CommonAction.class
							.getResourceAsStream("/util.properties");
					prop.load(in);

					rt.put("err", "");
					rt.put("msg", Commonparam.getKeyValue("imagepath")
							+ targetFolder + newfilename);
				} else {
					rt.put("err", "视频大小在100M内!");
					rt.put("msg", "视频大小在100M内!");
				}
			} else if (ext.contains("swf")) {
				if (Commonparam.swfMax >= length) {
					Properties prop = new Properties();
					InputStream in = CommonAction.class
							.getResourceAsStream("/util.properties");
					prop.load(in);

					rt.put("err", "");
					rt.put("msg", Commonparam.getKeyValue("imagepath")
							+ targetFolder + newfilename);
				} else {
					rt.put("err", "动画大小在100M内!");
					rt.put("msg", "动画大小在100M内!");
				}
			} else {
				if (Commonparam.fileMax >= length) {
					Properties prop = new Properties();
					InputStream in = CommonAction.class
							.getResourceAsStream("/util.properties");
					prop.load(in);

					rt.put("err", "");
					rt.put("msg", Commonparam.getKeyValue("imagepath")
							+ targetFolder + newfilename);
				} else {
					rt.put("err", "文件大小在10M内!");
					rt.put("msg", "文件大小在10M内!");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			rt.put("err", e.getLocalizedMessage());
			rt.put("msg", e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(rt).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	private String path;

	public void findPicture() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		HashMap rt = new HashMap();
		try {

			File file = new File(Commonparam.getKeyValue("imageStorePath")
					+ path);

			if (file.exists()) {
				response.reset();
				response.setContentType("image/png");
				BufferedInputStream fileIn = new BufferedInputStream(
						new FileInputStream(file));

				byte[] buf = new byte[1024];

				while (true) {
					// 读取数据
					int bytesIn = fileIn.read(buf, 0, 1024);
					if (bytesIn == -1) {
						break;
					} else {

						response.getOutputStream().write(buf, 0, bytesIn);
					}

				}
				response.getOutputStream().flush();
				response.getOutputStream().close();
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 长寿国旅
	 * 
	 * @throws Exception
	 */
	private Integer ticketType;

	public void travelTicket() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		User user = (User) request.getSession().getAttribute("user");
		try {
			if (user != null) {

				if (user.getFirstName() != null
						&& !"".equals(user.getFirstName().trim())) {
					if (user.getLastName() != null
							&& !"".equals(user.getLastName().trim())) {
						if (user.getEmail() != null
								&& !"".equals(user.getEmail().trim())) {
							if (user.getIdCardType() != null
									&& "I1".equals(user.getIdCardType().trim())) {
								if (user.getIdCardNo() != null
										&& !"".equals(user.getIdCardNo())) {
									String info = user.getNickName()
											+ "|"
											+ user.getIdCardNo()
											+ "|"
											+ StaticConstant.TICKET_TYPE[ticketType];
									System.out.println(info);
									SimpleDateFormat sdf = new SimpleDateFormat(
											"yyyy-MM-dd HH:mm");
									String s = sdf.format(new Date());
									s = com.chj.common.TestEncrypt.encrypt(s
											+ "|" + info);
									bean.setRows(s);
									bean.setStatus(200);
								} else {
									bean.setMsg("需要身份证，请至个人中心填写！");
								}
							} else {
								bean.setMsg("需要身份证，请至个人中心填写！");
							}
						} else {
							bean.setMsg("用户邮箱为空，请至个人中心填写！");
						}
					} else {
						bean.setMsg("用户名为空，请至个人中心填写！");
					}
				} else {
					bean.setMsg("用户姓为空，请至个人中心填写！");
				}
			} else {
				bean.setMsg("请登录！");
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		System.out.println(json);
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public Integer getTicketType() {
		return ticketType;
	}

	public void setTicketType(Integer ticketType) {
		this.ticketType = ticketType;
	}

	String orderId, pointAddr;

	/**
	 * 德普提交订单
	 * 
	 * @throws Exception
	 */
	public void createDepuOrder() throws Exception {
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

				HashMap<Object, Object> mapss = new HashMap<Object, Object>();
				mapss.put("flowNo", order.getFlowNo());
				mapss.put("columName", "addr_point");
				mapss.put("columValue", pointAddr);
				Integer i = (Integer) commonManager.updateOrderStatus(mapss);
				List<OrderItem> itemList = productManager
						.findUserOrderItem(order.getOrderId());

				List<HashMap<?, ?>> product = new ArrayList<HashMap<?, ?>>();
				BigDecimal totalPrice = new BigDecimal("0");
				for (OrderItem item : itemList) {
					HashMap<String, Object> map = new HashMap<String, Object>();
					HashMap<?, ?> pro = productManager.findProductCartInfo(item
							.getProductId());
					ProductSku sku = (ProductSku) productManager
							.findProductSku(item.getCompanyShopProductSkuId());

					map.put("id", pro.get("product_number"));
					map.put("name", pro.get("name"));
					map.put("unit_price", sku.getPrice());
					map.put("quantity", item.getQty());

					BigDecimal addPrice = new BigDecimal(sku.getPrice())
							.multiply(new BigDecimal(item.getQty()));
					map.put("total_price",
							addPrice.setScale(2, BigDecimal.ROUND_HALF_UP));
					totalPrice = totalPrice.add(addPrice);
					product.add(map);
				}
				String basePath = request.getScheme() + "://"
						+ request.getServerName() + ":"
						+ request.getServerPort() + request.getContextPath();
				String urls = basePath + "/product!findUserOrder.action";

				HashMap<String, Object> map = new HashMap<String, Object>();

				map.put("username", user.getNickName());
				map.put("referer", urls);
				map.put("name", order.getName());
				map.put("address", order.getAddress().replace("&nbsp;", ""));
				map.put("phone", order.getPhone());
				map.put("mail", null);
				map.put("delivery_point", pointAddr);
				map.put("orderid", order.getFlowNo());
				map.put("single_time", order.getOrderTime());
				map.put("total_payment",
						totalPrice.setScale(2, BigDecimal.ROUND_HALF_UP));
				map.put("detail", product);

				String json = "mypost=" + JSONObject.fromObject(map).toString();
				System.out.println(json);

				String info = HttpConnectUtil
						.getPostConnect(json, DepuOrderUrl);

				if (info.indexOf("href=") > -1) {
					String[] s = info.split("href=\"");
					String[] ss = s[1].split("\"");
					String[] s1 = info.split("￥");
					String[] ss1 = s1[1].split("</");
					if (totalPrice.compareTo(new BigDecimal(ss1[0])) == 0) {
						bean.setRows(ss[0]);
						bean.setTotal(ss1[0]);
						bean.setStatus(200);
					} else {
						BigDecimal tolt = new BigDecimal(ss1[0]);
						bean.setMsg("由于订单总价已变为" + tolt + "，与原价" + totalPrice
								+ "不一致，支付失败！");
					}
				} else {
					bean.setMsg(info);
				}
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			bean.setStatus(400);
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	String payreturn;

	/**
	 * 德普订单结果返回
	 * 
	 * @throws Exception
	 */
	public void depuOrderBack() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		// payreturn={"orderid":"233434","status":"1"}
		// status:1：付款成功,2是配送中,3：已发货,

		JSONObject json = JSONObject.fromObject(payreturn);
		String flowNo = json.getString("orderid");
		int status = json.getInt("status");
		try {
			if (flowNo != null) {
				if (status == 1) {
					HashMap<Object, Object> map = new HashMap<Object, Object>();
					map.put("flowNo", flowNo);
					map.put("columName", "pay_status");
					map.put("columValue", StaticConstant.ORDER_PAY_STATUS[1]);
					Integer i = (Integer) commonManager.updateOrderStatus(map);
					if (i > 0) {
						System.out.println("付款成功！");
					} else {
						System.out.println("订单返回结果有误！");
					}
				} else if (status == 2) {
					HashMap<Object, Object> map = new HashMap<Object, Object>();
					map.put("flowNo", flowNo);
					map.put("columName", "status");
					map.put("columValue", StaticConstant.ORDER_STATUS[3]);
					Integer i = (Integer) commonManager.updateOrderStatus(map);
					if (i > 0) {
						System.out.println("配送成功！");
					} else {
						System.out.println("订单返回结果有误！");
					}
				} else if (status == 3) {
					HashMap<Object, Object> map = new HashMap<Object, Object>();
					map.put("flowNo", flowNo);
					map.put("columName", "status");
					map.put("columValue", StaticConstant.ORDER_STATUS[4]);
					Integer i = (Integer) commonManager.updateOrderStatus(map);
					if (i > 0) {
						System.out.println("交易成功！");
					} else {
						System.out.println("订单返回结果有误！");
					}
				} else {
					System.out.println("状态错误！");
				}
			} else {
				response.getWriter().print("出错了!");
			}
		} catch (Exception e) {
			e.getLocalizedMessage();
		}
	}

	public String getPayreturn() {
		return payreturn;
	}

	public void setPayreturn(String payreturn) {
		this.payreturn = payreturn;
	}

	public String getUsername() {
		return username;
	}

	public File getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(File uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getUploadFileFileName() {
		return uploadFileFileName;
	}

	public void setUploadFileFileName(String uploadFileFileName) {
		this.uploadFileFileName = uploadFileFileName;
	}

	public String getUpliadFilePath() {
		return upliadFilePath;
	}

	public void setUpliadFilePath(String upliadFilePath) {
		this.upliadFilePath = upliadFilePath;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void updateObjectBrowseCount(String table, String pkField,
			Long pkFieldValue, String countField) {

	}

	public String getType() {
		return type;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public void setType(String type) {
		this.type = type;
	}

	/**
	 * 一号店接口文档
	 */
	private String client_id;
	private String client_secret;
	private String redirect_uri;
	private String response_type;
	private String grant_type;
	private String access_token;
	private String code;
	private String state;
	private String scope;

	public void represtOAuth() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		User user = (User) request.getSession().getAttribute("user");

		if (user == null) {
			request.setAttribute("error", "请登录!");
			request.getRequestDispatcher("common/404.jsp").forward(request,
					response);
		} else if (user.getNickName().trim() == null
				&& user.getPhone().trim() == null) {
			request.setAttribute("error", "您的个人信息不全，请先至个人中心完善资料吧！");
			request.getRequestDispatcher("common/404.jsp").forward(request,
					response);
		} else {
			response.sendRedirect("https://passport.yhd.com/caohejing/login.do");

		}
	}

	/**
	 * OAuth2.0协议,第三方信息对接，第一次请求code
	 * 
	 * @throws Exception
	 */
	public void reqOAuth() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		User user = (User) request.getSession().getAttribute("user");
		if (OAuthData.FirstShopKey.equals(client_id)
				&& OAuthData.ResponseType.equals(response_type)) {
			request.setAttribute("redirect_uri", redirect_uri);
			request.setAttribute("oauthState", state);

			request.setAttribute("tabel", "一号店");
			response.sendRedirect("http://www.icaohejing.com/chjservice/pages/yihaodian.jsp?redirect_uri="
					+ redirect_uri + "&oauthState=" + state);
		} else {
			response.getWriter().print("参数不全！");
		}
	}

	/**
	 * OAuth2.0协议，返回code
	 * 
	 * @throws Exception
	 */
	private String redirectUri, oauthState;

	public void askOAuth() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		User user = (User) request.getSession().getAttribute("user");

		String returnUrl = Commonparam.getKeyValue("returnUrl");

		if (user == null) {
			response.sendRedirect(returnUrl);
		} else {
			try {
				Oauth oauth = commonManager.greateOauthClass(user, redirectUri,
						oauthState);
				returnUrl = URLEncoder.encode(returnUrl, "utf-8");

				String pointUrls = redirectUri + "?code=" + oauth.getCode()
						+ "&state=" + oauthState + "&returnUrl=" + returnUrl;
				response.sendRedirect(pointUrls);
			} catch (Exception e) {
				request.setAttribute("error", e.getLocalizedMessage());
				request.getRequestDispatcher("common/404.jsp").forward(request,
						response);
			}
		}
	}

	/**
	 * OAuth2.0协议，第二次请求,请求并返回access_token
	 * 
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void askToken() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		request.setCharacterEncoding("UTF-8");

		HashMap<String, Object> map = null;
		if (OAuthData.FirstShopKey.equals(client_id)
				&& OAuthData.FirstShopSecret.equals(client_secret)
				&& OAuthData.GrantType.equals(grant_type)) {

			map = commonManager.grantOauthToken(code);
		} else {
			map = new HashMap<String, Object>();
			map.put("error", "503");
			map.put("error_desc", URLEncoder.encode("参数不全！", "utf-8"));
		}
		String js = JSONObject.fromObject(map).toString();
		response.getOutputStream().write(js.getBytes("UTF-8"));
	}

	/**
	 * OAuth2.0协议，第三次请求,请求并返回用户信息
	 * 
	 * @throws Exception
	 */
	public void askUserInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		Map<String, Object> map = new HashMap<String, Object>();
		if (access_token != null) {
			Oauth oauth = commonManager.findOauthCodeUser(access_token.trim());
			map.put("userId", oauth.getUserIdCode());
			map.put("username", oauth.getUserNameCode());
		}
		String js = JSONObject.fromObject(map).toString();
		response.getOutputStream().write(js.getBytes("UTF-8"));
	}

	public String getClient_id() {
		return client_id;
	}

	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}

	public String getClient_secret() {
		return client_secret;
	}

	public void setClient_secret(String client_secret) {
		this.client_secret = client_secret;
	}

	public String getRedirect_uri() {
		return redirect_uri;
	}

	public void setRedirect_uri(String redirect_uri) {
		this.redirect_uri = redirect_uri;
	}

	public String getResponse_type() {
		return response_type;
	}

	public void setResponse_type(String response_type) {
		this.response_type = response_type;
	}

	public String getGrant_type() {
		return grant_type;
	}

	public void setGrant_type(String grant_type) {
		this.grant_type = grant_type;
	}

	public String getAccess_token() {
		return access_token;
	}

	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getScope() {
		return scope;
	}

	public void setScope(String scope) {
		this.scope = scope;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getPointAddr() {
		return pointAddr;
	}

	public void setPointAddr(String pointAddr) {
		this.pointAddr = pointAddr;
	}

	public File getFiledata() {
		return filedata;
	}

	public void setFiledata(File filedata) {
		this.filedata = filedata;
	}

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public String getFiledataFileName() {
		return filedataFileName;
	}

	public String getRedirectUri() {
		return redirectUri;
	}

	public void setRedirectUri(String redirectUri) {
		this.redirectUri = redirectUri;
	}

	public String getOauthState() {
		return oauthState;
	}

	public void setOauthState(String oauthState) {
		this.oauthState = oauthState;
	}

	public void setFiledataFileName(String filedataFileName) {
		this.filedataFileName = filedataFileName;
	}

	/** 杉德卡接口 */

	private String access_time, access_type, access_ip, business_type,
			business_body, response_code, response_msg, sign;
	private String issueNo, cardNo, gender, personName, idType, idNo, mobileNo,
			compAddr, houseAddr, homeTel, mailBox;

	public void querySandCardInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		try {
			Long u = userManager.selectUserCard(cardNo);
			if (u > 0) {
				bean.setMsg("此一卡通卡号已被绑定！");
				bean.setStatus(400);
			} else {
				LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
				// 业务数据主体
				map.put("payMode", SandCard.payMode);
				map.put("payInstrument", SandCard.payInstrument);
				map.put("cardNo", cardNo);
				map.put("personName", "");
				map.put("idType", "");
				map.put("idNo", "");
				StringBuilder builder = new StringBuilder();
				for (Entry<?, ?> entry : map.entrySet()) {
					builder.append(entry.getKey()).append("=")
							.append(entry.getValue()).append("&");
				}
				builder.append(HttpConnectUtil.Md5(SandCard.sign_value[0]));
				String sign1 = HttpConnectUtil.Md5(builder.toString());
				// 版本信息
				LinkedHashMap<String, Object> maptwo = new LinkedHashMap<String, Object>();
				maptwo.put("version", SandCard.outVersion);
				maptwo.put("charset", SandCard.outCharset);
				maptwo.put("access_number", SandCard.access_number);
				maptwo.put("access_time",
						new SimpleDateFormat("yyyyMMddHHmmss")
								.format(new Date()));
				maptwo.put("access_type", SandCard.access_type[0]);
				maptwo.put("access_ip", request.getRemoteAddr());
				maptwo.put("business_type", SandCard.business_type[1]);
				maptwo.put("business_body", sign1);

				StringBuilder builder2 = new StringBuilder();
				for (Entry<?, ?> entry : maptwo.entrySet()) {
					builder2.append(entry.getKey()).append("=")
							.append(entry.getValue()).append("&");
				}
				builder2.append(HttpConnectUtil.Md5(SandCard.sign_value[1]));
				String sign = HttpConnectUtil.Md5(builder2.toString());

				maptwo.put("business_body", map);
				maptwo.put("sign_type", SandCard.outSign_type);
				maptwo.put("sign", sign);
				String post = "param="
						+ JSONObject.fromObject(maptwo).toString();
				// 连接 获取返回值
				String httpStr = HttpConnectUtil.getPostConnect(post,
						ShandUserQueryUrl);
				String s = new String(httpStr.getBytes(SandCard.outCharset));
				
				System.out.println(s);
				JSONObject obj = JSONObject.fromObject(s);
				HashMap<?, ?> maps = (HashMap<?, ?>) JSONObject.toBean(obj,
						java.util.HashMap.class);
				if (maps.size() > 0 && "0000".equals(maps.get("response_code"))) {
					bean.setStatus(200);
				} else {
					bean.setMsg("你的卡号不属于一卡通！");
					bean.setStatus(400);
				}
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 杉德卡持卡人信息查询
	 * 
	 * @throws Exception
	 */
	public void queryInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		User user1 = (User) request.getSession().getAttribute("user");

		BaseBean bean = new BaseBean();
		try {
			if (user1.getRealname() == null) {
				bean.setMsg("请确保你的真实姓名与杉德卡账号一致！");
			} else {
				// business_body 业务数据主体
				SandUser user = new SandUser();
				user.setPayMode(SandCard.payMode);
				user.setPayInstrument(SandCard.payInstrument);
				user.setCardNo(cardNo);
				user.setPersonName("");
				user.setIdType("");
				user.setIdNo("");
				// ShandVer 版本信息
				SandVersion ver = new SandVersion();
				ver.setVersion(SandCard.outVersion);
				ver.setCharset(SandCard.outCharset);
				ver.setAccess_number(SandCard.access_number);
				ver.setAccess_time(new SimpleDateFormat("yyyyMMddHHmmss")
						.format(new Date()));
				ver.setAccess_type(SandCard.access_type[0]);
				ver.setAccess_ip(request.getRemoteAddr());
				ver.setBusiness_type(SandCard.business_type[1]);

				SandMinUser minUser = new SandMinUser();
				minUser.setPayMode(SandCard.payMode);
				minUser.setPayInstrument(SandCard.payInstrument);
				minUser.setCardNo(cardNo);
				minUser.setPersonName("");
				minUser.setIdType("");
				minUser.setIdNo("");
				ver.setBusiness_body(minUser);
				ver.setSign_type(SandCard.outSign_type);

				String sign = HttpConnectUtil.createUserSign(user, ver);
				ver.setSign(sign);
				JSONObject json = JSONObject.fromObject(ver);
				String post = "param=" + json;
				System.out.println("post : " + post);
				// 连接 获取返回值
				String httpStr = HttpConnectUtil.getPostConnect(post,
						ShandUserQueryUrl);
				System.out.println(httpStr);
				String s = new String(httpStr.getBytes(SandCard.outCharset));

				JSONObject obj = JSONObject.fromObject(s);
				HashMap<?, ?> maps = (HashMap<?, ?>) JSONObject.toBean(obj,
						java.util.HashMap.class);
				if (maps.size() > 0 && "0000".equals(maps.get("response_code"))) {
					user1.setShandCardno(cardNo);
					int rt = userManager.updateShandCardno(user1);
					if (rt > 0) {
						bean.setStatus(200);
						bean.setRows(rt);
					} else {
						bean.setStatus(400);
						bean.setMsg("没有数据!");
					}
				} else {
					bean.setMsg("你的卡号或真实姓名有误！");
				}
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	private String trans_type, merchant_id, merchant_name, goods_content,
			custome_ip, order_id, sm_billno, order_amount, currency, pay_kind,
			front_url, back_url, merchant_attach;

	/**
	 * 杉德卡持卡人订单支付信息
	 * 
	 * @throws Exception
	 */
	public void goodsInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		request.setCharacterEncoding("UTF-8");
		try {

			Order order1 = (Order) productManager.findOrderById(orderId);
			// 获取数据对象
			SandOrder order = new SandOrder();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath();
			front_url = basePath + "/pages/a.jsp";
			back_url = basePath + "/out!dealOrder.action";

			order.setTrans_type(SandCard.trans_type[0]);
			order.setMerchant_id(SandCard.merchant_id);
			order.setMerchant_name("漕河泾");// 商户简称,可空
			order.setMerchant_attach(merchant_attach);// 附加信息,可空
			order.setGoods_content(goods_content);// 商品的具体描述,可空
			order.setCustome_ip(custome_ip);// 用户IP,可空
			order.setOrder_id(order1.getFlowNo());// 支付订单号，保证商户端唯一，并长度不超过30位。
			order.setSm_billno(sm_billno);// 系统内部订单号,可空,此参数仅在对账时提供。
			String date = new SimpleDateFormat("yyyyMMddHHmmss")
					.format(new Date());
			order.setOrder_time(date);

			order.setOrder_amount(String.format("%012d", order1.getMoney()));// 交易金额
			order.setCurrency(SandCard.currency);// 交易币种
			order.setPay_kind(SandCard.pay_kind[0]);// 默认支付方式
			order.setFront_url(front_url);// 前端通知URL
			order.setBack_url(back_url);// 后端通知URL

			String signdata = HttpConnectUtil.orderCreateSign(order);
			String sign = HttpConnectUtil.CreateOrderSign(
					order.getMerchant_id(), signdata);
			order.setSign(sign);// 数字签名
			request.setAttribute("info", order);
			request.getRequestDispatcher("pages/shand_pay.jsp").forward(
					request, response);
		} catch (Exception e) {
			response.getWriter().print(e.getLocalizedMessage());
		}
	}

	public void sandlinks() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		User user = (User) request.getSession().getAttribute("user");

		BaseBean bean = new BaseBean();
		try {

			if (user == null || user.getShandCardno() == null
					|| "".equals(user.getShandCardno().trim())) {
				bean.setMsg("你还没有绑定自己的漕河泾一卡通！");
				bean.setStatus(400);
			} else {
				SandInterce face = new SandInterce();
				face.setAc(SandInterce.SAND_AC[Integer.valueOf(type)]);
				face.setMemid(SandInterce.MEMID);
				face.setSignCardNo("7280000500005135");
				byte[] b = SandAPICipher.en3des(SandInterce.DES_KEY.getBytes(),
						face.getSignCardNo().getBytes());
				face.setSignCardNo(ByteUtil.bytes2Hex(b));
				face.setMid(SandInterce.MID);
				String signinfo = face.getAc() + face.getMid()
						+ face.getSignCardNo();
				String sign = new MessageDig().sign(signinfo.getBytes(),
						"SHA-1");
				face.setSign(sign);
				bean.setRows(face);
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public String getTrans_type() {
		return trans_type;
	}

	public void setTrans_type(String trans_type) {
		this.trans_type = trans_type;
	}

	public String getMerchant_id() {
		return merchant_id;
	}

	public void setMerchant_id(String merchant_id) {
		this.merchant_id = merchant_id;
	}

	public String getMerchant_name() {
		return merchant_name;
	}

	public void setMerchant_name(String merchant_name) {
		this.merchant_name = merchant_name;
	}

	public String getGoods_content() {
		return goods_content;
	}

	public void setGoods_content(String goods_content) {
		this.goods_content = goods_content;
	}

	public String getCustome_ip() {
		return custome_ip;
	}

	public void setCustome_ip(String custome_ip) {
		this.custome_ip = custome_ip;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getSm_billno() {
		return sm_billno;
	}

	public void setSm_billno(String sm_billno) {
		this.sm_billno = sm_billno;
	}

	public String getOrder_amount() {
		return order_amount;
	}

	public void setOrder_amount(String order_amount) {
		this.order_amount = order_amount;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getPay_kind() {
		return pay_kind;
	}

	public void setPay_kind(String pay_kind) {
		this.pay_kind = pay_kind;
	}

	public String getFront_url() {
		return front_url;
	}

	public void setFront_url(String front_url) {
		this.front_url = front_url;
	}

	public String getBack_url() {
		return back_url;
	}

	public void setBack_url(String back_url) {
		this.back_url = back_url;
	}

	public String getMerchant_attach() {
		return merchant_attach;
	}

	public void setMerchant_attach(String merchant_attach) {
		this.merchant_attach = merchant_attach;
	}

	public String getAccess_time() {
		return access_time;
	}

	public void setAccess_time(String access_time) {
		this.access_time = access_time;
	}

	public String getAccess_type() {
		return access_type;
	}

	public void setAccess_type(String access_type) {
		this.access_type = access_type;
	}

	public String getAccess_ip() {
		return access_ip;
	}

	public void setAccess_ip(String access_ip) {
		this.access_ip = access_ip;
	}

	public String getBusiness_type() {
		return business_type;
	}

	public void setBusiness_type(String business_type) {
		this.business_type = business_type;
	}

	public String getBusiness_body() {
		return business_body;
	}

	public void setBusiness_body(String business_body) {
		this.business_body = business_body;
	}

	public String getResponse_code() {
		return response_code;
	}

	public void setResponse_code(String response_code) {
		this.response_code = response_code;
	}

	public String getResponse_msg() {
		return response_msg;
	}

	public void setResponse_msg(String response_msg) {
		this.response_msg = response_msg;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getIssueNo() {
		return issueNo;
	}

	public void setIssueNo(String issueNo) {
		this.issueNo = issueNo;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPersonName() {
		return personName;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}

	public String getIdType() {
		return idType;
	}

	public void setIdType(String idType) {
		this.idType = idType;
	}

	public String getIdNo() {
		return idNo;
	}

	public void setIdNo(String idNo) {
		this.idNo = idNo;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getCompAddr() {
		return compAddr;
	}

	public void setCompAddr(String compAddr) {
		this.compAddr = compAddr;
	}

	public String getHouseAddr() {
		return houseAddr;
	}

	public void setHouseAddr(String houseAddr) {
		this.houseAddr = houseAddr;
	}

	public String getHomeTel() {
		return homeTel;
	}

	public void setHomeTel(String homeTel) {
		this.homeTel = homeTel;
	}

	public String getMailBox() {
		return mailBox;
	}

	public void setMailBox(String mailBox) {
		this.mailBox = mailBox;
	}

	/**
	 * 新浪微博登录
	 * 
	 * @throws Exception
	 */
	public void loginComeSina() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		request.setCharacterEncoding("UTF-8");
		try {
			request.setAttribute("client_id", "client_id");
			request.setAttribute("redirect_uri", "redirect_uri");
			request.setAttribute("scope", "all");
			request.setAttribute("state", "test");
			request.setAttribute("display", "default");
			request.setAttribute("forcelogin", "false");
			request.setAttribute("language", "UTF-8");

			request.getRequestDispatcher(
					"https://api.weibo.com/oauth2/authorize").forward(request,
					response);

		} catch (Exception e) {
			response.getWriter().print(e.getLocalizedMessage());
		}

	}

}
