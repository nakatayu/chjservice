<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script type="text/javascript"	src="http://webapi.amap.com/maps?v=1.2&key=57a5a7b350ad90c9bf5b9889b360f37e"></script>
<style type="text/css">
 .divImg{
width:368px;height:300px;padding: 230px 0 0 150px;
background: url('${ctx}/images/sbxu1.png') no-repeat;
 }
 .addMapop{
 width:30px;height:30px;
 background: url('${ctx}/images/sbxu3.png') no-repeat; 
 }
</style>
</head>
<body>
<c:if test="${param.type==1}">
<div class="divImg"><img src="${ctx}/images/sbxu2.png" style="cursor: pointer;" width="100px" height="35px" onclick="window.top.hidePopWin(true,null);"/></div>
</c:if>
<c:if test="${param.type==2}">
<div style="width: 890px;height: 550px;background-color: #FFF;">
<div style="width: 890px;height: 20px;float: left;">
<img src="${ctx}/images/lable_del.png" style="height: 20px;width: 25px;margin:5px 0 5px 855px;" onclick="window.top.hidePopWin(false,null);"/>
</div>
<div style="width: 890px;padding: 5px 30px 0 40px;height: auto;float: left;">

<div style="width: 100%;height: auto;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="65%" height="70px" valign="top">
    <span style="font-size:24px; font-family:'微软雅黑';">园区内星巴克门店</span><br />
    <span style="font-size:12px;font-family:Arial;color: #c7c7c7;">STARBUCKS IN CAMPUS</span>
    </td>
    <td width="35%" align="center" valign="bottom">
    <img src="${ctx}/images/starbuck_07.png" width="90px" height="70px" /></td>  
  </tr>
  </table>
</div>
<div style="width: 100%;padding: 0px 20px 0 10px;float:left;">
<div id="shopInfo">
<div style="border-bottom:1px solid #CCCCCC;padding-top: 5px;width: 800px;height: 70px;float: left;">
<table border="0" cellspacing="0" cellpadding="0" style="float: left;">
<tr><td style="width: 20px;background: url(\'${ctx}/images/sbxu3.png\') no-repeat;" valign="top" align="center"></td>
<td colspan="4"><span style="font-size:16px; color:#0e8a02; font-weight:bold;cursor: pointer;">
</span><br /><span style="color:#adadad; font-size:12px;"></span>
</td></tr><tr><td height="33">&nbsp;</td>
<td ><img src="${ctx}/images/selectstores_map.png" width="16" height="19" style="cursor: pointer;margin:0 10px 0 0;"/></td>
<td style="color:#a19f76">
<span style="cursor: pointer;font-size:12px;"> </span><br /></td>
<td><img src="${ctx}/images/selectstores_phoe.png" width="19" height="20" style="margin: 0 10px 0 15px;"/></td>
<td style="color:#a19f76"><span style="cursor: pointer;font-size:12px;"></span><br /></td></tr></table>

 <table border="0" cellspacing="0" cellpadding="0" style="float: left;margin: 5px;">
 <tr><td width="1" style="background-color: #CCCCCC;" height="50px"></td></tr></table>
</div>
</div>
</div>
<div style="width: 890px;float: left;padding:5px 10px 5px 10px;">
<div style="clear: both;">
<div id="container" style="width: 865px;border:2px solid #00aacc;height: 355px;">
</div>
</div>
</div>
 </div>
</c:if>

</body>
</html>
<script type="text/javascript" src="${ctx}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">

var num=['A','B','C','D','E','F','G','H'];
var mapObj,toolBar,locationInfo=null,trafficLayer=null;
var marklist=[],inforWindowArray=[];
var shopId="${param.compayshopId}";

mapObj = new AMap.Map("container"); // 创建地图实例
var point = new AMap.LngLat(121.372344, 31.16853430); // 创建点坐标
mapObj.setCenter(point); // 设置地图中心点坐标
mapObj.setZoom(16);
//在地图中添加ToolBar插件  
mapObj.plugin(["AMap.ToolBar"],function(){        
    toolBar = new AMap.ToolBar();  
    mapObj.addControl(toolBar);    
});

loadShop();
 
