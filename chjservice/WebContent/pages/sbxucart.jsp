<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<c:if test="${param.type==2}">
	<script type="text/javascript"
		src="http://webapi.amap.com/maps?v=1.2&key=57a5a7b350ad90c9bf5b9889b360f37e"></script>
</c:if>
<style type="text/css">
.divImg {
	font-family: '微软雅黑';
	width: 368px;
	height: 300px;
	font-size: 12px;
	color: #9a9a9a;
	padding: 65px 0 0 25px;
	font-weight: bold;
	background: url('${ctx}/images/sbxu1.png') no-repeat;
}

.addMapop {
	font-family: '微软雅黑';
	width: 30px;
	height: 30px;
	background: url('${ctx}/images/sbxu3.png') no-repeat;
}
</style>
</head>
<body>
	<c:if test="${param.type==1}">
		<div class="divImg">
			<table style="margin-right:4px;width: 350px;font-family: '微软雅黑';" cellspacing="1" cellpadding="2">
				<tr>
					<td width="23%">开放时间：</td>
					<td width="75%">工作日9:00-17:00，节假日除外</td>
				</tr>
				<tr>
					<td>起送金额：</td>
					<td>100元起</td>
				</tr>
				<tr>
					<td>外送产品：</td>
					<td>仅限手工调制饮料</td>
				</tr>
				<tr>
					<td>到货时间：</td>
					<td>确认订单起一小时内</td>
				</tr>
				<tr>
					<td>支付方式：</td>
					<td>仅限现金支付</td>
				</tr>
				<tr>
					<td valign="top">其&nbsp;&nbsp;&nbsp;他：</td>
					<td>不可使用各类免费券、星享券、员工券、买一送一券、升杯券等纸质券或电子券。<br /> 不参加门店折扣及优惠活动。<br />
						不可使用星享卡积分，不参加星享卡活动，不可使用星享卡内各类优惠券。
					</td>
				</tr>
				<tr>
					<td colspan="2"
						style="vertical-align: middle; padding: 10px 0px 0 110px;"><img
						src="${ctx}/images/sbxu2.png" style="cursor: pointer;"
						width="100px" height="35px"
						onclick="window.top.hidePopWin(true,null);" /></td>
				</tr>
			</table>
		</div>
	</c:if>
	<c:if test="${param.type==2}">
		<div style="width: 890px; height: 650px; background-color: #FFF;">
			<div style="width: 890px; height: 20px; float: left;">
				<img src="${ctx}/images/lable_del.png"
					style="height: 20px; width: 20px; margin: 5px 0 5px 855px;"
					onclick="window.top.hidePopWin(false,null);" />
			</div>
			<div
				style="width: 890px; padding: 5px 30px 0 40px; height: auto; float: left;">

				<div style="width: 100%; height: auto;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="65%" height="70px" valign="top"><span
								style="font-size: 24px; font-family: '微软雅黑';">园区内星巴克门店</span><br />
								<span
								style="font-size: 12px; font-family: Arial; color: #c7c7c7;">STARBUCKS
									IN CAMPUS</span></td>
							<td width="35%" align="center" valign="bottom"><img
								src="${ctx}/images/starbuck_07.png" width="105px" height="99px" /></td>
						</tr>
					</table>
				</div>
				<div style="width: 100%; padding: 0px 20px 0 10px; float: left;">
					<div id="shopInfo">
						<div
							style="border-bottom: 1px solid #CCCCCC; padding-top: 5px; width: 800px; height: 70px; float: left;">

							<table border="0" cellspacing="0" cellpadding="0"
								style="float: left;">
								<tr>
									<td
										style="width: 20px;background: url('${ctx}/images/sbxu3.png') no-repeat;color:#FFF;"
										valign="top" align="center">1</td>
									<td colspan="4"><span
										style="font-size: 16px; color: #0e8a02; font-weight: bold; cursor: pointer; font-family: 微软雅黑">星巴克钦江路门市</span><br />
										<span
										style="color: #adadad; font-size: 12px; font-family: 微软雅黑">QINJIANG
											ROAD STORE</span></td>
								</tr>
								<tr>
									<td height="33">&nbsp;</td>
									<td><img src="${ctx}/images/selectstores_map.png"
										width="16" height="19"
										style="cursor: pointer; margin: 0 10px 0 0;" /></td>
									<td style="color: #a19f76"><span
										style="cursor: pointer; font-size: 12px; font-family: 微软雅黑">钦江路102号</span></td>
									<td><img src="${ctx}/images/selectstores_phoe.png"
										width="19" height="20" style="margin: 0 10px 0 15px;" /></td>
									<td style="color: #a19f76"><span
										style="cursor: pointer; font-size: 12px; font-family: 微软雅黑">021-61913716</span></td>
								</tr>
							</table>

							<table border="0" cellspacing="0" cellpadding="0"
								style="float: left; margin: 5px;">
								<tr>
									<td width="1" style="background-color: #CCCCCC;" height="50px"></td>
								</tr>
							</table>

							<table border="0" cellspacing="0" cellpadding="0"
								style="float: left;">
								<tr>
									<td
										style="width: 20px;background: url('${ctx}/images/sbxu3.png') no-repeat;color:#FFF;"
										valign="top" align="center">2</td>
									<td colspan="4"><span
										style="font-size: 16px; color: #0e8a02; font-weight: bold; cursor: pointer; font-family: 微软雅黑">
											星巴克漕河泾门市 </span><br /> <span
										style="color: #adadad; font-size: 12px; font-family: 微软雅黑">CAOHEJING
											STORE</span></td>
								</tr>
								<tr>
									<td height="33">&nbsp;</td>
									<td><img src="${ctx}/images/selectstores_map.png"
										width="16" height="19"
										style="cursor: pointer; margin: 0 10px 0 0;" /></td>
									<td style="color: #a19f76"><span
										style="cursor: pointer; font-size: 12px; font-family: 微软雅黑">
											宜山路1009号创新大厦1层</span></td>
									<td><img src="${ctx}/images/selectstores_phoe.png"
										width="19" height="20" style="margin: 0 10px 0 15px;" /></td>
									<td style="color: #a19f76"><span
										style="cursor: pointer; font-size: 12px; font-family: 微软雅黑">021-64850387</span></td>
								</tr>
							</table>
						</div>

						<div
							style="border-bottom: 1px solid #CCCCCC; padding-top: 5px; width: 800px; height: 70px; float: left;">

							<table border="0" cellspacing="0" cellpadding="0"
								style="float: left;">
								<tr>
									<td
										style="width: 20px;background: url('${ctx}/images/sbxu3.png') no-repeat;color:#FFF;"
										valign="top" align="center">3</td>
									<td colspan="4"><span
										style="font-size: 16px; color: #0e8a02; font-weight: bold; cursor: pointer; font-family: 微软雅黑">
											星巴克科产大厦门市 </span><br /> <span
										style="color: #adadad; font-size: 12px; font-family: 微软雅黑">KECHAN
											BUILD STORE</span></td>
								</tr>
								<tr>
									<td height="33">&nbsp;</td>
									<td><img src="${ctx}/images/selectstores_map.png"
										width="16" height="19"
										style="cursor: pointer; margin: 0 10px 0 0;" /></td>
									<td style="color: #a19f76"><span
										style="cursor: pointer; font-size: 12px; font-family: 微软雅黑">
											宜山路900号科产休闲广场1楼</span></td>
									<td><img src="${ctx}/images/selectstores_phoe.png"
										width="19" height="20" style="margin: 0 10px 0 15px;" /></td>
									<td style="color: #a19f76"><span
										style="cursor: pointer; font-size: 12px; font-family: 微软雅黑">021-64279072</span></td>
								</tr>
							</table>

							<table border="0" cellspacing="0" cellpadding="0"
								style="float: left; margin: 5px;">
								<tr>
									<td width="1" style="background-color: #CCCCCC;" height="50px"></td>
								</tr>
							</table>

							<table border="0" cellspacing="0" cellpadding="0"
								style="float: left;">
								<tr>
									<td
										style="width: 20px;background: url('${ctx}/images/sbxu3.png') no-repeat;color:#FFF;"
										valign="top" align="center">4</td>
									<td colspan="4"><span
										style="font-size: 16px; color: #0e8a02; font-weight: bold; cursor: pointer; font-family: 微软雅黑">
											星巴克漕河泾二店 </span><br /> <span
										style="color: #adadad; font-size: 12px; font-family: 微软雅黑">CAOHEJING
											STORE</span></td>
								</tr>
								<tr>
									<td height="33">&nbsp;</td>
									<td><img src="${ctx}/images/selectstores_map.png"
										width="16" height="19"
										style="cursor: pointer; margin: 0 10px 0 0;" /></td>
									<td style="color: #a19f76"><span
										style="cursor: pointer; font-size: 12px; font-family: 微软雅黑"
										onclick="window.top.hidePopWin(false,null);">桂平路391号新漕河泾国际商务中心内</span></td>
									<td><img src="${ctx}/images/selectstores_phoe.png"
										width="19" height="20" style="margin: 0 10px 0 15px;" /></td>
									<td style="color: #a19f76"><span
										style="cursor: pointer; font-size: 12px; font-family: 微软雅黑">021-34140663</span></td>
								</tr>
							</table>
						</div>

					</div>
				</div>
			</div>
			<div style="clear: both;"></div>
			<div style="width: 890px; padding: 5px 10px 5px 10px;">
				<div>
					<div id="container"
						style="width: 865px; border: 2px solid #00aacc; height: 275px;">
					</div>
				</div>
			</div>
		</div>
	</c:if>

