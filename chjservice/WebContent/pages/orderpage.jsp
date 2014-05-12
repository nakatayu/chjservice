<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/css.css" />
<script type="text/javascript"
	src="${ctx }/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jqu1-3.js"></script>
<script type="text/javascript" src="${ctx}/js/selectstores.js"></script>
<style type="text/css">
.conv1 {
	float: left;
	margin-left: 10px;
}

.comm2 {
	float: left;
	margin-left: 10px;
}

.bottom_nav {
	margin: 0px;
}

.bottom_nav  li { /*顶端--菜单样式*/
	border-right: 1px solid #ccc;
	text-align: center;
	float: left;
	width: 115px;
	height: 60px;
	list-style: none;
	color: #fff;
}

.bottom_nav  li:hover {
	cursor: pointer;
	color: blue;
}

.bottom_nav  li div {
	margin: 20px 0 0 6px;
}

img {
	cursor: pointer;
}

* {
	margin: 0;
}

a,img {
	border: 0;
}
/* shutter */
.shutter {
	position: relative;
	overflow: hidden;
	height: 230px;
	width: 350px;
}

.shutter li {
	position: absolute;
	left: 0;
	top: 0;
}

.shutter-nav {
	display: inline-block;
	margin-right: 8px;
	margin-top: 0px;
	color: #fff;
	padding: 2px 5px;
	font-family: Tahoma;
	font-weight: bold;
	font-size: 12px;
	cursor: pointer;
}

.shutter-cur-nav {
	display: inline-block;
	margin-right: 8px;
	margin-top: 0px;
	color: #f00;
	padding: 2px 5px;
	font-family: Tahoma;
	font-weight: bold;
	font-size: 12px;
	cursor: pointer;
}

/* 我的订单 */
.myorder_font {
	color: #00b38a;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	padding-top: 15px;
}

.myorder_font1 {
	color: #00b38a;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	padding-top: 45px;
}

.myorder_font2 {
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	padding-top: 45px;
}

.myorder_font02 {
	color: #00b38a;
	font-size: 14px;
	font-weight: bold;
}

.myorder1 {
	float: left;
	margin-left: 10px;
}

.myorder1 img {
	width: 110px;
	height: 115px;
	cursor: pointer;
}

.gray-font {
	color: #9a9a9c;
	font-size: 14px;
}

.myorder_font4 {
	color: #9a9a9c;
	font-size: 14px;
	text-align: center;
	padding-top: 15px;
}

ul.ul-button {
	
}

ul.ul-button li {
	width: 120px;
	height: 40px;
	list-style: none;
	color: #fff;
	background: #00b38b;
}

ul.ul-button li:hover {
	cursor: pointer;
	background: #00b36b;
}

ul.ul-button li div {
	text-align: center;
	padding-top: 10px;
}

#cart_sure  input {
	border: 0px;
	height: 30px;
	width: 180px;
	padding-left: 6px;
	padding-top: 2px;
	background: url(${ctx}/images/input_180.png) no-repeat;
}

#cart_sure input:focus {
	background: url(${ctx}/images/input_focus_180.png) no-repeat;
}

.main_content textarea {
	border: 1px;
}

.main_content select {
	width: 180px;
	height: 24px;
}

#content {
	background-color: #FFF;
	border: solid 1px #CCC;
}

.input-color {
	color: #ccc;
}

