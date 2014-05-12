package com.chj.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.Map.Entry;



public class HttpMsgUtil {
	public static final String URL = "http://api.mms.net.cn/WebService.asmx/SendSMS";
	public static final String USERNAME = "lifangti";
	public static final String PASSWORD = "654321";
	public static void main(String[] args) throws UnsupportedEncodingException {
		Random r = new Random();
		String code = r.nextInt(10)+"";
		 code += r.nextInt(10);
		 code += r.nextInt(10);
		 code += r.nextInt(10);
			System.out.println(code);
		//System.out.println(mt("15618221516","测试3242",""));
	}
	
	public static String mt(String mobile, String content, String ext) throws UnsupportedEncodingException {
		String url = URL;
		
		Map<String, String> params = new HashMap<String, String>();
	
		params.put("username", USERNAME);
		params.put("password", PASSWORD);
		params.put("smsmemo", content);
		params.put("ext", ext);
		params.put("smsphone", mobile);
		return http(url,params);
	}
	
	
	public static String http(String url, Map<String, String> params) {
		URL u = null;
		HttpURLConnection con = null;
		// 构建请求参数
		
		StringBuffer sb = new StringBuffer();
		if (params != null) {
			for (Entry<String, String> e : params.entrySet()) {
				sb.append(e.getKey());
				sb.append("=");
				sb.append(e.getValue());
				sb.append("&");
			}
			sb.substring(0, sb.length() - 1);
		}
		System.out.println("send_url:" + url);
		System.out.println("send_data:" + sb.toString());
		// 尝试发送请求
		try {
			u = new URL(url);
			con = (HttpURLConnection) u.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setUseCaches(false);
			con.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");
			OutputStreamWriter osw = new OutputStreamWriter(
					con.getOutputStream(), "utf-8");
			osw.write(sb.toString());
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
			String temp;
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
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}

		return buffer.toString();
	}

}