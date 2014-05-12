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
	     <div style="float:left;"><img src="${ctx}/images/menu_68.jpg" onclick="gotoPage('${ctx}/community!communityHome.action')" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_62.jpg" onclick="gotoPage('${ctx}/pages/community_topiclist.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_70.jpg" onclick="gotoPage('${ctx}/pages/community_activitylist.jsp ')" style="width:190px;" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_63.jpg" onclick="gotoPage('${ctx}/community!findLableListCircle.action')"/></div>
           <div><img src="${ctx}/images/menu_66.png" style="width:473px;height: 100px;" /></div>
	    </div>
</div>
 


<div style="position:relative;height:50px; padding:10px 25px 0 15px;">
	   <div><table width="590" border="0" height="50" cellspacing="0" cellpadding="0" bgcolor="#ffc61a" class="comm2">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="5%" bgcolor="#f1a71a">&nbsp;</td>
        <td width="19%" align="center" bgcolor="#f1a71a" style="font-size:18px; color:#FFF; font-family:'黑体'">按时间排序</td>
        <td width="10%" height="50" bgcolor="#f1a71a"><img src="${ctx}/dynamic/activ_4.png" width="23" height="21" /></td>
        <td width="23%" align="center" style="font-size:18px; color:#FFF; font-family:'黑体'">按人气排序</td>
        <td width="6%"><img src="${ctx}/dynamic/activ_4.png" width="23" height="21" /></td>
        <td width="30%" style="font-size:18px; color:#FFF; font-family:'黑体'">按可参与人数排序</td>
        <td width="7%"><img src="${ctx}/dynamic/activ_4.png" width="23" height="21" /></td>
      </tr>
    </table></td>
    </tr>
 
       </table>

 <div style="float:right;  width:350px; height:50px;">
   <table width="100%" border="0" cellspacing="0" height="50" cellpadding="0" bgcolor="#f0b543">
     <tr>
       <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td width="31%">&nbsp;</td>
           <td width="27%" style="font-size:20px; color:#FFF; font-family:'黑体'">发起活动</td>
           <td width="42%"><img src="${ctx}/dynamic/activ_3.png" width="23" height="20" /></td>
         </tr>
       </table></td>
     </tr>
     </table>
 </div>
</div>
 </div>
 
 
 <div style="position:relative;height:186px; padding:1px 25px 0 15px;">
	   <div><table width="590" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" class="comm2">
  <tr>
    <td width="230"><img src="${ctx}/images/tupian2.png" width="230" height="186" /></td>
    <td width="360" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="46"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="comm_ys" style="font-size:18px; color:#333; font-family:'微软雅黑'">Mr.Graceless五周年全国巡演</td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="108"><p class="comm_ysdis" style="padding-right:10px; font-size:14px; color:#666;">作为北京新一代独立摇滚乐队的代表之一，Mr. Graceless（不优雅先生）的三个人看上去似乎太过于平常了，你甚至很难将台下的他们同那支满怀着抱负正冉冉升起的新晋乐队联系起来。</p></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="11"></td>
                <td width="35" align="center" style="color:#666; font-size:14px;">评论</td>
                <td width="34" align="center" style="background-image:url(${ctx}/images/button122.png); height:25px; width:30px; color:#fff; font-size:12px;">99</td>
                <td width="33"></td>
                <td width="60" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
                <td width="23"></td>
                <td width="60" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
                <td width="125">&nbsp;</td>
              </tr>
            </table></td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
 
       </table>

 <div style="float:right;  width:350px; height:186px;">
   <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f9f9f7">
     <tr>
       <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td width="32%" align="center" background="${ctx}/images/map9.png" style="height:70px"><p style="color:#666;">可参与人数</p><p><strong style="color:#333;">38人</strong></p></td>
           <td width="1" align="center"></td>
           <td width="32%" align="center" background="${ctx}/images/map9.png" style="height:70px"><p style="color:#666;">已参加人数</p><p><strong style="color:#333;">62人</strong></p></td>
           <td width="1" align="center"></td>
           <td width="34%" align="center" background="${ctx}/images/map9.png" style="height:70px"><p style="color:#666;">人数限制</p><p><strong style="color:#333;">99人</strong></p></td>
         </tr>
       </table></td>
     </tr>
     <tr>
       <td height="45" align="center"><p>活动时间:</p><p><strong style="color:#666;">10月19日，周六，21:00 </strong></p></td>
     </tr>
     <tr>
       <td height="70" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td align="center"><img src="${ctx}/images/button1.jpg" width="150" height="31" /></td>
           </tr>
       </table></td>
     </tr>
   
   </table>
 </div>
</div>
 </div>
 
 <div style="position:relative;height:186px; padding:10px 25px 0 15px;">
	   <div><table width="590" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" class="comm2">
  <tr>
    <td width="230"><img src="${ctx}/images/tupian2.png" width="230" height="186" /></td>
    <td width="360" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="46"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="comm_ys" style="font-size:18px; color:#333; font-family:'微软雅黑'">Mr.Graceless五周年全国巡演</td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="108"><p class="comm_ysdis" style="padding-right:10px; font-size:14px; color:#666;">作为北京新一代独立摇滚乐队的代表之一，Mr. Graceless（不优雅先生）的三个人看上去似乎太过于平常了，你甚至很难将台下的他们同那支满怀着抱负正冉冉升起的新晋乐队联系起来。</p></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="11"></td>
                <td width="35" align="center" style="color:#666; font-size:14px;">评论</td>
                <td width="34" align="center" style="background-image:url(${ctx}/images/button122.png); height:25px; width:30px; color:#fff; font-size:12px;">99</td>
                <td width="33"></td>
                <td width="60" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
                <td width="23"></td>
                <td width="60" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
                <td width="125">&nbsp;</td>
              </tr>
            </table></td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
 
       </table>

 <div style="float:right;  width:350px; height:186px;">
   <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f9f9f7">
     <tr>
       <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td width="32%" align="center" background="${ctx}/images/map9.png" style="height:70px"><p style="color:#666;">可参与人数</p><p><strong style="color:#333;">38人</strong></p></td>
           <td width="1" align="center"></td>
           <td width="32%" align="center" background="${ctx}/images/map9.png" style="height:70px"><p style="color:#666;">已参加人数</p><p><strong style="color:#333;">62人</strong></p></td>
           <td width="1" align="center"></td>
           <td width="34%" align="center" background="${ctx}/images/map9.png" style="height:70px"><p style="color:#666;">人数限制</p><p><strong style="color:#333;">99人</strong></p></td>
         </tr>
       </table></td>
     </tr>
     <tr>
       <td height="45" align="center"><p>活动时间:</p><p><strong style="color:#666;">10月19日，周六，21:00 </strong></p></td>
     </tr>
     <tr>
       <td height="70" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td align="center"><img src="${ctx}/images/button1.jpg" width="150" height="31" /></td>
           </tr>
       </table></td>
     </tr>
   
   </table>
 </div>
</div>
 </div>
 
 <div style="position:relative;height:186px; padding:10px 25px 0 15px;">
	   <div><table width="590" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" class="comm2">
  <tr>
    <td width="230"><img src="${ctx}/images/tupian2.png" width="230" height="186" /></td>
    <td width="360" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="46"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="comm_ys" style="font-size:18px; color:#333; font-family:'微软雅黑'">Mr.Graceless五周年全国巡演</td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="108"><p class="comm_ysdis" style="padding-right:10px; font-size:14px; color:#666;">作为北京新一代独立摇滚乐队的代表之一，Mr. Graceless（不优雅先生）的三个人看上去似乎太过于平常了，你甚至很难将台下的他们同那支满怀着抱负正冉冉升起的新晋乐队联系起来。</p></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="11"></td>
                <td width="35" align="center" style="color:#666; font-size:14px;">评论</td>
                <td width="34" align="center" style="background-image:url(${ctx}/images/button122.png); height:25px; width:30px; color:#fff; font-size:12px;">99</td>
                <td width="33"></td>
                <td width="60" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
                <td width="23"></td>
                <td width="60" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
                <td width="125">&nbsp;</td>
              </tr>
            </table></td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
 
       </table>

 <div style="float:right;  width:350px; height:186px;">
   <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f9f9f7">
     <tr>
       <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td width="32%" align="center" background="${ctx}/images/map9.png" style="height:70px"><p style="color:#666;">可参与人数</p><p><strong style="color:#333;">38人</strong></p></td>
           <td width="1" align="center"></td>
           <td width="32%" align="center" background="${ctx}/images/map9.png" style="height:70px"><p style="color:#666;">已参加人数</p><p><strong style="color:#333;">62人</strong></p></td>
           <td width="1" align="center"></td>
           <td width="34%" align="center" background="${ctx}/images/map9.png" style="height:70px"><p style="color:#666;">人数限制</p><p><strong style="color:#333;">99人</strong></p></td>
         </tr>
       </table></td>
     </tr>
     <tr>
       <td height="45" align="center"><p>活动时间:</p><p><strong style="color:#666;">10月19日，周六，21:00 </strong></p></td>
     </tr>
     <tr>
       <td height="70" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td align="center"><img src="${ctx}/images/button1.jpg" width="150" height="31" /></td>
           </tr>
       </table></td>
     </tr>
   
   </table>
 </div>
</div>
 </div>
 
 <div style="position:relative;height:50px; padding:10px 25px 0 25px;">
	   <div style="height:50px; color:#999;">
	     <table width="100%" border="0" cellspacing="0" cellpadding="0">
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

