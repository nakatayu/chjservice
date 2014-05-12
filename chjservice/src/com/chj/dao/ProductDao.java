package com.chj.dao;

import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Repository;

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

@Repository
public class ProductDao extends BaseDao {

	public List<HashMap> findProductByFunction(HashMap<String, Object> param) {
		Object object = this.getSqlMapClientTemplate().queryForList(
				"Product.selTop4ProductByFunction", param);
		return (List<HashMap>) object;
	}

	public Object findSkuByShopProductId(Object shopProductId) {
		Object object = this.getSqlMapClientTemplate().queryForObject(
				"ProductSku.selSkuByShopProductId", shopProductId);
		return object;
	}

	public Object findProductImage(Object productId) {
		Object object = this.getSqlMapClientTemplate().queryForObject(
				"Product.selProductImage", productId);
		return object;
	}

	public List<HashMap> findRestaurantList(HashMap<String, Object> param) {
		Object object = this.getSqlMapClientTemplate().queryForList(
				"CompanyShop.selTop4RestaurantList", param);
		return (List<HashMap>) object;
	}

	public List<HashMap> findShopTagsByShopId(HashMap<String, Object> param) {
		Object object = this.getSqlMapClientTemplate().queryForList(
				"CompanyShop.selShopTagList", param);
		return (List<HashMap>) object;
	}

	public List<HashMap> findProductTuiguangList(HashMap<String, Object> param) {
		Object object = this.getSqlMapClientTemplate().queryForList(
				"Product.selProductTuiguangList", param);
		return (List<HashMap>) object;
	}

	public Object findProductTuiguangListCount(HashMap<String, Object> param) {
		Object object = this.getSqlMapClientTemplate().queryForObject(
				"Product.selProductTuiguangListCount", param);
		return object;
	}

	public List<HashMap> findProductByCategory() {
		Object object = this.getSqlMapClientTemplate().queryForList(
				"Product.selTop4ProductByCategory");
		return (List<HashMap>) object;
	}

	public List<HashMap> findProductByuserTag(User user) {
		Object object = this.getSqlMapClientTemplate().queryForList(
				"Product.selTop4ProductByUserTag", user.getUserId());
		return (List<HashMap>) object;
	}

	public Object findProductTagsByProductId(Object productId) {
		Object object = this.getSqlMapClientTemplate().queryForList(
				"Product.selProductTagList", productId);
		return object;
	}

	public Object findProductCommentCount(Object productId) {
		Object object = this.getSqlMapClientTemplate().queryForObject(
				"Product.selProductCommentCount", productId);
		return object;
	}

	public List<HashMap> findProductInterestList(HashMap<String, Object> param) {
		Object object = this.getSqlMapClientTemplate().queryForList(
				"Product.selProductByUserTag", param);
		return (List<HashMap>) object;
	}

	public Object findProductInterestListCount(HashMap<String, Object> param) {
		Object object = this.getSqlMapClientTemplate().queryForObject(
				"Product.selProductByUserTagCount", param);
		return object;
	}

	public List<HashMap> findBrandTop4List(HashMap<String, Object> param) {
		Object object = this.getSqlMapClientTemplate().queryForList(
				"Company.selBrandTop4List", param);
		return (List<HashMap>) object;
	}

	public Object findBrandMoreListCount(HashMap<String, Object> param) {

		Object object = this.getSqlMapClientTemplate().queryForObject(
				"Company.selBrandMoreListCount", param);
		return object;
	}

	public List<HashMap> findBrandMoreList(HashMap<String, Object> param) {
		Object object = this.getSqlMapClientTemplate().queryForList(
				"Company.selBrandMoreList", param);
		return (List<HashMap>) object;
	}

	public Object findRestarauntMoreListCount(HashMap<String, Object> param) {
		Object object = this.getSqlMapClientTemplate().queryForObject(
				"CompanyShop.selRestarauntMoreListCount", param);
		return object;
	}

	public List<HashMap> findRestarauntMoreList(HashMap<String, Object> param) {
		Object object = this.getSqlMapClientTemplate().queryForList(
				"CompanyShop.selRestarauntMoreList", param);
		return (List<HashMap>) object;
	}

