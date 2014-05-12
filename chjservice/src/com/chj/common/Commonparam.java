package com.chj.common;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import com.chj.action.CommonAction;
import com.json.BaseBean;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class Commonparam {
	/**
	 * SELECT DATEADD(DAY, DATEDIFF(DAY,0,getdate()), 0) --今天 SELECT
	 * dateadd(ms,-3,DATEADD(DAY, DATEDIFF(DAY,0,getdate()), 1)) --今天
	 * 
	 * 
	 * SELECT DATEADD(wk, DATEDIFF(wk,0,getdate()), 0) --周一 SELECT
	 * dateadd(ms,-3,DATEADD(wk, DATEDIFF(wk,0,getdate()), 7))--周日
	 * 
	 * SELECT DATEADD(mm, DATEDIFF(m,0,getdate()),0)--本月第一天 SELECT
	 * dateadd(ms,-3,DATEADD(mm, DATEDIFF(m,0,getdate())+1, 0))--本月最后一天
	 */
	public static String headImage = "/upload/headimage";
	public static String circleImage = "/upload/circleimage";
	public static String topicImage = "/upload/topicimage";
	public static String activityImage = "/upload/activityimage";
	public static String actcontentImage = "/upload/actcontentimage";// 活动内容照片
	public static String cardImage = "/upload/cardimage";
	public static String qrcodefolder = "/upload/qrcodefolder";
	public static String htmlfolder = "/upload/html";
	public static String otherfolder = "/upload/other";
	public static int imageMax = 1024 * 400;
	public static int videoMax = 1024 * 1024 * 100;
	public static int swfMax = 1024 * 1024 * 100;
	public static int fileMax = 1024 * 1024 * 10;

	public static SimpleDateFormat fmt = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
	public static SimpleDateFormat fmtshort = new SimpleDateFormat("yyyy-MM-dd");
	public static SimpleDateFormat fmtmiddle = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm");
	public static SimpleDateFormat fmtChina = new SimpleDateFormat(
			"yy年MM月dd日 HH:mm");
	public static String p12Path = "/common/cert.p12";
	public static SimpleDateFormat yearmonth = new SimpleDateFormat("/yyyy/MM/");
	private  static  long orderMaxNum=0L;
	
	public static Date String2ShortDate(String str) {
		Date time = null;

		try {
			time = fmtshort.parse(str);
		} catch (java.text.ParseException e) {

			e.printStackTrace();
		}

		return time;

	}

	public static String Date2ShortStr(Date date) {
		if (date != null)
			return fmtshort.format(date);
		else
			return "";

	}

	public static String Date2Str(Date date) {
		if (date != null)
			return fmt.format(date);
		else
			return "";
	}

	public static Date StringtoDate(String str) {
		Date time = null;

		try {
			time = fmt.parse(str);
		} catch (java.text.ParseException e) {

			e.printStackTrace();
		}

		return time;

	}

	public static String nowDate() {
		Date date = new Date();
		String nowDate = (date.getYear() + 1900) + "-" + (date.getMonth() + 1)
				+ "-" + (date.getDate()) + "";
		return nowDate;

	}

	public static Date NowTime() {

		Date now = new Date();
		return now;

	}

	public static BaseBean checkUseDate(String loginDate, int spaceMonth,
			int remainMinutes) throws ParseException {
		BaseBean bean = new BaseBean();
		if (loginDate == null || loginDate.length() == 0) {
			bean.setStatus(200);
			bean.setMsg("未曾登录");
			return bean;
		}
		Calendar cal0 = Calendar.getInstance();
		cal0.setTime(fmt.parse(loginDate));
		cal0.add(Calendar.MONTH, spaceMonth); // 得到后24个月
		cal0.add(Calendar.MINUTE, remainMinutes); // 得到后24个月
		long enddate = cal0.getTimeInMillis();

		Calendar cal = Calendar.getInstance();
		cal.setTime(fmt.parse(loginDate));
		cal.add(Calendar.MONTH, 23); // 得到后23个月
		long date = cal.getTimeInMillis();

		Calendar cal1 = Calendar.getInstance();
		long now = cal1.getTimeInMillis();
		if (now >= date) {
			if (now >= enddate) {
				bean.setStatus(400);
				bean.setMsg("使用期限已经到期");
				System.out.println("使用期限已经到期");
			} else {
				int spacedate = (int) ((enddate - now) / (24 * 60 * 60 * 1000));
				if (spacedate > 0) {
					bean.setStatus(300);
					bean.setMsg("使用期限将到期,剩余" + spacedate + "天");
					System.out.println("使用期限将到期,剩余" + spacedate + "天");
				} else {
					int spacehour = (int) ((enddate - now) / (60 * 60 * 1000));
					if (spacehour > 0) {
						bean.setStatus(300);
						bean.setMsg("使用期限将到期,剩余" + (spacehour) + "小时");
						System.out.println("使用期限将到期,剩余" + (spacehour) + "小时");
					} else {
						int spacem = (int) ((enddate - now) / (60 * 1000));
						bean.setStatus(300);
						bean.setMsg("使用期限将到期,剩余" + (spacem) + "分钟");
						System.out.println("使用期限将到期,剩余" + (spacem) + "分钟");
					}
				}

			}
		} else {
			bean.setStatus(200);
			bean.setMsg("使用期限未到期");
		}
		System.out.println("now:" + fmt.format(new Date(now)) + "---------end:"
				+ fmt.format(new Date(enddate)));
		return bean;
	}

	/**
	 * 压缩图片
	 * 
	 * @param srcImageFile
	 *            原文件
	 * @param dstImageFileName
	 *            目标文件地址
	 * @throws Exception
	 */
	public static void makeSmallImage(File srcImageFile, String dstImageFileName)
			throws Exception {
		FileOutputStream fileOutputStream = null;
		JPEGImageEncoder encoder = null;
		BufferedImage tagImage = null;
		Image srcImage = null;
		try {
			srcImage = ImageIO.read(srcImageFile);
			int srcWidth = srcImage.getWidth(null);// 原图片宽度
			int srcHeight = srcImage.getHeight(null);// 原图片高度
			int dstMaxSize = 120;// 目标缩略图的最大宽度/高度，宽度与高度将按比例缩写
			int dstWidth = 120; // srcWidth;//缩略图宽度
			int dstHeight = 120; // srcHeight;//缩略图高度
			float scale = 0;
			// 计算缩略图的宽和高
			// if(srcWidth>dstMaxSize){
			// dstWidth = dstMaxSize;
			// scale = (float)srcWidth/(float)dstMaxSize;
			// dstHeight = Math.round((float)srcHeight/scale);
			// }
			// srcHeight = dstHeight;
			// if(srcHeight>dstMaxSize){
			// dstHeight = dstMaxSize;
			// scale = (float)srcHeight/(float)dstMaxSize;
			// dstWidth = Math.round((float)dstWidth/scale);
			// }
			// 生成缩略图
			tagImage = new BufferedImage(dstWidth, dstHeight,
					BufferedImage.TYPE_INT_RGB);
			tagImage.getGraphics().drawImage(srcImage, 0, 0, dstWidth,
					dstHeight, null);
			fileOutputStream = new FileOutputStream(dstImageFileName);
			encoder = JPEGCodec.createJPEGEncoder(fileOutputStream);
			encoder.encode(tagImage);
			fileOutputStream.close();
			fileOutputStream = null;
		} finally {
			if (fileOutputStream != null) {
				try {
					fileOutputStream.close();
				} catch (Exception e) {
				}
				fileOutputStream = null;
			}
			encoder = null;
			tagImage = null;
			srcImage = null;
			System.gc();
		}
	}

	public static boolean deleteFile(String filepath) {
		if (filepath == null || filepath.length() == 0) {
			return true;
		} else {
			File file = new File(filepath);
			if (file.isFile() && file.exists()) {
				return file.delete();
			}
		}

		return true;
	}

	/**
	 * 
	 * @param file
	 *            源文件
	 * @param targetFolder
	 *            目标文件夹
	 * @param filename
	 *            最终
	 * @throws IOException
	 */
	public static void makeFile( File file,
			String absolute, String filename) throws IOException {
		
		File absoluteFolder = new File(absolute);
		if (!absoluteFolder.exists()) {
			absoluteFolder.mkdirs();
		}
		FileOutputStream fos = null;
		FileInputStream fis = null;
		fos = new FileOutputStream(absolute + filename);
		fis = new FileInputStream(file);
		byte[] buffer = new byte[1024];
		int len = 0;
		while ((len = fis.read(buffer)) > 0) {
			fos.write(buffer, 0, len);
		}
		fos.close();
		fis.close();

	}

	public static String makeNewFileName(String oldfilename) {
		String ext = oldfilename.substring(
				oldfilename.lastIndexOf("."),
				oldfilename.length());
		SimpleDateFormat fmt1 = new SimpleDateFormat(
				"yyyyMMddHHmmss");
		String newfilename = fmt1.format(new Date()) + "_"
				+ UUID.randomUUID().toString() + ext;
		return newfilename;
	}

	public static boolean StringIsNull(String account) {
		if (account == null || account.trim().length() == 0)
			return true;
		return false;
	}

	public static boolean StringIsNotNull(String account) {
		if (account != null && account.trim().length() > 0)
			return true;
		return false;
	}

	public static Object findWeek() {
		Calendar date = Calendar.getInstance();
		System.out.println(date.get(Calendar.DAY_OF_WEEK));
		switch (date.get(Calendar.DAY_OF_WEEK)) {
		case 1:
			return "星期日";
		case 2:
			return "星期一";
		case 3:
			return "星期二";
		case 4:
			return "星期三";
		case 5:
			return "星期四";
		case 6:
			return "星期五";
		case 7:
			return "星期六";
		default:
			break;
		}
		return "";
	}

	public static String findWeek(Date dateParam) {
		Calendar date = Calendar.getInstance();
		date.setTime(dateParam);
		switch (date.get(Calendar.DAY_OF_WEEK)) {
		case 1:
			return "星期日";
		case 2:
			return "星期一";
		case 3:
			return "星期二";
		case 4:
			return "星期三";
		case 5:
			return "星期四";
		case 6:
			return "星期五";
		case 7:
			return "星期六";
		default:
			break;
		}
		return "";
	}

	public static String Date2ChinaStr(Date beginTime) {
		
		String date = fmtChina.format(beginTime);
		String week = findWeek(beginTime);
		date = date.replace(" ", "," + week + ",");
		return date;
	}

	public static Object removerHTML(String str) {
		
		if (str != null) {
			str = str.replaceAll("</?[^>]*>", ""); // 去除HTML tag
			str = str.replaceAll("[ | ]*\\n", ""); // 去除行尾空白
			str = str.replaceAll("\\n[\\s| | ]*\\r", ""); // 去除多余空行
			str = str.replaceAll("&nbsp;", "");// 去掉&nbsp;
			str = str.replaceAll("\\r", "");// 去掉&nbsp;
			str = str.replaceAll("\\n", "");// 去掉&nbsp;
			return str;
		}
		return "";
	}

	public static void tagListParam(HashMap<String, Object> param,
			String tagList) {
		
		String ids = "";
		JSONObject boj = JSONObject.fromObject(tagList);
		for (Object key : boj.keySet()) {
			if (boj.getString(key.toString()) != null
					&& boj.getString(key.toString()).trim().length() > 0) {
				ids += key.toString() + ",";
			}
		}
		if (ids.length() > 0)
			param.put("tagIds", ids.substring(0, ids.length() - 1));
	}

	public static Date StringtoMiddleDate(String sendTime) {
		Date time = null;

		try {
			time = fmtmiddle.parse(sendTime);
		} catch (java.text.ParseException e) {

			e.printStackTrace();
		}

		return time;
	}

	public static String makeYearMonth(Date date) {
		String time ="/2013/12/";
		try {
			 time = yearmonth.format(date);
		} catch (Exception e) {

			e.printStackTrace();
		}

		return time;
	}

	public static String getKeyValue(String key) {
		Properties prop = new Properties();
		InputStream in = CommonAction.class
				.getResourceAsStream("/util.properties");
		try {
			prop.load(in);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return prop.getProperty(key);
	}

	public static String createOrderNumber() {
		
		return null;
	}

	public   static long getOrderMaxNum() {
		return orderMaxNum;
	}

	public  static  void setOrderMaxNum(long orderMaxNum) {
		Commonparam.orderMaxNum = orderMaxNum;
	}


}
