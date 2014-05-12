package com.chj.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.management.RuntimeErrorException;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.chj.common.Commonparam;
import com.chj.dao.ProductDao;
import com.chj.entity.CartItem;
import com.chj.entity.CompanyShop;
import com.chj.entity.CompanyShopProductSku;
import com.chj.entity.Order;
import com.chj.entity.OrderComment;
import com.chj.entity.OrderFlow;
import com.chj.entity.OrderItem;
import com.chj.entity.Product;
import com.chj.entity.ProductAttribute;
import com.chj.entity.ProductSku;
import com.chj.entity.User;
import com.chj.entity.UserCollection;
import com.chj.service.ProductManager;
import com.chj.service.UserManager;
import com.chj.util.ExceptionMyself;

@Service
@Transactional
public class ProductManagerImpl implements ProductManager {
	@Autowired
	ProductDao productrDao;

	@Override
	public List<HashMap> findProductByFunction(HashMap<String, Object> param) {
		
		return productrDao.findProductByFunction(param);
	}

	@Override
	public Object findSkuByShopProductId(Object shopProductId) {
		
		return productrDao.findSkuByShopProductId(shopProductId);
	}

	@Override
	public Object findProductImage(Object object) {
		
		return productrDao.findProductImage(object);
	}

	@Override
	public List<HashMap> findRestaurantList(HashMap<String, Object> param) {
		return productrDao.findRestaurantList(param);
	}

	@Override
	public List<HashMap> findShopTagsByShopId(HashMap<String, Object> param) {
		return productrDao.findShopTagsByShopId(param);
	}

	@Override
	public List<HashMap> findProductTuiguangList(HashMap<String, Object> param) {
		
		return productrDao.findProductTuiguangList(param);
	}

	@Override
	public Object findProductTuiguangListCount(HashMap<String, Object> param) {
		return productrDao.findProductTuiguangListCount(param);
	}

	@Override
	public List<HashMap> findProductByCategory() {
		return productrDao.findProductByCategory();
	}

	@Override
	public List<HashMap> findProductByuserTag(User user) {
		return productrDao.findProductByuserTag(user);
	}

	@Override
	public Object findProductTagsByProductId(Object productId) {
		return productrDao.findProductTagsByProductId(productId);
	}

	@Override
	public Object findProductCommentCount(Object productId) {
		return productrDao.findProductCommentCount(productId);
	}

	@Override
	public List<HashMap> findProductInterestList(HashMap<String, Object> param) {
		return productrDao.findProductInterestList(param);
	}

	@Override
	public Object findProductInterestListCount(HashMap<String, Object> param) {
		return productrDao.findProductInterestListCount(param);
	}

	@Override
	public List<HashMap> findBrandTop4List(HashMap<String, Object> param) {
		return productrDao.findBrandTop4List(param);
	}

	@Override
	public List<HashMap> findBrandMoreList(HashMap<String, Object> param) {
		
		return productrDao.findBrandMoreList(param);
	}

	@Override
	public Object findBrandMoreListCount(HashMap<String, Object> param) {
		
		return productrDao.findBrandMoreListCount(param);
	}

	@Override
	public List<HashMap> findRestarauntMoreList(HashMap<String, Object> param) {
		
		return productrDao.findRestarauntMoreList(param);
	}

	@Override
	public Object findRestarauntMoreListCount(HashMap<String, Object> param) {
		return productrDao.findRestarauntMoreListCount(param);
	}

	@Override
	public Object findSendAreaList() {
		return productrDao.findSendAreaList();
	}

	@Override
	public Object findRestaraurantCategory() {
		return productrDao.findRestaraurantCategory();
	}

	@Override
	public Long findUserCollectObject(Long userId, Object objectId,
			int objectType) {
		return (Long) productrDao.findUserCollectObject(userId, objectId,
				objectType);
	}

	@Override
	public CompanyShop findRestarauntDetail(String companyShopId) {
		return productrDao.findRestarauntDetail(companyShopId);
	}

	@Override
	public String findCategoryName(Long categoryId) {
		if (categoryId != null)
			return productrDao.findCategoryName(categoryId);
		return "";
	}

	@Override
	public Object findShopAreaByShopId(Long companyShopId) {
		
		return productrDao.findShopAreaByShopId(companyShopId);
	}

