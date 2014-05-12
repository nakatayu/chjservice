<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta property="wb:webmaster" content="38f233a54e884870" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/header.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/bottom.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/btn.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/buttons.css" />

<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.lazyload.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/json2.js"></script>

<script type="text/javascript" src="${ctx}/js/dialog2/zDialog.js"></script>
<script type="text/javascript" src="${ctx}/js/dialog2/zDrag.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/js/dialog2/dialog.css" />

<link rel="stylesheet" type="text/css"
	href="${ctx}/css/font-awesome.min.css" />
<!--[if lt IE 7]><script src="../css/font-awesome-ie7.min.css"></script><![endif]-->
<title>漕河泾e服务</title>

</head>
<body>


	<form id="formturn" method="post">

		<input name="pagejsp" type="hidden" id="pageHidden" /> 
		<input name="keyword" type="hidden" id="hiddenKeyWord" /> <input
			name="name" type="hidden" id="hiddenProName" /> <input
			name="companyId" type="hidden" id="companyIdHidden" /> <input
			name="companyShopId" type="hidden" id="companyShopId" /> <input
			name="orderId" type="hidden" id="hiddenOrderId" /> <input
			name="orderItemId" type="hidden" id="hiddenOrderItemId" /> <input
			name="productId" type="hidden" id="hiddenProductId" /> <input
			name="companyShopProductId" type="hidden"
			id="hiddenCompanyShopProductId" /> <input
			name="companyShopProductSkuId" type="hidden"
			id="hiddenCompanyShopProductSkuId" /> <input name="skuId"
			type="hidden" id="hiddenSkuId" /> <input name="price" type="hidden"
			id="hiddenPrice" /> <input name="oldPrice" type="hidden"
			id="hiddenOldPrice" /> <input name="categoryId" type="hidden"
			id="hiddenCategoryId" /> <input name="circleId" type="hidden"
			id="circleIdHidden" /> <input name="topicId" type="hidden"
			id="topicIdHidden" /> <input name="activityId" type="hidden"
			id="activityIdHidden" /> <input name="type" type="hidden"
			id="typeHidden" /> <input name="userId" type="hidden"
			id="userIdHidden" /> <input name="color" type="hidden"
			id="colorHidden" /> <input name="lat" type="hidden" id="latHidden" />
		<input name="lng" type="hidden" id="lngHidden" /> <input name=address
			type="hidden" id="addressHidden" />
			<input name=isCheck	type="hidden" id="isCheckHidden" />

	</form>

	<div class="top">
		<div class="top_content">

			<div style="margin: 0 25px 0 25px;">
				<div align="left" style="float: left; padding: 4px 0 0 0;">
					<a href="${ctx}/pages/index.jsp"><img
						src="${ctx}/images/logo.png" /> </a>
				</div>
				<div align="right" style="float: right;">
				
					<ul class="nav1">
						<li id="topMenue" class="topMenue">
							<div class="menuediv"
								style="font-size: 12px; font-family: '微软雅黑';">精彩内容</div>

							<div id="topMenuePopView" class="popView"
								style="margin: 6px 0 0 0;">
								<div style="margin: 20px 0 0 0;">

									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td>
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">

													<tr>
														<td width="25%" align="center">
															<ul class="childThird1">
																<li class="first"><a href="${ctx}/pages/index.jsp">首页</a></li>
															</ul>
														</td>
														<td width="25%" align="center">
															<ul class="childThird1">
																<li class="first"><a
																	href="${ctx}/pages/share_index.jsp">共享漕河泾</a></li>
															</ul>
														</td>
														<td width="25%" align="center">
															<ul class="childThird1">
																<li class="first"><a
																	href="${ctx}/pages/convenient.jsp">便捷漕河泾</a></li>
															</ul>
														</td>
														<td width="25%" align="center">
															<ul class="childThird1">
																<li class="first"><a
																	href="${ctx}/community!communityHome.action">菁英漕河泾</a></li>
															</ul>
														</td>
													</tr>
													<tr>
														<td width="25%" align="center" style="vertical-align: top">
															<ul class="childThird">
																<li><a onclick="if('${user.userId}'=='') alert('请登录');else window.location.href='${ctx}/product!findUserOrder.action'" href="javascript:void(0)">我的订单</a></li>
																<li><a onclick="if('${user.userId}'=='') alert('请登录');else window.location.href='${ctx}/pages/myhome.jsp'"  href="javascript:void(0)">我的主页</a></li>
																<li><a onclick="if('${user.userId}'=='') alert('请登录');else window.location.href='${ctx}/pages/personal_set.jsp'"  href="javascript:void(0)">个人设置</a></li>
															</ul>
														</td>
														<td width="25%" align="center" style="vertical-align: top">
															<ul class="childThird">
																<li><a href="${ctx}/pages/share_service.jsp">服务优惠送</a></li>
																<li><a href="${ctx}/pages/share_corperate.jsp">招商直通车</a></li>
																<li><a href="${ctx}/pages/share_lifetips.jsp">生活小贴士</a></li>
																<li><a href="${ctx}/pages/share_policy.jsp">政策早解读</a></li>
																<li><a href="${ctx}/pages/share_publicgoods.jsp">公益你我他</a></li>
															</ul>
														</td>
														<td width="25%" align="center" style="vertical-align: top">
															<ul class="childThird">

																<li><a href="${ctx}/pages/convenient_brand.jsp">品牌馆</a></li>
																<li><a
																	href="${ctx}/pages/convenient_restaurant.jsp">便捷服务</a></li>
																<li><a href="${ctx}/pages/convenient_tuiguang.jsp">商品推广</a></li>
																<li><a href="${ctx}/pages/convenient_cuxiao.jsp">优惠促销</a></li>
																<li><a
																	href="${ctx}/pages/convenient_categories.jsp">商品分类</a></li>

															</ul>
														</td>
														<td width="25%" align="center" style="vertical-align: top">
															<ul class="childThird">
																<li><a href="${ctx}/pages/community_topiclist.jsp">瞩目漕河泾</a></li>
																<li><a
																	href="${ctx}/pages/community_activitylist.jsp">菁彩漕河泾</a></li>
																<li><a
																	href="${ctx}/community!findLableListCircle.action">菁汇漕河泾</a></li>

																<li><a onclick="if('${user.userId}'=='') alert('请登录');else window.location.href='${ctx}/community!createTopic.action?type=0'"
																	href="javascript:void(0)">创建我的话题</a></li>
																<li><a onclick="if('${user.userId}'=='') alert('请登录');else window.location.href='${ctx}/community!createActivity.action?type=0'"
																   href="javascript:void(0)">创建我的活动</a></li>
																<li><a onclick="if('${user.userId}'=='') alert('请登录');else window.location.href='${ctx}/community!createCircle.action'"
																href="javascript:void(0)">创建我的圈子</a></li>

															</ul>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>

								</div>
							</div>
						</li>
						<li id="topService" class="topService"><a
							style="color: #a6a6a6;" href="${ctx}/pages/convenient.jsp">
							<div class="menuediv"
									style="font-size: 12px; font-family: '微软雅黑'; margin-top: 0; vertical-align: bottom; height: 67px;">
									<label style="cursor: pointer; position: absolute; bottom: 8px">
										便捷服务</label>
								</div></a>
							<div id="topServicePopView" class="popView"
								style="margin: 6px 0 0 0;">
								<div align="center" style="margin-top: 60px;">
									<table align="center" border="0" cellspacing="6"
										cellpadding="0">
										<tr>
											<td><img src="${ctx}/images/xbk1.png"
												onclick="gotoPage('${ctx}/pages/convenient_restaurant.jsp')" /></td>
											<td><img src="${ctx}/images/xbk2.png"
												onclick="gotoPage('${ctx}/pages/convenient_map.jsp')" /></td>
											<td><a
												href="${ctx}/community!findLableListCircle.action"><img
													src="${ctx}/images/xbk3.png" /></a></td>
											<td><img src="${ctx}/images/xbk4.png"
												onclick="gotoPage('${ctx}/pages/convenient_brand.jsp')" /></td>
											<td><img src="${ctx}/images/travelzen.png"
												onclick="gotoPage('${ctx}/pages/travelzen.jsp')" /></td>
											<td><img src="${ctx}/images/xbk6.png"
												onclick="gotoPage('${ctx}/pages/depu/default.jsp')" /></td>
										</tr>
									</table>
								</div>

							</div></li>

						<li id="topLogin" class="topLogin"><a style="color: #a6a6a6;"
							href="${ctx}/pages/myhome.jsp">


								<div class="menuediv"	style="font-size: 12px; font-family: '微软雅黑'; margin-top: 0; vertical-align: bottom; height: 67px;">
									<c:choose>
										<c:when test="${user ==null}">
											<label
												style="cursor: pointer; position: absolute; bottom: 8px">注册登录
											</label>
										</c:when>
										<c:when test="${user !=null}">
											<label class="index-userinfo"
												style="cursor: pointer; position: absolute; bottom: 8px">
												<c:if test="${fn:length(user.nickName)>10}">
												  ${user.nickName}...
												</c:if> 
												<c:if test="${fn:length(user.nickName)<=10}">
												${user.nickName}
												</c:if>
											</label>
										</c:when>
									</c:choose>
								</div>
						</a>
							<div id="topLoginPopView" class="popView"
								style="margin: 3px 0 0 0;">
								<div style="margin: 60px 0 10px 200px">
									<table width="88%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="44%" style="border-right: #999 solid 1px;">
												<table width="99%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td height="40" valign="top">1.第三方快速登录(正在建设中)</td>
													</tr>
													<tr>
														<td>
															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tr>
																	<td width="39%"><img src="${ctx}/images/sin.png"
																		width="110" height="110"/></td>
																	<td width="43%"><img src="${ctx}/images/QQ.png"
																		width="110" height="110" /></td>
																	<td width="18%">&nbsp;</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
											<td width="4%"></td>
											<td width="52%" style="padding-left: 110px;">
												<form id="form1" name="form1" method="post" action="">
													<table width="360" border="0" cellspacing="0"
														cellpadding="0">
														<tr>
															<td height="30" colspan="3">2.请输入账号密码</td>
														</tr>
														<tr>
															<td colspan="3"><input id="txtAccount" border="0"
																class="input_login" name="account" value=""
																type="text" maxlength="30" value="手机/邮箱"/></td>
														</tr>
														<tr>
															<td colspan="3"><input id="txtPassword"
																class="input_login" name="password" type="password"
																value="" maxlength="30"/></td>
														</tr>
														
														<tr>
															<td width="180"><a href="javascript:void(0)" class="btn_blue"
																onclick="weblogin()"><div>登&nbsp;&nbsp;录</div></a></td>
															<td><a href="${ctx}/pages/personal_register.jsp"
																class="btn_blue"><div>注&nbsp;&nbsp;册</div></a></td>
															<td style="color: #f60;cursor:pointer;" onclick="window.location.href='${ctx}/pages/personal_findpass.jsp'">忘记密码?</td>
														
														</tr>
													</table>
												</form>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<div style="float: right; margin: -62px 2px 0 0px;">
								<c:choose>
									<c:when
										test="${user.headPicture !=null && user.headPicture!=''}">
										<img src="${imageStorePath}${user.headPicture}" id="userHeadImg"
											width="46" height="46" />
									</c:when>
								</c:choose>
							</div></li>
						<li id="topShop" class="topShop" onclick="if('${user.userId}'=='') alert('请登录');else gotoMyCart();"><div
								class="menuediv" style="font-size: 12px; font-family: '微软雅黑';">
								购物车
								<div class="my-cart" style="margin:-60px 0 0 70px;color:#fff;width:18px;height:24px;background:url(${ctx}/images/mycart.png) no-repeat;">
								  <div style="float:center;padding-top:1px;width:18px;text-align:center;font-size:10px;" id="mycartCount"></div>
								 </div>
								</div>
							<div id="topShopPopView1" class="popView1"
								style="margin: 3px 0 0 0;">
								<div style="margin: 20px;"></div>
							</div></li>
					</ul>

				</div>
			</div>
		</div>

       <div id="divTest" style="display:none;text-align:left;font-size:10px;color:#9a9a9c;position: absolute;">
      		 <!-- 平台内测中，如有问题请联系4008215151，感谢您的支持。 -->
       </div>

	</div>
 
	<div class="search">
		<div class="search_content">
			<div style="margin: 0 25px 0 25px;">
			   <table cellpadding="0" cellspacing="0">
			   <tr>
			   <td>			   
				<a style="float: left; margin-top: 2px;"
					href="${ctx}/pages/index.jsp"><img id="imgIndex"
					src="${ctx}/images/home_fangzi.jpg" height=36 width=160 /></a>
			   </td>
			   <td>
				<div style="float: left; width: 500px;text-align: left;">
					<input id="txtKeyWord" value='搜索您需要的'
						onclick="if(this.value=='搜索您需要的')this.value='';"
						style="border: 1px solid #ccc; margin: 2px 0 0 0px; width: 490px; color: #008163; line-height: 34px; height: 34px; font-size: 15px; padding-left: 10px; background-color: #dbf8ee;"
						type="text" />
				</div>
				</td>
				<td>
				<div style="float: right;">
					<img onclick="search_keyword()"
						style="cursor: pointer; margin-top: 2px; height: 36px;"
						src="${ctx}/images/search.png" />
				</div>
				</td>
				<td>
				<div onclick="show_lable()"
					style="cursor: pointer; float: right; margin-top: 0px; width: 232px; height: 32px; background: #D8D8D8;">
					<img id="imgLable" src="${ctx}/images/lable_type1.png" height=36
						width=232 />
				</div>
				</td>
				
				</tr>
			   </table>

			</div>


		</div>
	</div>
	<c:choose>
		<c:when test="${user != null}">
			<div
				style="position: fixed; z-index: 100000000000; float: right; margin: 90px 0 0 20px; font-family: 微软雅黑; font-size: 12px;">
				欢迎您&nbsp;
				<c:if test="${fn:length(user.nickName)>10}">
					${user.nickName}...
				</c:if> 
				<c:if test="${fn:length(user.nickName)<=10}">
					${user.nickName}
				</c:if>
				<a href="javascript:void(0)" style="color: blue;" onclick="logout()">退出</a>
			</div>
		</c:when>
	</c:choose>

	<div class="space"></div>

    
	<div onclick="show_lable()" class="div_lable">
		<div class="div_lable_content" onclick="event.cancelBubble=true;">
			<div
				style="width: 950px; position: relative; padding: 0px 25px 0px 25px;">
				<div id="lable_content1" style="display: none;">
					<div
						style="width: 950px; height: 200px; background: #eeffe4; border-bottom: 1px solid #ccc;">
						<div id="lableThirdContent" onclick="event.cancelBubble=true;"
							style="float: left; width: 705px; height: 200px; overflow-y: auto;">


						</div>
						<div
							style="float: right; height: 200px; width: 240px; background: #B1F1EF;">
							<div style="clear: both; background: #B1F; margin-top: 1px;">
								<div onclick="event.cancelBubble=true;"
									style="color: #fff; float: left; text-align: center; padding-top: 2px; width: 60px; height: 26px; background: #11a683;">
									<c:choose>
										<c:when test="${user ==null || user.lableType == '0'}">全部</c:when>
										<c:when test="${user.lableType == '1'}">企业</c:when>
										<c:when test="${user.lableType == '2'}">白领</c:when>
									</c:choose>
								</div>
								<div style="float: left; width: 180px;">
									<ul class="ul-time">
										<li id="time1" onclick="sel_time(1);event.cancelBubble=true">今天</li>
										<li id="time2" onclick="sel_time(2);event.cancelBubble=true">本周</li>
										<li id="time3" onclick="sel_time(3);event.cancelBubble=true">本月</li>
									</ul>
								</div>
							</div>


							<%-- 	<div align="center"								style="clear: both; height: 20px; width: 240px; margin-top: 0px;">
								<img align="middle" onclick="lableScroll(1)"
									src="${ctx}/images/btn_up.png" style="cursor: pointer;" />
							</div> --%>
							<div style="clear: both; height: 5px;"></div>
							<div id="lableScroll" onclick="event.cancelBubble=true;"
								style="height: 120px; width: 240px; overflow: hidden;">

								<ul class="lableFirstMenue" id="lableFirstMenue">

								</ul>
							</div>
									<div style="clear: both; height: 17px;"></div>
							<div onclick="lableScroll(1);event.cancelBubble=true;" class="classlableFirstMenuehover"	style="float:left; height: 28px;cursor: pointer; line-height:28px;width: 49%;background-image: url(${ctx}/images/btn_up.png); background-repeat:no-repeat;
    background-position:center;"
								align="right">
								<%-- <img align="middle" onclick="lableScroll(1)"
									src="${ctx}/images/btn_up.png" style="cursor: pointer;margin-right:5px;" />	 --%>
								<%-- <img onclick="lableScroll(-1)" src="${ctx}/images/btn_down.png"
									style="cursor: pointer;" /> --%>
							</div>
							<div onclick="lableScroll(-1);event.cancelBubble=true;" class="classlableFirstMenuehover" style="float:right; height: 28px;cursor: pointer;line-height:28px; width: 49%;background-image: url(${ctx}/images/btn_down.png); background-repeat:no-repeat;
    background-position:center;"
								align="left">
								<%-- <img align="middle" onclick="lableScroll(1)"
									src="${ctx}/images/btn_up.png" style="cursor: pointer;" /> --%>
								<%-- <img onclick="lableScroll(-1)" src="${ctx}/images/btn_down.png"
									style="cursor: pointer;margin-left:5px;" /> --%>
							</div>
						</div>
					</div>
					<div onclick="event.cancelBubble=true;"
						style="clear: both; background: #eeffe4;  border-bottom: 1px solid #ccc;">
						<table cellpadding="0" cellspacing="0">
							<tr>
								<td width=708>
									<div align="left"
										style="width: 707px; height: 60px; overflow-y: auto;">
										<ul class="lable_ul_select" id="lable_ul_select">

										</ul>

									</div>
								</td>

								<td width="120" style="text-align: left;padding-left:10px;">

									<div>
												<a href="javascript:void(0)"> <img
													width="100" src="${ctx}/images/first_sure.png" onclick="searchByTag();event.cancelBubble=true;" />
												</a>
												
									</div>

								</td>
								<td style="text-align: left;padding-left:10px;">

									<div>
												<a href="javascript:void(0)"> <img
													width="100" src="${ctx}/images/first_reset.png" onclick="resetTagTime();event.cancelBubble=true;" />
												</a>
												
									</div>

								</td>
							</tr>
						</table>



					</div>


				</div>
			</div>


		</div>
	</div>



