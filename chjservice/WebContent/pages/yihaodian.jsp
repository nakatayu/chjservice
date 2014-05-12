<%@ page contentType="text/html;charset=UTF-8"
	import="com.chj.entity.User"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
</style>
</head>
<%
	User u = (User) request.getSession().getAttribute("user");
%>

<body onscroll="b()">

	<jsp:include page="/common/header.jsp" />

	<div class="main">
		<div id="main_content" class="main_content">
		
	
		
			<div>
				<form name="fr" id="fr" action="" method="post"></form>
			</div>
			<div
				style="position: relative; height: 360px; padding: 10px 25px 0 25px;">
				<div>
					<div
						style="float: left; width: 950px; height: 350px; background-color: #FFF; border-bottom: #09b3a4 solid 3px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							style="padding-top: 15px;">
							<tr>
								<td width="17%" height="30">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td height="20">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="35%" height="269" align="center"
															style="font-family: '黑体'; font-size: 18px; color: #1da4bf; padding: 15px 0 0 20px;">
															<img src="${ctx}/images/1hd_1.png" width="200"
															height="200" />
														</td>
														<td width="4%"
															style="font-family: '黑体'; font-size: 18px; color: #1da4bf; padding: 15px 0 0 20px;">
															<img src="images/1hd_5.png" width="1" height="180" />
														</td>
														<td width="61%" valign="middle"
															style="font-family: '黑体'; padding: 15px 0 0 20px;">
															<table width="60%" border="0" cellspacing="0"
																cellpadding="0">
																<tr>
																	<td height="38"
																		style="color: #838383; font-size: 18px;">漕河泾e服务</td>
																</tr>
																<tr>
																	<td height="38"
																		style="color: #56ac96; font-size: 18px;">将会把下列信息发送到1号店</td>
																</tr>
																<tr>
																	<td>
																		<table width="100%" border="0" cellspacing="0"
																			cellpadding="0">
																			<tr>
																				<td width="12%" height="27"><img
																					src="${ctx}/images/1hd_6.png" width="33"
																					height="24" /></td>
																				<td width="88%"
																					style="color: #838383; font-size: 14px;">您的个人资料、基本信息</td>
																			</tr>
																		</table>
																	</td>
																</tr>
																<tr>
																	<td>
																		<table width="100%" border="0" cellspacing="0"
																			cellpadding="0">
																			<tr>
																				<td height="74" valign="bottom"><img
																					src="${ctx}/images/1hd_3.png" width="104"
																					height="38" onclick="queMinling()" /></td>
																				<td valign="bottom"><img
																					src="${ctx}/images/1hd_4.png" width="104"
																					height="38" onclick="quxiaoTheLink()" /></td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<jsp:include page="/common/bottom.jsp" />
		</div>
	</div>

</body>
</html>
<script type="text/javascript">
	var status = "${state}";
	function queMinling() {
		window.location.href = "${ctx}/common!askOAuth.action?redirectUri=${param.redirect_uri}&oauthState=${param.oauthState}";
	}

	function quxiaoTheLink() {
		window.location.href = "https://passport.yhd.com/caohejing/callBackUrl.do";
		//window.location.href = "${ctx}/pages/index.jsp";
	}
</script>