	@Override
	public List<HashMap> findRestarauntProductCategory(String companyShopId,long companyId) {
		
		return productrDao.findRestarauntProductCategory(companyShopId,companyId);
	}

	@Override
	public List<HashMap> findProductByShopSelfCategory(
			Object shopSelfCategoryId, String companyShopId,long companyId) {
		return productrDao.findProductByShopSelfCategory(shopSelfCategoryId,
				companyShopId,companyId);
	}

	@Override
	public CartItem findUserCartItem(HashMap<String, Object> map) {
		return productrDao.findUserCartItem(map);
	}

	@Override
	public synchronized Long addUserCart(HashMap<String, Object> map) {

		CartItem cardItem = productrDao.findUserCartItem(map);
		Long cardItemId = null;
		if (cardItem == null) {

			cardItemId = productrDao.addUserCart(map);
		} else {
			map.put("cartItemId", cardItem.getCartItemId());
			productrDao.updateUserCartCount(map);
		}
		return cardItemId;
	}

	@Override
	public HashMap findProductSkuInfo(Object productSkuId) {
		
		return productrDao.findProductSkuInfo(productSkuId);
	}

	@Override
	public List<HashMap> findUserCartShopList(Long userId) {
		//
		List<HashMap> list = new ArrayList<HashMap>();
		List<HashMap> shopIds = productrDao.findUserCartShopIdsList(userId);
		List<Long> setList = new ArrayList<Long>();
		for(HashMap shopInfo : shopIds){
			if(!setList.contains(shopInfo.get("shopId"))){
				setList.add(Long.valueOf(shopInfo.get("shopId").toString()));
			}
		}
		for(Long shopId : setList){
			list.add(productrDao.findUserCartShopInfo(shopId));
		}
		return list;
	}
 
	/**
	 * 通过companyShopProductSkuId获取
	 */
	@Override
	public Object findProductSku(Long companyShopProductSkuId) {
		return productrDao.findProductSku(companyShopProductSkuId);
	}

	@Override
	public List<CartItem> findCartItem(HashMap map) {
		return productrDao.findCartItem(map);
	}

	@Override
	public HashMap findProductCartInfo(Long productId) {
		return productrDao.findProductCartInfo(productId);
	}
	public Long findOrdedId (Order order){
		return productrDao.findOrdedId(order);
	}
	@Override
	public synchronized Long createUserOrdedr(User user, Order order, JSONArray cartArray) {
//		if (Commonparam.getOrderMaxNum() == 0) {
//			Commonparam.setOrderMaxNum(findOrderFlowNo(Commonparam
//					.Date2ShortStr(new Date())));
//		}
//		Commonparam.setOrderMaxNum(Commonparam.getOrderMaxNum()+1);
//		order.setFlowNo(Commonparam.getOrderMaxNum()+"");
		Long num = findOrderFlowNo(Commonparam
				.Date2ShortStr(new Date()));
		order.setFlowNo((num+1+""));
		productrDao.createUserOrdedr(order);
		Long orderid = findOrdedId(order);
		// {"total":"5.56","price":"5.56","oldPrice":" 5.00","qty":"1",
		// "productId":"10","cartItemId":"10","skuId":"10"
		for (int i = 0; i < cartArray.size(); i++) {
			JSONObject obj = cartArray.getJSONObject(i);
		
				OrderItem item = new OrderItem();
				item.setOrderId(orderid);
				item.setProductSkuId(Long.valueOf(obj.getString("skuId")));
				item.setProductId(Long.valueOf(obj.getString("productId")));
				item.setPrice(obj.getString("price"));
				item.setQty(obj.getString("qty"));
				item.setTotal(String.valueOf(Double.valueOf(obj.getString("qty"))
						* Double.valueOf(obj.getString("price"))));
				item.setCompanyShopProductId(Long.valueOf(obj
						.getString("companyShopProductId")));
				item.setCompanyShopProductSkuId(Long.valueOf(obj
						.getString("companyShopProductSkuId")));
				Long orderItemId = productrDao.createUserOrderItem(item);
				int rt = productrDao.reduceProductStock(item);
				if(rt<=0){
					Commonparam.setOrderMaxNum(Commonparam.getOrderMaxNum()-1);
					throw new ExceptionMyself("库存量不足!");
				}
				Long cartItemId = Long.valueOf(obj.getString("cartItemId"));
				if (cartItemId > 0) {// 购物车购买
					List<HashMap<String, Object>> appendList = (List<HashMap<String, Object>>) productrDao
							.findCartAppendItem(cartItemId);
					for (HashMap<String, Object> map : appendList) {

						map.put("orderItemId", orderItemId);

						Float price = Float.valueOf(map.get("price").toString());
						Float qty = Float.valueOf(map.get("qty").toString());
						map.put("total", price * qty);

						System.out.println(JSONObject.fromObject(map));
						Long appid = (Long) productrDao.addUserOrderAppend(map);
					}
					productrDao.deleteCartItemInfo(cartItemId);
				
			}
			
		

		}
		OrderFlow orderFlow = new OrderFlow();
		orderFlow.setCreateDate(new Date());
		orderFlow.setOrderId(orderid);
		orderFlow.setStatusValue("创建订单");
		orderFlow.setUserId(order.getUserId());
		if (user.getRealname() != null
				&& user.getRealname().trim().length() > 0)
			orderFlow.setName(user.getRealname());
		else if (user.getEmail() != null && user.getEmail().trim().length() > 0)
			orderFlow.setName(user.getEmail());
		else if (user.getPhone() != null && user.getPhone().trim().length() > 0)
			orderFlow.setName(user.getPhone());

		Long flowid = productrDao.insertOrderFlow(orderFlow);
		return orderid;
	}

