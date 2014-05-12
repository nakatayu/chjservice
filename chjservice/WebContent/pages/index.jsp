<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>漕河泾e服务</title>

<!-- 公共css,js -->
<link rel="stylesheet" type="text/css" href="${ctx}/css/css.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/index.css" />
<style>
.divcss5 {
	position: relative;
	width: 78px;
	height: 78px;
}

.divcss5 a {
	display: none;
	width: 78px;
	height: 78px;
}

.divcss5:hover {
	cursor: pointer
}

.divcss5:hover a.now {
	cursor: pointer;
	position: absolute;
	bottom: 0;
	left: 0;
	display: block;
	color: #FFF;
	font-size: 14px;
	width: 78px;
	line-height: 20px;
	background: #000;
	filter: alpha(opacity =     80);
	-moz-opacity: 0.8;
	opacity: 0.8;
}
</style>

</head>
<body onscroll="b()">

	<jsp:include page="/common/header.jsp" />

	<div class="main">
		<div id="main_content" class="main_content">


			<div
				style="clear: both; color: #fff; font-size: 20px; position: relative; padding: 10px 25px 0px 25px; height: 240px;">
				<div align="left"
					style="float:left;height:230px;width:230px;background:url(${ctx}/images/cx_bg.jpg)">
					<div style="float: left">
						<img id="img_weather" src="${ctx}/images/w_sunny1.png"
							style="width: 86px; height: 86px; margin: 24px 0 0 16px;" />
					</div>
					<div id="wetherinfo"
						style="width: 110px; text-align: center; float: left; font-family: 黑体; font-weight: bold; margin: 40px 0 0 10px;">
						30C/25C<br /> <span style="font-family: 黑体; font-size: 24px;">晴</span>
					</div>
					<div id="div_time"
						style="font-size: 36px; width: 230px; text-align: center; float: left; margin: 30px 0 0 40px; font-family: Arial; font-weight: bold;"></div>
					<div id="wetherday"
						style="font-family: 黑体; font-size: 16px; width: 230px; text-align: center; float: left; margin: 0 0 0 30px;"></div>
				</div>


				<div style="float: left;">
					<div>
						<div class="fun1">
							<img src="${ctx}/images/xbk1.png"
								onclick="gotoPage('${ctx}/pages/convenient_restaurant.jsp')" />
						</div>
						<div class="fun1">
							<img src="${ctx}/images/xbk2.png"
								onclick="gotoPage('${ctx}/pages/convenient_map.jsp')" />
						</div>
						<div class="fun1">
							<a href="${ctx}/pages/community_topiclist.jsp"><img
								src="${ctx}/images/topiczhumu.png" /></a>
						</div>
					</div>
					<div style="clear: both;">
						<div class="fun2">
							<img src="${ctx}/images/fwyhs.png"
								onclick="gotoPage('${ctx}/pages/share_service.jsp')" />
						</div>
						<div class="fun2">
							<img src="${ctx}/images/xbk5.png"
								onclick="gotoPage('${ctx}/pages/travelzen.jsp')" />
						</div>
						<div class="fun2">
							<img src="${ctx}/images/xbk6.png"
								onclick="gotoPage('${ctx}/pages/depu/default.jsp')" />
						</div>
					</div>
				</div>

				<div align="right" style="float: right;">

					<div id="shutter" class="shutter">
						<ul id="ul-ads">
							<li><a href="#"><img width="350px" height="230px"
									src="${ctx}/images/index_ads1.jpg" /></a></li>
							<li><a href="#"><img width="350px" height="230px"
									src="${ctx}/images/index_ads2.jpg" /></a></li>
							<li><a href="#"><img width="350px" height="230px"
									src="${ctx}/images/index_ads3.jpg" /></a></li>
							<li><a href="#"><img width="350px" height="230px"
									src="${ctx}/images/index_ads4.jpg" /></a></li>
						</ul>
					</div>
				</div>
			</div>

			<div
				style="position: relative; padding: 0px 25px 0px 25px; height: 310px;">
				<div>
					<div align="left" style="float: left;">
						<div style="height: 300px; width: 230px;">
							<table width="100%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td align="center"><a onclick="gotosbuxshopo()"> <img
											src="${ctx}/images/starbuck_01.jpg" width="232" height="301"
											style="cursor: pointer;" /></a></td>
								</tr>
							</table>

						</div>
					</div>

					<div
						style="margin-left: 10px; width: 350px; height: 298px; align: left; float: left;">
						<div class="Hr_1" id="Hr_1" style="CURSOR: hand">

							<div class="Hr_11" id="Hr_11"></div>


						</div>
					</div>


					<div align="left" style="float: left;">
						<div style="margin-left: 10px;">
							<div
								style="width:350px;height:200px;margin:0px;background:url(${ctx}/images/line2_3_1.jpg) no-repeat;">
								<table id="table_circle" width="100%" border="0" cellspacing="0"
									cellpadding="0">


								</table>
							</div>

							<div style="margin-top: 10px;">
								<table cellpadding="0" cellspacing="0">
									<tr>
										<td><img src="${ctx}/images/line2_3_2.png"
											style="width: 250px; height: 90px; cursor: pointer;"
											onclick="linkSandCard()" /></td>
										<td>
											<div class="divcss5"
												style="margin-left: 10px; border: 2px solid #FAAC58;">
												<img src="${ctx}/images/qrcode_icaohejing.png"
													style="width: 78px; height: 78px; cursor: pointer;" /> <a
													href="#" class="now">漕河泾E服务网站二维码</a>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div
				style="clear: both; position: relative; padding: 0px 25px 0px 25px;">
				<div style="height: 86px; repeat-y; border: 2px solid #FAAC58;">

					<img id="yihaodianImg" src="${ctx}/images/line3_3.jpg" width="946"
						height="86" onclick="DengLuYihaodian()" />

				</div>
			</div>


			<div
				style="clear: both; position: relative; padding: 0px 25px 0px 25px;">
				<div>

					<div
						style="cursor: default; color: #666; font-weight: bold; height: 20px; margin-top: 0px; margin-bottom: 0px; padding-top: 10px">
						<div
							style="float: left; width: 230px; margin: 0px 0 0 0; font-family: 黑体;">新品尝鲜</div>
						<div
							style="float: left; width: 490px; height: 18px; line-height: 18px; text-align: center; margin-top: 0px;">
							<img id="food0"
								style="cursor: pointer; margin-left: 0px; padding-top: 6px"
								src="${ctx}/images/dot_sel.png" onclick="showFood(0)" /> <img
								id="food1"
								style="cursor: pointer; margin-left: 0px; padding-top: 6px"
								src="${ctx}/images/dot.png" onclick="showFood(1)" /> <img
								id="food2"
								style="cursor: pointer; margin-left: 0px; padding-top: 6px"
								src="${ctx}/images/dot.png" onclick="showFood(2)" />
						</div>

					</div>
					<div id="productList"></div>

				</div>
			</div>

			<jsp:include page="/common/bottom.jsp" />

		</div>
	</div>


