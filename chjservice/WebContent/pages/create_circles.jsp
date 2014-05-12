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
   
   <div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	  <div style="float:left;"><img src="${ctx}/images/menu_48.jpg" onclick="gotoPage('${ctx}/pages/personal_set.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_41.jpg" onclick="gotoMyCart()"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_42.jpg" onclick="gotoPage('${ctx}/product!findUserOrder.action')"/></div>
             <div class="menu1"><img src="${ctx}/images/menu_43.jpg" onclick="gotoPage('${ctx}/pages/personal_friend.jsp')"/></div>
             <div class="menu1"><img src="${ctx}/images/menu_49.jpg" onclick="gotoPage('${ctx}/pages/personal_topic.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_39.jpg" style="width:190px;"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_45.jpg" onclick="gotoPage('${ctx}/pages/personal_activity.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_46.jpg" onclick="gotoPage('${ctx}/pages/personal_share.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_47.jpg" onclick="gotoPage('${ctx}/pages/personal_collection.jsp')"/></div>
	    </div>
  
</div>

 
<div style="position:relative;height:635px; padding:0 25px 0 25px;">
  <div>
    <div style="float:left; width:572px; height:635px; background-color:#fffef9; border-bottom:#00b38a 3px solid;"></div>
    
    
    <div class="personal_fr1" style="width:366px; height:635px; background-color:#fffef9; border-bottom:#00b38a 3px solid;">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="48" style="font-size:16px; font-weight:bolder; padding:20px 0 0 20px;">上传圈子图片</td>
        </tr>
        <tr>
          <td height="37" align="center"><img src="${ctx}/images/create_1.jpg" width="194" height="30" /></td>
        </tr>
        <tr>
          <td height="34" style="font-size:16px; font-weight:bolder; padding:0 0 0 20px;"><img src="${ctx}/images/create_7.png" width="25" height="23" /> 图片</td>
        </tr>
        <tr>
          <td height="96" align="center"><img src="${ctx}/images/create_6.jpg" width="94" height="95" /></td>
        </tr>
         <tr>
          <td height="48" style="font-size:16px; font-weight:bolder; padding:20px 0 0 20px;">上传证件照片</td>
        </tr>
        <tr>
          <td height="42" align="center"><img src="${ctx}/images/create_1.jpg" width="194" height="30" /></td>
        </tr>
      <tr>
          <td height="57" style="font-size:16px; font-weight:bolder; padding:0 0 0 20px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="76%"><img src="${ctx}/images/create_7.png" width="25" height="23" /> 照片</td>
              <td width="24%">修改</td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="115" align="center"><img src="${ctx}/images/create_6.jpg" width="94" height="95" /></td>
              <td align="center"><img src="${ctx}/images/create_6.jpg" width="94" height="95" /></td>
              <td align="center"><img src="${ctx}/images/create_6.jpg" width="94" height="95" /></td>
            </tr>
            <tr>
              <td align="center"><img src="${ctx}/images/create_6.jpg" width="94" height="95" /></td>
              <td align="center"><img src="${ctx}/images/create_6.jpg" width="94" height="95" /></td>
              <td align="center"><img src="${ctx}/images/create_6.jpg" width="94" height="95" /></td>
            </tr>
          </table></td>
        </tr>
        </table>
    </div>
    
   </div>
 </div>
 
 
<div style="position:relative;height:280px; padding:0 25px 0 25px;">

<div style="float:left; width:948px; height:280px; background-color:#fffef9; border-bottom:#00b38a 3px solid;">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="45"><span style="font-size:16px; font-weight:bolder; padding:0 0 0 20px;">圈子等级</span></td>
    </tr>
    <tr>
      <td height="45"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="5%" height="38" align="center">&nbsp;</td>
          <td width="6%" height="38" align="center" bgcolor="#71cec8" style="color:#FFF;">一级</td>
          <td width="5%" height="38" align="center">&nbsp;</td>
          <td width="6%" height="38" align="center" bgcolor="#71cec8" style="color:#FFF;">二级</td>
          <td width="5%" height="38" align="center">&nbsp;</td>
          <td width="6%" height="38" align="center" bgcolor="#71cec8" style="color:#FFF;">三级</td>
          <td width="5%" height="38" align="center">&nbsp;</td>
          <td width="6%" height="38" align="center" bgcolor="#71cec8" style="color:#FFF;">四级</td>
          <td width="5%" height="38" align="center">&nbsp;</td>
          <td width="6%" height="38" align="center" bgcolor="#71cec8" style="color:#FFF;">五级</td>
          <td width="6%" align="center">&nbsp;</td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td height="45"><span style="font-size:16px; font-weight:bolder; padding:0 0 0 20px;">圈子说明</span></td>
    </tr>
    <tr>
      <td height="45" align="center"><form id="form1" name="form1" method="post" action="">
        <textarea name="textfield" cols="100" rows="5" id="textfield"></textarea>
      </form></td>
    </tr>
  </table>
</div>

   </div>
   
   <div style="position:relative;height:680px; padding:0 25px 0 25px;">

<div style="float:left; width:948px; height:680px; background-color:#fffef9; border-bottom:#00b38a 3px solid;"></div>

   </div>

 

 

 
  <jsp:include page="/common/bottom.jsp" />
  
</div>
</div>


</body>
</html>
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>