	@Override
	public HashMap findShopPayTypeAndisDeliver(String companyShopId) {
		
		return productrDao.findShopPayTypeAndisDeliver(companyShopId);
	}

	@Override
	public List<Order> findUserOrderList(HashMap<String, Object> param) {
		return productrDao.findUserOrderList(param);
	}

	@Override
	public List<OrderItem> findUserOrderItem(Long orderId) {
		return productrDao.findUserOrderItem(orderId);
	}

	@Override
	public String findShopName(Long shopId) {
		return productrDao.findShopName(shopId);
	}

	@Override
	public Object findUserOrderListCount(HashMap<String, Object> param) {
		return productrDao.findUserOrderListCount(param);
	}

	@Override
	public int cancelUserOrder(HashMap<String, Object> map) {
		return productrDao.cancelUserOrder(map);
	}

	@Override
	public List<OrderFlow> findOrderFlow(String orderId) {
		return productrDao.findOrderFlow(orderId);
	}

	@Override
	public Object findOrderById(String orderId) {
		return productrDao.findOrderById(orderId);
	}

	@Override
	public List<OrderComment> findOrderComment(String orderId) {
		return productrDao.findOrderComment(orderId);
	}

	@Override
	public void saveOrderComment(OrderComment orderComment) {
		productrDao.saveOrderComment(orderComment);
	}

	@Override
	public void cancelCarProduct(Long userId, String cart) {
		JSONArray array = JSONArray.fromObject(cart);
		for (int i = 0; i < array.size(); i++) {
			JSONObject object = array.getJSONObject(i);
			productrDao.cancelCarProduct(object, userId);
		}

	}

	@Override
	public Product findProductDetail(String productId) {
		
		return productrDao.findProductDetail(productId);
	}

	@Override
	public List<HashMap> findnearbyShop(HashMap param) {
		return productrDao.findnearbyShop(param);
	}

	@Override
	public List<String> findProductImageList(Long productId) {
		return productrDao.findProductImageList(productId);
	}

	@Override
	public Object findCompanyShopInfo(String companyShopId) {
		return productrDao.findCompanyShopInfo(companyShopId);
	}

	@Override
	public List<ProductAttribute> findAllAttrList(String companyShopProductId) {
		return productrDao.findAllAttrList(companyShopProductId);
	}

	@Override
	public List<CompanyShopProductSku> findAllSkuList(
			String companyShopProductId) {
		return productrDao.findAllSkuList(companyShopProductId);
	}

	@Override
	public List<Long> findAttributeValueId(Long productSkuId) {
		return productrDao.findAttributeValueId(productSkuId);
	}

	@Override
	public ProductSku findProductSkuById(Long productSkuId) {
		return productrDao.findProductSkuById(productSkuId);
	}

