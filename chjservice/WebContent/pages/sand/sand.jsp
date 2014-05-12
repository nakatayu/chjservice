<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${ctx}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.easyui.min.js"></script>
<title>漕河泾e服务</title>
<style type="text/css">
.menuu11 {
	float: left;
	cursor: pointer;
}

.menuu1 {
	float: left;
	cursor: pointer;
}
</style>
</head>

<body>
	<jsp:include page="/common/header.jsp" />
	<form id="furm" name="furm" method="post" action="" target="">
		<input type="hidden" id="ac" name="ac" value="" /> <input
			type="hidden" id="mid" name="mid" value="" /> <input type="hidden"
			id="signCardNo" name="signCardNo" value="" /> <input type="hidden"
			id="memid" name="memid" value="" /> <input type="hidden" id="sign"
			name="sign" value="" />
	</form>

	<div class="main">
		<div id="main_content" class="main_content">

			<div
				style="position: relative; height: 100px; padding: 10px 25px 0 25px;">
				<div id="menuu"
					style="background:  url('${ctx}/images/travelzen_bg.jpg') repeat-x;width:950px;height:100px;">

					<img class="menuu11" src="${ctx}/images/sand0.jpg" onclick="sandrequest(this,2)" /> 
					<img class="menuu1" src="${ctx}/images/sandy1.jpg" onclick="sandrequest(this,0)" /> 
					<img class="menuu1" src="${ctx}/images/sandy2.jpg" onclick="sandrequest(this,1)" />
					<div></div>
				</div>
			</div>
			<div
				style="position: relative; height: 114px; padding: 10px 25px 0 25px;">
				<div
					style=" background-image:url('${ctx}/images/sandlogo.png');height:114px;">
				</div>
			</div>

			<div
				style="position: relative; height: auto; padding: 0 25px 0 25px;">

				<iframe name="topiframe" width="100%"
					style="border: 0; frameborder: no; allowtransparency: yes; min-height: 600px; background-color: #FFF;"
					marginwidth="0" marginheight="0" scrolling="auto"> </iframe>
			</div>

			<jsp:include page="/common/bottom.jsp" />
		</div>
	</div>


</body>
</html>
<script type="text/javascript">
	
	$(function() {
		sandrequest(0,2);
	});

	function sandrequest(obj, num) {
		if ($(obj).attr('class') == 'menuu1') {
			$(obj).parent().find('img').each(function(k, v) {
				if (this == obj) {
					$(this).attr('class', 'menuu11');
					$(this).attr('src', '${ctx}/images/sand' + k + '.jpg');
				} else {
					$(this).attr('class', 'menuu1');
					$(this).attr('src', '${ctx}/images/sandy' + k + '.jpg');
				}
			});
		}

		$.ajax({
			type : "POST",
			url : '${ctx}/common!sandlinks.action',
			dataType : 'json',
			data : {type : num},
			success : function(msg, status) {
				if (msg.status == 200) {
					var data = msg.rows;
					$('#ac').val(data["ac"]);
					$('#mid').val(data["mid"]);
					$('#signCardNo').val(data["signCardNo"]);
					$('#memid').val(data["memid"]);
					$('#sign').val(data["sign"]);
					document.getElementById("furm").action = "http://query-test.sandpay.com.cn/common/popuController.do";
					document.getElementById("furm").target = "topiframe";
					document.getElementById("furm").submit();
				} else {
					alert(msg.msg);
					location.href="${ctx}/pages/personal_set.jsp";
				}
			}
		});
	}
</script>