</body>
</html>
<script type="text/javascript" src="${ctx}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
	var num = [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H' ];
	var mapObj, toolBar, locationInfo = null, trafficLayer = null;
	var marklist = [], inforWindowArray = [];
	var shopId = "${param.compayshopId}";

	mapObj = new AMap.Map("container"); // 创建地图实例
	var point = new AMap.LngLat(121.372344, 31.16853430); // 创建点坐标
	mapObj.setCenter(point); // 设置地图中心点坐标
	mapObj.setZoom(16);
	//在地图中添加ToolBar插件  
	mapObj.plugin([ "AMap.ToolBar" ], function() {
		toolBar = new AMap.ToolBar();
		mapObj.addControl(toolBar);
	});

	var data1 = {
		name : '星巴克钦江路门市',
		address : '钦江路102号',
		lng : 121.410153,
		lat : 31.17659
	};
	var data2 = {
		name : '星巴克漕河泾门市',
		address : '宜山路1009号创新大厦1层',
		lng : 121.401005,
		lat : 31.170689
	};
	var data3 = {
		name : '星巴克科产大厦门市',
		address : '宜山路900号科产休闲广场1楼',
		lng : 121.401131,
		lat : 31.172123
	};
	var data4 = {
		name : '星巴克漕河泾二店',
		address : '桂平路391号新漕河泾国际商务中心内',
		lng : 121.404143,
		lat : 31.164326
	};
	addMyMarker(data1, 1);
	addMyMarker(data2, 2);
	addMyMarker(data3, 3);
	addMyMarker(data4, 4);
	mapObj.setFitView();
	//实例化点标记   
	function addMyMarker(data, index) {

		var lngX = data["lng"];
		var latY = data["lat"];

		var marker = new AMap.Marker({
			//icon:"${ctx}/images/map_pop.png", 
			content : createMyIcon(index),
			position : new AMap.LngLat(lngX, latY)
		});
		marker.setMap(mapObj); //在地图上添加点   
		marklist.push(marker);

		var info = [];
		info
				.push("<b><span style=\"font-size:14px;TEXT-DECORATION: underline;color:#00a6ac;cursor;pointer;\" onclick=\"window.top.hidePopWin(false,null);\">"
						+ data["name"] + "</span></b>");
		info.push("<span style='font-size:12px;color:#9a9a9c;'><br/>地址 : "
				+ data["address"] + '</span>');

		var inforWindow = new AMap.InfoWindow({
			content : info.join(""),
			size : new AMap.Size(300, 0),
			autoMove : true,
			offset : new AMap.Pixel(0, -30)

		});
		inforWindowArray.push(inforWindow);

		AMap.event.addListener(marker, "mouseover", function(e) {
			inforWindow.open(mapObj, marker.getPosition());
			$('.tr-map').each(function() {
				var sel1 = this.getAttribute('value');
				;
				if (index == sel1) {
					$(this).css("background", "#F0F0F0");
				} else {
					$(this).css("background", "");
				}
			});
		});

	}

	function createMyIcon(index) {
		return '<div><img style="width:30px;height:35px;" src="${ctx}/images/map/'+index+'.png"/></div>';
	}
</script>