	@Override
	public List<HashMap> loadProductComment(HashMap<String, Object> param) {
		return productrDao.loadProductComment(param);
	}

	@Override
	public List<HashMap> findnearbyShopArea(Object object) {
		return productrDao.findnearbyShopArea(object);
	}

	@Override
	public Long findnearbyShopCount(HashMap<String, Object> param) {
		return productrDao.findnearbyShopCount(param);
	}

	@Override
	public HashMap findnearbyShop1(HashMap<String, Object> param) {
		
		return productrDao.findnearbyShop1(param);
	}

	@Override
	public List<HashMap> findRestarauntMapList(HashMap<String, Object> param) {
		
		return productrDao.findRestarauntMapList(param);
	}

	@Override
	public Object findRestarauntMapListCount(HashMap<String, Object> param) {
		
		return productrDao.findRestarauntMapListCount(param);
	}

	@Override
	public List<HashMap> findCategoryFirstList() {
		return productrDao.findCategoryFirstList();
	}

	@Override
	public Object findSelfMadeProduct(HashMap param) {
		return productrDao.findSelfMadeProduct(param);
	}

	@Override
	public List<HashMap> findAttrValSku(HashMap param) {
		return productrDao.findAttrValSku(param);
	}

	@Override
	public List<HashMap> findAppendNameVal(HashMap param) {
		return productrDao.findAppendNameVal(param);
	}

	@Override
	public List<HashMap> findAppNamValAttr(HashMap param) {
		return productrDao.findAppNamValAttr(param);
	}

	@Override
	public List<HashMap> findSBUXProductCategory(HashMap param) {
		return productrDao.findSBUXProductCategory(param);
	}

	@Override
	public List<HashMap> findSBUXProductInfo(HashMap param) {
		return productrDao.findSBUXProductInfo(param);
	}

	@Override
	public Object addUserCartMenu(HashMap<String, Object> map,
			List<HashMap<String, Object>> appendList) {
		List<CartItem> CartItemList = productrDao.findCartItemCollection(map);
		Long id = 0L;
		if (CartItemList.size() == 0) {
			id = productrDao.addUserCart(map);
			if (id > 0) {
				for (HashMap<String, Object> map1 : appendList) {
					map1.put("cartId", id);
					Long m = productrDao.addUserCartAppend(map1);
				}
			}
		} else {
			for (CartItem cartItem : CartItemList) {
				List<HashMap> rlist = (java.util.List<HashMap>) productrDao
						.findCartAppendItem(cartItem.getCartItemId());
				if (rlist.size() != appendList.size()) {
					id = productrDao.addUserCart(map);
					if (id > 0) {
						for (HashMap<String, Object> map1 : appendList) {
							map1.put("cartId", id);
							Long m = productrDao.addUserCartAppend(map1);
						}
					}
				} else {
					Integer count = 0;
					for (HashMap map2 : rlist) {
						for (HashMap map3 : appendList) {
							if (map2.get("append_id") == map3.get("appendId")) {
								count++;
							}
						}
					}
					if (count < rlist.size()) {
						id = productrDao.addUserCart(map);
						if (id > 0) {
							for (HashMap<String, Object> map1 : appendList) {
								map1.put("cartId", id);
								Long m = productrDao.addUserCartAppend(map1);
							}
						}
					}
				}
			}
		}
		return id;
	}

	@Override
	public Object findCartAppendItem(Long cartItemId) {
		return productrDao.findCartAppendItem(cartItemId);
	}

	@Override
	public Object addUserCartMenuI(HashMap<String, Object> map) {
		List<CartItem> CartItemList = productrDao.findCartItemCollection(map);
		Long id = 0L;
		if (CartItemList.size() == 0) {
			id = productrDao.addUserCart(map);
		} else {
			Boolean b = false;
			for (CartItem catiem : CartItemList) {
				List<HashMap> rlist = (java.util.List<HashMap>) productrDao
						.findCartAppendItem(catiem.getCartItemId());
				if (rlist.size() == 0) {
					b = true;
					break;
				}
			}
			if (b == false) {
				id = productrDao.addUserCart(map);
			}
		}
		return id;
	}

	@Override
	public Object findOrderAppendItem(Long orderItemId) {
		return productrDao.findOrderAppendItem(orderItemId);
	}

