<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script type="text/javascript"	src="http://webapi.amap.com/maps?v=1.2&key=57a5a7b350ad90c9bf5b9889b360f37e"></script>
<title>漕河泾e服务</title>
<style type="text/css">
.personal_fr1{
float:left;margin-left:10px;
}
.title{font-family:宋体;text-align:center;float:left; font-size:12px;line-height:25px;width:60px;height:50px;background:#78f0fc;}
.div-content{
cursor:pointer;border:1px solid #13c4d4;line-height:25px;font-size:16px;height:50px;background:#fff;width:468px;
}

.text-title{cursor:pointer;margin-top:8px;margin-left:10px;font-size:14px;color:4c4c4c;font-family:黑体;}
.text-time{margin-top:4px;margin-left:10px;font-size:12px;color:#9a9a9c;font-family:黑体;}
.comment{float:right;margin:8px 4px 0 0;font-size:14px;color:#9a9a9c;}

.number-yellow{width:34px;height:30px;padding-top:4px;text-align:center; background:url(${ctx}/images/search_number_yellow.png) no-repeat;float:right;margin:4px 20px 0 0;font-size:14px;color:#fff;}
.number-red{width:34px;height:30px;padding-top:4px;text-align:center; background:url(${ctx}/images/search_number_red.png) no-repeat;float:right;margin:4px 20px 0 0;font-size:14px;color:#fff;}
.number-blue{width:34px;height:30px;padding-top:4px;text-align:center; background:url(${ctx}/images/search_number_blue.png) no-repeat;float:right;margin:4px 20px 0 0;font-size:14px;color:#fff;}
.image-title{border-bottom:1px solid #ccc;text-align:center;height:57px;width:55px;background-color:#FFF;}

.ul-search li{cursor:pointer;float:left;font-size:18px;font-weight:bold;
color:#fff;padding-top:16px;list-style: none;height:40px;
background:#00aacc;text-align: center;}
</style>

</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />

<div class="main">
<div id="main_content" class="main_content">

<div style="position:relative;margin-top:10px; padding:0px 25px 0 25px;">
   <div>
    
 <table width="100%" cellpadding="0" cellspacing="0" border="0">
 <tr>
 <td  width="100%">
   <ul class="ul-search">
   <li style="width:310px;" onclick="order_fun('time')">按时间排序<img id="img_time" src="${ctx}/images/search_desc_time.png"/></li>
   <li style="margin-left:10px;width:310px;" onclick="order_fun('browse')">按人气排序<img id="img_browse" src="${ctx}/images/search_desc_browse.png"/></li>
   <li style="margin-left:10px;width:150px;" onclick="show_fun('list')">列表模式<img src="${ctx}/images/search_btn_list.png" /></li>
    <li style="margin-left:10px;width:150px;" onclick="show_fun('map')">
     地图模式  <img  src="${ctx}/images/search_btn_map.png"/>
    </li>
  </ul>
  </td></tr>
 <tr>
 <td>
<div id="container" style="margin-top:10px;display:none;border:2px solid #00aacc;float:left; width:946px; height:467px; " >
</div> 
 </td></tr>
  </table>
  <div style="height:10px;">&nbsp</div>
  
 <table width="100%" cellpadding="0" cellspacing="0" border="0">
 
  <tr style="margin-top:10px;">
  <td  width="34%" valign="top">
   <div style="clear:both;float:left; width:310px;">
	    <div style="height:44px;background:url(${ctx}/images/search_share.png) no-repeat;">
	    
	    </div>
	    <table id="table_service" width="100%" cellpadding="0" cellspacing="0" border="0">
	   
	    </table>
 	</div>
  </td>
  
   <td  width="33%" valign="top">
   <div style="margin-left:10px;clear:both;float:left; width:310px;">
	    <div style="height:44px;background:url(${ctx}/images/search_convenient.png) no-repeat;">
	    
	    </div>
	   <div id="div_con"></div>
	   
 	</div>
  </td>
   <td width="33%" valign="top">
    <div style="margin-left:10px;clear:both;float:left; width:310px;">
	    <div style="height:44px;background:url(${ctx}/images/search_community.png) no-repeat;">
	    
	    </div>
	    <table id="table_community" width="100%" cellpadding="0" cellspacing="0" border="0">
	    
	    </table>
 	</div>
 	
  </td>
  </tr>
 </table>
 
<div style="clear:both;float:left; width:950px;padding-top:10px;">
     <div id="loadmore" onclick="loadMore()" style="cursor:pointer;height:55px; width:950px; background-color:#FFF;"> <p id="loadMoreText" style="text-align:center; padding-top:18px;font-size:14px;color:4c4c4c;font-family:黑体;">加载更多</p> </div>
  </div> 
  
  
	</div>
 </div>
 
 
  
  <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>



</body>
</html>
<script type="text/javascript">

$(document).ready(function(){
	$('#txtKeyWord').val('${sessionScope.keyword}');
	pageinfo["orderType"]='time';
	pageinfo["order"]='desc';
	if('${sessionScope.keyword}'=='')
		return;
	
	findSearchResult();
	
});
function loadMore(){
	
		
		findSearchResult();
	
}
function  search_keyword(){
	if($.trim($('#txtKeyWord').val()).length==0){
		alert('请输入查询内容!');
		return;
	}

	$('#table_community').html('');
	$('#table_service').html('');
	$('#div_con').html('');
	pageinfo["page"]=1;
	
	findSearchResult();
	
	
}
var orderInfo={time:'desc',browse:'desc'};
function order_fun(type){
	if($.trim($('#txtKeyWord').val()).length==0){
		alert('请输入查询内容!');
		return;
	}

	if(orderInfo[type]=="desc")
			orderInfo[type]="asc";
	else
			orderInfo[type]="desc";
	$('#img_'+type).attr('src',"${ctx}/images/search_"+orderInfo[type]+"_"+type+".png");
	
	$('#table_community').html('');
	$('#table_convenient').html('');
	$('#table_service').html('');
	pageinfo["orderType"]=type;
	pageinfo["order"]=orderInfo[type];
	pageinfo["page"]=1;
	
	findSearchResult();
}
var mapObj,toolBar,locationInfo=null,mapShow=false;
function show_fun(type){
	if(type=='list'){
		mapShow=false;
		$('#container').hide();
	}
	else{
		mapShow=true;
		$('#container').show();
		
		if(mapObj==null){
			mapObj = new AMap.Map("container"); // 创建地图实例
			var point = new AMap.LngLat(121.372344, 31.16853430); // 创建点坐标
			mapObj.setCenter(point); // 设置地图中心点坐标
			mapObj.setZoom(13);
			mapObj.plugin(["AMap.ToolBar","AMap.OverView,AMap.Scale"], function() {
			      // 加载工具条
			    toolBar = new AMap.ToolBar({ direction: true, // 隐藏方向导航
			        ruler: true, // 隐藏视野级别控制尺
			        autoPosition: false // 禁止自动定位
			    });
			    mapObj.addControl(toolBar);
			    
			    //AMap.event.addListener(toolBar,'location',function callback(e){    
		        //    locationInfo = e.lnglat;
		        // });   
			    //toolBar.doLocation();
			    
			// 加载鹰眼
			    view = new AMap.OverView();
			    mapObj.addControl(view);
			    
			// 加载比例尺
			    scale = new AMap.Scale();
			    mapObj.addControl(scale);
			});
	
		}
		loadMapData();
		

	}
}
var marklist=[];
var markerNear = new Array();//附近
var windowsArrNear = new Array();//附近
//实例化点标记   
function myAddMarker(index,type,data){   
	if(data["lng"]>0 && data["lat"]>0){} else return;
	
  var marker=new AMap.Marker({                     
  content:createMyIcon(index),  
  position:new AMap.LngLat(data.lng,data.lat),
  offset: new AMap.Pixel(-50,-70)               
  });   
  marker.setMap(mapObj);  //在地图上添加点   
  marklist.push(marker);
  
  var info = [];
  if(type=='company'){
	  info.push("&nbsp;&nbsp;<a style=\"TEXT-DECORATION: underline;color:#00a6ac;cursor;pointer;\" href=\"javascript:void(0)\" onclick='window.location.href=\"${ctx}/pages/convenient_brandpinfo.jsp?companyId="+data["companyId"]+"\"'>"+data["title"]+"</a>");                   
	  info.push("&nbsp;&nbsp;<span style='color:#9a9a9c;font-size:12px;'>地址:"+data["address"]+"</span>"); 
  }
  else if(type=='activity'){
	  info.push("&nbsp;&nbsp;<a style=\"TEXT-DECORATION: underline;color:#00a6ac;cursor;pointer;\" href=\"javascript:void(0)\" onclick='activity_detail(\""+"${user.userId}"+"\","+data["activityId"]+",\""+data["createUserId"]+"\",\""+data["status"]+"\",\""+data["examineResult"]+"\")'>"+data["title"]+"</a>");                   
	  info.push("&nbsp;&nbsp;<span style='color:#9a9a9c;font-size:12px;'>开始时间 :"+data["beginTime"]+"</span>");
  }
  else if(type=='shop'){
	  info.push("&nbsp;&nbsp;<a style=\"TEXT-DECORATION: underline;color:#00a6ac;cursor;pointer;\" href=\"javascript:void(0)\" onclick='gotoDetail("+data["companyShopId"]+")'>"+data["name"]+"</a>");                   
	  info.push("&nbsp;&nbsp;<span style='color:#9a9a9c;font-size:12px;'>地址:"+data["address"]+"</span>"); 
  }
  //info.push("&nbsp;&nbsp;<a style='cursor:pointer;TEXT-DECORATION: none;font-size:12px;'>周边</a>"); 
  //info.push('&nbsp;&nbsp;<input id="txtMapKeyWord"/><a onclick="placeSearch('+data.lng+','+data.lat+')" style="cursor:pointer;TEXT-DECORATION: none;font-size:12px;">搜索</a>'); 
                 
  var inforWindow = new AMap.InfoWindow({                   
	  offset: new AMap.Pixel(-38,-70),                   
    content:info.join("<br/>")                   
  });                   
  AMap.event.addListener(marker,"mouseover",function(e){                   
    inforWindow.open(mapObj,marker.getPosition());                   
  });                  

}   
function createMyIcon(index){
	return '<div><img style="width:40px;height:45px;" src="${ctx}/images/map/'+(index+1)+'.png"/></div>';
}
function clearMark(){
	if(mapObj==null)
		return;
	for(var i=0; i < marklist.length;i++){
		marklist[i].setMap(null);
	}
	marklist=[];
	mapObj.clearInfoWindow();
}
function loadMapData(){
	if(mapObj!=null && (mapActivity.length>0 || mapShop.length>0 || mapCompany.length>0)){
		for(var i=0;i<mapActivity.length;i++){
			myAddMarker(i,'activity',mapActivity[i]);
		}
		for(var i=0;i<mapShop.length;i++){
			myAddMarker(mapActivity.length+i,'shop',mapShop[i]);
		}
		for(var i=0;i<mapCompany.length;i++){
			myAddMarker(mapActivity.length+mapCompany.length+i,'company',mapCompany[i]);
		}
		mapObj.setFitView(marklist);
		mapActivity=[],mapShop=[],mapCompany=[];
	}
}
//地点查询函数  
function placeSearch(lng,lat) {  
	var word = $.trim($('#txtMapKeyWord').val());
	if(word.length==0)
		return;
    var MSearch;  
    //加载服务插件，实例化地点查询类    
    mapObj.plugin(["AMap.PlaceSearch"], function() {  
        MSearch = new AMap.PlaceSearch({   
            city: "上海"  
        });   
        //查询成功时的回调函数  
        AMap.event.addListener(MSearch, "complete", placeSearch_CallBack);   
        //周边搜索  
        MSearch.searchNearBy(word, new AMap.LngLat(lng,lat), 2000);   
    });  
}  
//查询结果的marker和infowindow   
function addmarker(i, d) {  
    var lngX = d.location.getLng();  
    var latY = d.location.getLat();  
    var markerOption = {  
        map:mapObj,  
        icon:"http://webapi.amap.com/images/" + (i + 1) + ".png",  
        position:new AMap.LngLat(lngX, latY)  
    };  
    var mar = new AMap.Marker(markerOption);  
    markerNear.push(new AMap.LngLat(lngX, latY));  
  
    var infoWindow = new AMap.InfoWindow({  
        content:"<h3><font color=\"#00a6ac\">&nbsp;&nbsp;" + (i + 1) + "." + d.name + "</h3></font><div style='color:#9a9a9c;font-size:12px;'>" + TipContents(d.type, d.address, d.tel)+"</div>",  
        size:new AMap.Size(300, 0),   
        autoMove:true,   
        offset:{x:0, y:-30}  
    });  
    windowsArrNear.push(infoWindow);  
    
    var aa = function (e) {infoWindow.open(mapObj, mar.getPosition());};  
    AMap.event.addListener(mar, "click", aa);  
}  
//回调函数   
function placeSearch_CallBack(data) {  
    var resultStr = "";  
    var poiArr = data.poiList.pois;  
    var resultCount = data.poiList.pois.length;  
    for (var i = 0; i < data.poiList.pois.length; i++) {  
        resultStr += "<div id='divid" + (i + 1) + "' onmouseover='openMarkerTipById1(" + i + ",this)' onmouseout='onmouseout_MarkerStyle(" + (i + 1) + ",this)' style=\"font-size: 12px;cursor:pointer;padding:0px 0 4px 2px; border-bottom:1px solid #C1FFC1;\"><table><tr><td><img src=\"http://webapi.amap.com/images/" + (i + 1) + ".png\"></td>" + "<td><h3><font color=\"#00a6ac\">名称: " + poiArr[i].name + "</font></h3>";  
        resultStr +=TipContents(poiArr[i].type, poiArr[i].address, poiArr[i].tel) + "</td></tr></table></div>";  
        addmarker(i, poiArr[i]);  
    }  
    mapObj.setFitView();  
    //document.getElementById("result").innerHTML = resultStr;  
}  
function TipContents(type, address, tel) {  //信息窗体内容  
    if (type == "" || type == "undefined" || type == null || type == " undefined" || typeof type == "undefined") {  
        type = "暂无";  
    }  
    if (address == "" || address == "undefined" || address == null || address == " undefined" || typeof address == "undefined") {  
        address = "暂无";  
    }  
    if (tel == "" || tel == "undefined" || tel == null || tel == " undefined" || typeof address == "tel") {  
        tel = "暂无";  
    }  
    var str = "&nbsp;&nbsp;地址：" + address + "<br />&nbsp;&nbsp;电话: " + tel + " <br />&nbsp;&nbsp;类型：" + type;  
    return str;  
}  
//根据数组id打开搜索结果点tip  
function openMarkerTipById1(pointid, thiss) {    
    thiss.style.background = '#CAE1FF';  
    windowsArrNear[pointid].open(mapObj, markerNear[pointid]);  
}  
//鼠标移开后点样式恢复  
function onmouseout_MarkerStyle(pointid, thiss) {   
    thiss.style.background = "";  
}

var mapActivity=[],mapShop=[],mapCompany=[];
function findSearchResult(){
	pageinfo["size"]=10;
	pageinfo["keyword"]=$('#txtKeyWord').val();

	$.ajax({
	     type: "POST",
	     url : '${ctx}/user!findSearchResult.action',
	     dataType:'json',
	     data:pageinfo,
	     success: function(msg,status){
	    	if(msg.status == 200){	
	    		var array = [];
	    		var circleLg =msg.rows["circleList"].length;
	    		var topicLg =msg.rows["topicList"].length;
	    		var activityLg =msg.rows["activityList"].length;
	    		
	    		for(var i=0; i<circleLg;i++){
	    			 var data = msg.rows["circleList"][i];
	    			 if(data["title"].length>15){
	    				 data["title"] =data["title"].substr(0,15)+'...';
	    			 }
	    			 var str='<tr>'+
	    				    '<td valign="middle" class="image-title">'+
	    			    '<img src="${ctx}/images/search_circle.png" />'+
	    			    '</td>'+
	    			    '<td valign="top" style="border-bottom:1px solid #ccc;height:57px;background-color:#FFF;">'+
	    			    ' <div class="text-title" onclick="circle_detail(\'${user.userId}\','+data["circleId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')">'+data["title"]+'</div>'+
	    			     '<div class="text-time">'+data["createTime"]+'</div>'+
	    			      '<div class="number-yellow">'+
	    			      data["browseCount"]+
	    			      '</div>'+
	    			      ' <div class="comment">浏览</div>'+
	    				 '</td>'+
	    			    '</tr>';
	    			  array.push(str);
	    			
	    		}
	    		
	    		for(var i=0; i<activityLg;i++){
	    			 var data = msg.rows["activityList"][i];
	    			 mapActivity.push(data);
	    			 if(data["title"].length>15){
	    				 data["title"] =data["title"].substr(0,15)+'...';
	    			 }
	    			 var str='<tr>'+
 				    '<td valign="middle" class="image-title">'+
 			    '<img src="${ctx}/images/search_activity.png" />'+
 			    '</td>'+
 			    '<td valign="top" style="border-bottom:1px solid #ccc;height:57px;background-color:#FFF;">'+
 			    ' <div class="text-title" onclick="activity_detail(\''+"${user.userId}"+'\','+data["activityId"]+',\''+data["createUserId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')" >'+data["title"]+'</div>'+
 			     '<div class="text-time">'+data["createTime"]+'</div>'+
 			      '<div class="number-yellow">'+
 			      data["browseCount"]+
 			      '</div>'+
 			      ' <div class="comment">浏览</div>'+
 				 '</td>'+
 			    '</tr>';
 			  		array.push(str);
	    		}
	    	
	    		for(var i=0; i<topicLg;i++){
	    			 var data = msg.rows["topicList"][i];
	    			 
	    			 if(data["title"].length>15){
	    				 data["title"] =data["title"].substr(0,15)+'...';
	    			 }
	    			 var str='<tr>'+
 				    '<td valign="middle" class="image-title">'+
 			    '<img src="${ctx}/images/search_activity.png" />'+
 			    '</td>'+
 			    '<td valign="top" style="border-bottom:1px solid #ccc;height:57px;background-color:#FFF;">'+
 			    ' <div class="text-title" onclick="circleTopicDetail(\''+"${user.userId}"+'\','+data["topicId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\',\''+data["circleId"]+'\')">'+data["title"]+'</div>'+
 			     '<div class="text-time">'+data["createTime"]+'</div>'+
 			      '<div class="number-yellow">'+
 			      data["browseCount"]+
 			      '</div>'+
 			      ' <div class="comment">浏览</div>'+
 				 '</td>'+
 			    '</tr>';
 			  		array.push(str);
	    		}
	    		$('#table_community').append(array.join(''));
	    		
	    		
	    		
	    		array=[];
	    		var productLg=msg.rows["proList"].length;
	    		var shopLg=msg.rows["shopList"].length;
	    		var companyLg=msg.rows["companyList"].length;
	    		
	    		
	    		for(var i=0; i<productLg;i++){
	    			 var data = msg.rows["proList"][i];
	    			 if(data["name"].length>15){
	    				 data["name"] =data["name"].substr(0,15)+'...';
	    			 }
	    			 data["create_time"]=data["create_time"]==null?"&nbsp;":data["create_time"];
	    			 var str=' <tr>'+
	    				    '<td valign="middle" class="image-title">'+
	    			    '<img src="${ctx}/images/search_product.png" />'+
	    			    '</td>'+
	    			    '<td valign="top" style="border-bottom:1px solid #ccc;height:57px;background-color:#FFF;">'+
	    			    ' <div class="text-title" onclick="productDetail(3,'+data["product_id"]+','+data["company_shop_product_id"]+','+data["company_shop_id"]+','+data["sku"]["companyShopProductSkuId"]+')">'+data["name"]+'</div>'+
	    			    ' <div class="text-time">'+data["create_time"]+'</div>'+
	    			     ' <div class="number-red">'+
	    			      data["browse_count"]+
	    			      '</div>'+
	    			       '<div class="comment">浏览</div>'+
	    				 '</td>'+
	    			    '</tr>';
	    			 array.push(str);
	    		}
	    		for(var i=0; i<shopLg;i++){
	    			 var data = msg.rows["shopList"][i];
	    			 data["createTime"]=data["createTime"]==null?"&nbsp;":data["createTime"];
	    			 mapShop.push(data);
	    			 if(data["name"].length>15){
	    				 data["name"] =data["name"].substr(0,15)+'...';
	    			 }
	    			
	    			 var str=' <tr>'+
	    				    '<td valign="middle" class="image-title">'+
	    			    '<img src="${ctx}/images/search_shop.png" />'+
	    			    '</td>'+
	    			    '<td valign="top" style="border-bottom:1px solid #ccc;height:57px;background-color:#FFF;">'+
	    			    ' <div class="text-title" onclick="gotoDetail('+data["companyShopId"]+')">'+data["name"]+'</div>'+
	    			    ' <div class="text-time">'+data["createTime"]+'</div>'+
	    			     ' <div class="number-red">'+
	    			      data["browseCount"]+
	    			      '</div>'+
	    			       '<div class="comment">浏览</div>'+
	    				 '</td>'+
	    			    '</tr>';
	    			 array.push(str);
	    		}
	    		for(var i=0; i<companyLg;i++){
	    			 var data = msg.rows["companyList"][i];
	    			 mapCompany.push(data);
	    			 if(data["title"].length>15){
	    				 data["title"] =data["title"].substr(0,15)+'...';
	    			 }
	    			 var str=' <tr>'+
	    				    '<td valign="middle" class="image-title">'+
	    			    '<img src="${ctx}/images/search_company.png" />'+
	    			    '</td>'+
	    			    '<td valign="top" style="border-bottom:1px solid #ccc;height:57px;background-color:#FFF;">'+
	    			    ' <div class="text-title"  onclick="window.location.href=\'${ctx}/pages/convenient_brandpinfo.jsp?companyId='+data["companyId"]+'\'" >'+data["title"]+'</div>'+
	    			    ' <div class="text-time">'+data["createTime"]+'</div>'+
	    			     ' <div class="number-red">'+
	    			      data["browseCount"]+
	    			      '</div>'+
	    			       '<div class="comment">浏览</div>'+
	    				 '</td>'+
	    			    '</tr>';
	    			 array.push(str);
	    		}
	    		
	    		$('#div_con').append('<table id="table_convenient" width="100%" cellpadding="0" cellspacing="0" border="0">'+array.join('')+'</table>');
	    		
	    		
	    		array=[];
	    		var serviceLg=msg.rows["serviceList"].length;
	    		for(var i=0; i<serviceLg;i++){
	    			 var data = msg.rows["serviceList"][i];
	    			 if(data["title"].length>15){
	    				 data["title"] =data["title"].substr(0,15)+'...';
	    			 }
	    			
	    			var str='<tr>'+
	    			    '<td valign="middle" class="image-title">'+
	    			    '<img src="${ctx}/images/search_service.png" />'+
	    			    '</td>'+
	    			    '<td valign="top" style="border-bottom:1px solid #ccc;height:57px;background-color:#FFF;">'+
	    			     '<div class="text-title" onclick="service_detail('+data["serviceId"]+','+data["serviceType"]+')">'+data["title"]+'</div>'+
	    			     '<div class="text-time">'+data["createTime"]+'</div>'+
	    			      '<div class="number-blue">'+
	    			      data["browseCount"]+
	    			      '</div>'+
	    			       '<div class="comment">浏览</div>'+
	    				' </td>'+
	    			    '</tr>';
	    			    array.push(str);
	    			    
	    		}
	    		
	    		
	    		$('#table_service').append(array.join(''));
	    		if(mapShow){
	    			 loadMapData();
	    		 }
	    		
	    		if(msg.rows["topicList"].length<pageinfo["size"]&&
	    				msg.rows["circleList"].length<pageinfo["size"]&&
	    				msg.rows["activityList"].length<pageinfo["size"]&&
	    				msg.rows["proList"].length<pageinfo["size"]&&
	    				msg.rows["shopList"].length<pageinfo["size"]&&
	    				msg.rows["companyList"].length<pageinfo["size"]&&
	    				msg.rows["serviceList"].length<pageinfo["size"]){
			    	$('#loadMoreText').html('没有更多!');
			    	pageinfo["more"]=false;
			    }
		    	 else{
		    		 
		    		pageinfo["page"]++;
		    	 }
			    array=[];
		    	array=null;
	    	}
	    	else
	    	  alert(msg.msg);
	     }
	});
}
function gotoDetail(shopId){
	$('#formturn').attr('action',"${ctx}/product!findRestarauntDetail.action");
	$('#companyShopId').val(shopId);
	$('#formturn').submit();
}
function service_detail(id,type){
		window.location.href='${ctx}/pages/share_serviceinfo.jsp?serviceType='+type+'&serviceId=' +id;
	
}
</script>