	public Object findSendAreaList() {
		Object object = this.getSqlMapClientTemplate().queryForList(
				"CompanyShop.selectSendAreaList");
		return (List<HashMap>) object;
	}

	public Object findRestaraurantCategory() {
		Object object = this.getSqlMapClientTemplate().queryForList(
				"CompanyShop.selectRestaurauntCategory");
		return (List<HashMap>) object;
	}

	public Long findUserCollectObject(Long userId, Object objectId,
			int objectType) {
		HashMap map = new HashMap();
		map.put("userId", userId);
		map.put("objectId", objectId);
		map.put("type", objectType);

		Object object = this.getSqlMapClientTemplate().queryForObject(
				"UserCollection.selectUserCollectionResta", map);
		return (Long) object;
	}

	public CompanyShop findRestarauntDetail(String companyShopId) {

		Object object = this.getSqlMapClientTemplate().queryForObject(
				"CompanyShop.selectShopById", Long.valueOf(companyShopId));
		return (CompanyShop) object;
	}

	public String findCategoryName(Long categoryId) {
		Object object = this.getSqlMapClientTemplate().queryForObject(
				"Product.selectShopCategoryName", categoryId);
		return (String) object;
	}

	public Object findShopAreaByShopId(Long companyShopId) {
		Object object = this.getSqlMapClientTemplate().queryForList(
				"Product.selectShopAreaList", companyShopId);
		return object;
	}

	public List<HashMap> findRestarauntProductCategory(String companyShopId, long companyId) {
		HashMap map = new HashMap();
		map.put("companyShopId", Long.valueOf(companyShopId));
		map.put("companyId", companyId);
		Object object = this.getSqlMapClientTemplate().queryForList(
				"Product.selectRestarauntProductCategory", map);
		return (List<HashMap>) object;
	}

	public List<HashMap> findProductByShopSelfCategory(
			Object shopSelfCategoryId, String companyShopId, long companyId) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("shopSelfCategoryId", shopSelfCategoryId);
		param.put("companyShopId", companyShopId);
		param.put("companyId", companyId);
		
