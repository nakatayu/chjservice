<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
<title>漕河泾e服务</title>
<script>
function goback_prepage(){
	window.history.go(-1);
}
</script>
</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />
<script type=text/javascript src="${ctx}/js/slides.jquery.js"></script>


<div class="main">
<div id="main_content" class="main_content">
	<table cellpadding="0" cellspacing="0" border="0" style="margin-left:25px;width:950px;height:1200px;background-color: #fff;">
	 <tr>
	 <td width="424" valign="top" align="right" style="padding-top:90px;">
	  <img src="${ctx}/images/error_sorry.jpg"/>
	 </td>
	 <td valign="top" align="center" style="padding-top:240px;">
	 		<div style="color:#009393;font-size:24px;">${result}</div>
			<a href="javascript:void(0)" onclick="goback_prepage()" style="color:#009393;font-size:24px;">返回</a>
	 </td>
	 </tr>
	</table>
	
	 <jsp:include page="/common/bottom.jsp" />
</div>
</div>

</body>
</html>