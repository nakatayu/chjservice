package com.chj.common;

public class TicketSouce implements Runnable {

	public void run() {
		for (int i = 0; i < 100; i++) {
			try {
				// 休眠1s秒中，为了使效果更明显，否则可能出不了效果
				Thread.sleep(100);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			this.sale();
		}
	}

	public synchronized void sale() {
//		String cart="[{\"qty\":\"1\",\"companyShopProductSkuId\":\"1706\",\"skuId\":\"1019\",\"price\":\"18.00\",\"oldPrice\":\"18.00\",\"name\":\"意大利香肠6寸三文治\",\"productId\":\"822\",\"companyShopProductId\":\"1137\",\"cartItemId\":0}]";
//		String data = HttpGetMsg
//				.postUrl(
//						"http://192.168.1.120:8080/chjservice/product!createOrder.action",
//						"cart="+cart+"&userId=8&shopId=215&areaId=112&sendType=1&address=2345&money=18&name=34567&payType=1&phone=15618221516&sendCost=0&info=");
//		System.out.println(Thread.currentThread().getName() + ":" + data);
		
		
		String data = HttpGetMsg
				.postUrl(
						"http://192.168.1.120:8080/chjservice/community!findHotActivityList.action",
						"page=1&size=10&order=desc&orderType=time");
		System.out.println(Thread.currentThread().getName() + ":" + data);
	}
}
