<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />
<title>漕河泾e服务</title>
<style type="text/css">
/* 我的订单 */

.myorder_font{ color:#00b38a; font-size:14px;  font-weight:bold; text-align:center; padding-top:15px;padding-bottom:15px;}

.orderinfo-title{
margin-left:10px;float:left;	width:310px; height:50px; background-color:#FFF;

}

ul.ul-button li{
width:100px;
height:40px;
list-style: none;
color:#fff;
background:#65d8bd;
font-weight:bold;
}
ul.ul-button li:hover{
cursor:pointer;
background:#00b36b;
}
ul.ul-button li div{
text-align: center;
padding-top:10px;
}
ul.ul-buy {
margin:0px;
}
ul.ul-buy li{
width:100px;
height:40px;
list-style: none;
color:#fff;
background:#f15f48;
font-weight:bold;
}
ul.ul-buy li:hover{
cursor:pointer;
background:#f15f22;
}
ul.ul-buy li div{
text-align: center;
padding-top:10px;
}
.orderinfo {
color:#999;
font-size:14px; 
 font-weight:bold;
}
.orderinfo a{
text-decoration: underline;
color:#999;cursor:pointer;
 font-size:14px;  font-weight:bold;
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
           <div class="menu1"><img src="${ctx}/images/menu_35.jpg" style="width:190px;" onclick="gotoPage('${ctx}/product!findUserOrder.action')" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_43.jpg" onclick="gotoPage('${ctx}/pages/personal_friend.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_49.jpg" onclick="gotoPage('${ctx}/pages/personal_topic.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_44.jpg" onclick="gotoPage('${ctx}/pages/personal_circle.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_45.jpg" onclick="gotoPage('${ctx}/pages/personal_activity.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_46.jpg" onclick="gotoPage('${ctx}/pages/personal_share.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_47.jpg" onclick="gotoPage('${ctx}/pages/personal_collection.jsp')"/></div>
	    </div>
  
</div>

 <div style="position:relative;height:50px;  padding:10px 25px 0 25px;">
	   <div>
	    
	       <table style="height:50px;margin-left:0px;font-weight:bold;width:950px;background:#fff;">
	       <tr><td valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单编号：${order.flowNo }</td></tr>
	       </table>
	  
	   </div>
</div>
 
 
 <div style="position:relative;height:50px;  padding:10px 25px 0 25px;">
	   <div>
	      <div class="orderinfo-title" style="margin-left:0px;"><p class="myorder_font">操作人</p></div> 
          <div class="orderinfo-title" ><p class="myorder_font">操作类型</p></div> 
          <div class="orderinfo-title" ><p class="myorder_font">时间</p></div> 
	   </div>
 </div>
 
  <div style="height:900px;">
  <c:forEach var ="flow" items="${flowList}">
   <div style="position:relative;height:50px; padding:10px 25px 0 25px;">
	   <div style="">
	      <div class="orderinfo-title"  style="margin-left:0px;width:320px;"><p class="myorder_font">${flow.name}</p></div> 
          <div class="orderinfo-title"  style="margin-left:0px;width:310px;"><p class="myorder_font">${flow.statusValue}</p></div> 
          <div class="orderinfo-title"  style="margin-left:0px;width:320px;"><p class="myorder_font">
           ${flow.createDate}
          </p></div> 
	   </div>
 </div>
</c:forEach>

  </div>
  
  <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>


 
 
 

</body>
</html>