</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$('#txtAccount').val("手机/邮箱");
		initInputText('txtAccount','手机/邮箱');
		var width = $(window).width();
		$('#divTest').css("margin-left",(width-(width/2-500)-20)+"px");
		$('#divTest').css("margin-top","-40px");
		$('#divTest').show();
		a(0, 0);// #tbox的div距浏览器底部和页面内容区域右侧的距离
		$(document).scroll(function(e) {
			onscroll_body();
		});
		$('#lable_content1').height(0);
		if("${user.userId}" == ""){
			$('.my-cart').hide();
			$('.index-userinfo').hide();
		}
		else{
			$('.index-userinfo').show();
			var count = getCookie("userCartCount");
    		if(count !="" && count !=null){
    			if(count=="0")
    				$('.my-cart').hide();
    			else{
    				$('.my-cart').show();
    				$('#mycartCount').html(count);
    			}
    		}
    		else{
    			finduserCartItemCount();
    		}
		}
		$('#share_img').mousemove(function(e){
			$('.shareweb').show();
			$('.shareweb').css({"left":(e.pageX-200)+"px","top":(e.pageY-104)+"px"});
		});
		
		initMenueAndSearch();
		
		window.alert=Dialog.alert;
		window.confirm=Dialog.confirm;
		
		
		if(document.addEventListener){//如果是Firefox   
			  document.addEventListener("keypress",fireFoxHandler, true);   
	    }else{   
			      document.attachEvent("onkeypress",ieHandler);  
		}   
	  function fireFoxHandler(evt){ 
		
			 //alert("firefox"); 
			 if(evt.keyCode==13){  
				 if(evt.target.id=='txtKeyWord'){
					 search_keyword();//你的代码 
				 }
				
			  }  
			 } 
	function ieHandler(evt){ 
			  //alert("IE");  
			 if(evt.keyCode==13){ 
				 if(evt.target.id=='txtKeyWord'){
					 search_keyword();//你的代码 
				 }
			 }  
	  }
			 
	});

	function initMenueAndSearch() {
		/** 公共* */
		$(".nav1 li").hover(function() {

			if ("${user.userId}" != '') {
				if ($(this).attr("id") != "topLogin") {
					$('#' + $(this).attr("id") + "PopView").show();
					$(this).addClass($(this).attr("id") + "Sel");
				} else {

					$('#' + $(this).attr("id") + "PopView").hide();
					$(this).addClass($(this).attr("id") + "Sel");
				}
			} else {
				$('#' + $(this).attr("id") + "PopView").show();
				$(this).addClass($(this).attr("id") + "Sel");
			}

		}, function() {
			$('#' + $(this).attr("id") + "PopView").hide();
			$(this).removeClass($(this).attr("id") + "Sel");
			$(this).addClass($(this).attr("id"));
		});

		/** 公共* */
	}
	var searchFlag=false;
	function search_keyword() {
		if ($.trim($('#txtKeyWord').val()).length == 0) {
			alert('请输入查询内容!');
			return;
		}
		$('#hiddenKeyWord').val($('#txtKeyWord').val());
		$('#formturn').attr('target',"_blank");
		$('#formturn').attr('action', "${ctx}/user!turnSearchResult.action?type=refresh");
		$('#formturn').submit();
	}
	function gotoMyCart() {
		$('#formturn').attr('action', "${ctx}/product!findUserCartList.action");
		$('#formturn').submit();
	}
	function loginComeSina(){
		$('#formturn').attr('action', "${ctx}/common!loginComeSina.action");
		$('#formturn').submit();
	}
	function share_web(obj,e){
		
		$('.shareweb').show();
		$('.shareweb').css({"left":(e.pageX-200)+"px","top":(e.pageY-104)+"px"});
		
	}
	function initInputText(txtId,text){
		var title=document.getElementById(txtId);
		if(title!=null && title!= undefined){
			title.onfocus=function(){
				if(this.value ==text){
					this.value='';
					this.className='input_login_focus';
				}
				else
					this.className='input_login_focus';
				};
				title.onblur=function(){
				if(this.value==''){
				  this.value=text;
				  this.className='input_login';
				}
				else
					this.className='input_login';
				};
		}
	}
	  
</script>
