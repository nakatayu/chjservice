<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script type="text/javascript"	src="http://webapi.amap.com/maps?v=1.2&key=57a5a7b350ad90c9bf5b9889b360f37e"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />
<style type="text/css">

.conv1{
float:left;margin-left:10px;
}
.conv1 img{
width:110px;height:110px;cursor:pointer;
}

.conv2{
float:left;margin-left:10px;
}
.conv2 img{
width:230px;height:110px;cursor:pointer;
}
.conv3{
float:left;
margin-left:10px;
background-image:url(${ctx}/images/cuxiao_bg.jpg);
 height:250px; 
 width:230px;
}
.conv3 img{
width:230px;height:250px;cursor:pointer;
}
.conv4{
float:left;margin-left:10px;
}
.conv4 img{
width:230px;height:210px;cursor:pointer;
}
.conv5{
width:230px;height:280px;
overflow:hidden;
background:#000000;filter:alpha(opacity=65);-moz-opacity:0.65;opacity:0.65; 
float:left;margin-left:10px;
color:#fff;
font-size:16px;
}

.fun4{
float:left;margin-left:10px;
}
.fun4 img{
width:230px;height:230px;cursor:pointer;
}
.index_Productfont{float:left;padding-left:10px; line-height:50px;width:190px; }

ul.ul-button li{
width:120px;
height:40px;
list-style: none;
color:#fff;
background:#00b38b;
}
ul.ul-button li:hover{
cursor:pointer;
background:#00b36b;
}
ul.ul-button li div{
text-align: center;
padding-top:10px;
}


ul.searchNav{
margin:0;
}
ul.searchNav  li{
	border:0px solid #ccc;
	text-align:center;
	float:left;
	width:127px;
	height:50px;
	list-style:none;
	background:#00aacc;
	color:#fff;
	margin-left:10px;
	font-size:18px;
}

ul.searchNav  li:hover{
	cursor:pointer;
}
ul .search_menuediv{
/***margin:10px 0 0 0px;**/
heihgt:50px;
line-height:50px;
}
ul.searchNav  li ul{
display:none;
position:absolute;
z-index:999999999;
position: absolute;
width:128px;
}
ul.searchNav  li ul li{
border:0px solid #ccc;
background:#5fcacf;
font-size:14px;
padding-top:10px;
height:30px;
}
ul.searchNav  li ul li:hover{
background:#FF8040;
}

ul#search1{
width:700px;
/***margin-top:10px;***/
}
ul#search1 li{
margin-left:0px;
border:0px solid #ccc;
}
#search2{
width:700px;
/***margin-top:10px;***/
}
#search2 li{
margin-left:0px;
border:0px solid #ccc;
}

</style>
</head>

<body onscroll="onscroll_body()">

<jsp:include page="/common/header.jsp" />

<div class="main">
<div id="main_content" class="main_content">



 <div style=" padding:10px 25px 0 25px;">
	<div>
     <ul class="searchNav" >
	  <li style="margin-left:0px;">
	  <div class="search_menuediv">所属分类</div>
	    <ul id="search1">
	    
	    </ul>
	  </li>
	<li>
	  <div class="search_menuediv">所在区域</div>
	    <ul id="search2" style="width:750px;">
	      
	    </ul>
	  </li>
	  <li>
	  <div class="search_menuediv">距离</div>
	    <ul id="search3" style="margin:0px 0 0 -10px;">
	        <li value="0">全部</li>
	        <li value="100">100米内</li>
	        <li value="300">300米内</li>
	        <li value="500">500米内</li>
	        <li value="501">500米以上</li>
	    </ul>
	  </li>
	  <li style="width:538px;">
	  <div class="search_menuediv" id="addressInfo">
	     未获取到当前位置信息
	  </div>
	  </li>
	</ul>
</div>
</div>
	  
	  
<div id="container" style="border:2px solid #00AACC;float:left; margin:10px 25px 0 25px; width:946px; height:467px; " >
</div> 

<div id="div_restaraunt">
 <div style="float:left; margin:10px 25px 0 25px; width:950px; height:580px; " >
</div> 	  

</div>


<div style="float:left; margin:10px 25px 0 25px; width:950px; height:40px; background:#fff;" >
<div id="pager" style="float:right;" ></div>
</div>


  <p> <br/><br/><br/></p>
	  
  <jsp:include page="/common/bottom.jsp" />
  
	
	
</div>
</div>


<br />
<br />
<br />
<span id="latlng"></span>

</body>
</html>
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript">