.input-color-focus {
	color: #000;
}
</style>
</head>
<body>
	<jsp:include page="/common/header.jsp" />

	<div id="main_style" class="main" style="background-color: #FFF;">
		<div id="main_content" class="main_content">

			<div id="companytitle"
				style="position: relative; height: 140px; padding: 10px 25px 0 25px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="21"></td>
					</tr>
					<tr>
						<td style="font-size: 12px; color: #c9c9c9;">您的位置：星巴克首页
							&gt;&nbsp; <a href="javascript:void(0)" id="shopName"
							onclick="gotodianpupage(${param.companyShopId})"
							style="font-size: 12px; color: #c9c9c9;">门店选择</a> &gt;&nbsp; <a
							href="${ctx}/pages/ordering.jsp?shopId=${param.companyShopId}"
							style="font-size: 12px; color: #c9c9c9;">外送饮品</a> &gt;&nbsp; <span
							id="title1"></span><br />
						</td>
					</tr>
					<tr>
						<td><table width="97%" border="0" cellspacing="0"
								cellpadding="0">
								<tr>
									<td width="85%" height="43" style="font-size: 25px;">&nbsp;</td>
									<td width="15%" rowspan="3" align="right"><img
										src="${ctx}/images/starbuck_07.png" width="105" height="99" /></td>
								</tr>
								<tr>
									<td height="20"><span
										style="font-size: 26px; font-family: '黑体';"><span
											id="title2"></span></span></td>
								</tr>
								<tr>
									<td><p>
											<span
												style="font-size: 12px; font-family: Arial; color: #c7c7c7;"
												id="foreignName"></span>
										</p>
										<p>
											<span
												style="font-size: 12px; font-family: Arial; color: #c7c7c7;"
												id="contentText"></span>
										</p></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td height="23px">&nbsp;</td>
					</tr>
				</table>
			</div>

			<div id="companymain"
				style="position: relative; padding: 10px 25px 0 25px;">

				<div style="float: left; width: 730px;">

					<table style="float: left;" width="730" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td width="730" valign="top">
								<table id="product_table" width="100%" border="0"
									cellspacing="0" cellpadding="0">
								</table>

							</td>
						</tr>
						<tr>
							<td height="10px">&nbsp;</td>
						</tr>
					</table>


					<table style="float: left; border: solid 1px #CCCCCC;" width="730"
						height="600px" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="730" height="50" valign="top">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">

									<tr>
										<td>
											<table id="table_comment" width="100%" border="0"
												cellspacing="0" cellpadding="0">

											</table>
										</td>
									</tr>

									<tr>
										<td height="50">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="79%" height="30px;"></td>
													<td width="21%"
														style="font-size: 13px; color: #8e8b8b; padding-left: 50px; padding-top: 10px;">
														<a onclick="addProductComments()" style="cursor: pointer;">更多评论</a>
													</td>
												</tr>
												<tr>
													<td width="79%" height="51" style="padding-left: 25px;">我要说两句：</td>
													<td width="21%"
														style="font-size: 13px; color: #8e8b8b; padding-left: 50px;">
													</td>
												</tr>
											</table>
										</td>
									</tr>

									<tr>
										<td height="85" align="center"><textarea name="content"
												id="content" style="padding-left: 0px; padding-right: 0px;"
												cols="95" rows="5"></textarea></td>
									</tr>
									<tr>
										<td height="36"><table width="100%" border="0"
												cellspacing="0" cellpadding="0">
												<tr>
													<td width="70%" height="50">&nbsp;</td>
													<td width="17%" style="font-size: 13px;">还能输入<span
														id="spanContent"
														style="font-size: 24px; font-family: 'Arial';">120</span>字
													</td>
													<td width="13%"><img
														src="${ctx}/images/starbuck_13.jpg" width="75" height="32"
														onclick="commentProduct()" /></td>
												</tr>
											</table></td>
									</tr>


								</table>
							</td>
						</tr>
					</table>
				</div>

				<div
					style="float: right; width: 210px; height: 1000px; border: 0; padding: 0; margin: 0;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						height="220" bgcolor="#ebebeb" style="padding-left: 7px;">
						<tr>
							<td valign="middle">
								<table width="88%" border="0" align="center" cellpadding="0"
									cellspacing="0">
									<tr>
										<td height="98"
											style="padding-left: 7px; background-color: #FFF;">
											<table width="90%" border="0" align="center" cellpadding="0"
												cellspacing="0">
												<tr>
													<td height="28">合计：</td>
												</tr>
												<tr>
													<td height="25" align="center"
														style="font-size: 24px; font-family: 'Arial';">￥<span
														id="cellprice" style="font-family: 'Arial';">0.00</span><span
														style="font-family: '黑体';">元</span></td>
												</tr>
												<tr>
													<td>
														<table width="100%" border="0" cellspacing="0"
															cellpadding="0">
															<tr>
																<td width="40%" align="right" style="font-size: 13px;">我要买</td>
																<td width="15%" align="center"><img
																	src="${ctx}/images/orderpage_xz.png" width="22"
																	height="22" onclick="update_value(1,0,0)" /></td>
																<td width="15%"><input name="cheBoxNum00"
																	style="text-align: center;" type="text"
																	id="cheBoxNum00" value="1" size="3" maxlength="3"
																	onblur="ckeck_totalVal(this)" /></td>
																<td width="15%" align="center"><img
																	src="${ctx}/images/orderpage_jt.png" width="22"
																	height="22" onclick="update_value(2,0,0)"></td>
																<td width="15%"></td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td height="61" align="center"><img
											src="${ctx}/images/starbuck_18.png" width="196" height="50"
											onclick="atOnceBuy()" /></td>
									</tr>
									<tr>
										<td align="right"><img
											src="${ctx}/images/starbuck_19.png" width="196" height="50"
											onclick="addMyCartMenu()" /></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>

					<table width="100%" border="0" cellspacing="0" height="335"
						cellpadding="0"
						style="padding-top: 10px; margin-top: 10px; border: #CCC 1px solid;">
						<tr>
							<td height="28"
								style="padding-left: 5px; color: #6b5142; font-size: 13px">推荐饮品</td>
						</tr>
						<tr>
							<td height="25" style="padding-left: 5px;"><img
								src="${ctx}/images/starbuck_16.jpg" width="196" height="16"
								onclick="findrecProduct(-1,'recoended')" /></td>
						</tr>
						<tr>
							<td height="191" valign="top" id="recoended"
								style="font-size: 12px; color: #757575;"></td>
						</tr>
						<tr>
							<td style="padding-left: 5px;"><img
								src="${ctx}/images/starbuck_17.jpg" width="196" height="16"
								onclick="findrecProduct(1,'recoended')" /></td>
						</tr>
					</table>


					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						style="padding-top: 10px;">
						<tr>
							<td
								style="color: #6b5142; font-size: 12px; font-weight: bold; height: 28px;">&gt;查看全部饮品
							</td>
						</tr>
					</table>

					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						style="padding-top: 10px;">
						<tr>
							<td><img src="${ctx}/images/starbuck_08.jpg" width="210"
								height="381" /></td>
						</tr>
					</table>

				</div>
			</div>



			<div id="cart_sure" style="display: none;">

				<div style="position: relative; padding: 10px 25px 0 25px;">
					<div>
						<div style="float: left; width: 950px;">


							<div
								style="float: left; width: 950px; height: 55px; margin-bottom: 10px; background-color: #FFF">

								<table id="table_address" width="950" border="0" cellspacing="0"
									cellpadding="0">
									<tr>
										<td width="120"
											style="font-weight: bold; padding-left: 15px; font-family: '黑体'">
											确认收货信息</td>
										<td align="right"
											style="padding-top: 8px; padding-right: 40px; padding-left: 15px; font-family: '黑体'">
											<ul class="ul-button">
												<li onclick="gotoPage('${ctx}/pages/personal_set.jsp')"><div>管理收货地址</div></li>
											</ul>
										</td>
									</tr>
								</table>
							</div>

							<div
								style="float: left; width: 540px; height: 55px; background-color: #FFF">
								<p class="myorder_font"
									style="padding-left: 15px; text-align: left;">收货人地址</p>
							</div>
							<div class="conv1"
								style="width: 180px; height: 55px; background-color: #FFF">
								<p class="myorder_font">收货人信息</p>
							</div>
							<div class="conv1"
								style="width: 210px; height: 55px; background-color: #FFF">
								<p class="myorder_font">联系电话</p>
							</div>
						</div>

						<div id="div_address"></div>
					</div>
				</div>



				<div
					style="clear: both; position: relative; margin-top: 10px; padding: 10px 25px 0 25px;">
					<div>

						<div
							style="float: left; width: 950px; height: 55px; margin-bottom: 10px; background-color: #FFF">

							<table width="950" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="200px"
										style="font-weight: bold; padding-left: 15px; padding-top: 8px;">
										确认订单信息</td>
									<td width="500px"
										style="font-weight: bold; padding-left: 15px; padding-top: 8px;">
										店铺：<span style="color: #00b38a" id="selectShop"></span>
									</td>
									<td width="100px"
										style="font-weight: bold; padding-left: 15px; padding-top: 8px;">
										运费：<span style="color: #00b38a" id="txtOrderDeliver"></span>
									</td>
									<td style="padding-right: 40px; padding-top: 8px;">
										<ul class="ul-button">
											<li onclick="updateProduct()"><div>修改</div></li>
										</ul>
									</td>
								</tr>
							</table>
						</div>


						<div style="float: left; width: 950px; margin-top: 0px;">
							<div
								style="float: left; width: 440px; height: 55px; background-color: #FFF">
								<p class="myorder_font"
									style="padding-left: 15px; text-align: left;">商品信息</p>
							</div>
							<div class="conv1"
								style="width: 160px; height: 55px; background-color: #FFF">
								<p class="myorder_font">单价</p>
							</div>
							<div class="conv1"
								style="width: 160px; height: 55px; background-color: #FFF">
								<p class="myorder_font">数量</p>
							</div>
							<div class="conv1"
								style="width: 160px; height: 55px; background-color: #FFF">
								<p class="myorder_font">小计</p>
							</div>
						</div>

						<div id="div_cartsure"></div>

						<div align="right"
							style="float: left; padding-top: 20px; width: 950px; height: 45px; margin-top: 10px; background: #fff;">
							<span style="color: #000; font-size: 20px;"> 合计</span> <span
								id="txtOrderDeliverInfo" style="padding-top: 10px;">(不含运费):</span>
							<span id="totaltotal"
								style="color: #00b38b; font-size: 22px; margin-right: 40px;">6666</span>
						</div>
					</div>
				</div>

				<div
					style="clear: both; position: relative; margin-top: 10px; padding: 10px 25px 0 25px;">
					<div>
						<div
							style="float: left; width: 950px; background: #fff; border-bottom: #57ae97 solid 2px;">

							<table width="950" style="margin: 10px;" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="400px"
										style="font-weight: bold; padding-left: 15px;" colspan="2">
										生成订单</td>

									<td align="right" colspan="2" style="padding-right: 40px;">
										<ul class="ul-button">
											<li onclick="submit_order()"><div>&nbsp;&nbsp;提交订单&nbsp;&nbsp;</div></li>
										</ul>
									</td>
								</tr>

								<tr>
									<td colspan="4"><p>&nbsp;</p></td>
								</tr>

								<tr>
									<td width="18%" align="left" class="gray-font"
										style="padding-left: 45px;">送&nbsp;货&nbsp;方&nbsp;式 :</td>
									<td width="20%"><select id="sendType">
											<option value="1">配送</option>
											<option value="2">自取</option>
									</select></td>
									<td width="15%" align="left" class="gray-font">付款方式 :</td>
									<td width="70%"><select id="payType">
									</select></td>
								</tr>

								<tr>
									<td colspan="2"><p>&nbsp;</p></td>
								</tr>

								<tr>
									<td align="left" class="gray-font" style="padding-left: 45px;">
										要求到货日期:&nbsp;</td>
									<td><input id="txtSendDate" class="Wdate"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" /></td>

									<td align="left" class="gray-font">备
										&nbsp;&nbsp;&nbsp;&nbsp;注:</td>
									<td><input id="txtInfo" maxlength="30" class="input-color"
										value="" /><span id="spanInfo" style="color: #9a9a9c;">&nbsp;30字内</span>
									</td>
								</tr>
								<tr id="mm">
									<td colspan="4" height="45px" class="gray-font"
										style="padding-top: 10px; padding-left: 45px;">请注意，本店外送时间是：<span
										id="workTime"></span>&nbsp;<span id="serviceTime"></span>，请在服务时间内下单。
									</td>
								</tr>
							</table>
							<p>
								<br />
							</p>
						</div>
					</div>
				</div>

			</div>
			<jsp:include page="/common/bottom.jsp" />

		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var productId = "${param.productId}";
	var companyShopId = "${param.companyShopId}";
	var companyShopProductId = "${param.companyShopProductId}";

	var user = "${sessionScope.user}";
	var userName = "${sessionScope.user.nickName}";
	var userPicture = "${sessionScope.user.headPicture}";

	var AttTopPrice = {};
	var totalPriceVal = 0;
	var productInfo = {};

	var addressArray = [];
	var selectAddress = -1;

	var commentId = 0;
	var pageNumber = 1;
	var size = 8;

	$(document).ready(function() {
		initInput1();
		initInput('txtInfo', 'spanInfo', '备注30字以内', 30);
		findrecProduct(1, 'recoended');
		ffiinndd();

		addProductComments();
		loadUserAddress();
		findShopPayTypeAndisDeliver(companyShopId);

	});
	function initInput1() {
		var title = document.getElementById('content');
		title.onfocus = function() {
			if (this.value == '120字内') {
				this.value = '';
			}

		};
		title.onblur = function() {
			if (this.value == '') {
				this.value = '120字内';

			}

		};
		title.onkeyup = function() {
			if (this.value != '') {

			}
			if (this.value.length <= 120)
				$('#spanContent').html(120 - this.value.length);
			else {
				this.value = this.value.substr(0, 120);
				$('#spanContent').html(0);
			}

		};

	}
	var loadding_dialog=null;
	function show_loading(){
		if(loadding_dialog==null){
			loadding_dialog = new Dialog();
			loadding_dialog.Width = 300;
			loadding_dialog.Height = 100;
			loadding_dialog.Title = "";
			loadding_dialog.InnerHtml='<div style="text-align:center;font-size:14px;padding-top:20px;">loading......</div>';
			loadding_dialog.show();
		}
		else{
			loadding_dialog.show();
		}
		
	}
	function commentProduct() {

		if (user == null) {
			alert('你还没有登录！');
			return;
		}

		var connect = $.trim($('#content').val());
		if (connect == '') {
			alert('请输入评论内容!');
			return;
		}
		if (connect.length > 120) {
			alert('文字过长!');
			return;
		}
		$.ajax({
		    type: "POST",
		    url : '${ctx}/user!KeywordFliter.action',
		    dataType:'json',
		    data:{word:connect},
		    success: function(msg,status){
		    	
		    	if(msg.status==200){
		    		if(msg.rows.length>0){		    			
		    			if(loadding_dialog!=null){
		    	    		loadding_dialog.close();
		    	    	}
		    			alert('您提交的内容含有敏感词:'+msg.rows.join(','));
		    		}
		    		else{
		    			commentProductSubmit();
		    		}
		        }
		    }
		   });
	}
	
	function commentProductSubmit() {

		if (user == null) {
			alert('你还没有登录！');
			return;
		}

		var connect = $.trim($('#content').val());
		if (connect == '') {
			alert('请输入评论内容!');
			return;
		}
		if (connect.length > 120) {
			alert('文字过长!');
			return;
		}
		var data = {};
		data["productId"] = productId;
		data["companyShopProductId"] = companyShopProductId;
		data["content"] = connect;
		$
				.ajax({
					type : "POST",
					url : '${ctx}/community!addProductComment.action',
					dataType : 'json',
					data : data,
					success : function(msg, status) {
						if (msg.status == 200) {
							alert("谢谢评价！");

							$('#table_comment')
									.prepend(
											'<tr><td height="50px"><table width="100%" border="0" cellspacing="0" cellpadding="0">'
													+ '<tr><td width="14%" rowspan="3" style="padding:10px 0 0 20px;">'
													+ '<img src="${imageStorePath}'+userPicture+'" width="48" height="48" /></td>'
													+ '<td width="26%" height="32" align="left" style="font-size:12px;color:#898989;">'
													+ '发布者：'
													+ userName
													+ '</td>'
													+ '<td width="60%" align="left" style="font-size:12px;color:#898989;">'
													+ curDateTime()
													+ '</td></tr>'
													+ '<tr><td colspan="3" align="left"  style="color:#999; font-size:12px;word-break:break-all; word-wrap:break-word;">'
													+ connect
													+ '</td></tr>'
													+ '<tr><td colspan="3" style="text-align:right;color:#999; font-size:12px;padding-right:20px;">'
													+ '</td></tr>'
													+ '<tr><td colspan="4" style="border-bottom:#cccccc solid 1px;">&nbsp;</td>'
													+ '</tr></table></td></tr>');

							commentId++;
						} else {
							alert(msg.msg);
						}
					}
				});
	}

	function addProductComments() {

		$
				.ajax({
					type : "POST",
					url : '${ctx}/community!selectProductComments.action',
					dataType : 'json',
					data : {
						productCommentId : commentId,
						page : pageNumber,
						size : size,
						productId : productId,
						companyShopProductId : companyShopProductId
					},
					success : function(msg, status) {
						if (msg.status == 200) {

							var data = msg.rows;
							var str = '';
							for ( var i = 0; i < data.length; i++) {
								var meet = data[i];
								str += '<tr><td height="50PX"><table width="100%" border="0" cellspacing="0" cellpadding="0">';
								str += '<tr><td width="14%" rowspan="3" style="padding:10px 0 0 20px;">';
								str += '<img src="${imageStorePath}'+meet["commentUser"]["headPicture"]+'" width="48" height="48" />';
								str += '</td><td width="26%" height="32" align="left" style="font-size:12px;color:#898989;">';
								str += '发布者：' + meet["commentUser"]["nickName"]
										+ '</td>';
								str += '<td width="60%" align="left" style="font-size:12px;color:#898989;">'
										+ meet["commentTime"] + '</td></tr>';
								str += '<tr><td colspan="3" align="left"  style="color:#898989; font-size:12px;">';
								str += meet["content"] + '</td></tr>';
								str += '<tr><td colspan="3" style="text-align:right;color:#999; font-size:12px;padding-right:20px;">';
								str += '</td></tr>';
								str += '<tr><td colspan="3" style="border-bottom:#cccccc solid 1px;">&nbsp;</td>';
								str += '</tr></table></td></tr>';
							}
							$('#table_comment').append(str);
							pageNumber++;
						} else {
							alert(msg.msg);
						}
					}
				});
	}

	function addMyproductInfo() {
		var appendInfo = [];

		var zh = $('input:radio[name="attrvalname"]:checked').attr("id")
				.substring(7);
		productInfo["qty"] = $('#cheBoxNum00').val();
		productInfo["price"] = $('input:radio[name="attrvalname"]:checked')
				.val();
		productInfo["skuId"] = $('#proSkuId' + zh).val();
		productInfo["typeName"] = $('#typeName' + zh).html();
		productInfo["companyShopProductSkuId"] = $('#shopProSkuId' + zh).val();
		productInfo["oldPrice"] = $('#oldPrice' + zh).val();

		$('table[id^="checktable"]').each(
				function() {
					var ckeckId = $(this).attr("id").substring(10);

					$('input:checkbox[name="choAttr' + ckeckId + '"]:checked')
							.each(
									function() {
										if (this.checked) {
											var len = $(this).attr("id")
													.substring(7);
											var t = $('#cheBoxNum' + len).attr(
													"value");
											if (t > 0) {
												var appval = {};
												appval["price"] = $(this).attr(
														"value");
												appval["qty"] = t;
												appval["appendId"] = $(
														'#appendId' + len)
														.attr("value");
												appendInfo.push(appval);
											}
										}
									});
				});

		$('table[id^="radiotable"]').each(
				function() {
					var radiomen = {};
					var zh = $(this).attr("id").substring(10);
					var appendId = $(
							'input:radio[name="radioName' + zh + '"]:checked')
							.val();
					radiomen["price"] = 0;
					radiomen["qty"] = 0;
					radiomen["appendId"] = appendId;

					appendInfo.push(radiomen);
				});

		productInfo["appendInfo"] = JSON.stringify(appendInfo);
	}

	function addMyCartMenu() {
		if(productId!=XBUXProductId){		
			addMyCartMenu22();
		}else{	
			$.ajax({
			     type: "POST",
			     async:false,
			     url : '/chjservice/product!checkProduct.action',
			     dataType:'json',
			     data:{productId:productId},
			     success: function(msg,status){
			    	if(msg.status == 200){
			    		var obj=msg.rows;
			    		if(obj==1){
			    			alert('活动期间，该商品每人限购一次，每次限购一个。你已将其加入购物车，请前往购物车购买或取消！');
			    		}else if(obj==2){
			    			alert('活动期间，该商品每人限购一次，每次限购一个。你已将其加入订单中，请您完成订单或取消！');
			    		}else if(obj==0){
			    			addMyCartMenu22();
			    		}
			    	}else{
			    		alert(msg.msg);
			    	}	    		
			     }	     
			});		
		}
	}
	function addMyCartMenu22() {
		addMyproductInfo();
		$.ajax({
			type : "POST",
			url : '${ctx}/product!addUserProductCart.action',
			dataType : 'json',
			data : productInfo,
			success : function(msg, status) {
				if (msg.status == 200) {
					alert("已成功加入购物车！");
					finduserCartItemCount();
				} else {
					alert("已在购物车中！");
				}
			}
		});
	}

	function updateProduct() {
		$('#cart_sure').hide();
		$('#main_style').attr("style", "background-color:#FFF;");
		$('#companytitle').show();
		$('#companymain').show();
	}
	function atOnceBuy() {
		if(!shopStatusMsg(statusMsg,deliverOk)){
			return;
		}
		if(productId!=XBUXProductId){		
			atOnceBuy22();
		}else{	
			$.ajax({
			     type: "POST",
			     async:false,
			     url : '/chjservice/product!checkProduct.action',
			     dataType:'json',
			     data:{productId:productId},
			     success: function(msg,status){
			    	if(msg.status == 200){
			    		var obj=msg.rows;
			    		if(obj==1){
			    			alert('活动期间，该商品每人限购一次，每次限购一个。你已将其加入购物车，请前往购物车购买或取消！');
			    		}else if(obj==2){
			    			alert('活动期间，该商品每人限购一次，每次限购一个。你已将其加入订单中，请您完成订单或取消！');
			    		}else if(obj==0){
			    			atOnceBuy22();
			    		}
			    	}else{
			    		alert(msg.msg);
			    	}	    		
			     }	     
			});		
		}
	}
	function atOnceBuy22() {
		var n = parseInt($('#cheBoxNum00').attr('value'));
		var total = n * totalPriceVal;
		if(total<100){
			alert('此交易总额少于100元，无法生成订单！');
			return;
		}
		
		addMyproductInfo();
		$('#main_style').attr("style", "");
		$('#companytitle').hide();
		$('#companymain').hide();
		$('#cart_sure').show();
		
		productInfo["money"] = total;
		$('#selectShop').html(productInfo["shopName"]);
		productInfo["price"] = totalPriceVal;
		var array = [];
		var str = '<div style="float:left; width:950px;margin-top:10px;">'
				+ '<div style="float:left;padding-left:15px; width:425px; height:55px;background-color:#FFF;border-bottom:#57ae97 solid 2px;">'
				+ '<p class="myorder_font4" style="text-align:left;">'
				+ productInfo["nickName"]
				+ '&nbsp;&nbsp;'
				+ productInfo["typeName"]
				+ ' </p></div> '
				+ '<div class="conv1" style="width:160px; height:55px; background-color:#FFF;border-bottom:#57ae97 solid 2px;">'
				+ '<p class="myorder_font4">'
				+ totalPriceVal
				+ '</p></div> '
				+ '<div class="conv1" style="width:160px; height:55px; background-color:#FFF;border-bottom:#57ae97 solid 2px;">'
				+ '<p class="myorder_font4">'
				+ n
				+ '</p></div> '
				+ '<div class="conv1" style="width:160px; height:55px; background-color:#FFF;border-bottom:#57ae97 solid 2px;">'
				+ '<p class="myorder_font4">' + total + '</p></div>' + '</div>';

		array.push(str);

		$('#div_cartsure').html(array.join(''));
		$('#totaltotal').html((total + productInfo["sendCost"]).toFixed(2));
		$('#txtOrderDeliver').html(productInfo["sendCost"]);
		if (productInfo["sendCost"] > 0)
			$('#txtOrderDeliverInfo').html('(含运费)');
		else
			$('#txtOrderDeliverInfo').html('(不含运费)');
	}

	function submit_order() {
		if (selectAddress == -1) {
			alert('请选择送货地址!');
			return;
		}
		productInfo["name"] = addressArray[selectAddress]["name"];
		productInfo["address"]=addressArray[selectAddress]["parentArea"]+addressArray[selectAddress]["childArea"]+addressArray[selectAddress]["address"];
		productInfo["phone"] = addressArray[selectAddress]["phone"];

		productInfo["payType"] = $('#payType').val();
		productInfo["sendType"] = $('#sendType').val();
		productInfo["sendTime"] = $('#txtSendDate').val();
		productInfo["info"] = $('#txtInfo').val();

		$.ajax({
			type : "POST",
			url : '${ctx}/product!addUserAndProduct.action',
			dataType : 'json',
			data : productInfo,
			success : function(msg, status) {
				if (msg.status == 200) {

					window.location.href = "${ctx}/product!findUserOrder.action";
				} else {
					alert(msg.msg);
				}
			}
		});
	}

	function ffiinndd() {
		productInfo["companyId"] = companyId;
		productInfo["productId"] = productId;
		productInfo["companyShopId"] = companyShopId;
		productInfo["companyShopProductId"] = companyShopProductId;
		$
				.ajax({
					type : "POST",
					url : '${ctx}/product!selfSetProduct.action',
					dataType : 'json',
					data : productInfo,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = '';
							var data = msg.rows;
							productInfo["nickName"] = data["proAttribute"]["nickName"];
							deliverOk=data["deliverOk"];
							statusMsg=data["statusMsg"];

							$('#title1').html(data["proAttribute"]["nickName"]);
							$('#title2').html(data["proAttribute"]["nickName"]);

							$('#foreignName').html(
									data["proAttribute"]["foreign_name"]);
							$('#contentText').html(
									data["proAttribute"]["content"]);
							$('#shopName').html(data["shopName"]);

							productInfo["shopName"] = data["shopName"];
							productInfo["sendCost"] = data["sendCost"];

							array += '<tr><td align="left" width="340px" height="340px" valign="top"><img src="${imageStorePath}'+data["productImg"]+'" width="320" height="320"/>';
							array += '<img src="${ctx}/images/starbuck_15.jpg" width="97" height="28" style="padding-top:10px;" onclick="addFavorite()"/></td>';
							array += '<td width="417px" valign="top"><table width="100%" border="0" cellspacing="1" cellpadding="0">';
							array += '<tr><td style="color:#0e8a02; font-size:13px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">';

							var attrName = data["proAttribute"];

							array += '<tr><td height="30" valign="top">选择您需要的'
									+ attrName["name"] + '：</td></tr>';
							array += '<tr style="color:#898989;font-size:12px;"><td><table id="attrtable" width="100%" border="0" cellspacing="0" cellpadding="0"><tr>';

							for ( var j = 0; j < attrName["attrVal"].length; j++) {
								var att = attrName["attrVal"][j];
								if (j % 3 == 0) {
									array += '<td width="30%" height="30" valign="top">';
								} else if (j % 3 == 1) {
									array += '<td width="30%" valign="top">';
								} else if (j % 3 == 2) {
									array += '<td width="40%" valign="top">';
								}

								if (j == 0) {
									array += '<input checked="checked" type="radio" id="attrval'
											+ att["product_attribute_value_id"]
											+ '" name="attrvalname" value="'
											+ att["price"] + '"';
									AttTopPrice["attRadioTab"
											+ attrName["product_attribute_id"]] = parseFloat(att["price"]);
								} else {
									array += '<input type="radio" id="attrval'
											+ att["product_attribute_value_id"]
											+ '" name="attrvalname" value="'
											+ att["price"] + '" ';
								}
								array += ' onclick="on_attRadioTabPrice('
										+ attrName["product_attribute_id"]
										+ ','
										+ att["product_attribute_value_id"]
										+ ')"/>';
								array += '<input type="hidden" id="proSkuId'+att["product_attribute_value_id"]+'" value="'+att["product_sku_id"]+'"/>';
								array += '<input type="hidden" id="shopProSkuId'+att["product_attribute_value_id"]+'" value="'+att["company_shop_product_sku_id"]+'"/>';
								array += '<input type="hidden" id="oldPrice'+att["product_attribute_value_id"]+'" value="'+att["old_price"]+'"/>';
								array += '<span id="typeName'+att["product_attribute_value_id"]+'" line-height="30px">&nbsp;'
										+ att["attrValName"] + '</span></td>';

								if (j % 3 == 0
										&& j == attrName["attrVal"].length - 1) {
									array += '<td width="30%">&nbsp;</td><td width="45%">&nbsp;</td>';
								} else if (j % 3 == 1
										&& j == attrName["attrVal"].length - 1) {
									array += '<td width="40%">&nbsp;</td>';
								} else if (j % 3 == 2
										&& j == attrName["attrVal"].length - 1) {
									array += '</tr><tr>';
								}
							}
							array += '</tr></table></td></tr><tr><td><hr width="99%" style="1px solid #CCC"/></td></tr>';

							for ( var i = 0; i < data["checkboxName"].length; i++) {
								var appendName = data["checkboxName"][i];
								AttTopPrice["appCheckTab"
										+ appendName["append_id"]] = 0;
								array += '<tr><td height="30">'
										+ appendName["name"]
										+ '： <span style="background-color:#0e8a02; color:#fff;"> +'
										+ appendName["price"]
										+ '元每份&nbsp;</span></td></tr>';
								array += '<tr style="color:#898989;font-size:12px;"><td><table id="checktable'
										+ appendName["append_id"]
										+ '" width="100%" border="0" cellspacing="0" cellpadding="0">';
								array += '<tr align="left">';
								for ( var j = 0; j < appendName["appendName"].length; j++) {
									var appendVal = appendName["appendName"][j];

									if (j % 3 == 0) {
										array += '<td width="16%" height="28" style="padding-top:10px;padding-bottom:10px;" valign="middle" nowrap="nowrap">';
									} else {
										array += '<td width="16%" height="28" style="padding-top:10px;padding-bottom:10px;" valign="middle" nowrap="nowrap">';
									}

									array += '<input value="'
											+ appendVal["price"]
											+ '" onclick="on_appCheckTabPrice('
											+ appendName["append_id"] + ','
											+ appendVal["append_id"] + ')"';
									array += 'type="checkbox" id="choAttr'
											+ appendName["append_id"]
											+ appendVal["append_id"]
											+ '" name="choAttr'
											+ appendName["append_id"]
											+ '"/>&nbsp;<span>'
											+ appendVal["name"] + '';
									array += '</td><td width="17%" height="28" valign="middle" style="padding-top:10px;padding-bottom:10px;" nowrap="nowrap">';
									array += '<img src="${ctx}/images/orderpage_xz.png" width="20" style="margin-top:3px;" height="20" onclick="update_value(1,'
											+ appendName["append_id"]
											+ ','
											+ appendVal["append_id"] + ')"/>';
									array += '<input style="margin-top:2px;text-align: center;" heigth="10" id="cheBoxNum'
											+ appendName["append_id"]
											+ appendVal["append_id"]
											+ '" type="text"  value="0" size="2" maxlength="2" onblur="ckeck_val(this)"/>';
									array += '<input id="appendId'+appendName["append_id"]+appendVal["append_id"]+'" type="hidden"  value="'+appendVal["append_id"]+'"/>';
									array += '<img src="${ctx}/images/orderpage_jt.png" style="margin-top:3px;" width="20" height="20" onclick="update_value(2,'
											+ appendName["append_id"]
											+ ','
											+ appendVal["append_id"]
											+ ')"/></td>';
									if (j % 3 == 0
											&& j == appendName["appendName"].length - 1) {
										array += '<td width="16%" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;</td><td width="17%">&nbsp;</td><td width="16%">&nbsp;</td><td width="17%">&nbsp;&nbsp;</td>';
									} else if (j % 3 == 1
											&& j == appendName["appendName"].length - 1) {
										array += '<td width="16%" valign="top">&nbsp;&nbsp;</td><td width="17%">&nbsp;&nbsp;&nbsp;</td>';
									} else if (j % 3 == 2) {
										array += '</tr><tr align="left">';
									}
								}
								array += '</tr></table></td></tr><tr><td><hr width="99%" style="1px solid #CCC"/></td></tr>';
							}

							for ( var i = 0; i < data["radioName"].length; i++) {
								var appendName = data["radioName"][i];
								AttTopPrice["appRadioTab"
										+ appendName["append_id"]] = 0;
								array += '<tr><td height="30">'
										+ appendName["name"] + '：</td></tr>';
								array += '<tr style="color:#898989;font-size:12px;"><td><table id="radiotable'
										+ appendName["append_id"]
										+ '" width="100%" border="0" cellspacing="0" cellpadding="0">';
								array += '<tr>';
								for ( var j = 0; j < appendName["appendName"].length; j++) {
									var appendVal = appendName["appendName"][j];
									if (j % 3 == 0) {
										array += '<td width="30%" height="30">';
									} else if (j % 3 == 1) {
										array += '<td width="30%">';
									} else if (j % 3 == 2) {
										array += '<td width="40%">';
									}
									if (j == 0) {
										array += '<input checked="checked" onclick="on_appRadioTabPrice('
												+ appendName["append_id"]
												+ ','
												+ appendVal["append_id"]
												+ ')" type="radio" name="radioName'
												+ appendName["append_id"]
												+ '" value="'
												+ appendVal["append_id"]
												+ '"/>&nbsp;'
												+ appendVal["name"] + '</td>';
									} else {
										array += '<input onclick="on_appRadioTabPrice('
												+ appendName["append_id"]
												+ ','
												+ appendVal["append_id"]
												+ ')" type="radio" name="radioName'
												+ appendName["append_id"]
												+ '" value="'
												+ appendVal["append_id"]
												+ '"/>&nbsp;'
												+ appendVal["name"] + '</td>';
									}
									if (j % 3 == 0
											&& j == appendName["appendName"].length - 1) {
										array += '<td width="30%">&nbsp;</td><td width="40%">&nbsp;</td>';
									} else if (j % 3 == 1
											&& j == appendName["appendName"].length - 1) {
										array += '<td width="40%">&nbsp;</td>';
									} else if (j % 3 == 2
											&& j == appendName["appendName"].length - 1) {
										array += '</tr><tr>';
									}
								}
								if (i < data["radioName"].length - 1) {
									array += '</tr></table></td></tr><tr><td><hr width="99%" style="1px solid #CCC"/></td></tr>';
								}
							}
							array += '</table></td></tr></table></td></tr>';

							array += '<tr><td  height="12px"></td>';
							array += '</tr>';

							$('#product_table').html(array);

							totalPriceValFun();
						} else {
							alert(msg.msg);
						}
					}
				});
	}

	function on_attRadioTabPrice(parentId, childId) {
		var attr = parseFloat($('input[name="attrvalname"]:checked').val());
		AttTopPrice["attRadioTab" + parentId] = attr;
		totalPriceValFun();
	}

	function on_appRadioTabPrice(parentId, childId) {
	}

	function on_appCheckTabPrice(parentId, childId) {

		var n = parseInt($('#cheBoxNum' + parentId + childId).attr('value'));

		if ($('#choAttr' + parentId + childId).attr("checked") == true) {
			n = n > 1 ? n : 1;
			$('#cheBoxNum' + parentId + childId).attr('value', n);
		} else if ($('#choAttr' + parentId + childId).attr("checked") == false) {
			$('#cheBoxNum' + parentId + childId).attr('value', 0);
		}

		AttTopPrice["appCheckTab" + parentId] = 0;
		$('#checktable' + parentId + ' input[type="checkbox"]:checked').each(
				function() {
					if (this.checked) {
						var apc = parseFloat($(this).val());
						var str = $(this).attr("id").replace("choAttr",
								"cheBoxNum");
						var count = parseInt($('#' + str).val());
						var talPrice = apc * count;
						AttTopPrice["appCheckTab" + parentId] += talPrice;
					}
				});
		totalPriceValFun();
	}

	function totalPriceValFun() {
		totalPriceVal = 0;
		$.each(AttTopPrice, function(key, value) {
			totalPriceVal += value;
		});
		var n = parseInt($('#cheBoxNum00').attr('value'));
		var total = n * totalPriceVal;
		$('#cellprice').html(total);
	}
	function update_value(t, i, j) {
		var n = parseInt($('#cheBoxNum' + i + j).attr('value'));
		if (t == 1) {			
			if(i==0&&productId==XBUXProductId){
				alert('活动期间，该商品每人限购一次，每次限购一个。');
				return;
			}			
			n++;
		} else if (t == 2) {
			n--;
		}
		if (n < 0) {
			n = 0;
		}
        if(i==0){
        	if (n > 100) {
    			n = 100;
    		}
        }else{
        	if (n > 10) {n = 10;}
        } 

		$('#cheBoxNum' + i + j).attr('value', n);
		if (i != 0) {
			if (n > 0) {
				$('input[id="choAttr' + i + j + '"]').attr("checked", true);
			} else {
				$('input[id="choAttr' + i + j + '"]').attr("checked", false);
			}
			on_appCheckTabPrice(i, j);
		} else {
			totalPriceValFun();
		}

	}
	function addFavorite() {
		$.ajax({
			type : "POST",
			url : '${ctx}/user!collectionUserRestarant.action',
			dataType : 'json',
			data : {
				objectId : productId,
				type : 5
			},
			success : function(msg, status) {
				if (msg.status == 200) {
					alert('收藏成功!');
				} else {
					alert('已收藏成功!');
				}
			}
		});
	}

	function ckeck_val(obj) {
		var val = $(obj).val();
		var tsd = /^\d+$/;
		var bolon = tsd.test(val);
		if (bolon == false) {
			$(obj).val(0);
		} else {
			if (val > 10) {
				$(obj).val(10);
			}
		}
	}
	function ckeck_totalVal(obj) {
		var val = $(obj).val();
		var tsd = /^\d+$/;
		var bolon = tsd.test(val);
		if (bolon == false) {
			$(obj).val(1);
		} else {
			if (val > 100) {
				$(obj).val(100);
			}
		}
	}
</script>