</body>
</html>

<script type="text/javascript" src="${ctx}/js/index_jqu1-3.js"></script>
<script type="text/javascript" src="${ctx }/js/index_food_for.js"></script>
<script type="text/javascript" src="${ctx }/js/index.js"></script>
<script type="text/javascript">

//右上角广告
/**
var shutterH = new Hongru.shutter.init('shutterH',{
	id:'shutter'
});*/

function timer() {
    var time = new Date ();
    var hour  =time.getHours()<10?('0'+time.getHours()):time.getHours();
    var minute  =time.getMinutes()<10?('0'+time.getMinutes()):time.getMinutes();
    var second  =time.getSeconds()<10?('0'+time.getSeconds()):time.getSeconds();
   $('#div_time').html(hour+':'+minute+':'+second);
   
}
	$(document).ready(function () {
		setInterval('timer()',1000);
		findIndexAdsRightTop();
		findIndexCircle();
		findActivities();

		$.ajax({
			type: "POST",
			url: context + '/product!findFirstPromote.action',
			dataType: 'json',
			data: {},
			success: function (msg, status) {
				if (msg.status == 200) {
					var str = '';
					var data = msg.rows;

					for (var i = 0; i < data.length; i++) {

						if (i % 8 == 0) {
							var t = i / 8;
							if (t == 0) {
								str += '<div id="foodCon' + t + '"><div>';
							} else {
								str += '<div id="foodCon' + t + '" style="display:none;"><div>';
							}
						}
						str+=' <div class="fun4" ';
						
						if (i % 4 == 0) {
							str += ' style="margin-left:0px; margin-top:10px;" ';
						}else{
							str += ' style="margin-left:10px; margin-top:10px;" ';
						}
						
						if(data[i]["productInfo"]["name"].length>10){
							data[i]["productInfo"]["name"]=data[i]["productInfo"]["name"].substr(0,9)+'...';
						}
						str += ' onclick="productDetail(3,' + data[i]["product_id"] + ',' + data[i]["company_shop_product_id"];
						str += ',' + data[i]["company_shop_id"] + ',' + data[i]["sku"]["companyShopProductSkuId"] + ')">';
						str += '<div class="flashNews"><img src="${imageStorePath}' + data[i]["image"] + '" />';
						str += '<div class="bg_index" style="font-size:28px;">';
						str += '<span style="float:right;"><span style="font-size:12px;color:#b3b3b3;">RMB</span>' + data[i]["sku"]["price"] + '</span></div></div>';
						str += '<div style="background-color:#FFF; height:50px; width:230px;">';
						str += '<div class="indexProductfont">' + data[i]["productInfo"]["name"] + '</div>';
						str += '<div style="float:right;"><img src="${ctx}/images/pd.png" style="width:20px;height:45px;"/></div>';
						str += '</div></div>';
						if (i % 8 == 3) {
							str += '</div><div style="clear:both;">';
						} else if (i % 8 == 7) {
							str += '</div></div>';
						}
					}
					$('#productList').html(str);
				} else {
					alert(msg.msg);
				}
			}
		});

	});


	function findActivities() {
		$.ajax({
			type: "POST",
			url: '${ctx}/community!findHeadPageActivity.action',
			dataType: 'json',
			success: function (msg) {
				//load servcieList
				if (msg.status == 200) {
					var array11 = [];
					var array1 = [];
					for (var i = 0; i < msg.rows.length; i++) {
						var data = msg.rows[i];
						var createTime=data["create_time"];
						if(i==0){
							array11.push('<a class=act ');
						}else{
							array11.push('<a class=nor ');
						}
						array11.push('id=a'+i+' onmouseover=clearAuto(); onclick=Mea('+i+'); onmouseout=setAuto() href="JavaScript:activity_detail(\'${user.userId}\','+data["activity_id"]+',\''+data["create_user_id"]+'\',\''+data["status"]+'\',\''+data["examine_result"]+'\')" target=_self>');
						array11.push('<div class="Hfont"><span style="font-size:24px;">'+createTime.substring(8,10)+'</span>/'+createTime.substring(5,7)+'</div></a>');
						array1.push('<a href="JavaScript:activity_detail(\'${user.userId}\','+data["activity_id"]+',\''+data["create_user_id"]+'\',\''+data["status"]+'\',\''+data["examine_result"]+'\')"><img id=pc_'+i+' style="DISPLAY: '+(i==0?'block':'none')+'" height="298px" src="${imageStorePath}'+data["activity_image"]+'" width="348px"/></a>');
					}
					$("#Hr_1").append(array1.join(''));
					$("#Hr_11").append(array11.join('')); 	
					
					
				} else {
					altert(msg.msg);
				}
			}
		});
	}
	var shutterH=null;
	function shutterStart(){
		//水平百叶窗图片切换
		   shutterH = new Hongru.shutter.init('shutterH',{
				id:'shutter',
				position:0
			});
	}
	function findIndexAdsRightTop() {	
		
		$.ajax({
		type: "POST",
		url: '${ctx}/common!findIndexAds.action',
		dataType: 'json',
		data: {type:1},
		success: function (msg, status) {
			var array=[];
			for(var i=0; i<msg.rows.list1.length;i++){
				if(i<msg.rows.list1.length-1){
					array.push('<li><a href="'+msg.rows.list1[i+1]["linkAddress"]+'"><img width="350px" height="230px" src="${imageStorePath}'+msg.rows.list1[i]["path"]+'"/></a></li>');
				}
				else{
					array.push('<li><a href="'+msg.rows.list1[0]["linkAddress"]+'"><img width="350px" height="230px" src="${imageStorePath}'+msg.rows.list1[i]["path"]+'"/></a></li>');
				}
			}
			$('#ul-ads').html(array.join(''));
			
			setTimeout('shutterStart()',1000);
			
			if(msg.rows.list3[0]["path"].length>0){
				$('#yihaodianImg').attr('src',"${ctx}"+msg.rows.list3[0]["path"]);
			}		    
		 }
	  });
	
	}
	
	function findIndexCircle() {
		$.ajax({
			type: "POST",
			url: context + '/community!findIndexCircle.action',
			dataType: 'json',
			data: pageinfo,
			success: function (msg, status) {
				if (msg.status == 200) {
					var array = [];
					for (var i = 0; i < msg.rows["circleRecommend"].length; i++) {
						var data = msg.rows["circleRecommend"][i];

						var name = data["name"];
						if (name.length > 6) {
							name = name.substr(0, 6) + '...';
						}
						array.push(circelTextStr(i, data["circleId"], name, data["circleImage"],data));
						if (i == msg.rows["circleRecommend"].length - 1) {
							if (i % 3 == 0) {
								array.push(circelTextStr(i, 0, '', ''));
								array.push(circelTextStr(i, 0, '', ''));
							}
							if (i % 3 == 1) {
								array.push(circelTextStr(i, 0, '', ''));
							}
						}
					}
					$('#table_circle').append('<tr>' + array.join('') + '</tr>');
					array = [];
					for (var i = 0; i < msg.rows["circleNew"].length; i++) {
						var data = msg.rows["circleNew"][i];

						var name = data["name"];
						if (name.length > 6) {
							name = name.substr(0, 6) + '...';
						}
						array.push(circelTextStr1(i, data["circleId"], name, data["circleImage"],data));
						if (i == msg.rows["circleNew"].length - 1) {
							if (i % 3 == 0) {
								array.push(circelTextStr1(i, 0, '', '',data));
								array.push(circelTextStr1(i, 0, '', '',data));
							}
							if (i % 3 == 1) {
								array.push(circelTextStr1(i, 0, '', '',data));
							}
						}
					}
					$('#table_circle').append('<tr>' + array.join('') + '</tr>');
				}
			}
		});

	}
	function circelTextStr(index, id, name, img,data) {
		var temp = 0;
		if (index == 1) {
			temp = 2; 
		}else if (index == 2) {
			temp = 6;
		}
		var circle = '';
		if (id > 0) {
			circle = '<img onclick="circle_detail(\'${user.userId}\','+data["circleId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')" style="cursor:pointer;" src="${ctx}/images/index_circle1.png" width="100" height="60"/>';
			img = '<img src="${imageStorePath}' + img + '" width="60" height="60"/>';

		}else {
			img = '<img src="${ctx}/images/bk_0000000.png" width="60" height="60"/>';
			name = "";
		}
		return '<td width="100" valign="top" style="height:100px;">' +
				'<div style="margin-left:28px;width:60px;height:60px;margin-top:14px;">' +
				img +
				'</div>' +
				'<div align="center" style="position: absolute;margin:-60px 0 0 8px;">' +
				circle +
				'<br/>' +
				'<span style="color:#7c9596;font-size:14px;">' + name + '</span>' +
				'</div>' +
				'</td>';

	}
	function circelTextStr1(index, id, name, img,data) {
		var temp = 0;
		if (index == 1) {
			temp = 2;
		}else if (index == 2) {
			temp = 6;
		}
		var circle = '';
		if (id > 0) {
			circle = '<img onclick="circle_detail(\'${user.userId}\','+data["circleId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')" style="cursor:pointer;" src="${ctx}/images/index_circle1.png" width="100" height="60"/>';
			img = '<img src="${imageStorePath}' + img + '" width="60" height="60"/>';

		}else {			
			img = '<img src="${ctx}/images/bk_0000000.png" width="60" height="60"/>';
			name = "";
		}
		return '<td width="100" valign="top" style="height:100px;">' +
				'<div style="margin-left:28px;width:60px;height:60px;margin-top:14px;">' +
				img +
				'</div>' +
				'<div align="center" style="position: absolute;margin:-60px 0 0 8px;">' +
				circle +
				'<br/>' +
				'<span style="color:#7c9596;font-size:14px;">' + name + '</span>' +
				'</div>' +
				'</td>';

	}
	


function DengLuYihaodian(){
	window.location.href="${ctx}/common!represtOAuth.action";
}

function gotosbuxshopo(){
	var user="${user}";
	if(user.length==0){
		alert("请登录！");
		return;
	}	
	
	$('#companyIdHidden').val(254);
	$('#companyShopId').val(192);
	$('#formturn').attr("action","${ctx}/product!sbuxShopInfo.action");
	$('#formturn').submit();
}

function linkSandCard(){
	//window.location.href="${ctx}/pages/sand/sand.jsp";
}

</script>
