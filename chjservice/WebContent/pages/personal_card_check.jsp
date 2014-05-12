<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>漕河泾e服务</title>
<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${ctx }/js/ajaxupload.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/css/input.css" />
<style type="text/css">
.btns {
	border: 1px;
	background-color: yellow;
	font-size: 16px;
	width: 80px;
	height: 30px;
}

.btns:HOVER {
	background-color: red;
}
</style>
</head>

<body>

<table width="100%" cellpadding="0" cellspacing="0" bgcolor="#fff">
<tr>
<td id="popupTitle">证件信息:</td>
<td  align="right"></td>
</tr>
<c:choose>
<c:when test="${fn:length(userCard)>0}">
<tr><td colspan="2" align="left" style="font-size: 16px;height:20px;">&nbsp;</td></tr>
<tr><td colspan="2" align="center" valign="top"><img src="${imageStorePath}${userCard.file_path}" width="300"/></td></tr>
<tr><td colspan="2" align="left" style="font-size: 16px;">申请原因:${userCard.reason}</td></tr>
<tr><td colspan="2" align="left" style="font-size: 16px;height:20px;">&nbsp;</td></tr>
</c:when>
<c:otherwise>
<tr><td colspan="2" align="left" style="font-size: 16px;height:20px;">&nbsp;</td></tr>
<tr><td colspan="2" align="center" style="font-size: 26px;height:300px;">没有相关证件!!!</td></tr>
<tr><td colspan="2" align="left" style="font-size: 16px;height:20px;">&nbsp;</td></tr>
</c:otherwise>
</c:choose>
</table>

 </body>
 
 </html>
