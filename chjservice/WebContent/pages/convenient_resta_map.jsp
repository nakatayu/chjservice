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

<body onscroll="onscroll_body()">

<jsp:include page="/common/header.jsp" />

<div class="main">
<div id="main_content" class="main_content">

<div style="position:relative;height:680px;margin-top:10px; padding:0px 25px 0 25px;">
   <div>
    
<div id="container" style="margin-top:10px;border:2px solid #00aacc;float:left; width:946px; height:580px; " >
</div> 
 
 
  
	</div>
 </div>
 
 
  
  <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>


 
 
 

</body>
</html>
<script type="text/javascript">

var mapObj,toolBar,locationInfo=null,mapShow=false;
var marklist=[];
var markerNear = new Array();//附近
var windowsArrNear = new Array();//附近

	mapObj = new AMap.Map("container"); // 创建地图实例
	var point = new AMap.LngLat(121.372344, 31.16853430); // 创建点坐标
	mapObj.setCenter(point); // 设置地图中心点坐标
	mapObj.setZoom(16);
	mapObj.plugin(["AMap.ToolBar","AMap.OverView,AMap.Scale"], function() {
	      // 加载工具条
	    toolBar = new AMap.ToolBar({ direction: true, //方向导航
	        ruler: true, // 视野级别控制尺
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
	
	var data={lng:"${param.lng}",
			lat:"<%=request.getParameter("lat")%>",
			name:"<%=request.getParameter("name")%>",
			address:"<%=request.getParameter("address")%>",
			companyShopId:"<%=request.getParameter("companyShopId")%>"};
	myAddMarker('shop',data);




//实例化点标记   
function myAddMarker(type,data){   
	if(data["lng"]>0 && data["lat"]>0){} else return;
	
  //var marker=new AMap.Marker({                     
 // content:createMyIcon(0),   
 // position:new AMap.LngLat(data.lng,data.lat),
 // offset: new AMap.Pixel(-50,-70)             
//  });   
 // marker.setMap(mapObj);  //在地图上添加点   
 var markerOption = {  
        map:mapObj,  
        icon:"${ctx}/images/map/"+(1)+".png",  
        position:new AMap.LngLat(data.lng,data.lat)  
    };  
   var marker = new AMap.Marker(markerOption); 
    
  mapObj.setCenter(new AMap.LngLat(data.lng,data.lat));
  
  var info=[];
  if(type=='shop'){
	  info.push("&nbsp;&nbsp;<a style=\"color:#00a6ac;cursor;pointer;\" href=\"javascript:void(0)\" onclick='gotoDetail("+data["companyShopId"]+")'>"+data["name"]+"</a>");                   
	  info.push("&nbsp;&nbsp;<span style='color:#9a9a9c;font-size:12px;'>地址:"+data["address"]+"</span>"); 
  }
  //info.push("&nbsp;&nbsp;<a style='cursor:pointer;TEXT-DECORATION: none;font-size:12px;'>周边</a>"); 
  //info.push('&nbsp;&nbsp;<input id="txtMapKeyWord"/><a onclick="placeSearch('+data.lng+','+data.lat+')" style="cursor:pointer;TEXT-DECORATION: none;font-size:12px;">搜索</a>'); 
                 
  var inforWindow = new AMap.InfoWindow({ 
	  content:info.join("<br/>"),
		size:new AMap.Size(300,0),  
	    autoMove:true ,  
	    offset:{x:0, y:-30}
	    //offset:new AMap.Pixel(-38,-70)               
   		                  
  });                   
  AMap.event.addListener(marker,"mouseover",function(e){                   
    inforWindow.open(mapObj,marker.getPosition());                   
  });                  

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
        content:createMyIcon(i),
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


function gotoDetail(shopId){
	history.go(-1);
}
function createMyIcon(index){
	return '<div><img style="width:40px;height:45px;" src="${ctx}/images/map/'+(index+1)+'.png"/></div>';
}
</script>