PageClick = function(pageclickednumber) {
    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
    loadResturauntMap(pageclickednumber);
}
function loadResturauntMap(page){
	pageinfo["page"]=page;
	pageinfo["size"]=8;
	pageinfo["keyword"]=$("#txtKeyWord").val();
	if(pageinfo["distance"]>0 && locationInfo !=null){
		if(pageinfo["distance"]==100){
			pageinfo["latmin"]=locationInfo.lat-0.001;
			pageinfo["latmax"]=locationInfo.lat+0.001;
			pageinfo["lngmin"]=locationInfo.lng-0.001;
			pageinfo["lngmax"]=locationInfo.lng+0.001;
		}
		else if(pageinfo["distance"]==300){
			pageinfo["latmin"]=locationInfo.lat-0.003;
			pageinfo["latmax"]=locationInfo.lat+0.003;
			pageinfo["lngmin"]=locationInfo.lng-0.003;
			pageinfo["lngmax"]=locationInfo.lng+0.003;
		}
		else if(pageinfo["distance"]==500){
			pageinfo["latmin"]=locationInfo.lat-0.005;
			pageinfo["latmax"]=locationInfo.lat+0.005;
			pageinfo["lngmin"]=locationInfo.lng-0.005;
			pageinfo["lngmax"]=locationInfo.lng+0.005;
		}
	}
	else{
		pageinfo["latmin"]=0;
		pageinfo["latmax"]=0;
		pageinfo["lngmin"]=0;
		pageinfo["lngmax"]=0;
	}
	$.ajax({
	     type: "POST",
	     url : context+'/product!loadResturauntMap.action',
	     dataType:'json',
	     data:pageinfo,
	     success: function(msg,status){
	    	if(msg.status == 200){
	    		if(msg.total%pageinfo["size"]==0)
	    	    	pageinfo["tp"]=msg.total/pageinfo["size"];
	    	    else
	    	    	pageinfo["tp"]=Math.ceil(msg.total/pageinfo["size"]);
	    		$("#pager").pager({ pagenumber: pageinfo["page"], pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
	    		
	    		clearMark();
	    	   var array = [];
	    	   for(var i=0; i < msg.rows.length; i++){
	    		   var data = msg.rows[i];
	    		
	    		   addMarker(data);
	    		   
	    		  var tag='';
	    		  if(data["tagList"].length>0)
	    			  tag += data["tagList"][0]["tagName"]+",";
	    		  if(data["tagList"].length>1)
	    			  tag += data["tagList"][1]["tagName"]+",";
	    		  tag = tag.substr(0,tag.length-1);
    		   var str='';
    		   if(i%4==0){
    			   str ='<div style="clear:both;float:left; padding:10px 25px 0 25px;"><div>';
    			   str +='<div id="con'+i+'"  class="conv4" style="margin-left:0px;">';
    		   }
    		   else
    			   str ='<div id="con'+i+'"  class="conv4">';
    		   
    		  str +='<div class="flashNews"><img src="${ctx}'+data["logo"]+'"/>'
		      +'<div class="bg1">&nbsp;'+data["name"]+'</div>'
		  	  +'</div>'
		  +'<div style="background-color:#FFF; height:50px; width:230px;">'
		  +'<div class="index_Productfont" style="color:#FF8040;overflow: hidden;height:50px;width:200px;"><span>标签：</span><span class="lable_title">'+tag+'</span></div>'
		  +'<div style="float:right;"><img src="${ctx}/images/od.png" style="width:20px;height:45px;"/></div>'
		  +' </div></div>';
		  
		   var star="";
 		  for(var h=0;h<data["starScore"];h++){
 			 star +=' <img src="${ctx}/images/brand_xx.png" style="width:12px;height:12px;"/>';
 		  }
 		  var collection="";
 		  if(data["isCollection"] ==0){
 			 collection = '<div style="overflow:hidden;width:220px;height:30px;"><a href="javascript:void(0)" onclick="user_collection('+data["companyShopId"]+')">收藏</a></div>';
 		  }
 		  else if(data["isCollection"]>0){
 			 collection='<div style="overflow:hidden;width:220px;height:30px;">已收藏</div>';
 		  }
 		  var yuding='<span style="color:#FF5809;font-size:16px;">预订</span>';
 		 var gotoResta = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="cursor:pointer;color:#fff;background:#ff6532;padding:6px 10px 6px 10px;" onclick="gotoDetail('+data["companyShopId"]+')">进入餐厅</span>';
		   if(data["yuding"]=="F"){
 			 yuding='<span style="color:#FF5809;font-size:16px;">不在服务时间内!</span>';
 		 	gotoResta='';
	    }
    		 if(i%4==0){
   			   str +='<div id="con'+i+'-con'+i+'"  class="conv5" style="display:none;margin-left:0px;">';
   		   }
   		   else
   			   str +='<div id="con'+i+'-con'+i+'"    class="conv5" style="display:none;">';
   		   
   		      str +='<div style="maring-top:10px;margin-left:10px;"><br/>'
   		      +'<div style="overflow:hidden;width:210px;height:30px;color:#FF5809;font-size:20px;font-weight:bold;">'+data["name"]+'</div>'
   			 + '<div style="overflow:hidden;width:220px;height:30px;">'+star+'</div>'
   			 +'<div style="overflow:hidden;width:220px;height:30px;font-size:14px;">人均:&nbsp;<span style="color:#FF5809;">'+data["consumptionPer"]+'</span></div>'
   			+ '<div style="overflow:hidden;width:220px;height:58px;font-size:14px;">简介:&nbsp;'+data["content"]+'</div>'
   			 +  '<div style="overflow:hidden;width:220px;height:30px;font-size:14px;">月销量:&nbsp;<span style="color:#FF5809;">'+data["sellCount"]+'</span></div>'
   			+collection
   			+  '<div style="overflow:hidden;width:220px;height:30px;color:#FFF;font-size:14px;">'+yuding
   			+ gotoResta+'</div>'
   			  +'</div></div>';
		  
		   
	    		  if(i%4==3 || i==msg.rows.length-1){
	    			  str +='</div></div>';
	    		   }
	    		  array.push(str);
	    	   }
	    	  // mapObj.setFitView(marklist);
	    	   mapObj.setZoom(13);
	    	   
	    	   $('#div_restaraunt').html(array.join(''));
	    		$("#div_restaraunt .conv4").click(function() {
	    			var obj = $(this);
	    			obj.hide();
	    			$('#'+obj.attr('id')+'-'+obj.attr('id')).show();
	    		
	    	  }, function() {
	    		
	    	 });
	    		$("#div_restaraunt .conv5").hover(function() {
	    			
	    		
	    	  }, function() {
	    		  var obj = $(this);
		    		
  				obj.hide();
  				
  				 $('#'+obj.attr('id').split('-')[0]).show();
	    	 });
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
	    		
		 } 
	});
}
var marklist=[];
//实例化点标记   
function addMarker(data){   
    var marker=new AMap.Marker({                     
    icon:"${ctx}/images/pop.png",   
    position:new AMap.LngLat(data.lng,data.lat),
    offset: new AMap.Pixel(-30,-54)                
    });   
    marker.setMap(mapObj);  //在地图上添加点   
    marklist.push(marker);
    
    var info = [];                   
    info.push("<b>&nbsp;&nbsp;<a style=\"TEXT-DECORATION: underline;color:#000;cursor;pointer;\" href=\"javascript:void(0)\" onclick=\"gotoDetail("+data["companyShopId"]+")\">"+data["name"]+"</a></b>");                   
    info.push("&nbsp;&nbsp;电话 :  "+data["linkman"]);   
    info.push("&nbsp;&nbsp;联系人 : "+data["linkmanTel"]);  
    info.push("&nbsp;&nbsp;地址 : "+data["address"]);                   
                   
    var inforWindow = new AMap.InfoWindow({                   
      offset:new AMap.Pixel(-5,-54),                   
      content:info.join("<br/>")                   
    });                   
    AMap.event.addListener(marker,"mouseover",function(e){                   
      inforWindow.open(mapObj,marker.getPosition());                   
    });                  

}   
function clearMark(){
	for(var i=0; i < marklist.length;i++){
		marklist[i].setMap(null);
	}
	marklist=[];
	mapObj.clearInfoWindow();
}
 function search_keyword(){
	 loadResturauntMap(1);
 }

function gotoDetail(shopId){
			$('#formturn').attr('action',"${ctx}/product!findRestarauntDetail.action");
			$('#companyShopId').val(shopId);
			$('#formturn').submit();
		
 }
function findAreaAndCategoryList(){
	$.ajax({
	     type: "POST",
	     url : context+'/product!findAreaAndCategoryList.action',
	     dataType:'json',
	     data:pageinfo,
	     success: function(msg,status){
	    	if(msg.status == 200){	
	    		
	    		var array=[];
	    		array.push('<li style="width:140px;" value="0">全部</li>');
	    		var total=0;
	    		if((msg.rows.area.length+1)%5==0)
	    			total = msg.rows.area.length+1;
	    		else
	    			total = Math.ceil((msg.rows.area.length+1)/5)*5;
	    		for(var i=0; i<total-1;i++){
	    			if(i < msg.rows.area.length)
	    				array.push('<li style="width:140px;" value="'+msg.rows.area[i]["areaId"]+'">'+msg.rows.area[i]["areaName"]+'</li>');
	    			else
	    				array.push('<li  style="width:140px;" value="-1"></li>');
	    		}
	    		$('#search2').html(array.join(''));
	    		array=[];
	    		array.push('<li value="0">全部</li>');
	    		if((msg.rows.category.length+1)%5==0)
	    			total = msg.rows.category.length+1;
	    		else
	    			total = Math.ceil((msg.rows.category.length+1)/5)*5;
	    		for(var i=0; i<total-1;i++){
	    			if(i<msg.rows.category.length)
	    				array.push(' <li style="width:140x;" value="'+msg.rows.category[i]["categoryId"]+'">'+msg.rows.category[i]["name"]+'</li>');
	    			else
	    				array.push('<li style="width:140x;" value="-1"></li>');
	    		}
	    		$('#search1').html(array.join(''));
	    		initSearchMenue();
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
	     }
	});
}
function initSearchMenue(){

	$(".searchNav li").hover(function() {
		$(this).find("ul").show();
  }, function() {
		$(this).find("ul").hide();
 });
	
$(".searchNav li ul li").click(function(index) {
	var selVal = this.getAttribute("value");
	var title = $(this).parent().parent().find('div');
	if($(this).parent().attr("id")=="search1"){
		if(selVal==0){
			title.html('所属分类');
			pageinfo["categoryId"]="";
		}
		else{
			if(selVal==-1){
				
			}
			else{
				title.html($(this).text().length>5?$(this).text().substr(0,5)+'...':$(this).text());
				pageinfo["categoryId"]=selVal;
			}
			
		}	
	}
	else if($(this).parent().attr("id")=="search2"){
		if(selVal==0){
			title.html('所在区域');
			pageinfo["areaThirdId"]="";
		}
		else{
			if(selVal==-1){
				
			}
			else{
				title.html($(this).text().length>5?$(this).text().substr(0,5)+'...':$(this).text());
				pageinfo["areaThirdId"]=selVal;
			}
			
		}
			
	}
	else if($(this).parent().attr("id")=="search3"){
		if(selVal==0){
			title.html('距离');
			pageinfo["distance"]=0;
		}
		else{
			title.html($(this).text());
			pageinfo["distance"]=selVal;
		}
			
	}

  });
	
}

</script>
<script type="text/javascript">
		var mapObj,toolBar,locationInfo=null;
		mapObj = new AMap.Map("container"); // 创建地图实例
		var point = new AMap.LngLat(121.372344, 31.16853430); // 创建点坐标
		mapObj.setCenter(point); // 设置地图中心点坐标
		mapObj.setZoom(13);
		mapObj.plugin(["AMap.ToolBar","AMap.OverView,AMap.Scale"], function() {
		      // 加载工具条
		    toolBar = new AMap.ToolBar({ direction: false, // 隐藏方向导航
		        ruler: true, // 隐藏视野级别控制尺
		        autoPosition: false // 禁止自动定位
		    });
		    mapObj.addControl(toolBar);
		    
		    AMap.event.addListener(toolBar,'location',function callback(e){    
	            locationInfo = e.lnglat;
	           $('#addressInfo').html("("+locationInfo.lat+","+locationInfo.lng+")");
	           geocoder(new AMap.LngLat(locationInfo.lng, locationInfo.lat));
	         });   
		    toolBar.doLocation();
		    
		// 加载鹰眼
		    view = new AMap.OverView();
		    mapObj.addControl(view);
		    
		// 加载比例尺
		    scale = new AMap.Scale();
		    mapObj.addControl(scale);
		});
		
		$('#txtKeyWord').val("${keyword}");
		loadResturauntMap(1);
		findAreaAndCategoryList();
		initSearchMenue();
		
	
		function geocoder(lnglatXY) {   
		    var MGeocoder;   
		    //加载地理编码插件   
		    mapObj.plugin(["AMap.Geocoder"], function() {           
		        MGeocoder = new AMap.Geocoder({    
		            radius: 1000,   
		            extensions: "all"  
		        });   
		        //返回地理编码结果    
		        AMap.event.addListener(MGeocoder, "complete", geocoder_CallBack);    
		        //逆地理编码   
		        MGeocoder.getAddress(lnglatXY);    
		 });  
		}
		//回调函数   
		function geocoder_CallBack(data) {   
		   
		    //返回地址描述   
		    $('#addressInfo').html(data.regeocode.formattedAddress);   
		     
		}   

</script>
