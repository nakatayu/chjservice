package com.chj.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;

import com.sand.crypto.SandOrder;
import com.sand.crypto.SandUser;
import com.sand.crypto.SandVersion;
import com.sand.crypto.pay.SandPayUtil;

public class HttpConnectUtil {

	private static final String sign_one = "824671395";
	private static final String sign_two = "571398246";

	public static String CreateOrderSign(String merchant_id, String str) {
		SandPayUtil sandpay = new SandPayUtil(false);
		String sign = null;
		boolean r = sandpay
				.LoadKeyFile(
						merchant_id,
						"D:/tomcat/shandCardSign/PK_888002148160001_20121017170124.cer",
						"D:/tomcat/shandCardSign/PBK_SAND_20110225151631.cer");
		if (r) {
			sign = sandpay.signature(str, SandPayUtil.SD_SIGNTYPE_MD5RSA);
		}
		return sign;
	}

	// MD5加密
	public static String Md5(String plainText) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(plainText.getBytes("UTF-8"));
			byte b[] = md.digest();
			int i;
			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}

			return buf.toString().toUpperCase();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String getPostConnect(String post, String url) {
		URL u = null;
		HttpURLConnection con = null;
		try {
			u = new URL(url);
			con = (HttpURLConnection) u.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setUseCaches(false);
			con.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");
			con.connect();
			OutputStreamWriter osw = new OutputStreamWriter(
					con.getOutputStream(), "utf-8");
			osw.write(post);
			osw.flush();
			osw.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				con.disconnect();
			}
		}
		// 读取返回内容
		StringBuffer buffer = new StringBuffer();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(
					con.getInputStream(), "utf-8"));
			String temp = null;
			while ((temp = br.readLine()) != null) {
				buffer.append(temp);
				buffer.append("\n");
			}
		} catch (Exception e) {
			BufferedReader br;
			try {
				br = new BufferedReader(new InputStreamReader(
						con.getErrorStream(), "utf-8"));
				String temp;
				while ((temp = br.readLine()) != null) {
					buffer.append(temp);
					buffer.append("\n");
				}
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return buffer.toString();
	}

	public static String getGetConnect(String url) {

		URL u = null;
		HttpURLConnection con = null;
		try {
			u = new URL(url);
			con = (HttpURLConnection) u.openConnection();
			con.setRequestMethod("GET");
			con.connect();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				con.disconnect();
			}
		}
		// 读取返回内容
		StringBuffer buffer = new StringBuffer();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(
					con.getInputStream(), "utf-8"));
			String temp = null;
			while ((temp = br.readLine()) != null) {
				buffer.append(temp);
				buffer.append("\n");
			}
		} catch (Exception e) {
			BufferedReader br;
			try {
				br = new BufferedReader(new InputStreamReader(
						con.getErrorStream(), "utf-8"));
				String temp;
				while ((temp = br.readLine()) != null) {
					buffer.append(temp);
					buffer.append("\n");
				}
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return buffer.toString();
	}

	public static String createUserSign(SandUser user, SandVersion ver) {
		String sign1 = createUserSign1(user, ver.getBusiness_type());
		String sign=CreateUserSign(ver,sign1);
		return sign;
	}

	private static String CreateUserSign(SandVersion s, String sign1) {
		
		StringBuffer sb2 = new StringBuffer();
		sb2.append("version=").append(s.getVersion()).append("&");
		sb2.append("charset=").append(s.getCharset()).append("&");
		sb2.append("access_number=").append(s.getAccess_number()).append("&");
		sb2.append("access_time=").append(s.getAccess_time()).append("&");
		sb2.append("access_type=").append(s.getAccess_type()).append("&");
		sb2.append("access_ip=").append(s.getAccess_ip()).append("&");
		sb2.append("business_type=").append(s.getBusiness_type()).append("&");
		sb2.append("business_body=").append(sign1).append("&");
		sb2.append(Md5(sign_two));
		System.out.println("sign :  "+sb2.toString());
		
		return Md5(sb2.toString());
	}

	private static String createUserSign1(SandUser m, String type) {
		StringBuffer sb = new StringBuffer();

		sb.append("payMode=").append(m.getPayMode()).append("&");
		sb.append("payInstrument=").append(m.getPayInstrument()).append("&");
		if ("00010001".equals(type)) {
			sb.append("issueNo=").append(m.getIssueNo()).append("&");
		}
		sb.append("cardNo=").append(m.getCardNo()).append("&");
		if ("00010001".equals(type)) {
			sb.append("gender=").append(m.getGender()).append("&");
		}
		sb.append("personName=").append(m.getPersonName()).append("&");

		sb.append("idType=").append(m.getIdType()).append("&");
		sb.append("idNo=").append(m.getIdNo()).append("&");
		if ("00010001".equals(type)) {
			sb.append("mobileNo=").append(m.getMobileNo()).append("&");
			sb.append("compAddr=").append(m.getCompAddr()).append("&");
			sb.append("houseAddr=").append(m.getHouseAddr()).append("&");
			sb.append("homeTel=").append(m.getHomeTel()).append("&");
			sb.append("mailBox=").append(m.getMailBox()).append("&");
		}
		String sign11 = sb.append(Md5(sign_one)).toString();
		System.out.println("sign1 :  "+sign11);
		return Md5(sign11);
	}

	public static String orderCreateSign(SandOrder order) {
		StringBuffer sb3 = new StringBuffer();

		sb3.append("version=").append(order.getVersion()).append("&");
		sb3.append("charset=").append(order.getCharset()).append("&");
		sb3.append("trans_type=").append(order.getTrans_type()).append("&");
		sb3.append("merchant_id=").append(order.getMerchant_id()).append("&");
		
		sb3.append("merchant_name=").append(order.getMerchant_name()).append("&");
		sb3.append("goods_content=").append(order.getGoods_content()).append("&");
		sb3.append("custome_ip=").append(order.getCustome_ip()).append("&");
		
		sb3.append("order_id=").append(order.getOrder_id()).append("&");
		
		sb3.append("sm_billno=").append(order.getSm_billno()).append("&");
		
		sb3.append("order_time=").append(order.getOrder_time()).append("&");
		
		sb3.append("order_amount=").append(order.getOrder_amount()).append("&");
		sb3.append("currency=").append(order.getCurrency()).append("&");
		sb3.append("pay_kind=").append(order.getPay_kind()).append("&");
		sb3.append("front_url=").append(order.getFront_url()).append("&");
		sb3.append("back_url=").append(order.getBack_url()).append("&");
		
		sb3.append("merchant_attach=").append(order.getMerchant_attach());
		return sb3.toString();
	}

	public static String orderQuerySign(SandOrder order) {
		StringBuffer sb4 = new StringBuffer();

		sb4.append("version=").append(order.getVersion()).append("&");
		sb4.append("charset=").append(order.getCharset()).append("&");		
		sb4.append("trans_type=").append(order.getTrans_type()).append("&");
		sb4.append("merchant_id=").append(order.getMerchant_id()).append("&");
		
		sb4.append("order_id=").append(order.getOrder_id()).append("&");
		sb4.append("order_time=").append(order.getOrder_time()).append("&");
		sb4.append("merchant_attach=").append(order.getMerchant_attach());
		System.out.println(sb4);
		return sb4.toString();
	}

	public static String orderQueryData(String signdata,SandOrder order) {
		StringBuffer sb = new StringBuffer(signdata);
		sb.append("&").append("sign_type=").append(order.getSign_type());
		sb.append("&").append("sign=").append(order.getSign());
		System.out.println(sb);
		String url = "http://query-test.sandpay.com.cn/payment/tradition/checkquery.do";
		return HttpConnectUtil.getPostConnect(sb.toString(), url);
	}

	public static String orderCancelSign(SandOrder orderCancel) {
		StringBuffer sb4 = new StringBuffer();
		sb4.append("version=").append(orderCancel.getVersion()).append("&");
		sb4.append("charset=").append(orderCancel.getCharset()).append("&");
		sb4.append("trans_type=").append(orderCancel.getTrans_type()).append("&");
		sb4.append("merchant_id=").append(orderCancel.getMerchant_id()).append("&");
		sb4.append("merchant_name=").append(orderCancel.getMerchant_name()).append("&");

		sb4.append("goods_content=").append(orderCancel.getGoods_content()).append("&");
		sb4.append("order_id=").append(orderCancel.getOrder_id()).append("&");
		sb4.append("refund_amount=").append(orderCancel.getOrder_amount()).append("&");
		sb4.append("refund_currency=").append(orderCancel.getCurrency()).append("&");

		sb4.append("order_time=").append(orderCancel.getOrder_time()).append("&");
		sb4.append("back_url=").append(orderCancel.getBack_url()).append("&");
		sb4.append("merchant_attach=").append(orderCancel.getMerchant_attach());

		return sb4.toString();
	}
}
