<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script type="text/javascript"	src="http://webapi.amap.com/maps?v=1.2&key=57a5a7b350ad90c9bf5b9889b360f37e"></script>
<script language="javascript">
var mapObj;
function mapInit() {
    var opt = {
        level: 18, //设置地图缩放级别  
        center: new AMap.LngLat(121.409225, 31.166691) //设置地图中心点 
    }
    mapObj = new AMap.Map("iCenter", opt);
    mapObj.plugin(["AMap.ToolBar"],function(){        
        toolBar = new AMap.ToolBar();  
        mapObj.addControl(toolBar);       
    });  
    geocoder();
	
	/**var marker = new AMap.Marker({
        map:mapObj,
		draggable :true,
        icon: new AMap.Icon({
            image: "http://www.amap.com/images/mark.png",
            size:new AMap.Size(58,30),
            imageOffset: new AMap.Pixel(-32, -0)
        }),
        position: new AMap.LngLat(121.409225, 31.166691),
        offset: new AMap.Pixel(-5,-30)
    });
	 
    mapObj.setFitView();
	 AMap.event.addListener(marker,"dragend",function(e){      
		 var bname = navigator.appName;   
		 if (bname.search(/netscape/i) == 0)   
		 {   
		  window.opener.document.getElementById("spanLatLng").innerHTML=marker.getPosition();
		  window.opener.document.getElementById("hiddenAddressLat").value=marker.getPosition().getLat();
		  window.opener.document.getElementById("hiddenAddressLng").value=marker.getPosition().getLng();
		 }   
		 else if (bname.search(/microsoft/i) == 0)   
		 {   
		 window.opener.document.all.spanLatLng.innerHTML=marker.getPosition();
		 window.opener.document.all.hiddenAddressLat.innerHTML=marker.getPosition().getLat();
		 window.opener.document.all.hiddenAddressLng.innerHTML=marker.getPosition().getLng();
		 }   
         // document.getElementById("result").value=marker.getPosition();
    });*/
}
function geocoder() {  
	var address='';
	 var bname = navigator.appName;   
	 if (bname.search(/netscape/i) == 0)   
	 {   
		 address=window.opener.document.getElementById("txtAddress").value;
	 }  
	 else if (bname.search(/microsoft/i) == 0)   
	 {   
		 address=window.opener.document.all.txtAddress.value;
	 }
	
	mapObj.clearMap();
    var MGeocoder;  
    //加载地理编码插件  
    mapObj.plugin(["AMap.Geocoder"], function() {          
        MGeocoder = new AMap.Geocoder({   
            city:"上海", //城市，默认：“全国”  
            radius:1000 //范围，默认：500  
        });  
        //返回地理编码结果   
        AMap.event.addListener(MGeocoder, "complete", geocoder_CallBack);   
        //地理编码  
        MGeocoder.getLocation(address);   
    });  
}    
//地理编码返回结果展示     
function geocoder_CallBack(data){ 
 var resultStr="";  
    //地理编码结果数组  
    var geocode = new Array();  
    geocode = data.geocodes;    
    for (var i = 0; i < geocode.length; i++) {  
        var windowsArr = new Array();    
        var markerOption = {  
            map:mapObj,  
			draggable :true,
			icon:"${ctx}/images/map/"+(1)+".png",  
            position:new AMap.LngLat(geocode[i].location.getLng(),geocode[i].location.getLat())  
        };    
        
         
        if(i==0){
        	 mapObj.setCenter(geocode[i].location);
        	 generateLatLng(geocode[i].location.getLng(),geocode[i].location.getLat());
        }
       
        var mar = new AMap.Marker(markerOption);    
          
       
		
		 AMap.event.addListener(mar,"dragend",function(e){     
			 generateLatLng(e.lnglat.lng,e.lnglat.lat);
		});
		
    }    
      
    
}   
function generateLatLng(lng,lat){
	 var bname = navigator.appName;   
	 if (bname.search(/netscape/i) == 0)   
	 {   
	  window.opener.document.getElementById("spanLatLng").innerHTML=lng+","+lat;
	  window.opener.document.getElementById("hiddenAddressLat").value=lat;
	  window.opener.document.getElementById("hiddenAddressLng").value=lng;
	 }   
	 else if (bname.search(/microsoft/i) == 0)   
	 {   
	 window.opener.document.all.spanLatLng.innerHTML=lng+","+lat;
	 window.opener.document.all.hiddenAddressLat.value=lat;
	 window.opener.document.all.hiddenAddressLng.value=lng;
	 }   
}

function createMyIcon(index){
	return '<div><img style="width:40px;height:45px;" src="${ctx}/images/map/'+(index+1)+'.png"/></div>';
}

</script>
</head>
<body onload="mapInit();">
<table align="center">
<tr><td>
    <div id="iCenter" style="width:800px;height:600px;" ></div>
	</td>
	<td>
   <!-- <input id="result"  width="200"/>  --> 
       
	<td>
	</tr></table>
</body>
</html>