		Object object = this.getSqlMapClientTemplate().queryForList(
				"Product.selectProductByShopSelfCategory", param);
		return (List<HashMap>) object;
	}

	public CartItem findUserCartItem(HashMap<String, Object> map) {
		Object object = this.getSqlMapClientTemplate().queryForObject(
				"CartItem.selectUserCartItem", map);
		return (CartItem) object;
	}

	public Object updateUserCartCount(HashMap map) {
		Object object = this.getSqlMapClientTemplate().update(
				"CartItem.updateUserCartCount", map);
		return 1;
	}

	public Long addUserCart(HashMap<String, Object> map) {
		Object object = this.getSqlMapClientTemplate().insert(
				"CartItem.insertUserCart", map);
		return (Long) object;
	}

	public HashMap findProductSkuInfo(Object productSkuId) {
		Object object = this.getSqlMapClientTemplate().queryForObject(
				"Product.selectProductSkuInfo",
				Long.valueOf(productSkuId.toString()));
		return (HashMap) object;
	}

	public List<HashMap> findUserCartShopList(Long userId) {
		// select distinct shop_id from tb_cart_item where user_id=8
		Object object = this.getSqlMapClientTemplate().queryForList(
				"CartItem.selectUserCartShop", userId);
		return (List<HashMap>) object;
	}

	public Object findUserCartItemListCount(Long userId) {
		// select distinct shop_id from tb_cart_item where user_id=8
		Object object = this.getSqlMapClientTemplate().queryForObject(
				"CartItem.findUserCartItemListCount", userId);
		return object;
	}

	public Object findProductSku(Long companyShopProductSkuId) {
		Object object = this.getSqlMapClientTemplate().queryForObject(
				"ProductSku.selProductSkuById", companyShopProductSkuId);
		return object;
	}

	public HashMap findProductCartInfo(Long productId) {
		Object object = this.getSqlMapClientTemplate().queryForObject(
				"Product.selectProductCartInfo", productId);
		return (HashMap) object;
	}

	public List<CartItem> findCartItem(HashMap map) {
		Object object = this.getSqlMapClientTemplate().queryForList(
				"CartItem.selectCartItemList", map);
		return (List<CartItem>) object;
	}

	public Long createUserOrdedr(Order order) {
		Object object = this.getSqlMapClientTemplate().insert(
				"Order.insertOrder", order);

		return (Long) object;
	}

	public Long createUserOrderItem(OrderItem item) {

		Object object = this.getSqlMapClientTemplate().insert(
				"OrderItem.insertOrderItem", item);
		return (Long) object;
	}

	public int reduceProductStock(OrderItem item) {
		int rt = this.getSqlMapClientTemplate().update(
				"OrderItem.reduceProductStock", item);
		return rt;
	}

	public HashMap findShopPayTypeAndisDeliver(String companyShopId) {
		Object object = this.getSqlMapClientTemplate().queryForObject(
				"CompanyShop.selectShopPayTypeAndisDeliver",
				Long.valueOf(companyShopId));
		return (HashMap) object;
	}

	public List<Order> findUserOrderList(HashMap<String, Object> param) {
		Object object = this.getSqlMapClientTemplate().queryForList(
				"Order.selectUserOrderList", param);
		return (List<Order>) object;
	}

	public Object findUserOrderListCount(HashMap<String, Object> param) {
		Object object = this.getSqlMapClientTemplate().queryForObject(
				"Order.selectUserOrderListCount", param);
		return object;
	}

	public List<OrderItem> findUserOrderItem(Long orderId) {
		Object object = this.getSqlMapClientTemplate().queryForList(
				"OrderItem.selectOrderItem", orderId);
		return (List<OrderItem>) object;
	}

	public String findShopName(Long shopId) {
		Object object = this.getSqlMapClientTemplate().queryForObject(
				"CompanyShop.selectShopName", shopId);
		return (String) object;
	}

	public int cancelUserOrder(HashMap<String, Object> map) {
		Object object = this.getSqlMapClientTemplate().update(
				"Order.cancelUserOrder", map);
		return Integer.valueOf(object.toString());
	}

	public Long insertOrderFlow(OrderFlow orderFlow) {

		Object object = this.getSqlMapClientTemplate().insert(
				"OrderFlow.insertOrderFlow", orderFlow);
		return (Long) object;
	}

	public List<OrderFlow> findOrderFlow(String orderId) {
		Object object = this.getSqlMapClientTemplate().queryForList(
				"OrderFlow.selectOrderFlow", Long.valueOf(orderId));
		return (List<OrderFlow>) object;
	}

	public Object findOrderById(String orderId) {
		Object object = this.getSqlMapClientTemplate().queryForObject(
				"Order.selectOrderById", Long.valueOf(orderId));
		return object;
	}

	public List<OrderComment> findOrderComment(String orderId) {
		Object object = this.getSqlMapClientTemplate().queryForList(
				"OrderComment.selectOrderComment", Long.valueOf(orderId));
		return (List<OrderComment>) object;
	}

	public Object saveOrderComment(OrderComment orderComment) {
		Object object = this.getSqlMapClientTemplate().insert(
				"OrderComment.insertOrderComment", orderComment);
		return (Long) object;
	}

	public Object cancelCarProduct(JSONObject param, Long userId) {

		HashMap<String, Object> ids = new HashMap<String, Object>();
		ids.put("userId", userId);
		ids.put("skuId", Long.valueOf(param.getString("skuId")));
		ids.put("shopId", Long.valueOf(param.getString("shopId")));
		ids.put("productId", Long.valueOf(param.getString("productId")));
		ids.put("cartItemId", Long.valueOf(param.getString("cartItemId")));
		Object object = this.getSqlMapClientTemplate().delete(
				"CartItem.cancelCarProduct", ids);
		return object;
	}

	public Product findProductDetail(String productId) {
		Object object = this.getSqlMapClientTemplate().queryForObject(
				"Product.selectProductDetail", Long.valueOf(productId));
		return (Product) object;
	}

	public List<HashMap> findnearbyShop(HashMap param) {
		Object list = this.getSqlMapClientTemplate().queryForList(
				"CompanyShop.findnearbyShop", param);
		return (List<HashMap>) list;
	}

	public List<String> findProductImageList(Long productId) {
		Object list = this.getSqlMapClientTemplate().queryForList(
				"Product.findProductImageList", productId);
		return (List<String>) list;
	}

	public Object findCompanyShopInfo(String companyShopId) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Product.findCompanyShopImage", Long.valueOf(companyShopId));

		return obj;
	}

	public List<ProductAttribute> findAllAttrList(String companyShopProductId) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"ProductAttribute.searchProductAttribute",
				Long.valueOf(companyShopProductId));
		return (List<ProductAttribute>) obj;
	}

	public List<CompanyShopProductSku> findAllSkuList(
			String companyShopProductId) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"CompanyShopProductSku.selectCompanyShopProductSku",
				Long.valueOf(companyShopProductId));
		return (List<CompanyShopProductSku>) obj;
	}

	public List<Long> findAttributeValueId(Long productSkuId) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"CompanyShopProductSku.selectProductAttributeValueIdList",
				productSkuId);
		return (List<Long>) obj;
	}

	public ProductSku findProductSkuById(Long productSkuId) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"ProductSku.findProductSkuById", productSkuId);
		return (ProductSku) obj;
	}

	public List<HashMap> loadProductComment(HashMap<String, Object> param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Product.findProductComment", param);
		return (List<HashMap>) obj;
	}

	public List<HashMap> findnearbyShopArea(Object object) {
		Object list = this.getSqlMapClientTemplate().queryForList(
				"CompanyShop.findnearbyShopArea", object);

		return (List<HashMap>) list;
	}

	public Long findnearbyShopCount(HashMap<String, Object> param) {
		Long lon = (Long) this.getSqlMapClientTemplate().queryForObject(
				"CompanyShop.findnearbyShopCount", param);
		return lon;
	}

	public HashMap findnearbyShop1(HashMap<String, Object> param) {
		HashMap lon = (HashMap) this.getSqlMapClientTemplate().queryForObject(
				"CompanyShop.findnearbyShop1", param);
		return lon;
	}

	public List<HashMap> findRestarauntMapList(HashMap<String, Object> param) {

		Object lon = this.getSqlMapClientTemplate().queryForList(
				"CompanyShop.findRestarauntMapList", param);
		return (List<HashMap>) lon;
	}

	public Object findRestarauntMapListCount(HashMap<String, Object> param) {

		Object lon = this.getSqlMapClientTemplate().queryForObject(
				"CompanyShop.findRestarauntMapListCount", param);
		return lon;
	}

	public List<HashMap> findCategoryFirstList() {
		Object lon = this.getSqlMapClientTemplate().queryForList(
				"CompanyShop.findCategoryFirstList");
		return (List<HashMap>) lon;
	}

	public Object findSelfMadeProduct(HashMap param) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Product.findSelfMadeProduct", param);
		return obj;
	}

	public List<HashMap> findAttrValSku(HashMap param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Product.findAttrValSku", param);
		return (List<HashMap>) obj;
	}

	public List<HashMap> findAppendNameVal(HashMap param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Product.findAppendNameVal", param);
		return (List<HashMap>) obj;
	}

	public List<HashMap> findAppNamValAttr(HashMap param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Product.findAppNamValAttr", param);
		return (List<HashMap>) obj;
	}

	public List<HashMap> findSBUXProductCategory(HashMap param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Product.findSBUXProductCategory", param);
		return (List<HashMap>) obj;
	}

	public List<HashMap> findSBUXProductInfo(HashMap param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Product.findSBUXProductInfo", param);
		return (List<HashMap>) obj;
	}

	public Long addUserCartAppend(HashMap<String, Object> map) {
		Object obj = this.getSqlMapClientTemplate().insert(
				"CartItem.addUserCartAppend", map);
		return (Long) obj;
	}

	public Object findCartAppendItem(Long cartItemId) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"CartItem.findCartAppendItem", cartItemId);
		return (List<HashMap>) obj;
	}

	public List<CartItem> findCartItemCollection(HashMap<String, Object> map) {
		List<CartItem> obj = this.getSqlMapClientTemplate().queryForList(
				"CartItem.selectUserCartItem", map);
		return obj;
	}

	public Object addUserOrderAppend(HashMap<String, Object> map) {
		Long t = (Long) this.getSqlMapClientTemplate().insert(
				"OrderItem.addUserOrderAppend", map);
		return t;
	}

	public Object findOrderAppendItem(Long orderItemId) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"OrderItem.findOrderAppendItem", orderItemId);
		return (List<HashMap<String, Object>>) obj;
	}

	public Object findParentAppendName(HashMap param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Product.findParentAppendName", param);
		return (List<HashMap<String, Object>>) obj;
	}

	public Object findChildenAppendName(HashMap param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Product.findChildenAppendName", param);
		return (List<HashMap<String, Object>>) obj;
	}

	public Object findRecommendProduct(HashMap<String, Object> param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Product.findRecommendProduct", param);
		return (List<HashMap>) obj;
	}

	private Object findShopNameDeliverMoney(Long val) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Product.shopNameDeliver", val);
		return (HashMap) obj;
	}

	public void deleteCartItemInfo(Long cartItemId) {
		this.getSqlMapClientTemplate().delete("CartItem.deleteCartAppend",
				cartItemId);
		this.getSqlMapClientTemplate().delete("CartItem.deleteCartItem",
				cartItemId);
	}

	public String findProductSellCount(Long companyShopProductId) {
		Object obh = this.getSqlMapClientTemplate().queryForObject(
				"Product.selectSumProductSell", companyShopProductId);
		return (String) obh;
	}

	public List<HashMap> findCooperatorShopByCompanyId(HashMap param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"CompanyShop.selCooperatorShopByCompanyId", param);
		return (List<HashMap>) obj;
	}

	// name,browse_count as browseCount
	public Object findProductInfoById(Long productId) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Product.findProductInfoById", productId);
		return obj;
	}

	public List<UserCollection> findUserCollectionShop(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"CompanyShop.selectUserCollectionShop", map);
		return (List<UserCollection>) obj;
	}

	public List<HashMap> findProductCategoryFirstList(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Product.selectProductCategoryFirst", map);
		return (List<HashMap>) obj;
	}

	public List<HashMap> findProductCategorySecondList(String categoryId) {
		Object obj = this.getSqlMapClientTemplate()
				.queryForList("Product.selectProductCategorySecond",
						Long.valueOf(categoryId));
		return (List<HashMap>) obj;
	}

	public List<HashMap> findProductListByCategoryId(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Product.selectProductListByCategoryId", map);
		return (List<HashMap>) obj;
	}

	public Object findProductListByCategoryIdCount(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Product.selectProductListByCategoryIdCount", map);
		return obj;
	}

	public Long saveOrderProductComment(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().insert(
				"Product.saveOrderProductComment", map);
		return 1L;
	}

	public Object findProductCommentCountByUserId(Long orderItemId,
			Long companyShopProductId, Long userId) {
		HashMap map = new HashMap();
		map.put("companyShopProductId", companyShopProductId);
		map.put("userId", userId);
		map.put("orderItemId", orderItemId);

		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Product.selProductCommentCountByUserId", map);
		return obj;
	}

	public List<HashMap> findCompanyShopTuiguang(Long companyShopId) {
		HashMap map = new HashMap();
		map.put("companyShopId", companyShopId);

		List<HashMap> obj = (List<HashMap>) this.getSqlMapClientTemplate()
				.queryForList("Product.selectCompanyShopTuiguang", map);
		if (obj.size() == 0) {
			obj = (List<HashMap>) this.getSqlMapClientTemplate().queryForList(
					"Product.selectCompanyShopTuiguangOther", map);
		}
		return (List<HashMap>) obj;
	}

	public HashMap findShopNameAndDeliver(String companyShopId) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Product.findShopNameAndDeliver", Long.valueOf(companyShopId));
		return (HashMap) obj;
	}

	public List<HashMap> findCompanyShopAreaByShopId(Long shopId) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Product.selectShopAreaList", shopId);
		return (List<HashMap>) obj;
	}

	public Object findCategoryImagePath(String categoryId) {
		Object obj = this.getSqlMapClientTemplate()
				.queryForObject("Product.selectCategoryImagePathById",
						Long.valueOf(categoryId));
		return obj;
	}

	public List<HashMap> findFirstPromoteProduct(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"CompanyShopProductSku.findFirstPromoteProduct");
		return (List<HashMap>) obj;
	}

	public Long findOrdedId(Order order) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Order.findOrdedId", order);
		return (Long) obj;
	}

	public List<HashMap> findProductByKeyword(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Product.findProductByKeyword", map);
		return (List<HashMap>) obj;
	}

	public List<HashMap> findCompanyShopByKeyword(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Product.findCompanyShopByKeyword", map);
		return (List<HashMap>) obj;
	}

	public Long findOrderFlowNo(String orderDay) {
		// 查询当天的订单编号
		Object o = this.getSqlMapClientTemplate().queryForObject(
				"Order.findOrderFlowNo", orderDay);
		if (o == null) {
			o = orderDay.replace("-", "") + "0000000";
		}
		return Long.valueOf(o.toString());
	}

	public Object findDepuShopCategory(HashMap param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"DepuGoods.findTheCategory", param);
		return (List<HashMap>) obj;
	}

	public Object findParentDepuProductList(HashMap param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"DepuGoods.findParentProductList", param);
		return (List<HashMap>) obj;
	}

	public Object findDepuProductList(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"DepuGoods.findProductSkuList", map);
		return obj;
	}

	public Integer findCompanyShopProductSkuStock(Long companyShopProductSkuId) {

		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"CompanyShopProductSku.findCompanyShopProductSkuStock",
				companyShopProductSkuId);
		if (obj == null)
			return 0;
		return Double.valueOf(obj.toString()).intValue();
	}

	public List<HashMap> findAds(String type) {
		HashMap map = new HashMap();
		map.put("type", type);

		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Product.findAds", map);
		return (List<HashMap>) obj;
	}

	public Object findShopMonthCount(Object shopid) {

		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Order.selectShopMonthCount", Long.valueOf(shopid.toString()));
		return obj;
	}

	public Object findCompanyName(Long companyId) {
		
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Company.findCompanyNamePic", companyId);
		return obj;
	}

	public HashMap findUserNickName(Long userId) {
		
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"User.findUserNickName", userId);
		return (HashMap) obj;
	}

	public Object findProductName(Object productId) {
		
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"Product.findProductName", productId);
		return obj;
	}

	public Long findProductCommentCountByOrderid(Long orderId) {
		
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"OrderItem.findProductCommentCountByOrderid", orderId);
		return (Long) obj;
	}

	public Object findShopAreaList(Object shopId) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"CompanyShop.findShopAreaList", shopId);
		return obj;
	}

	public String findCompanyDeliverOk(String companyShopId) {
		
		Object obj = this.getSqlMapClientTemplate()
				.queryForObject("CompanyShop.findCompanyDeliverOk",
						Long.valueOf(companyShopId));
		return (String) obj;
	}

	public Integer checkCartOfUser(HashMap map) {
		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				"CartItem.checkCartOfUser", map);
	}
	public Object findShopStatus() {
		
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"Product.findShopStatus");
		return  obj;
	}

	public Integer checkOrderToUser(HashMap map) {
		
		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				"CartItem.checkOrderToUser", map);
	}

	public List<HashMap> findProductSelectedSkuAttrAndAttrValueList(Long companyShopProductSkuId) {
		// TODO Auto-generated method stub
		return (List<HashMap>) this.getSqlMapClientTemplate().queryForList(
				"ProductSku.findProductSelectedSkuAttrAndAttrValueList", companyShopProductSkuId);
	}

	public List<HashMap> findUserCartShopIdsList(Long userId) {
		// TODO Auto-generated method stub
		return (List<HashMap>) this.getSqlMapClientTemplate().queryForList(
				"CartItem.findUserCartShopIdsList", userId);
	}

	public HashMap findUserCartShopInfo(Long shopId) {
		return (HashMap) this.getSqlMapClientTemplate().queryForObject(
				"CartItem.findUserCartShopInfo", shopId);
	}

}