	@Override
	public Object findParentAppendName(HashMap param) {

		return productrDao.findParentAppendName(param);
	}

	@Override
	public Object findChildenAppendName(HashMap param) {
		return productrDao.findChildenAppendName(param);
	}

	@Override
	public Object findRecommendProduct(HashMap<String, Object> param) {
		return productrDao.findRecommendProduct(param);
	}

	@Override
	public synchronized Object creatOnceOrder(User user, Order order,
			HashMap<String, Object> map1,
			List<HashMap<String, Object>> appendList) {
		Long flowNo = productrDao.findOrderFlowNo(Commonparam
				.Date2ShortStr(new Date()));
		order.setFlowNo(String.valueOf(flowNo + 1L));
		productrDao.createUserOrdedr(order);
		Long orderId = productrDao.findOrdedId(order);

		OrderItem item = new OrderItem();
		item.setOrderId(orderId);
		item.setProductSkuId(Long.valueOf(map1.get("productSkuId").toString()));
		item.setProductId(Long.valueOf(map1.get("productId").toString()));
		item.setPrice(map1.get("price").toString());
		item.setQty(map1.get("qty").toString());

		item.setTotal(String.valueOf(Double.valueOf(map1.get("qty").toString())
				* Double.valueOf(map1.get("price").toString())));
		item.setCompanyShopProductId(Long.valueOf(map1.get(
				"companyShopProductId").toString()));
		item.setCompanyShopProductSkuId(Long.valueOf(map1.get(
				"companyShopProductSkuId").toString()));

		Long orderItemId = productrDao.createUserOrderItem(item);
		if (appendList != null && appendList.size() > 0) {
			for (HashMap<String, Object> map : appendList) {
				map.put("orderItemId", orderItemId);
				Float price = Float.valueOf(map.get("price").toString());
				Float qty = Float.valueOf(map.get("qty").toString());
				map.put("total", price * qty);
				System.out.println(JSONObject.fromObject(map));
				productrDao.addUserOrderAppend(map);
			}
		}

		OrderFlow orderFlow = new OrderFlow();
		orderFlow.setCreateDate(new Date());
		orderFlow.setOrderId(orderId);
		orderFlow.setStatusValue("创建订单");
		orderFlow.setUserId(order.getUserId());
		if (user.getRealname() != null
				&& user.getRealname().trim().length() > 0)
			orderFlow.setName(user.getRealname());
		else if (user.getEmail() != null && user.getEmail().trim().length() > 0)
			orderFlow.setName(user.getEmail());
		else if (user.getPhone() != null && user.getPhone().trim().length() > 0)
			orderFlow.setName(user.getPhone());
		Long flowid = productrDao.insertOrderFlow(orderFlow);

		return orderId;
	}

	@Override
	public String findProductSellCount(Long companyShopProductId) {
		
		return productrDao.findProductSellCount(companyShopProductId);
	}

	@Override
	public List<HashMap> findCooperatorShopByCompanyId(HashMap param) {
		return productrDao.findCooperatorShopByCompanyId(param);
	}

	@Override
	public Object findProductInfoById(Long productId) {
		return productrDao.findProductInfoById(productId);
	}

	@Override
	public List<UserCollection> findUserCollectionShop(HashMap map) {
		return productrDao.findUserCollectionShop(map);
	}

	@Override
	public List<HashMap> findProductCategoryFirstList(HashMap map) {
		return productrDao.findProductCategoryFirstList(map);
	}

	@Override
	public List<HashMap> findProductCategorySecondList(String categoryId) {
		return productrDao.findProductCategorySecondList(categoryId);
	}

	@Override
	public Object findProductListByCategoryIdCount(HashMap map) {
		return productrDao.findProductListByCategoryIdCount(map);
	}

	@Override
	public List<HashMap> findProductListByCategoryId(HashMap map) {
		return productrDao.findProductListByCategoryId(map);
	}

	@Override
	public Long saveOrderProductComment(HashMap map) {
		return productrDao.saveOrderProductComment(map);
	}

	@Override
	public Object findProductCommentCountByUserId(Long orderItemId,
			Long companyShopProductId, Long userId) {
		return productrDao.findProductCommentCountByUserId(orderItemId,
				companyShopProductId, userId);
	}

