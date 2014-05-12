<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=utf8" language="java"
	import="java.io.*,
	java.awt.Image,
	java.awt.image.*,
	java.util.*,
	com.sun.image.codec.jpeg.*,
	com.jspsmart.upload.*"%>
<%
	String from = request.getHeader("Referer");
	String imgid;
	SimpleDateFormat fmt =new  SimpleDateFormat("yyyyMMdd");
	String riqi = fmt.format(new Date());
	
	String url = "upload/html/"+fmt.format(new Date());
	String url2 = "upload/htmlsmall/"+fmt.format(new Date());

	
	int maxId = 9;
	Random r = new Random();
	int radok = r.nextInt(maxId);
	SimpleDateFormat fmt1 =new  SimpleDateFormat("yyyyMMddHHmmss");
	String newFilename = fmt1.format(new Date()) + radok;

	String fileurl;

	String filemulu = newFilename;
	String realmulu = request.getRealPath("/") + url;
	String realmulu2 = request.getRealPath("/") + url2;
	java.io.File mulu = new java.io.File(realmulu);
	java.io.File mulu2 = new java.io.File(realmulu2);
	if(!mulu.exists())
		mulu.mkdirs();
	if(!mulu2.exists())
		mulu2.mkdirs();

	if (from.indexOf("titlepic") > 0) {
		imgid = "img";
		fileurl = "" + url2  + "/" + newFilename + ".jpg";
	} else {
		imgid = "picture";
		fileurl = "" + url  + "/" + newFilename + ".jpg";
	}

	SmartUpload mySmartUpload = new SmartUpload();
	long file_size_max = 1048576;//图片大小设置

	//初始化上传
	mySmartUpload.initialize(pageContext);

	//只允许上载此类文件
	try {
		mySmartUpload.setAllowedFilesList("jpg,Jpg,JPG,GIF,gif,Gif");
		//上载文件 
		mySmartUpload.upload();
	} catch (Exception e) {

		out
				.println("<script language=javascript>alert('上传格式错误！');   history.back(-1);</script>");

		return;

	}
	try {
		com.jspsmart.upload.File myFile = mySmartUpload.getFiles()
				.getFile(0);
		if (myFile.isMissing()) {

			out
					.println("<script language=javascript>alert('必须选择图片！');   history.back(-1);</script>");

			return;

		} else {
			int file_size = myFile.getSize(); //取得文件的大小  
			if (file_size < 10240) {
				out
						.println("<script language=javascript>alert('上传图片大小应控制在10K~1M之间！');   history.back(-1);</script>");
				return;
			}

			String saveurl = "";
			if (file_size < file_size_max) {
				saveurl = realmulu  + "/" + newFilename
						+ ".jpg"; //保存路径
				myFile.saveAs(saveurl, mySmartUpload.SAVE_PHYSICAL);

				//-----------------------上传完成，开始生成缩略图-------------------------    
				java.io.File file = new java.io.File(saveurl); //读入刚才上传的文件
				String newurl = realmulu2  + "/"
						+ newFilename + ".jpg"; //新的缩略图保存地址
				Image src = javax.imageio.ImageIO.read(file); //构造Image对象
				float tagsize = 300;
				int old_w = src.getWidth(null); //得到源图宽
				int old_h = src.getHeight(null);
				int new_w = 0;
				int new_h = 0; //得到源图长
				//int tempsize;
				float tempdouble;
				if (old_w > old_h) {
					tempdouble = old_w / tagsize;
				} else {
					tempdouble = old_h / tagsize;
				}
				new_w = Math.round(old_w / tempdouble);
				new_h = Math.round(old_h / tempdouble);//计算新图长宽
				BufferedImage tag = new BufferedImage(new_w, new_h,
						BufferedImage.TYPE_INT_RGB);
				tag.getGraphics().drawImage(src, 0, 0, new_w, new_h,
						null); //绘制缩小后的图
				FileOutputStream newimage = new FileOutputStream(newurl); //输出到文件流
				JPEGImageEncoder encoder = JPEGCodec
						.createJPEGEncoder(newimage);
				encoder.encode(tag); //近JPEG编码
				newimage.close();

				out.print("<SCRIPT language=''javascript''>");
				out.print("window.parent.document.getElementById('"
						+ imgid + "').value='" +fileurl + "';");
				out.print("window.location.href='upload.jsp';");
				out.print("</script>");

			} else {
				out.print("<SCRIPT language=''javascript''>");
				out.print("alert(''上传文件大小不能超过"
						+ (file_size_max / 1048576) + "M'');");
				out.print("history.back(-1);");
				out.print("</SCRIPT>");
			}
		}
	} catch (Exception e) {
		e.fillInStackTrace();
	}
%>