function loadShop(){
	
	$.ajax({
	     type: "POST",
	     url : '${ctx}/product!findnearbyShop.action',
	     dataType:'json',
	     data:{companyId:254,size:10,page:1},
	     success: function(msg,status){
	    	if(msg.status == 200){	
	    		var shopStr='';	    		 
	    		for(var i=0;i<msg.rows.length;i++){
	    			var data=msg.rows[i];
	    			if(i%2==0){
	    				shopStr+='<div style="border-bottom:1px solid #CCCCCC;padding-top: 5px;width: 800px;height: 70px;float: left;">';
	    			}else{
	    				shopStr+='<table onmouseover="initMapDataHover()" class="tr-map" id="shoptab'+i+'" border="0" cellspacing="0" cellpadding="0" style="float: left;margin: 5px;">';
	    				shopStr+='<tr><td width="1" style="background-color: #CCCCCC;" height="50px"></td></tr></table>';
	    			}
	    			shopStr+='<table border="0" cellspacing="0" cellpadding="0" style="float: left;">';
	    			shopStr+='<tr><td style="width: 20px;background: url(\'${ctx}/images/sbxu3.png\') no-repeat;" valign="top" align="center">'+(i+1)+'</td>';
	    			shopStr+='<td colspan="4"><span style="font-size:16px; color:#0e8a02; font-weight:bold;cursor: pointer;"  onclick="returNewShop('+data["company_shop_id"]+')">';
	    			shopStr+=''+data["name"]+'</span><br /><span style="color:#adadad; font-size:12px;">'+data["name"]+'</span>';
	    			shopStr+='</td></tr><tr><td height="33">&nbsp;</td>';
	    			shopStr+='<td ><img src="${ctx}/images/selectstores_map.png" width="16" height="19" style="cursor: pointer;margin:0 10px 0 0;"/></td>';
	    			shopStr+='<td style="color:#a19f76">';
	    			shopStr+='<span style="cursor: pointer;font-size:12px;">'+data["address"]+'</span><br /></td>';
	    			shopStr+='<td><img src="${ctx}/images/selectstores_phoe.png" width="19" height="20" style="margin: 0 10px 0 15px;"/></td>';
	    			shopStr+='<td style="color:#a19f76"><span style="cursor: pointer;font-size:12px;">'+data["linkman_tel"]+'</span><br /></td></tr></table>';
	    			if(i%2==1){
	    				shopStr+='</div>';
	    			} 
    				if(i%2==0&&i==msg.rows.length-1){
    					shopStr+='</div>';
    				}    				
    				addMyMarker('shop',data,i);
	    		}
	    		$('#shopInfo').html(shopStr);
	    		 mapObj.setFitView();
	    		
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
	     }
	});
}

function initMapDataHover(){
	 $('.tr-map').hover(function(){
  	 $(this).css("background","#F0F0F0");  				 
  	  },function(){
  		$(this).css("background","");  	  
  });    
}

//实例化点标记   
function addMyMarker(type,data,index){ 
	 
 var lngX = data["lng"];
 var latY = data["lat"];  
	 
  var marker=new AMap.Marker({ 
  //icon:"${ctx}/images/map_pop.png", 
  content:createMyIcon(index),
  position:new AMap.LngLat(lngX,latY)
  });   
  marker.setMap(mapObj);  //在地图上添加点   
  marklist.push(marker);
  
  var info = [];  
 info.push("<b><a style=\"font-size:14px;TEXT-DECORATION: underline;color:#00a6ac;cursor;pointer;\" href=\"javascript:void(0)\" onclick=\"gotoDetail("+data["companyShopId"]+")\">"+data["name"]+"</a></b>");                   
 info.push("<span style='font-size:12px;color:#9a9a9c;'><br/>地址 : "+data["address"]+'</span>');
                
  var inforWindow = new AMap.InfoWindow({ 
  	content:info.join(""),
  	size:new AMap.Size(300,0),  
	    autoMove:true ,  
	    offset:new AMap.Pixel(0,-30)          
                     
  });   
  inforWindowArray.push(inforWindow);
  
  AMap.event.addListener(marker,"mouseover",function(e){                   
    inforWindow.open(mapObj,marker.getPosition());    
    $('.tr-map').each(function(){
				var sel1 = this.getAttribute('value');;
				if(index == sel1){
					$(this).css("background","#F0F0F0");
				}
				else{
					$(this).css("background","");
				}
	  });
  });                  

}   

function createMyIcon(index){
	return '<div><img style="width:30px;height:35px;" src="${ctx}/images/map/'+(index+1)+'.png"/></div>';
}

</script>

