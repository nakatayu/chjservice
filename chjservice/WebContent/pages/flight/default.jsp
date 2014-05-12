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
<script type="text/javascript">
	function setvalue(str) {
		var reqq = null;
		if (window.XMLHttpRequest) { //非IE浏览器，创建XMLHttpRequest对象
			reqq = new XMLHttpRequest("utf-8");
		} else if (window.ActiveXObject) { //IE浏览器，创建XMLHttpRequest对象
			var arrSignatures = [ "Msxml2.XMLHTTP", "Microsoft.XMLHTTP",
					"Microsoft.XMLHTTP", "MSXML2.XMLHTTP.5.0",
					"MSXML2.XMLHTTP.4.0", "MSXML2.XMLHTTP.3.0",
					"MSXML2.XMLHTTP" ];
			for ( var i = 0; i < arrSignatures.length; i++) {
				reqq = new ActiveXObject(arrSignatures[i], "utf-8");
			}
		}
		var user = document.getElementById("username").value;
		var id = document.getElementById("userid").value;
		var s = "user=" + user + "&id=" + id+"&test="+str;
		reqq.open("POST", "${ctx}/common!test.action", true);
		reqq.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		reqq.onreadystatechange = function() {
			if (reqq.readyState == 4) {
				if (reqq.status == 200) {
					document.getElementById("DIGITAL_SIGN").value = reqq.responseText;
				    document.getElementById("frm").action = "flight.jsp";
				    document.getElementById("frm").submit();
				}
			}
		};
		reqq.send(encodeURI(s));
	}
</script>
</head>
<body>

	<form id="frm" name="frm" method="post" action="">
	<input type="hidden" id="DIGITAL_SIGN" name="DIGITAL_SIGN" value="" />
		<table id="tab" name="tab">
			<caption align="top" style="font-size: 40px;">
				表&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单</caption>
			<tr>
				<th>公司ID:</th>
				<td><input type="text" name="FUI_CP_ID" value="000021" /></td>
			</tr>
			<tr>
				<th>用户名:</th>
				<td><input type="text" id="username" name="username"
					value="admin" /></td>
			</tr>
			<tr>
				<th>邮箱:</th>
				<td><input type="text" name="FUI_EMAIL"	value="2670994100@qq.com" /></td>
			</tr>
			<tr>
				<th>手机号码:</th>
				<td><input type="text" name="FUI_MOBILE" value="15801811785" /></td>
			</tr>
			<tr>
				<th>证件姓:</th>
				<td><input type="text" name="FUC_SURNAME" value="刘" /></td>
			</tr>
			<tr>
				<th>证件名:</th>
				<td><input type="text" name="FUC_THENAME" value="东台" /></td>
			</tr>
			<tr>
				<th>证件类型:</th>
				<td><input type="radio" name="FUC_CARDTYPE" value="0" align="left"
					checked="checked" />身份证 <input width="10px" name="FUC_CARDTYPE"
					type="radio" value="1" align="left" />护照</td>
			</tr>
			<tr>
				<th>证件号码:</th>
				<td><input type="text" id="userid" name="userid"
					value="610324198710022050" /></td>
			</tr>
			<tr>
				<th colspan="2">
				<input type="button" name="w1" id="" value="机票预定" onclick="setvalue('initSearchFlight')" class="button" /> 
				<input type="button" name="w2" id="" value="订单查询" onclick="setvalue('queryTaItinerary')"class="button" /> 
				<input type="button" name="w3" id="" value="临时差旅人" onclick="setvalue('queryTempTravller')" class="button" /></th>
			</tr>
		</table>
	</form>
</body>
</html>