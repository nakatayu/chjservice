<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>漕河泾e服务</title>
<style type="text/css">
form {
	text-align: center;
}

table {
	background-color: green;
	margin: auto;
	text-align: center;
	font-size: 20px;
}

input {
	font-size: 20px;
}

h1 {
	color: red;
}
</style>
</head>
<body onload="frm.submit()">
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<form name="frm" method="post"
		action="http://180.169.46.150:7080/online/travelzen/embedEntrance.action">
		<input type="hidden" id="DIGITAL_SIGN" name="DIGITAL_SIGN"
			value="${param.DIGITAL_SIGN}" /> <input type="hidden"
			name="FUI_CP_ID" value="${param.FUI_CP_ID }" /> <input type="hidden"
			name="FUI_EMAIL" value="${param.FUI_EMAIL }" /> <input type="hidden"
			name="FUI_MOBILE" value="${param.FUI_MOBILE }" /> <input
			type="hidden" name="FUC_SURNAME" value="${param.FUC_SURNAME }" /> <input
			type="hidden" name="FUC_THENAME" value="${param.FUC_THENAME }" /> <input
			type="hidden" name="FUC_CARDTYPE" value="${param.FUC_CARDTYPE }" />

	</form>

</body>
</html>