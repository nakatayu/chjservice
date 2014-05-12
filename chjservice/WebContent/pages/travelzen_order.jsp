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
	     <div style="float:left;"><img  onclick="gotoPage('${ctx}/pages/travelzen.jsp')" src="${ctx}/images/travelzen_02.jpg" style="width:95px;"/></div>
         <div class="menu1"><img src="${ctx}/images/travelzen_04.jpg" style=" width:190px;" /></div>
         <!-- <div class="menu1"><img onclick="gotoPage('${ctx}/pages/travelzen_people.jsp')" src="${ctx}/images/travelzen_06.jpg" /></div> -->
         <div class="menu1"><img src="${ctx}/images/travelzen_bg.jpg" style="width:90px"/></div>
         <div><img src="${ctx}/images/travelzen_bg.jpg" style="width:570px;" /></div>
	   </div>
 </div>

<div style="position:relative;height:900px; padding:10px 25px 0 25px;">
  <div id="infosit" style="width:950px;" >
   
    <iframe name="topiframe" width="950" height="900px"   style="frameborder:no;border:0;allowtransparency:yes;" marginwidth="0" marginheight="0" scrolling="auto">
		</iframe>
	
 </div>
 <div id="test" style="display: none;"></div>
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
		data : {ticketType : 1},
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
