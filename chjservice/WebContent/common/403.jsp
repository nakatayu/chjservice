<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>403 - 缺少权限</title>
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
	 		<div style="color:#009393;font-size:24px;">你没有访问该页面的权限.</div>
			<a href="${ctx}" style="color:#009393;font-size:24px;">返回</a>
	 </td>
	 </tr>
	</table>
	
	 <jsp:include page="/common/bottom.jsp" />
</div>
</div>

</body>
</html>