<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${ctx}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.easyui.min.js"></script>
<title>漕河泾e服务</title>
<style type="text/css">
.conv1 {
	float: left;
	margin-left: 10px;
}

.conv1 img {
	width: 110px;
	height: 110px;
	cursor: pointer;
}

.conv2 {
	float: left;
	margin-left: 10px;
}

.conv2 img {
	width: 230px;
	height: 110px;
	cursor: pointer;
}

.conv3 {
	float: left;
	margin-left: 10px;
}

.conv3 img {
	width: 230px;
	height: 250px;
	cursor: pointer;
}

.conv4 {
	float: left;
	margin-left: 10px;
}

.conv4 img {
	width: 230px;
	height: 210px;
	cursor: pointer;
}
.personal_fr1{
float:left;margin-left:10px;
}
.myorder1 img{
width:110px;height:115px;cursor:pointer;
}
</style>
</head>

<body>
	<jsp:include page="/common/header.jsp" />
	<form id="frm" name="frm" method="post" action="" target="">
		<input type="hidden" id="DIGITAL_SIGN" name="DIGITAL_SIGN" value=""/>
		<input type="hidden" id="FUI_CP_ID" name="FUI_CP_ID" value="000122" />
		<input type="hidden" id="FUI_EMAIL" name="FUI_EMAIL" value="${user.email}" /> 
		<input type="hidden" id="FUI_MOBILE" name="FUI_MOBILE" value="${user.phone}" /> 
		<input type="hidden" id="FUC_SURNAME" name="FUC_SURNAME" value="${user.firstName}" /> 
		<input type="hidden" id="FUC_THENAME" name="FUC_THENAME" value="${user.lastName}" /> 
		<input type="hidden" id="FUC_CARDTYPE" name="FUC_CARDTYPE" value="0" /> 
	</form>
		
	<div class="main">
<div id="main_content" class="main_content">
 
<div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	   <div>
	     <div style="float:left;"><img src="${ctx}/images/travelzen_01.jpg" /></div>
         <div class="menu1"><img src="${ctx}/images/travelzen_05.jpg" onclick="gotoPage('${ctx}/pages/travelzen_order.jsp')"/></div>
         <!-- <div class="menu1"><img src="${ctx}/images/travelzen_06.jpg" onclick="gotoPage('${ctx}/pages/travelzen_people.jsp')"/></div> -->
         <div class="menu1"><img src="${ctx}/images/travelzen_bg.jpg" style="width:90px"/></div>
         <div><img src="${ctx}/images/travelzen_bg.jpg" style="width:570px;" /></div>
	   </div>
 </div>

    <div style="position:relative; margin: 10px 0 0 25px;width:950px;height:113px;background-image:url(${ctx}/images/travelzenLogo.jpg);">
    <div style="padding: 10px 0 0 200px;">
    <div>上海长寿国际旅行社有限公司</div>
    <div style="
    font-size: 12px;
    padding: 10px 25px 0 0;
    color: #666666;
    line-height: 23px;
    "><p>漕河泾长寿国旅机票专区是上海长寿国际旅行社有限公司旗下真旅网协助漕河泾e服务公共服务平台建设的，实现机票实时查询、报价、支付和确认的一站式机票服务专区。</p>
    <p>联系方式：4006206266转7</p></div>
    </div>
    </div>
<div style="position:relative;height:1000px; padding:0 25px 0 25px;">
  <div id="infosit" style="width:100%;" >
   
    <iframe name="topiframe" width="100%" height="1000"    style="border:0;frameborder:no;allowtransparency:yes;" marginwidth="0" marginheight="0" scrolling="scroll">
		 
		
		</iframe>
	
 </div>
 <div id="test" style="display: none;background-color: #FFF;height:1000px;"></div>
 
</div>
 
 
  <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>


</body>
</html>
<script type="text/javascript">

$(document).ready(function(){

	$.ajax({
		type : "POST",
		url : '${ctx}/common!travelTicket.action',
		dataType : 'json',
		data : {ticketType : 0},
		success : function(msg, status) {
			if (msg.status == 200) {
				
				document.getElementById("DIGITAL_SIGN").value = msg.rows;
				document.getElementById("frm").action = "http://corp.travelzen.com/online/travelzen/embedEntrance.action";
				document.getElementById("frm").target = "topiframe";
				document.getElementById("frm").submit();
				
			} else{
				
				$('#test').html(msg.msg);
				$('#infosit').hide();
				$('#test').show();
			} 
		}
	});
});
	
</script>