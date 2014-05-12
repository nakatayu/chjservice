<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/css.css" />
<title>漕河泾e服务</title>
<style type="text/css">
/* 我的订单 */

.myorder_font{ color:#00b38a; font-size:14px;  font-weight:bold; text-align:center; padding-top:15px;}
.myorder_font1{ color:#00b38a; font-size:14px;  font-weight:bold; text-align:center; padding-top:45px;}
.myorder_font2{  font-size:14px;  font-weight:bold; text-align:center; padding-top:45px;}
.myorder_font02{ color:#00b38a; font-size:14px; font-weight:bold; }
.myorder1{
float:left;margin-left:10px;
}
.myorder1 img{
width:110px;height:115px;cursor:pointer;
}

.personal_fr1{
float:left;margin-left:10px;
}

.conv1{
float:left;margin-left:10px;
}
.conv1 img{
width:110px;height:110px;cursor:pointer;
}

.comm2{
float:left;margin-left:10px;
}

ul.ul-button li{
width:40px;
list-style: none;
color:#fff;
background:#00b38b;
text-align: center;
}
ul.ul-button li:hover{
cursor:pointer;
background:#00b36b;
}
</style>
</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />

<div class="main">
<div id="main_content" class="main_content">
   
<div
				style="position: relative; height: 100px; padding: 10px 25px 0 25px;">
				<div>
					<div style="float: left;">
						<img src="${ctx}/images/menu_68.jpg"
							onclick="gotoPage('${ctx}/community!communityHome.action')" />
					</div>
					<div class="menu1">
						<img src="${ctx}/images/menu_69.jpg" style="width: 190px;" />
					</div>
					<div class="menu1">
						<img src="${ctx}/images/menu_65.jpg"
							onclick="gotoPage('${ctx}/pages/community_activitylist.jsp')" />
					</div>
					<div class="menu1">
						<img src="${ctx}/images/menu_63.jpg"
							onclick="gotoPage('${ctx}/community!findLableListCircle.action')" />
					</div>
					<div>
						<img src="${ctx}/images/menu_66.png" style="width: 473px;height: 100px;" />
					</div>
				</div>

			</div>

 

<div style="position:relative;height:1230px; padding:10px 25px 0 25px;">
   <div>
    <div style="float:left; width:590px; height:1230px; ">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; border-bottom:#ffe28c 2px solid;">
      <tr></tr>
      <tr>
        <td width="12%" rowspan="3" align="center"><img src="${ctx}/dynamic/topic_but1.png" width="63" height="63" /></td>
        <td width="85%" height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="41%" style="font-size:16px; font-weight:bold; padding-top:5px; font-family:'黑体'">喜欢这部电影的人也喜欢</td>
            <td width="59%" style="font-size:14px; color:#f1a71a;font-weight:bold; padding-top:5px; font-family:'黑体'">置顶</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="25" style="font-size:14px;color:#666;  font-family:'黑体'">穆里根不像富家女。把晚宴拍的有点像马戏团。服装马马虎虎...</td>
      </tr>
      <tr>
        <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0 0 5px 0 ;">
          <tr>
            <td width="135" style="font-size:14px;color:#666;  font-family:'黑体'">发起人：小猫爱吃鱼</td>
            <td width="118" style="font-size:14px;color:#666;  font-family:'黑体'">2013.11.30 15:50</td>
            <td width="57" align="center" style="font-size:14px;color:#666;  font-family:'黑体'">评论</td>
            <td width="30" align="center" background="${ctx}/images/button122.png" style="width:30px; height:25px; color:#FFF;" >99</td>
            <td width="16">&nbsp;</td>
            <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
            <td width="13"></td>
            <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
            <td width="24"></td>
            </tr>
        </table></td>
      </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; margin-top:2px;border-bottom:#ffe28c 2px solid;">
        <tr></tr>
        <tr>
          <td width="12%" rowspan="3" align="center"><img src="${ctx}/dynamic/topic_but1.png" width="63" height="63" /></td>
          <td width="85%" height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="41%" style="font-size:16px; font-weight:bold; padding-top:5px; font-family:'黑体'">喜欢这部电影的人也喜欢</td>
              <td width="59%" style="font-size:14px; color:#f1a71a;font-weight:bold; padding-top:5px; font-family:'黑体'">置顶</td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="25" style="font-size:14px;color:#666;  font-family:'黑体'">穆里根不像富家女。把晚宴拍的有点像马戏团。服装马马虎虎...</td>
        </tr>
        <tr>
          <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0 0 5px 0 ;">
            <tr>
              <td width="135" style="font-size:14px;color:#666;  font-family:'黑体'">发起人：小猫爱吃鱼</td>
              <td width="118" style="font-size:14px;color:#666;  font-family:'黑体'">2013.11.30 15:50</td>
              <td width="57" align="center" style="font-size:14px;color:#666;  font-family:'黑体'">评论</td>
              <td width="30" align="center" background="${ctx}/images/button122.png" style="width:30px; height:25px; color:#FFF;" >99</td>
              <td width="16">&nbsp;</td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
              <td width="13"></td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
              <td width="24"></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; margin-top:2px;border-bottom:#ffe28c 2px solid;">
        <tr></tr>
        <tr>
          <td width="12%" rowspan="3" align="center"><img src="${ctx}/dynamic/topic_but1.png" width="63" height="63" /></td>
          <td width="85%" height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="41%" style="font-size:16px; font-weight:bold; padding-top:5px; font-family:'黑体'">喜欢这部电影的人也喜欢</td>
              <td width="59%" style="font-size:14px; color:#f1a71a;font-weight:bold; padding-top:5px; font-family:'黑体'">置顶</td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="25" style="font-size:14px;color:#666;  font-family:'黑体'">穆里根不像富家女。把晚宴拍的有点像马戏团。服装马马虎虎...</td>
        </tr>
        <tr>
          <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0 0 5px 0 ;">
            <tr>
              <td width="135" style="font-size:14px;color:#666;  font-family:'黑体'">发起人：小猫爱吃鱼</td>
              <td width="118" style="font-size:14px;color:#666;  font-family:'黑体'">2013.11.30 15:50</td>
              <td width="57" align="center" style="font-size:14px;color:#666;  font-family:'黑体'">评论</td>
              <td width="30" align="center" background="${ctx}/images/button122.png" style="width:30px; height:25px; color:#FFF;" >99</td>
              <td width="16">&nbsp;</td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
              <td width="13"></td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
              <td width="24"></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; margin-top:2px;border-bottom:#ffe28c 2px solid;">
        <tr></tr>
        <tr>
          <td width="12%" rowspan="3" align="center"><img src="${ctx}/dynamic/topic_but1.png" width="63" height="63" /></td>
          <td width="85%" height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="41%" style="font-size:16px; font-weight:bold; padding-top:5px; font-family:'黑体'">喜欢这部电影的人也喜欢</td>
              <td width="59%" style="font-size:14px; color:#f1a71a;font-weight:bold; padding-top:5px; font-family:'黑体'">置顶</td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="25" style="font-size:14px;color:#666;  font-family:'黑体'">穆里根不像富家女。把晚宴拍的有点像马戏团。服装马马虎虎...</td>
        </tr>
        <tr>
          <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0 0 5px 0 ;">
            <tr>
              <td width="135" style="font-size:14px;color:#666;  font-family:'黑体'">发起人：小猫爱吃鱼</td>
              <td width="118" style="font-size:14px;color:#666;  font-family:'黑体'">2013.11.30 15:50</td>
              <td width="57" align="center" style="font-size:14px;color:#666;  font-family:'黑体'">评论</td>
              <td width="30" align="center" background="${ctx}/images/button122.png" style="width:30px; height:25px; color:#FFF;" >99</td>
              <td width="16">&nbsp;</td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
              <td width="13"></td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
              <td width="24"></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; margin-top:2px;border-bottom:#ffe28c 2px solid;">
        <tr></tr>
        <tr>
          <td width="12%" rowspan="3" align="center"><img src="${ctx}/dynamic/topic_but1.png" width="63" height="63" /></td>
          <td width="85%" height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="41%" style="font-size:16px; font-weight:bold; padding-top:5px; font-family:'黑体'">喜欢这部电影的人也喜欢</td>
              <td width="59%" style="font-size:14px; color:#f1a71a;font-weight:bold; padding-top:5px; font-family:'黑体'">置顶</td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="25" style="font-size:14px;color:#666;  font-family:'黑体'">穆里根不像富家女。把晚宴拍的有点像马戏团。服装马马虎虎...</td>
        </tr>
        <tr>
          <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0 0 5px 0 ;">
            <tr>
              <td width="135" style="font-size:14px;color:#666;  font-family:'黑体'">发起人：小猫爱吃鱼</td>
              <td width="118" style="font-size:14px;color:#666;  font-family:'黑体'">2013.11.30 15:50</td>
              <td width="57" align="center" style="font-size:14px;color:#666;  font-family:'黑体'">评论</td>
              <td width="30" align="center" background="${ctx}/images/button122.png" style="width:30px; height:25px; color:#FFF;" >99</td>
              <td width="16">&nbsp;</td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
              <td width="13"></td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
              <td width="24"></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; margin-top:2px;border-bottom:#ffe28c 2px solid;">
        <tr></tr>
        <tr>
          <td width="12%" rowspan="3" align="center"><img src="${ctx}/dynamic/topic_but1.png" width="63" height="63" /></td>
          <td width="85%" height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="41%" style="font-size:16px; font-weight:bold; padding-top:5px; font-family:'黑体'">喜欢这部电影的人也喜欢</td>
              <td width="59%" style="font-size:14px; color:#f1a71a;font-weight:bold; padding-top:5px; font-family:'黑体'">置顶</td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="25" style="font-size:14px;color:#666;  font-family:'黑体'">穆里根不像富家女。把晚宴拍的有点像马戏团。服装马马虎虎...</td>
        </tr>
        <tr>
          <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0 0 5px 0 ;">
            <tr>
              <td width="135" style="font-size:14px;color:#666;  font-family:'黑体'">发起人：小猫爱吃鱼</td>
              <td width="118" style="font-size:14px;color:#666;  font-family:'黑体'">2013.11.30 15:50</td>
              <td width="57" align="center" style="font-size:14px;color:#666;  font-family:'黑体'">评论</td>
              <td width="30" align="center" background="${ctx}/images/button122.png" style="width:30px; height:25px; color:#FFF;" >99</td>
              <td width="16">&nbsp;</td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
              <td width="13"></td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
              <td width="24"></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; margin-top:2px;border-bottom:#ffe28c 2px solid;">
        <tr></tr>
        <tr>
          <td width="12%" rowspan="3" align="center"><img src="${ctx}/dynamic/topic_but1.png" width="63" height="63" /></td>
          <td width="85%" height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="41%" style="font-size:16px; font-weight:bold; padding-top:5px; font-family:'黑体'">喜欢这部电影的人也喜欢</td>
              <td width="59%" style="font-size:14px; color:#f1a71a;font-weight:bold; padding-top:5px; font-family:'黑体'">置顶</td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="25" style="font-size:14px;color:#666;  font-family:'黑体'">穆里根不像富家女。把晚宴拍的有点像马戏团。服装马马虎虎...</td>
        </tr>
        <tr>
          <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0 0 5px 0 ;">
            <tr>
              <td width="135" style="font-size:14px;color:#666;  font-family:'黑体'">发起人：小猫爱吃鱼</td>
              <td width="118" style="font-size:14px;color:#666;  font-family:'黑体'">2013.11.30 15:50</td>
              <td width="57" align="center" style="font-size:14px;color:#666;  font-family:'黑体'">评论</td>
              <td width="30" align="center" background="${ctx}/images/button122.png" style="width:30px; height:25px; color:#FFF;" >99</td>
              <td width="16">&nbsp;</td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
              <td width="13"></td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
              <td width="24"></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; margin-top:2px;border-bottom:#ffe28c 2px solid;">
        <tr></tr>
        <tr>
          <td width="12%" rowspan="3" align="center"><img src="${ctx}/dynamic/topic_but1.png" width="63" height="63" /></td>
          <td width="85%" height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="41%" style="font-size:16px; font-weight:bold; padding-top:5px; font-family:'黑体'">喜欢这部电影的人也喜欢</td>
              <td width="59%" style="font-size:14px; color:#f1a71a;font-weight:bold; padding-top:5px; font-family:'黑体'">置顶</td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="25" style="font-size:14px;color:#666;  font-family:'黑体'">穆里根不像富家女。把晚宴拍的有点像马戏团。服装马马虎虎...</td>
        </tr>
        <tr>
          <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0 0 5px 0 ;">
            <tr>
              <td width="135" style="font-size:14px;color:#666;  font-family:'黑体'">发起人：小猫爱吃鱼</td>
              <td width="118" style="font-size:14px;color:#666;  font-family:'黑体'">2013.11.30 15:50</td>
              <td width="57" align="center" style="font-size:14px;color:#666;  font-family:'黑体'">评论</td>
              <td width="30" align="center" background="${ctx}/images/button122.png" style="width:30px; height:25px; color:#FFF;" >99</td>
              <td width="16">&nbsp;</td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
              <td width="13"></td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
              <td width="24"></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; margin-top:2px;border-bottom:#ffe28c 2px solid;">
        <tr></tr>
        <tr>
          <td width="12%" rowspan="3" align="center"><img src="${ctx}/dynamic/topic_but1.png" width="63" height="63" /></td>
          <td width="85%" height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="41%" style="font-size:16px; font-weight:bold; padding-top:5px; font-family:'黑体'">喜欢这部电影的人也喜欢</td>
              <td width="59%" style="font-size:14px; color:#f1a71a;font-weight:bold; padding-top:5px; font-family:'黑体'">置顶</td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="25" style="font-size:14px;color:#666;  font-family:'黑体'">穆里根不像富家女。把晚宴拍的有点像马戏团。服装马马虎虎...</td>
        </tr>
        <tr>
          <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0 0 5px 0 ;">
            <tr>
              <td width="135" style="font-size:14px;color:#666;  font-family:'黑体'">发起人：小猫爱吃鱼</td>
              <td width="118" style="font-size:14px;color:#666;  font-family:'黑体'">2013.11.30 15:50</td>
              <td width="57" align="center" style="font-size:14px;color:#666;  font-family:'黑体'">评论</td>
              <td width="30" align="center" background="${ctx}/images/button122.png" style="width:30px; height:25px; color:#FFF;" >99</td>
              <td width="16">&nbsp;</td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
              <td width="13"></td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
              <td width="24"></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; margin-top:2px;border-bottom:#ffe28c 2px solid;">
        <tr></tr>
        <tr>
          <td width="12%" rowspan="3" align="center"><img src="${ctx}/dynamic/topic_but1.png" width="63" height="63" /></td>
          <td width="85%" height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="41%" style="font-size:16px; font-weight:bold; padding-top:5px; font-family:'黑体'">喜欢这部电影的人也喜欢</td>
              <td width="59%" style="font-size:14px; color:#f1a71a;font-weight:bold; padding-top:5px; font-family:'黑体'">置顶</td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="25" style="font-size:14px;color:#666;  font-family:'黑体'">穆里根不像富家女。把晚宴拍的有点像马戏团。服装马马虎虎...</td>
        </tr>
        <tr>
          <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0 0 5px 0 ;">
            <tr>
              <td width="135" style="font-size:14px;color:#666;  font-family:'黑体'">发起人：小猫爱吃鱼</td>
              <td width="118" style="font-size:14px;color:#666;  font-family:'黑体'">2013.11.30 15:50</td>
              <td width="57" align="center" style="font-size:14px;color:#666;  font-family:'黑体'">评论</td>
              <td width="30" align="center" background="${ctx}/images/button122.png" style="width:30px; height:25px; color:#FFF;" >99</td>
              <td width="16">&nbsp;</td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
              <td width="13"></td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
              <td width="24"></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; margin-top:2px;border-bottom:#ffe28c 2px solid;">
        <tr></tr>
        <tr>
          <td width="12%" rowspan="3" align="center"><img src="${ctx}/dynamic/topic_but1.png" width="63" height="63" /></td>
          <td width="85%" height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="41%" style="font-size:16px; font-weight:bold; padding-top:5px; font-family:'黑体'">喜欢这部电影的人也喜欢</td>
              <td width="59%" style="font-size:14px; color:#f1a71a;font-weight:bold; padding-top:5px; font-family:'黑体'">置顶</td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="25" style="font-size:14px;color:#666;  font-family:'黑体'">穆里根不像富家女。把晚宴拍的有点像马戏团。服装马马虎虎...</td>
        </tr>
        <tr>
          <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0 0 5px 0 ;">
            <tr>
              <td width="135" style="font-size:14px;color:#666;  font-family:'黑体'">发起人：小猫爱吃鱼</td>
              <td width="118" style="font-size:14px;color:#666;  font-family:'黑体'">2013.11.30 15:50</td>
              <td width="57" align="center" style="font-size:14px;color:#666;  font-family:'黑体'">评论</td>
              <td width="30" align="center" background="${ctx}/images/button122.png" style="width:30px; height:25px; color:#FFF;" >99</td>
              <td width="16">&nbsp;</td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
              <td width="13"></td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
              <td width="24"></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; margin-top:2px;border-bottom:#ffe28c 2px solid;">
        <tr></tr>
        <tr>
          <td width="12%" rowspan="3" align="center"><img src="${ctx}/dynamic/topic_but1.png" width="63" height="63" /></td>
          <td width="85%" height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="41%" style="font-size:16px; font-weight:bold; padding-top:5px; font-family:'黑体'">喜欢这部电影的人也喜欢</td>
              <td width="59%" style="font-size:14px; color:#f1a71a;font-weight:bold; padding-top:5px; font-family:'黑体'">置顶</td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="25" style="font-size:14px;color:#666;  font-family:'黑体'">穆里根不像富家女。把晚宴拍的有点像马戏团。服装马马虎虎...</td>
        </tr>
        <tr>
          <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0 0 5px 0 ;">
            <tr>
              <td width="135" style="font-size:14px;color:#666;  font-family:'黑体'">发起人：小猫爱吃鱼</td>
              <td width="118" style="font-size:14px;color:#666;  font-family:'黑体'">2013.11.30 15:50</td>
              <td width="57" align="center" style="font-size:14px;color:#666;  font-family:'黑体'">评论</td>
              <td width="30" align="center" background="${ctx}/images/button122.png" style="width:30px; height:25px; color:#FFF;" >99</td>
              <td width="16">&nbsp;</td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
              <td width="13"></td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
              <td width="24"></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; margin-top:2px;border-bottom:#ffe28c 2px solid;">
        <tr></tr>
        <tr>
          <td width="12%" rowspan="3" align="center"><img src="${ctx}/dynamic/topic_but1.png" width="63" height="63" /></td>
          <td width="85%" height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="41%" style="font-size:16px; font-weight:bold; padding-top:5px; font-family:'黑体'">喜欢这部电影的人也喜欢</td>
              <td width="59%" style="font-size:14px; color:#f1a71a;font-weight:bold; padding-top:5px; font-family:'黑体'">置顶</td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="25" style="font-size:14px;color:#666;  font-family:'黑体'">穆里根不像富家女。把晚宴拍的有点像马戏团。服装马马虎虎...</td>
        </tr>
        <tr>
          <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0 0 5px 0 ;">
            <tr>
              <td width="135" style="font-size:14px;color:#666;  font-family:'黑体'">发起人：小猫爱吃鱼</td>
              <td width="118" style="font-size:14px;color:#666;  font-family:'黑体'">2013.11.30 15:50</td>
              <td width="57" align="center" style="font-size:14px;color:#666;  font-family:'黑体'">评论</td>
              <td width="30" align="center" background="${ctx}/images/button122.png" style="width:30px; height:25px; color:#FFF;" >99</td>
              <td width="16">&nbsp;</td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
              <td width="13"></td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
              <td width="24"></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; margin-top:2px;border-bottom:#ffe28c 2px solid;">
        <tr></tr>
        <tr>
          <td width="12%" rowspan="3" align="center"><img src="${ctx}/dynamic/topic_but1.png" width="63" height="63" /></td>
          <td width="85%" height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="41%" style="font-size:16px; font-weight:bold; padding-top:5px; font-family:'黑体'">喜欢这部电影的人也喜欢</td>
              <td width="59%" style="font-size:14px; color:#f1a71a;font-weight:bold; padding-top:5px; font-family:'黑体'">置顶</td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="25" style="font-size:14px;color:#666;  font-family:'黑体'">穆里根不像富家女。把晚宴拍的有点像马戏团。服装马马虎虎...</td>
        </tr>
        <tr>
          <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0 0 5px 0 ;">
            <tr>
              <td width="135" style="font-size:14px;color:#666;  font-family:'黑体'">发起人：小猫爱吃鱼</td>
              <td width="118" style="font-size:14px;color:#666;  font-family:'黑体'">2013.11.30 15:50</td>
              <td width="57" align="center" style="font-size:14px;color:#666;  font-family:'黑体'">评论</td>
              <td width="30" align="center" background="${ctx}/images/button122.png" style="width:30px; height:25px; color:#FFF;" >99</td>
              <td width="16">&nbsp;</td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
              <td width="13"></td>
              <td width="64" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
              <td width="24"></td>
            </tr>
          </table></td>
        </tr>
      </table>
    </div>
   </div>
    <div style="float:right; width:350px; height:950px;">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="height:50px; background-color:#3ebfa0;">
        <tr>
          <td width="59%" align="right" style="font-size:20px; color:#FFF; font-family:'黑体'">发表话题</td>
          <td width="41%">　<img src="${ctx}/dynamic/activ_3.png" width="23" height="20" /></td>
        </tr>
      </table>
      
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="height:42px; background-color:#f1a71a; margin-top:5px;">
        <tr>
          <td width="71%" style="font-size:16px; color:#FFF; padding-left:5px; font-family:'黑体'">您感兴趣的活动</td>
          <td width="29%">　<img src="${ctx}/dynamic/topic_more1.png" width="75" height="19" /></td>
        </tr>
      </table>
      
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; background-color:#FFF;">
  <tr>
    <td width="31%"><img src="${ctx}/dynamic/topic_but2.png" width="111" height="113" /></td>
    <td width="69%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
            <td  style="font-size:16px; padding:3px 0 0 10px;font-weight:bold; color:#333; font-family:'微软雅黑'">Mr.Graceless五周年全国巡演</td>
            </tr>
      <tr>
        <td height="40"><p  style="padding:0 6px 0 10px; font-size:14px; color:#666;">作为北京新一代独立摇滚乐队的代表之一，Mr. Graceless</p></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="11"></td>
            <td width="60" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">音乐</td>
            <td width="23"></td>
            <td width="60" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">热门活动</td>
            <td width="125">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="9"></td>
            <td width="38" align="center" style="color:#666; font-size:12px;">评论</td>
            <td width="31" align="center" style="background-image:url(${ctx}/images/button122.png); height:25px; width:30px; color:#fff; font-size:12px;">99</td>
            <td width="44" align="center" style="color:#666; font-size:12px;">评分</td>
            <td width="119" style="color:#666; font-size:12px;">9.0</td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; background-color:#FFF;">
  <tr>
    <td width="31%"><img src="${ctx}/dynamic/topic_but2.png" width="111" height="113" /></td>
    <td width="69%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
            <td  style="font-size:16px; padding:3px 0 0 10px;font-weight:bold; color:#333; font-family:'微软雅黑'">Mr.Graceless五周年全国巡演</td>
            </tr>
      <tr>
        <td height="40"><p  style="padding:0 6px 0 10px; font-size:14px; color:#666;">作为北京新一代独立摇滚乐队的代表之一，Mr. Graceless</p></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="11"></td>
            <td width="60" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">音乐</td>
            <td width="23"></td>
            <td width="60" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">热门活动</td>
            <td width="125">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="9"></td>
            <td width="38" align="center" style="color:#666; font-size:12px;">评论</td>
            <td width="31" align="center" style="background-image:url(${ctx}/images/button122.png); height:25px; width:30px; color:#fff; font-size:12px;">99</td>
            <td width="44" align="center" style="color:#666; font-size:12px;">评分</td>
            <td width="119" style="color:#666; font-size:12px;">9.0</td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; background-color:#FFF;">
  <tr>
    <td width="31%"><img src="${ctx}/dynamic/topic_but2.png" width="111" height="113" /></td>
    <td width="69%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
            <td  style="font-size:16px; padding:3px 0 0 10px;font-weight:bold; color:#333; font-family:'微软雅黑'">Mr.Graceless五周年全国巡演</td>
            </tr>
      <tr>
        <td height="40"><p  style="padding:0 6px 0 10px; font-size:14px; color:#666;">作为北京新一代独立摇滚乐队的代表之一，Mr. Graceless</p></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="11"></td>
            <td width="60" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">音乐</td>
            <td width="23"></td>
            <td width="60" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">热门活动</td>
            <td width="125">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="9"></td>
            <td width="38" align="center" style="color:#666; font-size:12px;">评论</td>
            <td width="31" align="center" style="background-image:url(${ctx}/images/button122.png); height:25px; width:30px; color:#fff; font-size:12px;">99</td>
            <td width="44" align="center" style="color:#666; font-size:12px;">评分</td>
            <td width="119" style="color:#666; font-size:12px;">9.0</td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px; background-color:#FFF;">
  <tr>
    <td width="31%"><img src="${ctx}/dynamic/topic_but2.png" width="111" height="113" /></td>
    <td width="69%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
            <td  style="font-size:16px; padding:3px 0 0 10px;font-weight:bold; color:#333; font-family:'微软雅黑'">Mr.Graceless五周年全国巡演</td>
            </tr>
      <tr>
        <td height="40"><p  style="padding:0 6px 0 10px; font-size:14px; color:#666;">作为北京新一代独立摇滚乐队的代表之一，Mr. Graceless</p></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="11"></td>
            <td width="60" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">音乐</td>
            <td width="23"></td>
            <td width="60" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">热门活动</td>
            <td width="125">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="9"></td>
            <td width="38" align="center" style="color:#666; font-size:12px;">评论</td>
            <td width="31" align="center" style="background-image:url(${ctx}/images/button122.png); height:25px; width:30px; color:#fff; font-size:12px;">99</td>
            <td width="44" align="center" style="color:#666; font-size:12px;">评分</td>
            <td width="119" style="color:#666; font-size:12px;">9.0</td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>

      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
  <tr>
    <td><img src="${ctx}/dynamic/topic_but3.png" width="351" height="268" /></td>
  </tr>
</table>

    </div>
    
 </div>
 
 
 <div style="position:relative;height:50px; padding:10px 25px 0 25px;">
	   <div style="height:50px; color:#999;">
	     <table width="63%" border="0" cellspacing="0" cellpadding="0">
	       <tr>
	         <td width="86%" align="right" style="font-family:'微软雅黑'; padding:10px 10px 0 0 ;font-size:16px; font-weight:bold;">上一页 1 2 3 4 5  下一页</td>
	        
           </tr>
         </table>
      </div>
 </div> 
 
 
 
  <jsp:include page="/common/bottom.jsp" />
  
</div>
</div>


</body>
</html>
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>

