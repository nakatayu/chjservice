package com.chj.util;

public class StaticConstant {
	// 验证结果
	/**
	 * 验证失败
	 */
	public static final String ISVERIFY_FALSE = "F";
	/**
	 * 验证成功
	 */
	public static final String ISVERIFY_TRUE = "T";

	public static final String SEX_MAN = "M";// 男
	public static final String SEX_WOMAN = "W";// 女
	public static final String BLOOD_A = "A";// 血型 A
	public static final String BLOOD_B = "B";// 血型 B
	public static final String BLOOD_AB = "AB";// 血型 AB
	public static final String BLOOD_O = "O";// 血型 O

	// 订单状态
	/**
	 * 创建订单 订单刚创建 没有任何操作的初始状态
	 */
	public static final String ORDER_CREATED = "C";
	/**
	 * 订单接收 卖家确认订单 代表订单被卖家接收
	 */
	public static final String ORDER_VERIFY_TRUE = "V";
	/**
	 * 拒绝订单 代表卖家拒绝这张订单
	 */
	public static final String ORDER_VERIFY_FALSE = "F";

	public static final String TRUE = "T";
	public static final String FALSE = "F";

	/**
	 * C:促销商品,T:推广商品,W:无
	 */
	public static final String[] FUNCTION_TYPE = new String[] { "C", "T","W" };
	/**
	 * 送达时间 15分钟，30分钟，1小时，指定送达时间
	 */
	public static final int[] SEND_TIME = new int[] { 1, 2, 3, 4 };
	public static final String[] SEND_TIME_VALUE = new String[] { "15分钟",
			"30分钟", "1小时", "指定送达时间" };
	/**
	 * 人均消费 0-10元，10-15元，15-20元,20-25元,25-30元,30元以上
	 */
	public static final int[] COMSUME_PER = new int[] { 10, 15, 20, 25, 30, 31 };
	public static final String[] COMSUME_PER_VALUE = new String[] { "0-10元",
			"10-15元", "15-20元", "20-25元", "25-30元", "30元以上" };
	/**
	 * 起送价 10元，15元，20元，25元,30元，30元以上
	 */
	public static final int[] SEND_START = new int[] { 10, 15, 20, 25, 30, 31 };
	/**
	 * 支付类型 1到店支付，2货到付款(现金)，3货到付款(一卡通)，4货到付款(银行卡)，5线上支付(一卡通)，6线上支付(银行卡)
	 */
	public static final int[] PAY_TYPE = new int[] { 1, 2, 3, 4, 5, 6 };
	public static final String[] PAY_TYPE_VALUE = new String[] { "到店支付",
			"货到付款(现金)", "货到付款(一卡通)", "货到付款(银行卡)", "线上支付(一卡通)", "线上支付(银行卡)" };

	/**
	 * 商品状态 1: 上架 2：下架
	 */
	public static final int[] PRODUCT_STATUS = new int[] { 1, 2 };
	/**
	 * 对象分类,收藏表中的type 1:店铺 2:圈子3：活动4话题 5：商品 6服务信息(共享漕河泾) 7:企业
	 */
	public static final int[] OBJECT_TYPE = new int[] { 1, 2, 3, 4, 5,6,7};
	/**
	 * 0线上 1 线下
	 */
	public static final int[] ONLIONE = new int[] { 0, 1 };
	/**
	 * T预定中 F不在服务时间内
	 */
	public static final String[] IS_WORK = new String[] { "T", "F" };
	/**
	 * 订单状态 1未处理/未提货2已接受3拒绝4配送中5交易完成6已取消
	 */
	public static final int[] ORDER_STATUS = new int[] { 1, 2, 3, 4, 5, 6 };
	/**
	 * 送货类型 1送货 2自取
	 */
	public static final int[] ORDER_SEND_TYPE = new int[] { 1, 2 };
	/**
	 * 1未付款 2已付款
	 */
	public static final int[] ORDER_PAY_STATUS = new int[] { 1, 2 };
	/**
	 * 圈子等级   1 人数《=50 2  人数《=200 3 人数《=500 4人数《=1000 5人数《=3000
	 */
	public static final int[] CIRCLE_LEVEL = new int[] { 1, 2,3,4,5};
	/**
	 * 圈子状态  1创建待审核2修改申请3升级申请4申请关闭
	 */
	public static final int[] CIRCLE_STATUS = new int[] { 1, 2,3,4};
	
	/**  圈子用户
	 *   1待审核2未通过3通过4退出5踢出
	 */
	public static final int[] CIRCLE_USER_STATUS = new int[] { 1, 2,3,4,5};
	/**
	 * 0普通，1管理员
	 */
	public static final int[] CIRCLE_USER_ROLE = new int[] { 0,1};
	/**
	 * 圈子类型 1企业2普通
	 */
	public static final int[] CIRCLE_TYPE = new int[] { 1, 2};
	/**
	 * 活动类型 1订票  2普通
	 */
	public static final int[] ACTIVITY_TYPE = new int[] { 1, 2};
	/** 
	 * 活动状态  1创建待审核2修改申请3申请关闭
	 */
	public static final int[] ACTIVITY_STATUS = new int[] { 1,2,3};
	/**
	 * 1 审核通过2审核不通过3待审核
	 */
	public static final int[] EXAMINE_RESULT = new int[] { 1,2,3};
	/**  活动用户
	 *   1待审核2未通过3通过4退出5踢出
	 */
	public static final String[] ACTIVITY_USER_STATUS = new String[] {"1","2","3","4","5"};
	
	/**
	 *  话题状态:1创建待审核2修改申请
	 */
	public static final int[] TOPIC_STATUS = new int[] { 1, 2};
	
	//1待审核2未通过3通过4退出5踢出
	public static final String[] ACTIVITY_ERROR = new String[]{"非活动成员不能进行此操作!","尚未审核通过,不能进行此操作!","尚未审核通过,不能进行此操作!","审核通过!","您已退出该活动!","您已被踢出该活动!"};
	
	//1待审核2未通过3通过4退出5踢出
	public static final String[] CIRCLE_ERROR = new String[]{"非活圈子成员不能进行此操作!","尚未审核通过,不能进行此操作!","尚未审核通过,不能进行此操作!","审核通过!","您已退出该圈子!","您已被踢出该圈子!"};
	/**
	 * 长寿国旅机票接口参数
	 */
	public static final String[] TICKET_TYPE={"initSearchFlight","queryTaItinerary","queryTempTravller"};
}
