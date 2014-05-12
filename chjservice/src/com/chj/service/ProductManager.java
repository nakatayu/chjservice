package com.chj.service;

import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONArray;

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

public interface ProductManager {

	List<HashMap> findProductByFunction(HashMap<String, Object> param);

	Object findSkuByShopProductId(Object shopProductId);

	Object findProductImage(Object object);

	List<HashMap> findRestaurantList(HashMap<String, Object> param);

	List<HashMap> findShopTagsByShopId(HashMap<String, Object> param);

	List<HashMap> findProductTuiguangList(HashMap<String, Object> param);

	Object findProductTuiguangListCount(HashMap<String, Object> param);

	List<HashMap> findProductByCategory();

	List<HashMap> findProductByuserTag(User user);

	Object findProductTagsByProductId(Object productId);

	Object findProductCommentCount(Object productId);

	List<HashMap> findProductInterestList(HashMap<String, Object> param);

	Object findProductInterestListCount(HashMap<String, Object> param);

	List<HashMap> findBrandTop4List(HashMap<String, Object> param);

	List<HashMap> findBrandMoreList(HashMap<String, Object> param);

	Object findBrandMoreListCount(HashMap<String, Object> param);

	List<HashMap> findRestarauntMoreList(HashMap<String, Object> param);

	Object findRestarauntMoreListCount(HashMap<String, Object> param);

	Object findSendAreaList();

	Object findRestaraurantCategory();

	Long findUserCollectObject(Long userId, Object object, int objectType);

	CompanyShop findRestarauntDetail(String companyShopId);

	String findCategoryName(Long categoryId);
	/**
	 * 店铺的配送区域
	 * @param companyShopId
	 * @return
	 */
	Object findShopAreaByShopId(Long companyShopId);

	List<HashMap> findRestarauntProductCategory(String companyShopId, long companyId);

	List<HashMap> findProductByShopSelfCategory(Object shopSelfCategoryId, String companyShopId, long companyId);

	CartItem findUserCartItem(HashMap<String, Object> map);

	Long addUserCart(HashMap<String, Object> map);
	
	HashMap findProductSkuInfo(Object object);

	List<HashMap> findUserCartShopList(Long userId);

	Object findProductSku(Long companyShopProductSkuId);

	List<CartItem> findCartItem(HashMap map);

	HashMap findProductCartInfo(Long productId);

	Long createUserOrdedr(User user,Order order, JSONArray cartArray);

	HashMap findShopPayTypeAndisDeliver(String companyShopId);

	List<Order> findUserOrderList(HashMap<String, Object> param);

	List<OrderItem> findUserOrderItem(Long orderId);

	String findShopName(Long shopId);

	Object findUserOrderListCount(HashMap<String, Object> param);

	int cancelUserOrder(HashMap<String, Object> map);

	List<OrderFlow> findOrderFlow(String orderId);

	Object findOrderById(String orderId);

	List<OrderComment> findOrderComment(String orderId);

	void saveOrderComment(OrderComment orderComment);

	void cancelCarProduct(Long userId,String cart);
	Product findProductDetail(String productId);
	List<HashMap> findnearbyShop(HashMap param);

	List<String> findProductImageList(Long productId);

	Object findCompanyShopInfo(String companyShopProductId);

	List<ProductAttribute> findAllAttrList(String productId);

	List<CompanyShopProductSku> findAllSkuList(String companyShopProductId);

	List<Long> findAttributeValueId(Long productSkuId);
	/**
	 * 通主键Id获取
	 * @param productSkuId
	 * @return
	 */
	ProductSku findProductSkuById(Long productSkuId);

	List<HashMap> loadProductComment(HashMap<String, Object> param);
	List<HashMap> findnearbyShopArea(Object object);

	Long findnearbyShopCount(HashMap<String, Object> param);

	HashMap findnearbyShop1(HashMap<String, Object> param);

	List<HashMap> findRestarauntMapList(HashMap<String, Object> param);

	Object findRestarauntMapListCount(HashMap<String, Object> param);

	List<HashMap> findCategoryFirstList();

	Object findSelfMadeProduct(HashMap param);

	List<HashMap> findAttrValSku(HashMap param);

	List<HashMap> findAppendNameVal(HashMap param);

	List<HashMap> findAppNamValAttr(HashMap param);

	List<HashMap> findSBUXProductCategory(HashMap param);

	List<HashMap> findSBUXProductInfo(HashMap param);

	Object addUserCartMenu(HashMap<String, Object> map,
			List<HashMap<String, Object>> list);

	Object findCartAppendItem(Long cartItemId);

	Object addUserCartMenuI(HashMap<String, Object> map);

	Object findOrderAppendItem(Long orderItemId);

	Object findParentAppendName(HashMap param);

	Object findChildenAppendName(HashMap param);

	Object findRecommendProduct(HashMap<String, Object> param);

	Object creatOnceOrder(User user, Order order, HashMap<String, Object> map,
			List<HashMap<String, Object>> appendList);

	String findProductSellCount(Long companyShopProductId);

    List<HashMap> findCooperatorShopByCompanyId(HashMap<String, Object> param);

	Object findProductInfoById(Long productId);

	List<UserCollection> findUserCollectionShop(HashMap map);

	List<HashMap> findProductCategoryFirstList(HashMap map);

	List<HashMap> findProductCategorySecondList(String categoryId);

	List<HashMap> findProductListByCategoryId(HashMap map);

	Object findProductListByCategoryIdCount(HashMap map);

	Long saveOrderProductComment(HashMap map);

	Object findProductCommentCountByUserId(Long orderItemId,Long companyShopProductId,
			Long userId);

	List<HashMap> findCompanyShopTuiguang(Long companyShopId);
	
    List<HashMap> findCompanyShopAreaByShopId(Long shopId);

	HashMap findShopNameAndDeliver(String companyShopId);

	Object findCategoryImagePath(String categoryId);

	List<HashMap> findFirstPromoteProduct(HashMap map);

	List<HashMap> findProductByKeyword(HashMap map);

	List<HashMap> findCompanyShopByKeyword(HashMap map);

	Object findDepuShopCategory(HashMap param);

	Object queryTheDepuProduct(HashMap param, Integer levelRank);

	List<HashMap> findAds(String type);

	Object findUserCartItemListCount(Long userId);

	Object findShopMonthCount(Object shopid);

	Object findCompanyName(Long companyId);

	HashMap findUserNickName(Long userId);

	Object findProductName(Object object);

	Long findProductCommentCountByOrderid(Long orderId);

	Object findShopAreaList(Object shopId);

	String findCompanyDeliverOk(String companyShopId);

	long findOrderFlowNo(String date2ShortStr);

	Object checkProduct(String productId, User user);

	Object findShopStatus();

	List<HashMap> findProductSelectedSkuAttrAndAttrValueList(
			String companyShopProductSkuId);

	
}