	@Override
	public List<HashMap> findCompanyShopTuiguang(Long companyShopId) {
		return productrDao.findCompanyShopTuiguang(companyShopId);
	}

	@Override
	public HashMap findShopNameAndDeliver(String companyShopId) {
		return productrDao.findShopNameAndDeliver(companyShopId);
	}

	public List<HashMap> findCompanyShopAreaByShopId(Long shopId) {
		return productrDao.findCompanyShopAreaByShopId(shopId);
	}

	@Override
	public Object findCategoryImagePath(String categoryId) {
		return productrDao.findCategoryImagePath(categoryId);
	}

	@Override
	public List<HashMap> findFirstPromoteProduct(HashMap map) {

		return productrDao.findFirstPromoteProduct(map);
	}

	@Override
	public List<HashMap> findProductByKeyword(HashMap map) {
		return productrDao.findProductByKeyword(map);
	}

	@Override
	public List<HashMap> findCompanyShopByKeyword(HashMap map) {
		return productrDao.findCompanyShopByKeyword(map);
	}

	@Override
	public Object findDepuShopCategory(HashMap param) {
		param.put("parentId", 0);
		List<HashMap> parentCategory = (List<HashMap>) productrDao
				.findDepuShopCategory(param);
		for (HashMap map : parentCategory) {
			param.remove("parentId");
			param.put("parentId", map.get("product_shop_category_id"));
			List<HashMap> childenCategory = (List<HashMap>) productrDao
					.findDepuShopCategory(param);
			map.put("childCate", childenCategory);
		}
		return parentCategory;
	}

	@Override
	public Object queryTheDepuProduct(HashMap param, Integer levelRank) {
		List<HashMap> productList = (List<HashMap>) productrDao
				.findParentDepuProductList(param);
		for (HashMap map : productList) {
			HashMap prodlist = (HashMap) productrDao.findDepuProductList(map);
			if(prodlist!=null&&prodlist.size()>0){
				Long productId = Long.valueOf(map.get("product_id").toString());
				prodlist.put("image", productrDao.findProductImage(productId));
				map.put("product", prodlist);
			}			
		}
		return productList;
	}

	@Override
	public List<HashMap> findAds(String type) {
		
		return productrDao.findAds(type);
	}

	@Override
	public Object findUserCartItemListCount(Long userId) {
		return productrDao.findUserCartItemListCount(userId);
	}

	@Override
	public Object findShopMonthCount(Object shopid) {
		return productrDao.findShopMonthCount(shopid);
	}

	@Override
	public Object findCompanyName(Long companyId) {
		
		return productrDao.findCompanyName(companyId);
	}

	@Override
	public HashMap findUserNickName(Long userId) {
		
		return productrDao.findUserNickName(userId);
	}

	@Override
	public Object findProductName(Object productId) {
		
		return productrDao.findProductName(productId);
	}

	@Override
	public Long findProductCommentCountByOrderid(Long orderId) {
		return productrDao.findProductCommentCountByOrderid(orderId);
	}

	@Override
	public Object findShopAreaList(Object shopId) {
		return productrDao.findShopAreaList(shopId);
	}

	@Override
	public String findCompanyDeliverOk(String companyShopId) {
		
		return productrDao.findCompanyDeliverOk(companyShopId);
	}

	@Override
	public synchronized long findOrderFlowNo(String date2ShortStr) {
		
		return productrDao.findOrderFlowNo(date2ShortStr);
	}

	@Override
	public Object findShopStatus() {
		// TODO Auto-generated method stub
		return productrDao.findShopStatus();
	}

	
	@Override
	public Object checkProduct(String productId, User user) {
		Integer msg=0;
		HashMap map=new HashMap();
		map.put("productId", productId);
		map.put("userId", user.getUserId());
		Integer cartNum=productrDao.checkCartOfUser(map);
		if(cartNum>0){
			msg=1;			
		}else{
			Integer orderNum=productrDao.checkOrderToUser(map);
			if(orderNum>0){
				msg=2;
			}
		}
		return msg;
	}

	@Override
	public List<HashMap> findProductSelectedSkuAttrAndAttrValueList(
			String companyShopProductSkuId) {
		// TODO Auto-generated method stub
		return productrDao.findProductSelectedSkuAttrAndAttrValueList(Long.valueOf(companyShopProductSkuId));
	}

	
}
