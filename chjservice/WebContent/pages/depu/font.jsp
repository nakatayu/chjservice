<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/js/dialog/dialog_subModal.css" />
<title>漕河泾e服务</title>
<style type="text/css">


</style>
</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />
<script type="text/javascript" src="${ctx}/js/dialog/dialog_common.js"></script>
<script type="text/javascript" src="${ctx}/js/dialog/dialog_subModal.js"></script>

<div class="main">
<div id="main_content" class="main_content">
   
  
   

<div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	     <div style="float:left;"><img src="${ctx}/images/menu_48.jpg" onclick="gotoPage('${ctx}/pages/personal_set.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_41.jpg" onclick="gotoMyCart()"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_35.jpg" style="width:190px;" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_43.jpg" onclick="gotoPage('${ctx}/pages/personal_friend.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_49.jpg" onclick="gotoPage('${ctx}/pages/personal_topic.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_44.jpg" onclick="gotoPage('${ctx}/pages/personal_circle.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_45.jpg" onclick="gotoPage('${ctx}/pages/personal_activity.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_46.jpg" onclick="gotoPage('${ctx}/pages/personal_share.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_47.jpg" onclick="gotoPage('${ctx}/pages/personal_collection.jsp')"/></div>
	    </div>
  
</div>
<div style="position:relative;padding:10px 25px 0 25px;">
<div style="background-color: #FFF;font-family: '微软雅黑';padding: 20px 0 20px 0;height: 230px;">

<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center" id="tabInfo">
<tr><td width="100px" height="90px" rowspan="3"></td><td>订单号：</td><td>201312180000003</td><td rowspan="3" style="font-size: 30px;">
付款成1122！
</td></tr>
<tr><td>收货人：</td><td>小邹</td></tr>
<tr><td>付款金额：</td><td>20.00</td></tr>
<tr><td colspan="4" align="center"><a>返回我的订单</a></td></tr>  
</table>
</div>
</div>

  <jsp:include page="/common/bottom.jsp" />  
</div>
</div>

</body>
</html>
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript">
var orderNo="${param.no}";

$(document).ready(function(){
	 $.ajax({
		  type: "POST",
		  url : '${ctx}/product!operatorMoneyCheck.action',
		  dataType:'json',
		  data:{orderId:orderNo},
		  success: function(msg,status){
			  if(msg.status==200){
				  
				  var str='';
				  var data=msg.rows;
				  
				  str+='<tr><td width="100px" height="90px" rowspan="3"></td><td>订单号：</td>';
				  str+='<td>'+data["flowNo"]+'</td><td rowspan="3" style="font-size: 30px;">';
				  if(data["payStatus"]==2){
					  str+='付款成功！';
				  }else if(data["payStatus"]==1){
					  str+='付款失败！';
				  }else{
					  str+='其他错误！';
				  }
				  str+='</td></tr><tr><td>收货人：</td><td>'+data["name"]+'</td></tr>';
				  str+='<tr><td>付款金额：</td><td>'+data["total"]+'</td></tr>';
				  str+='<tr><td colspan="4" align="center"><a>返回我的订单</a></td></tr>';
				  $('#tabInfo').html(str);			  
			  }else{
				  $('#tabInfo').html('<tr><td>'+msg.msg+'</td></tr>');
			  }			  
		  }		  
	 });
		
});


</script>

