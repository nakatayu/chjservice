package com.chj.common;

import java.awt.Image;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;

import javax.imageio.ImageIO;
import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;
import javax.print.attribute.DocAttributeSet;
import javax.print.attribute.HashDocAttributeSet;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.chj.action.CommonAction;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class HttpGetMsg {
	public static void main(String[] args) throws Exception {

//		String data = HttpGetMsg.postUrl(
//				"http://192.168.1.120:8080/chjservice/community!findHotActivityList.action",
//				"page=1&size=10&order=desc&orderType=time");
//		System.out.println(data);
//		System.out.println(Commonparam.Date2Str(new Date()));
//		 TicketSouce mt = new TicketSouce();
//		 //基于火车票创建三个窗口
//		 new Thread(mt,"900").start();
//		 new Thread(mt,"901").start();
//		 new Thread(mt,"902").start();
		
		String data = HttpGetMsg.postUrl("http://222.66.234.51/chjservice/user!weblogin.action",
				"username=2&password=12345678");
		System.out.println(data);
	}

	public static String postUrl(String remoteUrl, String param) {
		URL url = null;
		HttpURLConnection httpurlconnection = null;
		StringBuffer sb = new StringBuffer();
		try {
			url = new URL(remoteUrl);

			httpurlconnection = (HttpURLConnection) url.openConnection();
			httpurlconnection.setDoOutput(true);
			httpurlconnection.setRequestMethod("POST");

			httpurlconnection.getOutputStream().write(param.getBytes());
			httpurlconnection.getOutputStream().close();
			InputStream in = httpurlconnection.getInputStream();
			byte[] b = new byte[1024];
			int i = 0;
			while ((i = in.read(b)) != -1) {
				sb.append(new String(b, 0, i, "UTF-8"));
			}

		} catch (Exception e) {
			e.printStackTrace();
			sb.append("0");

		} finally {
			if (httpurlconnection != null)
				httpurlconnection.disconnect();

		}
		return sb.toString();
	}

	public static String getUrl(String remoteUrl, String param) {
		URL url = null;
		HttpURLConnection httpurlconnection = null;
		StringBuffer sb = new StringBuffer();
		try {
			url = new URL(remoteUrl);

			httpurlconnection = (HttpURLConnection) url.openConnection();
			// httpurlconnection.setDoOutput(true);
			// httpurlconnection.setRequestMethod("GET");
			//
			// httpurlconnection.getOutputStream().write(param.getBytes());
			// httpurlconnection.getOutputStream().close();
			InputStream in = httpurlconnection.getInputStream();
			byte[] b = new byte[1024];
			int i = 0;
			while ((i = in.read(b)) != -1) {
				sb.append(new String(b, 0, i, "UTF-8"));
			}

		} catch (Exception e) {
			e.printStackTrace();
			sb.append("0");

		} finally {
			if (httpurlconnection != null)
				httpurlconnection.disconnect();

		}
		return sb.toString();
	}
}
