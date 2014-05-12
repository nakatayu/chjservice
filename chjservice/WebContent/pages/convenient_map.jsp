<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script type="text/javascript"	src="http://webapi.amap.com/maps?v=1.2&key=57a5a7b350ad90c9bf5b9889b360f37e"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/js/dialog/dialog_subModal.css" />
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

.ul-map-search{margin-top:10px;}
.ul-map-search li{
float:left;
list-style: none;
margin-left:14px;
margin-top:10px;
font-size:14px;
color:#444;
cursor:pointer;
}
.ul-map-search li:hover{text-decoration: underline;color:#2472df;}

ul.ul-shop-category li{
margin-left:10px;
color:#2472df;
cursor:pointer;
padding-left:4px;
padding-right:4px;
float:left;
font-size:14px;
margin-left:4px;
margin-top:2px;
text-align:center;
list-style: none;
max-width: 200px;/*具体数值自行修改，下一行相同*/
word-break:keep-all;
}
ul.ul-shop-category li:hover{text-decoration: underline;}
ul.ul_transfer_search{background: url(${ctx}/images/map_li.jpg) repeat-x;}
ul.ul_transfer_search li{
color:#444;
cursor:pointer;
float:left;
font-size:12px;
margin-left:0px;
border-top:1px solid #ccc;
border-bottom:1px solid #ccc;
border-left:1px solid #ccc;
text-align:center;
list-style: none;
width:60px;
height:26px;
line-height:26px;
background: url(${ctx}/images/map_li.jpg) repeat-x;
}
ul.ul_transfer_search li:hover{background: url(${ctx}/images/map_li_hover.jpg) repeat-x;}


</style>
</head>

<body onscroll="onscroll_body()">

<jsp:include page="/common/header.jsp" />

<div class="main">
<div id="main_content" class="main_content">
  
<div style="margin:10px 25px 0 25px;">
	<div>
	
<div id="container" style="border:2px solid #00AACC;float:left;  width:712px; height:717px; " >

</div> 

<div id="map_search" style="border:0px solid #00AACC;float:right; width:234px; height:720px; background:#fff;" >
<c:if test="${user!=null}">
<ul class="ul_transfer_search">
<li style="width:234px;" onclick="findLocation()">我的位置</li>
</ul>
</c:if>
<img src="${ctx}/images/map_top.png" style="margin-top:10px;margin-left:20px;" height="40"/>
<ul class="ul-map-search" style="margin-top:10px;">
<li onclick="search_resta()"><img src="${ctx}/images/map_dianpu.png"/><br/>店铺</li>
<li onclick="search_activity()"> <img src="${ctx}/images/map_huodong.png"/><br/>活动</li>
<li onclick="addTraffic()"><img src="${ctx}/images/map_lukuang.png"/><br/>路况</li>
<li onclick="search_bus_station_info()"><img src="${ctx}/images/map_jiaotong.png"/><br/>交通</li>
<li onclick="search_bus()"><img src="${ctx}/images/map_chuxing.png"/><br/>出行</li>
</ul>
</div> 

<div id="result_info" style="display:none;border:0px solid #00AACC;float:right; width:234px; height:720px; background:#fff;" >

<div style="border-bottom:1px solid #eee;width:234px;padding-top:10px;padding-bottom:10px;font-size:14px;">
<a style="margin-left:20px;color:#2472df;" href="javascript:void(0)" onclick="$('#result_info').hide();$('#search_bus_condition_div').hide();$('#map_search').show();clearMark(true);$('#result').html('');$('#category_div').html('');">返回</a>
</div>
<div class="scroll_div" style="scrollbar-arrow-color: #f4ae21;margin-left:5px;margin-top:10px; height:655px;width:230px;overflow-y: auto;overflow-x: hidden;">

<div id="search_bus_condition_div" style="display:none;">
<table width="100%" cellpadding="4" cellspacing="0">
<tr><td valign="top" width="50" align="right"><img  src="${ctx}/images/map_start.jpg"/></td>
<td>
<input id="txtStart" onfocus="focus_fun('txtStart')" style="height:24px;border:1px solid #ccc;"/> 
<div id="result_txtStart"  style="overflow: auto; width: 130px; border: 1px solid gray;display: none;"></div> 
</td>
<td  rowspan="2" style="width:50px;">
<ul class="ul_transfer_search" style="margin-left:10px;">
<li onclick="search_text_change()" style="width:20px;border-right:1px solid #ccc;">
<img  src="${ctx}/images/map_change.png"/>
</li>
</ul>
</td>
</tr>
<tr>
<td valign="top" width="50" align="right">
<img  src="${ctx}/images/map_end.jpg"/></td>
<td style="padding-top:4px;">
<input id="txtEnd" onfocus="focus_fun('txtEnd')" style="height:24px;border:1px solid #ccc;"/>
<div id="result_txtEnd"  style="overflow: auto; width: 130px; border: 1px solid gray;display: none;"></div>  
</td></tr>
<tr><td colspan="3" style="padding-left:20px;padding-top:10px;text-align: center;">
<ul class="ul_transfer_search">
<li id="li_bus_type0" onclick="search_transfer(0)">公交</li>
<li id="li_bus_type1" onclick="search_transfer(1)">驾车</li>
<li id="li_bus_type2" onclick="search_transfer(2)" style="border-right:1px solid #ccc;">步行</li>
</ul>
</td>
</tr>
<tr><td colspan="2" height="10">&nbsp;</td></tr>
</table>

</div>

<div id="category_div" style="z-index:995">

</div>

<div id="result" style="clear:both;">
</div>

</div>
</div> 


</div>
</div>




  <p> <br/></p>
  

	  
  <jsp:include page="/common/bottom.jsp" />
  
	
	
</div>
</div>


<br />


</body>
</html>
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/js/dialog/dialog_common.js"></script>
<script type="text/javascript" src="${ctx}/js/dialog/dialog_subModal.js"></script>
<script type="text/javascript">
function search_activity(){
	$('#result_info').show();
	$('#map_search').hide();
	pageActivity={page:1,size:10,tp:0};
	
	findActivityMapList(1);
	
}
function search_resta(){
	$('#result_info').show();
	$('#map_search').hide();
	pageinfo={page:1,size:10,tp:0};
	
	categoryIdSelected=null;
	if(category.length==0){
		findSendAreaList();
	}
	else{
		initCategroyClick();
	}
	
}
var loadding_dialog=null;
function show_loading(){
	
	loadding_dialog = new Dialog();
	loadding_dialog.Width = 300;
	loadding_dialog.Height = 100;
	loadding_dialog.Title = "";
	loadding_dialog.InnerHtml='<div style="text-align:center;font-size:14px;padding-top:20px;">loading......</div>';
	loadding_dialog.show();
}

var diag =null;
function search_bus(){
	
 
	
	marklist=[],inforWindowArray=[];
	clearMark(true);
	$('#search_bus_condition_div').show();
	$('#category_div').html('');
	$('#result').html('');
	$('#result_info').show();$('#map_search').hide();
	
	/**if(diag==null)
		diag = new Dialog();
	diag.Width = 300;
	diag.Height = 100;
	diag.Title = "公交/地铁";
	diag.InnerHtml='<div style="text-align:center;color:red;font-size:14px;padding-top:20px;">起点：<input id="txtBusStart" width="140"/><br/>终点：<input id="txtBusEnd" width="140"/></div>';
	diag.OKEvent = search_bus_result;
	diag.show();*/
	
}
var search_bus_type=0;
function search_transfer(type){
	
	search_bus_type = type;
	search_bus_result(type);
	
}
var busStartEndPoint={startP:null,endP:null};
function search_bus_result(type){
	busStartEndPoint["startP"]=null;
	busStartEndPoint["endP"]=null;
	transLineAll["lineAllInfo"]=[];
	 transLineAll["pathArray"]=[];
	transLineAll["btOrigin"]=null;
    transLineAll["btDestination"]=null;
    
	busStartEndPoint["startName"]=$("#txtStart").val();
	busStartEndPoint["endName"]=$("#txtEnd").val();
	if($.trim(busStartEndPoint["startName"]).length==0 || $.trim(busStartEndPoint["endName"]).length==0){
		return;
	}
	for(var i=0;i<3;i++){
		if(i==type){
			$('#li_bus_type'+i).css("background","url(${ctx}/images/map_li_hover.jpg) repeat-x");
		}
		else{
			$('#li_bus_type'+i).css("background","url(${ctx}/images/map_li.jpg) repeat-x");
		}
	}

	marklist=[],inforWindowArray=[];
	clearMark(true);
	$('#result').html('');
	preIndex=null;
	geocoder(busStartEndPoint["startName"]);
}
function search_text_change(){
	busStartEndPoint["startName"]=$("#txtStart").val();
	$("#txtStart").val($("#txtEnd").val());
	$("#txtEnd").val(busStartEndPoint["startName"]);
	
	document.getElementsByTagName('body')[0].style.fontSize="30pt";

}
function search_bus_station_info(){
	marklist=[],inforWindowArray=[];
	clearMark(true);
	pageinfo={page:1,size:10,tp:0};
	placeSearch(0);
	
	/**if(diag==null)
		diag = new Dialog();
	diag.Width = 300;
	diag.Height = 100;
	diag.Title = "公交信息";
	diag.InnerHtml='<div style="text-align:center;color:red;font-size:14px;padding-top:20px;">公交站点：<input id="txtBusStation" width="140"/></div>';
	diag.OKEvent = search_bus_station_info_result;
	diag.show();*/
}
function search_bus_station_info_result(){
	var value = $id("txtBusStation").value;
	if($.trim(value).length==0){
		return;
	}
	diag.close();
	lineSearch(value);
	show_loading();
	
}

var categoryIdSelected=null;
var shopArray=[];
function initCategroyClick(){
	$('#category_div').html('<ul class="ul-shop-category" id="ul-shop-category">'+category.join('')+'</ul><div style="clear:both;margin-top:10px;">&nbsp;</div>');
	$('.ul-shop-category li').click(function(){
		var sel = this.getAttribute('value');
		categoryIdSelected=sel;
		$('.ul-shop-category li').each(function(){
			var sel1 = this.getAttribute('value');;
			if(sel == sel1){
				$(this).css({background:"#3585dc",color:"#fff"});
			}
			else{
				$(this).css({background:"#fff",color:"#2472df"});
			}
		});
		loadResturauntMap(1);
	});
	loadResturauntMap(1);
}
var category=[];
function findSendAreaList(){
	$.ajax({
	     type: "POST",
	     url : context+'/product!findSendAreaList.action',
	     dataType:'json',
	     data:pageinfo,
	     success: function(msg,status){
	    	if(msg.status == 200){	
	    		category.push(' <li value="" style="color:#fff;background:#3585dc;">全部</li>');
	    		
	    		for(var i=0; i<msg.rows.category.length;i++){
	    			category.push(' <li  value="'+msg.rows.category[i]["categoryId"]+'">'+msg.rows.category[i]["name"]+'</li>');
	    		}
	    		initCategroyClick();
	    	}
	    	else{
	    		//alert(msg.msg);
	    	}
	     }
	});
}
var pageActivity={page:1,size:20,tp:0};
function findActivityMapList(page){
	marklist=[],inforWindowArray=[];
	clearMark(true);
	
		pageActivity["page"]=page;
		pageActivity["size"]=10;
		var bouns = mapObj.getBounds();
		if(bouns){
			pageActivity["latmin"]=bouns["southwest"].lat+0.0001;
			pageActivity["latmax"]=bouns["northeast"].lat-0.0001;
			pageActivity["lngmin"]=bouns["southwest"].lng+0.0001;
			pageActivity["lngmax"]=bouns["northeast"].lng-0.0001;	
		}
		else{
			pageActivity["latmin"]=0;
			pageActivity["latmax"]=0;
			pageActivity["lngmin"]=0;
			pageActivity["lngmax"]=0;
		}
		$.ajax({
		     type: "POST",
		     url : '${ctx}/community!findActivityMapList.action',
		     dataType:'json',
		     data:pageActivity,
		     success: function(msg,status){
		    	if(msg.status == 200){
		    		if(msg.total%pageinfo["size"]==0)
		    			pageActivity["tp"]=msg.total/pageActivity["size"];
		    	    else
		    	    	pageActivity["tp"]=Math.ceil(msg.total/pageActivity["size"]);
		    		var array=[];
		    		array.push('<table width="95%" border="0" cellspacing="0" cellpadding="0">');
		    		for(var i=0;i<msg.rows.length;i++){
		    			var data=msg.rows[i];
		    			addMyMarker('act',data,i);
		    			var str='<tr class="tr-map" value="'+i+'"><td valign="top" style="padding-top:4px;padding-bottom:4px;border:0px solid #2472df;cursor:pointer;color:#2472df;font-size:14px;">'+createMyIconSmall(i);
		    			str +='&nbsp;&nbsp;&nbsp;&nbsp;</td><td onclick="activity_detail(\'${user.userId}\','+data["activityId"]+',\''+data["createUserId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')" style="text-align:left;padding-bottom:10px;cursor:pointer;font-size:14px;"><span style="color:#2472df;">'+ data["title"] +'</span><span style="color:#9a9a9c;font-size:12px;"><br/>地址：'+(data["address"].length>12?data["address"].substr(0,12)+'...':data["address"])+'<br/>开始时间：'+data["beginTime"]+'<br/>结束时间：'+(data["endTime"]==null?'':data["endTime"])+'</span></td></tr/>';
					    array.push(str);
		    		} 
		    		mapObj.setFitView();
		    		var str ='<table style="margin-top:20px;text-align:left;width:95%;height:30px;line-height:30px;font-size:12px;"><tr><td>'+pageActivity["page"]+'页/共'+pageActivity["tp"]+'页</span>&nbsp;&nbsp;</td><td width="114" style="text-align:right;"><ul class="ul_transfer_search">'+
		    		'<li id="li_bus_type1" onclick="activityPage(-1)" style="width:50px;height:24px;border-right:1px solid #ccc;">上一页</li>'+
		    		'<li id="li_bus_type2" onclick="activityPage(1)" style="width:50px;height:24px;margin-left:4px;border-right:1px solid #ccc;">下一页</li>'+
		    		'</ul></td></tr></table>';
		    		 $('#result').html(array.join('')+'</table>'+str);
				        
			       if(msg.total==0){
			    	   $('#result').html('暂无数据!');
			       }
			       initMapDataHover();
			       
		    	  
		    	   
		    	}
		    	else{
		    		//alert(msg.msg);
		    	}
		     }
		});
		
}


function loadResturauntMap(page){
	marklist=[],inforWindowArray=[];
	clearMark(true);
	
	pageinfo["page"]=page;
	pageinfo["size"]=20;
	if(categoryIdSelected!=null)
		pageinfo["categoryId"]=categoryIdSelected;
	var bouns = mapObj.getBounds();
	if(bouns){
			pageinfo["latmin"]=bouns["southwest"].lat+0.0001;
			pageinfo["latmax"]=bouns["northeast"].lat-0.0001;
			pageinfo["lngmin"]=bouns["southwest"].lng+0.0001;
			pageinfo["lngmax"]=bouns["northeast"].lng-0.0001;	
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
	    		shopArray=msg.rows;
	    		var array=[];
	    		array.push('<table width="95%" border="0" cellspacing="0" cellpadding="0">');
	    		for(var i=0;i<msg.rows.length;i++){
	    			var data=msg.rows[i];
	    			 addMyMarker('shop',data,i);
	    			 
	    			/*var str='<tr class="tr-map" value="'+i+'"><td valign="top" style="padding-top:4px;padding-bottom:4px;border:0px solid #2472df;cursor:pointer;color:#2472df;font-size:14px;">'+createMyIconSmall(i);
	    			str +='&nbsp;&nbsp;&nbsp;&nbsp;</td><td style="width:187px;text-align:left;padding-bottom:10px;cursor:pointer;font-size:14px;"><span style="color:#2472df;cursor:pointer;" onclick="gotoDetail('+data["companyShopId"]+')">'+ data["name"] +'</span><span style="font-size:12px;color:#9a9a9c;"><br/>地址：'+data["address"]+'<br/>营业时间：'+data["workTime"]+'<br/>人均：'+data["consumptionPer"]+'元<br/>电话：'+data["linkmanTel"]+'<br/>联系人：'+data["linkman"]+'</span></td></tr/>';
				    array.push(str);*/
				    var str='<tr class="tr-map" value="'+i+'"><td valign="top" style="padding-top:4px;padding-bottom:4px;border:0px solid #2472df;cursor:pointer;color:#2472df;font-size:14px;">'+createMyIconSmall(i);
	    			str +='&nbsp;&nbsp;&nbsp;&nbsp;</td><td style="width:187px;text-align:left;padding-bottom:10px;cursor:pointer;font-size:14px;"><span style="color:#2472df;cursor:pointer;" onclick="gotoDetail('+data["companyShopId"]+')">'+ data["name"] +'</span><span style="font-size:12px;color:#9a9a9c;"><br/>地址：'+(data["address"].length>12?data["address"].substr(0,12)+'...':data["address"])+'<br/>联系方式：'+data["linkmanTel"]+'</span></td></tr/>';
				    array.push(str);
	    		} 
	    		mapObj.setFitView();
	    		var str ='<table style="margin-top:20px;text-align:left;width:95%;height:30px;line-height:30px;font-size:12px;"><tr><td>'+pageinfo["page"]+'页/共'+pageinfo["tp"]+'页</span>&nbsp;&nbsp;</td><td width="114" style="text-align:right;"><ul class="ul_transfer_search">'+
	    		'<li  onclick="shopPage(-1)" style="width:50px;height:24px;border-right:1px solid #ccc;">上页</li>'+
	    		'<li  onclick="shopPage(1)" style="width:50px;height:24px;margin-left:4px;border-right:1px solid #ccc;">下页</li>'+
	    		'</ul></td></tr></table>';
		       $('#result').html(array.join('')+'</table>'+str);
		       
		       if(msg.total==0){
		    	   $('#result').html('暂无数据!');
		       }
		       initMapDataHover();
		       
	    	}
	    	else{
	    		//alert(msg.msg);
	    	}
	    		
		 } 
	});
}
function shopPage(type){
	if(pageinfo["tp"]==0){
		return;
	}
	if(type==1){
		if(pageinfo["page"]>=pageinfo["tp"]){
			return;
		}
	}
	else if(type==-1){
		if(pageinfo["page"]<=1){
			return;
		}
	}
	pageinfo["page"]=pageinfo["page"]+type;
	loadResturauntMap(pageinfo["page"]);
}
function activityPage(type){
	if(pageActivity["tp"]==0){
		return;
	}
	if(type==1){
		if(pageActivity["page"]>=pageActivity["tp"]){
			return;
		}
	}
	else if(type==-1){
		if(pageActivity["page"]<=1){
			return;
		}
	}
	pageActivity["page"]=pageActivity["page"]+type;
	findActivityMapList(pageActivity["page"]);
}
function initMapDataHover(){
	 $('.tr-map').hover(function(){
   	  var sel = parseInt(this.getAttribute("value"),10);
   	  $('.tr-map').each(function(){
   				var sel1 = this.getAttribute('value');;
   				if(sel == sel1){
   					$(this).css("background","#F0F0F0");
   				}
   				else{
   					$(this).css("background","");
   				}
   	  });
   	  if(sel<inforWindowArray.length){
   		inforWindowArray[sel].open(mapObj,marklist[sel].getPosition());   
   	  }
   	  
      });
      
}
var marklist=[],inforWindowArray=[];
//实例化点标记   
function addMyMarker(type,data,index){ 
	 var lngX = 121.23456;
	 var latY = 33.223456;
	 if(type=='bus'){
		 lngX=data.location.getLng();
		 latY=data.location.getLat();
	 }
	 else{
		 var lngX = data.lng;
		 var latY = data.lat;
	 }
	 
   // var marker=new AMap.Marker({ 
     //icon:"${ctx}/images/map_pop.png", 
   // content:createMyIcon(index),
  //  position:new AMap.LngLat(lngX,latY),
  //  offset: new AMap.Pixel(-50,-70) 
  //  }); 
   // marker.setMap(mapObj);
   
    var markerOption = {  
        map:mapObj,  
        icon:"${ctx}/images/map/"+(index+1)+".png",  
        position:new AMap.LngLat(lngX, latY)  
    };  
    var marker = new AMap.Marker(markerOption);  
      
    marklist.push(marker);
    
    var info = [];  
    if(type=='act'){
    	 info.push('<b><a style="font-size:14px;TEXT-DECORATION: underline;color:#00a6ac;cursor;pointer;" href="javascript:void(0)" onclick="activity_detail(\'${user.userId}\','+data["activityId"]+',\''+data["createUserId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')">'+data["title"]+'</a></b>');                   
    	 info.push('<span style="font-size:12px;color:#9a9a9c;"><br/>开始时间：'+(data["beginTime"]==null?'':data["beginTime"])+'<br/>结束时间：'+(data["endTime"]==null?'':data["endTime"])+'<br />地址：'+data["address"]+'</span>'); 
    }
    else if(type=='shop'){
    	 info.push("<b><a style=\"font-size:14px;TEXT-DECORATION: underline;color:#00a6ac;cursor;pointer;\" href=\"javascript:void(0)\" onclick=\"gotoDetail("+data["companyShopId"]+")\">"+data["name"]+"</a></b>");                   
    	 info.push("<span style='font-size:12px;color:#9a9a9c;'><br/>地址 : "+data["address"]);
    	 info.push("<br/>人均 :  "+data["consumptionPer"]+'元');
    	 info.push("<br/>联系方式 :  "+data["linkmanTel"]);   
    	 info.push("<br/>联系人 : "+data["linkman"]+'</span>');  
    	 if(data["areaList"].length>0){
    		 //info.push("<br/><a style=\"font-size:14px;TEXT-DECORATION: underline;color:#00a6ac;cursor;pointer;\" href=\"javascript:void(0)\" onclick=\"drawShopArea("+index+")\">查看配送范围</a>");
    	 }
    	
    	 
    }
    else if(type=='bus'){ 
    	 info.push("<b><font color=\"#00a6ac\">"+ data.name +"</font></b>"+TipContents(data.type,data.address,data.tel));	    
    }
                     
                   
    var inforWindow = new AMap.InfoWindow({ 
    	content:info.join(""),
    	size:new AMap.Size(300,0),  
	    autoMove:true ,  
	    offset:{x:0, y:-30} 
	    //offset:{x:-44, y:-70} 
                       
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
	return '<div><img style="width:40px;height:45px;" src="${ctx}/images/map/'+(index+1)+'.png"/></div>';
}
function createMyIconSmall(index){
	return '<div><img style="width:30px;height:32px;" src="${ctx}/images/map/'+(index+1)+'.png"/></div>';
}
function clearMark(myLocationRefresh){
	mapObj.clearMap();
	myLocation(myLocationRefresh);
}


function gotoDetail(shopId){
			$('#formturn').attr('action',"${ctx}/product!findRestarauntDetail.action");
			$('#companyShopId').val(shopId);
			$('#formturn').submit();
		
 }


</script>
<script type="text/javascript">

		
		var mapObj,toolBar,locationInfo=null,trafficLayer=null;
		var circleLocation =null,locationP=null,circleLocationSmall=null,errorFlag=0;
		
		mapObj = new AMap.Map("container"); // 创建地图实例
		var point = new AMap.LngLat(121.372344, 31.16853430); // 创建点坐标
		mapObj.setCenter(point); // 设置地图中心点坐标
		mapObj.setZoom(16);
		//在地图中添加ToolBar插件  
	    mapObj.plugin(["AMap.ToolBar"],function(){        
	        toolBar = new AMap.ToolBar();  
	        mapObj.addControl(toolBar);       
	    });  
		
	    if("${user.userId}"==""){
	    	  locationP =  new AMap.LngLat(121.402938, 31.171942);
	    }
	    myLocation(true);
		/**mapObj.plugin(["AMap.ToolBar","AMap.OverView,AMap.Scale"], function() {
		      // 加载工具条
		    toolBar = new AMap.ToolBar({ direction: false, // 隐藏方向导航
		        ruler: true, // 隐藏视野级别控制尺
		        autoPosition: false // 禁止自动定位
		    });
		    mapObj.addControl(toolBar);
		    
		    AMap.event.addListener(toolBar,'location',function callback(e){    
	            locationInfo = e.lnglat;
	           $('#addressInfo').html("("+locationInfo.lat+","+locationInfo.lng+")");
	           //geocoder(new AMap.LngLat(locationInfo.lng, locationInfo.lat));
	         });   
		    toolBar.doLocation();
		    
		// 加载鹰眼
		    view = new AMap.OverView();
		    mapObj.addControl(view);
		    
		// 加载比例尺
		    scale = new AMap.Scale();
		    mapObj.addControl(scale);
		});*/
	

		
	
		/**function geocoder(lnglatXY) {   
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
		     
		}   */
		
		
		function geocoder(address) {  
			clearMark(true);
		    var MGeocoder;  
		    //加载地理编码插件  
		    mapObj.plugin(["AMap.Geocoder"], function() {          
		        MGeocoder = new AMap.Geocoder({   
		            city:"上海市", //城市，默认：“全国”  
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
		    //地理编码结果数组  
		    var geocode = new Array();  
		    geocode = data.geocodes;    
		    for (var i = 0; i < geocode.length; i++) {  
		       
		    	if(busStartEndPoint["startP"]==null){
		    		busStartEndPoint["startP"]=new AMap.LngLat(geocode[i].location.getLng(),geocode[i].location.getLat());
		    		break;
		    	}
		    	if(busStartEndPoint["startP"]!=null && busStartEndPoint["endP"]==null){
		    		busStartEndPoint["endP"]=new AMap.LngLat(geocode[i].location.getLng(),geocode[i].location.getLat());
		    		break;
		    	}
		    	
		    }    
		   // mapObj.setFitView();     
		   
		    if(busStartEndPoint["startP"]!=null && busStartEndPoint["endP"]==null){
		    	geocoder(busStartEndPoint["endName"]);
		    	
		    	
	    		
	    	}
		    if(busStartEndPoint["startP"]!=null && busStartEndPoint["endP"]!=null){
		    	preIndex=null;
				if(search_bus_type==0){
					transfer_route();
		    	}
		    	else if(search_bus_type==1){
		    		driving_route();
		    	}
		    	else if(search_bus_type==2){
		    		walking_route();
		    	}
		    }
		}   
		
		//实时路况
		var addTrafficFlag=false;
		function addTraffic(){  
           if(trafficLayer==null && !addTrafficFlag){
        	   trafficLayer= new AMap.TileLayer.Traffic({zIndex:10}); //实时路况图层  
        	   trafficLayer.setMap(mapObj);  
           }  
           if(addTrafficFlag){
        	   trafficLayer.hide();
        	   addTrafficFlag=false;
           }
           else{
        	   trafficLayer.show();
        	   addTrafficFlag=true;
           }
          
           
        }  
		/* 
		 * 调用公交换乘服务 
		 * param Object trans 公交换乘服务实例 
		 */  
		function transfer_route() {  
		    var trans;  
		    //加载公交换乘插件  
		    mapObj.plugin(["AMap.Transfer"], function() {        
		        transOptions = {  
		            city: '上海市',                            //公交城市  
		            policy: AMap.TransferPolicy.LEAST_TIME //乘车策略  
		        };  
		        //构造公交换乘类  
		        trans = new AMap.Transfer (transOptions);  
		        //返回导航查询结果            
		        AMap.event.addListener(trans, "complete", transCallBack);  
		        //显示错误信息  
		        AMap.event.addListener(trans, "error", function(e) {
		        	//alert(e.info);
		        });  
		        //根据起、终点坐标查询公交换乘路线  
		        trans.search(busStartEndPoint["startP"], busStartEndPoint["endP"]);   
		    });  
		}  
		 /* 
		 * 公交换乘服务返回数据解析概况 
		 * param Object  btCount       换乘方案总数 
		 * param Array[] btPlans       换乘方案数组 
		 * param Object  btOrigin      换乘起点 
		 * param Object  btDestination 换乘终点 
		 * param Object  btTaxiCost    全程打的花费 
		 * param Object  btType        查询状态 
		 * param Array[] BusArr        公交路径数组 
		 * param Array[] WalkArr       步行路径数组 
		 * param Array[] onbus         公交换乘点（上车站）数组 
		 * param Object  naviInfo      换乘段导航信息 
		 */  
		 var transLineAll={lineAllInfo:[]};
		function transCallBack(data) { 
			if(loadding_dialog!=null)
				loadding_dialog.close();
			$('#result_info').show();
			$('#map_search').hide();
			
		    var btCount       = data.count;   
		    var btPlans         = data.plans;   
		    var btOrigin      = data.origin;  
		    var btDestination = data.destination; 
		    transLineAll["btOrigin"]=btOrigin;
		    transLineAll["btDestination"]=btDestination;
		    var btTaxiCost    = data.taxi_cost;  
		    var startName     = busStartEndPoint["startName"]; //可以使用地理编码解析起点和终点坐标  
		    var endName       = busStartEndPoint["endName"];   
		   
		    var onbus         = new Array();  
		    var onwalk        = new Array();  
		    var btContent = new Array(); //结果表格数组  
		    //遍历每种换乘方案  
		    transLineAll["pathArray"]=[];
		    for (var i = 0; i < btPlans.length; i++) {  
		    	var lineAllInfo={BusArr:[],WalkArr:[]};
		        var btDistance  = btPlans[i].distance;  
		        var btseg       = btPlans[i].segments;  
		       
		        var lineNameArr = new Array();  
		        var resLine     = "";  
		        var naviInfo    = '';  
		        var lineName;  
		        var timeCount=0;
		        var paths=[];
		        for(var j = 0; j < btseg.length; j++) {  
		            timeCount +=btseg[j]["time"];
		            var instruction = btseg[j].instruction;
		            if(btseg[j].transit_mode =="WALK") {  
		               var steps = btseg[j].transit.steps;
		               for(var m=0;m<steps.length;m++){
		            	   var road = steps[m]["road"];
		            	   if(road.length>0){
		            		   instruction = instruction.replace(road,'<span style="font-weight:bold;color:#2894FF">'+road+'</span>');
		            	   }
		               }
		               naviInfo +='<tr onmouseover="drawTransOver('+i+','+j+')" style="font-size:12px;color:#9a9a9c;"><td align="center">'+(j+1)+'</td><td  style="padding-bottom:4px;border-bottom:1px solid #ccc;">'+ instruction + "</td><td align=\"right\" style=\"padding-right:4px;width:50px;border-bottom:1px solid #ccc;\"s>"+btseg[j]["distance"]+"米</td></tr>";  
		               
		            	lineAllInfo["WalkArr"].push(btseg[j].transit.path);  
		            
		            }  
		            else {  
		            	var lines = btseg[j].transit.lines;
		            	  for(var m=0;m<lines.length;m++){
			            	   var road = lines[m]["name"];
			            	   if(road.length>0){
			            		   instruction = instruction.replace(road,'<span style="font-weight:bold;color:#666;">'+road+'</span>');
			            	   }
			            	}
		            	   instruction = instruction.replace(btseg[j].transit.on_station["name"],'<span style="font-weight:bold;color:#2894FF">'+btseg[j].transit.on_station["name"]+'</span>');
		            	   instruction = instruction.replace(btseg[j].transit.off_station["name"],'<span style="font-weight:bold;color:#2894FF">'+btseg[j].transit.off_station["name"]+'</span>');
		            	  naviInfo +='<tr onmouseover="drawTransOver('+i+','+j+')" style="font-size:12px;color:#9a9a9c;"><td align="center">'+(j+1)+'</td><td  style="padding-top:4px;padding-bottom:4px;border-bottom:1px solid #ccc;">'+ instruction + "</td><td align=\"right\" style=\"padding-right:4px;width:50px;font-weight:bold;color:#2894FF;border-bottom:1px solid #ccc;\">"+btseg[j].transit["via_num"]+"站</td></tr>";  
		            	  
		                lineName = btseg[j].transit.lines[0].name;  
		                lineName=lineName.split("(")[0];
		                lineNameArr.push(lineName);  
		               
		                lineAllInfo["BusArr"].push(btseg[j].transit.path); 
		               
		            } 
		        	paths.push(btseg[j].transit.path);
		        }  
		        lineName = lineNameArr.join("-->"); 
		        transLineAll["lineAllInfo"].push(lineAllInfo);
		        transLineAll["pathArray"].push(paths);
		      
		        //结果输出用表格展现，输出表格内容  
		        resLine = "<table width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";  
		        resLine +='<tr id="line_'+i+'" onclick="show_line('+i+')" style="cursor:pointer;"><td  style="width:26px;padding-bottom:4px;border:2px solid #46A3FF;border-right:0px;"><span style="font-size:10px;margin-top:1px;margin-left:1px;padding:1px 4px;color:#fff;background:#46A3FF;">'+(i+1)+'</span></td>';
		        resLine +='<td style="padding-bottom:4px;border:2px solid #46A3FF;border-left:0px;color:#46A3FF;font-size:14px;">'+ lineName +'<span style="display:none;font-size:12px;color:#9a9a9c;"><br/>全程约'+Getdistance(timeCount,btDistance) +'</span></td></tr/>';
		        resLine +='<tr id="line_detail'+i+'" style="display:none;font-size:14px;"><td colspan="2" style="padding-top:4px;padding-bottom:4px;padding-right:4px;border:2px solid #46A3FF;border-top:0px;padding-left:4px;">';
		       	resLine +='<table width="100%" border="0" cellspacing="0" cellpadding="0">';
		        resLine += "<tr><td><img src=\"${ctx}/images/map_start.jpg\" /> </td><td>" + startName + "</td></tr>"+ naviInfo +"<tr><td><img src=\"${ctx}/images/map_end.jpg\" /></td><td> " + endName + "</td></tr>";  
		        resLine +='</table>';
		        resLine +='<tr><td style="height:5px;" colspan="2"></td></tr></table>';
		        btContent.push(resLine);  
		     }  
		    
		     //写到result这个div
		     $("#result").show();
		    $("#result").html(btContent.join("")); 
		 
		  
		   
		   show_line(0);
		   
		}  
		//距离，米换算为千米  
		function Getdistance(times,len) {  
			var timeMinute = '';
			if(times/60<60){
				timeMinute =(Math.round(times/60)).toFixed(1)+'分种'
			}
			else{
				var s = (Math.round(times/60/60)).toFixed(1);  
				timeMinute = s + "小时";  
			}
			var distance='';
		    if (len <= 1000) {  
		        distance = s + "米";  
		    } else {  
		        var s = Math.round(len / 1000).toFixed(1);  
		        distance = s + "公里";  
		    }  
		    return distance+"/"+timeMinute;
		}  
		//绘制路线  
		function drawBuschangeLine(startPot,endPot,BusArr,WalkArr) {  
			clearMark(false);
			//自定义起点，终点图标  
		     var sicon = new AMap.Icon({    
		        image: "${ctx}/images/poi.png",    
		        size: new AMap.Size(44,44),    
		        imageOffset: new AMap.Pixel(-334, -180)    
		    });   
		     var eicon = new AMap.Icon({    
		        image: "${ctx}/images/poi.png",    
		        size: new AMap.Size(44,44),    
		        imageOffset: new AMap.Pixel(-334, -134)    
		    });   
		    //绘制起点，终点  
		    var stmarker = new AMap.Marker({  
		        map:mapObj,  
		        position:new AMap.LngLat(startPot.lng,startPot.lat), //基点位置  
		        icon:sicon, //复杂图标  
		        offset:{x:-16,y:-34} //相对于基点的位置  
		    });  
		    var endmarker = new AMap.Marker({  
		        map:mapObj,  
		        position:new AMap.LngLat(endPot.lng,endPot.lat), //基点位置  
		        icon:eicon, //复杂图标  
		        offset:{x:-16,y:-34} //相对于基点的位置  
		    });  
		    mapObj.setFitView();
		    //绘制乘车的路线  
		    for(var j in BusArr) {  
		        busPolyline = new AMap.Polyline({  
		            map:mapObj,  
		            path:BusArr[j],  
		            strokeColor:"#005cb5",//线颜色  
		            strokeOpacity:0.8,//线透明度  
		            strokeWeight:6//线宽  
		        });  
		    }  
		
		    //绘制步行的路线  
		    for (var i in WalkArr) {  
		        walkPolyline = new AMap.Polyline({  
		            map:mapObj,  
		            path:WalkArr[i],  
		            strokeColor : "#6EB034", //线颜色  
		            strokeOpacity : 0.6, //线透明度  
		            strokeWeight : 6//线宽  
		  
		        });  
		    }  
		   
		}  
		//鼠标经过时路径
		function drawTransOver(index,num){
			 var drawpath1 = new Array();  
			    drawpath1 = transLineAll["pathArray"][index][num];  
			    if(polyline != null){  
			        polyline.setMap(null);  
			    }  
			    polyline = new AMap.Polyline({  
			            map: mapObj,  
			            path: drawpath1,  
			            strokeColor: "#FF3030",  
			            strokeOpacity: 0.9,  
			            strokeWeight: 4,  
			            strokeDasharray: [10, 5]  
			        });  
			    // mapObj.setFitView(polyline);  
		}
		
		function addMarker(busmar) {  
		    for (var i = 0; i < busmar.length; i++) {  
		        var busmarker = new AMap.Marker({  
		            icon : new AMap.Icon({  
		                image: "http://www.amap.com/images/busroute.png",  
		                size: new AMap.Size(20, 20),  
		                imageOffset: new AMap.Pixel(-33, -3)  
		            }),  
		            position : busmar[i],  
		            offset : {  
		                x : -25,  
		                y : -25  
		            },  
		            map:mapObj  
		        });  
		    }  
		}  
		//驾车导航  
		function driving_route() {  
		    var MDrive;  
		    mapObj.plugin(["AMap.Driving"], function() {  
		        var DrivingOption = {  
		            //驾车策略，包括 LEAST_TIME，LEAST_FEE, LEAST_DISTANCE,REAL_TRAFFIC  
		            policy: AMap.DrivingPolicy.LEAST_TIME   
		        };          
		        MDrive = new AMap.Driving(DrivingOption); //构造驾车导航类   
		        AMap.event.addListener(MDrive, "complete", driving_routeCallBack); //返回导航查询结果  
		        MDrive.search(busStartEndPoint["startP"], busStartEndPoint["endP"]); //根据起终点坐标规划驾车路线  
		    });  
		}  
		//导航结果展示  
		function driving_routeCallBack(data) {  
			transLineAll["btOrigin"]=busStartEndPoint["startP"];
			transLineAll["btDestination"]=busStartEndPoint["endP"];
			
		    var routeS = data.routes;  
		    if (routeS.length <= 0) {  
		        document.getElementById("result").innerHTML = "未查找到任何结果!<br />建议：<br />1.请确保所有字词拼写正确。<br />2.尝试不同的关键字。<br />3.尝试更宽泛的关键字。";  
		    }   
		    else{   
		        route_text="";  
		        for(var v =0; v< routeS.length;v++){  
		            //驾车步骤数  
		            var  steps = routeS[v].steps;
		            transLineAll["lineAllInfo"].push(steps);
		          var naviInfo='';
		            for(var i=0 ;i< steps.length;i++){  
		            	var instruction = steps[i].instruction;
		            	var road = steps[i].road;
		            	if(road.length>0){
		            		instruction=instruction.replace(road,'<span style="font-weight:bold;color:#2894FF">'+road+'</span>');
		            	}
		            	naviInfo +='<tr style="font-size:12px;color:#9a9a9c;" onMouseover="driveDrawFoldline(\''+v+'\',\'' + i + '\')"><td align="center">'+(i+1)+'</td><td  style="padding-bottom:4px;border-bottom:1px solid #ccc;">'+ instruction + "</td></tr>";  
		            }  
		            
		            //拼接输出html  
		            route_text += "<table width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";  
		            route_text +='<tr id="line_'+v+'" onclick="show_line('+v+')" style="cursor:pointer;"><td  style="width:26px;padding-bottom:4px;border:2px solid #46A3FF;border-right:0px;"><span style="font-size:10px;margin-top:1px;margin-left:1px;padding:1px 4px;color:#fff;background:#46A3FF;">'+(v+1)+'</span></td>';
		            route_text +='<td style="padding-bottom:4px;border:2px solid #46A3FF;border-left:0px;color:#46A3FF;font-size:14px;">'+ busStartEndPoint["startName"]+'-->'+busStartEndPoint["endName"] +'<span style="display:none;font-size:12px;color:#9a9a9c;"><br/>全程约'+Getdistance(routeS[v].time,routeS[v].distance) +'</span></td></tr/>';
		            route_text +='<tr id="line_detail'+v+'" style="display:none;font-size:14px;"><td colspan="2" style="padding-top:4px;padding-bottom:4px;padding-right:4px;border:2px solid #46A3FF;border-top:0px;padding-left:4px;">';
		            route_text +='<table width="100%" border="0" cellspacing="0" cellpadding="0">';
		            route_text += "<tr><td><img src=\"${ctx}/images/map_start.jpg\" /> </td><td>" + busStartEndPoint["startName"] + "</td></tr>"+ naviInfo +"<tr><td><img src=\"${ctx}/images/map_end.jpg\" /></td><td> " + busStartEndPoint["endName"] + "</td></tr>";  
		            route_text +='</table>';
		            route_text +='<tr><td style="height:5px;" colspan="2"></td></tr></table>';
		            
		        }   
		        //输出行车路线指示  
		       document.getElementById("result").innerHTML = route_text;  
		       show_line(0);
		    }     
		}  
		//绘制驾车导航路线  
		function drivingDrawLine(startP,endP,steps) {  
			clearMark(false);
		    //起点、终点图标  
		    var sicon = new AMap.Icon({  
		        image: "${ctx}/images/poi.png",  
		        size:new AMap.Size(44,44),  
		        imageOffset: new AMap.Pixel(-334, -180)  
		    });  
		    var startmarker = new AMap.Marker({  
		        icon : sicon, //复杂图标  
		        visible : true,   
		        position : startP,  
		        map:mapObj,  
		        offset : {  
		            x : -16,  
		            y : -40  
		        }  
		    });  
		    var eicon = new AMap.Icon({  
		        image: "${ctx}/images/poi.png",  
		        size:new AMap.Size(44,44),  
		        imageOffset: new AMap.Pixel(-334, -134)  
		    });  
		    var endmarker = new AMap.Marker({  
		        icon : eicon, //复杂图标  
		        visible : true,   
		        position : endP,  
		        map:mapObj,  
		        offset : {  
		            x : -16,  
		            y : -40  
		        }  
		    });  
		    //起点到路线的起点 路线的终点到终点 绘制无道路部分  
		    var extra_path1 = new Array();  
		    extra_path1.push(startP);  
		    extra_path1.push(steps[0].path[0]);  
		    var extra_line1 = new AMap.Polyline({  
		        map: mapObj,  
		        path: extra_path1,  
		        strokeColor: "#9400D3",  
		        strokeOpacity: 0.7,  
		        strokeWeight: 4,  
		        strokeStyle: "dashed",  
		        strokeDasharray: [10, 5]  
		    });  
		  
		    var extra_path2 = new Array();  
		    var path_xy = steps[(steps.length-1)].path;  
		    extra_path2.push(endP);  
		    extra_path2.push(path_xy[(path_xy.length-1)]);  
		    var extra_line2 = new AMap.Polyline({  
		        map: mapObj,  
		        path: extra_path2,  
		        strokeColor: "#9400D3",  
		        strokeOpacity: 0.7,  
		        strokeWeight: 4,  
		        strokeStyle: "dashed",  
		        strokeDasharray: [10, 5]  
		    });  
		      
		    var drawpath = new Array();  
		    for(var s=0; s<steps.length; s++){  
		        drawpath = steps[s].path;  
		        var polyline = new AMap.Polyline({  
		            map: mapObj,  
		            path: drawpath,  
		            strokeColor: "#9400D3",  
		            strokeOpacity: 0.7,  
		            strokeWeight: 4,  
		            strokeDasharray: [10, 5]  
		        });  
		    }  
		    mapObj.setFitView();  
		}  
		//绘制驾车导航路段  
		var polyline;
		function driveDrawFoldline(index,num){  
		    var drawpath1 = new Array();  
		    drawpath1 = transLineAll["lineAllInfo"][index][num].path;  
		    if(polyline != null){  
		        polyline.setMap(null);  
		    }  
		    polyline = new AMap.Polyline({  
		            map: mapObj,  
		            path: drawpath1,  
		            strokeColor: "#FF3030",  
		            strokeOpacity: 0.9,  
		            strokeWeight: 4,  
		            strokeDasharray: [10, 5]  
		        });  
		  
		   // mapObj.setFitView(polyline);  
		}  
		//绘制店铺配送范围
		var showAranLine=null;
		function drawShopArea(index){
			if(showAranLine!=null){
				showAranLine.setMap(null);
			}
			  var dataArray = bubbleSort(shopArray[index]["areaList"]);
			    var polygonArr=new Array();//多边形覆盖物节点坐标数组   
			    for(var i=0;i<dataArray.length;i++){
			    	   polygonArr.push(new AMap.LngLat(dataArray[i]["lng"], dataArray[i]["lat"]));   
			    }
			   	 showAranLine=new AMap.Polygon({     
			       path:polygonArr,//设置多边形边界路径  
			       strokeColor:"#2E64FE", //线颜色  
			       strokeOpacity:0.8, //线透明度   
			       strokeWeight:3,    //线宽   
			       fillColor: "#F5A9A9", //填充色  
			       fillOpacity: 0.55//填充透明度  
			      });   
			      showAranLine.setMap(mapObj);  

		  }
		function bubbleSort(arr){
			 for(var i = 0;i<arr.length;i++){
			  for(var j = i+1;j<arr.length;j++){
			   if(arr[i]["lat"]>arr[j]["lat"]){  //升序; 如果是小于,则为降序
			    var t = arr[i];
			    arr[i]=arr[j];
			    arr[j]=t;
			   }
			  }
			 }
			 return arr;
			}
		//步行导航  
		function walking_route() {  
		    var MWalk;  
		    mapObj.plugin(["AMap.Walking"], function() {          
		        MWalk = new AMap.Walking(); //构造路线导航类   
		        AMap.event.addListener(MWalk, "complete", driving_routeCallBack); //返回导航查询结果  
		        MWalk.search(busStartEndPoint["startP"], busStartEndPoint["endP"]); //根据起终点坐标规划步行路线  
		    });  
		}  
		//导航结果展示  
		function walk_routeCallBack(data) {  
		    var routeS = data.routes;  
		        if (routeS.length <= 0) {  
		            document.getElementById("result").innerHTML = "未查找到任何结果!<br />建议：<br />1.请确保所有字词拼写正确。<br />2.尝试不同的关键字。<br />3.尝试更宽泛的关键字。";  
		        }   
		        else {   
		            route_text="";  
		            for(var v =0; v< routeS.length;v++){  
		                //步行导航路段数  
		                steps = routeS[v].steps;  
		                var route_count = steps.length;  
		                //步行距离（米）  
		                var distance = routeS[v].distance;  
		                //拼接输出html  
		                for(var i=0 ;i< steps.length;i++) {  
		                    route_text += "<tr><td align=\"left\" onMouseover=\"walkingDrawSeg('" + i + "')\">" + i +"." +steps[i].instruction  + "</td></tr>";  
		                }  
		            }  
		            //输出步行路线指示  
		            route_text = "<table cellspacing=\"5 px\" ><tr><td style=\"background:#e1e1e1;\">路线</td></tr><tr><td><img src=\"http://code.mapabc.com/images/start.gif\" />&nbsp;&nbsp;北京南站</td></tr>" + route_text + "<tr><td><img src=\"http://code.mapabc.com/images/end.gif\" />&nbsp;&nbsp;北京站</td></tr></table>";  
		            document.getElementById("result").innerHTML = route_text;  
		            walkingDrawLine();  
		        }  
		    }  
		//绘制步行导航路线  
		function walkingDrawLine() {  
		    //起点、终点图标  
		    var sicon = new AMap.Icon({  
		        image: "${ctx}/images/poi.png",  
		        size:new AMap.Size(44,44),  
		        imageOffset: new AMap.Pixel(-334, -180)  
		    });  
		    var startmarker = new AMap.Marker({  
		        icon : sicon, //复杂图标  
		        visible : true,   
		        position : start_xy,  
		        map:mapObj,  
		        offset : {  
		            x : -16,  
		            y : -40  
		        }  
		    });  
		    var eicon = new AMap.Icon({  
		        image: "${ctx}/images/poi.png",  
		        size:new AMap.Size(44,44),  
		        imageOffset: new AMap.Pixel(-334, -134)  
		    });  
		    var endmarker = new AMap.Marker({  
		        icon : eicon, //复杂图标  
		        visible : true,   
		        position : end_xy,  
		        map:mapObj,  
		        offset : {  
		            x : -16,  
		            y : -40  
		        }  
		    });   
		    //起点到路线的起点 路线的终点到终点 绘制无道路部分  
		    var extra_path1 = new Array();  
		    extra_path1.push(start_xy);  
		    extra_path1.push(steps[0].path[0]);  
		    var extra_line1 = new AMap.Polyline({  
		        map: mapObj,  
		        path: extra_path1,  
		        strokeColor: "#9400D3",  
		        strokeOpacity: 0.7,  
		        strokeWeight: 4,  
		        strokeStyle: "dashed",  
		        strokeDasharray: [10, 5]  
		    });  
		  
		    var extra_path2 = new Array();  
		    var path_xy = steps[(steps.length-1)].path;  
		    extra_path2.push(end_xy);  
		    extra_path2.push(path_xy[(path_xy.length-1)]);  
		    var extra_line2 = new AMap.Polyline({  
		        map: mapObj,  
		        path: extra_path2,  
		        strokeColor: "#9400D3",  
		        strokeOpacity: 0.7,  
		        strokeWeight: 4,  
		        strokeStyle: "dashed",  
		        strokeDasharray: [10, 5]  
		    });  
		  
		    for(var s=0; s<steps.length; s++) {  
		        var drawpath = steps[s].path;  
		        var polyline = new AMap.Polyline({  
		            map: mapObj,  
		            path: drawpath,  
		            strokeColor: "#9400D3",  
		            strokeOpacity: 0.7,  
		            strokeWeight: 4  
		        });   
		    }  
		    mapObj.setFitView();  
		}     
		//绘制步行导航路段  
		function walkingDrawSeg(n) {  
		    var drawpath_seg = steps[n].path;  
		    if(polyline != null){  
		        polyline.setMap(null);  
		    }  
		    polyline = new AMap.Polyline({  
		            map: mapObj,  
		            path: drawpath_seg,  
		            strokeColor: "#FF3030",  
		            strokeOpacity: 0.9,  
		            strokeWeight: 4,  
		            strokeDasharray: [10, 5]  
		        });  
		}  
		
		var preIndex=null;
		var selectFontColor="#2894FF";
		function show_line(index){
			if(preIndex!=null){
				$('#line_detail'+preIndex).hide();
				$('#line_'+preIndex).css({"background-color":"#fff"});
				$('#line_'+preIndex).find("td").each(function(){
					$(this).css({"border-bottom":"2px solid #46A3FF"});
				});
				var tdTitle = $('#line_'+preIndex).find("td")[1];
				$(tdTitle).css({"color":"#46A3FF","font-weight":"normal"});
				$($(tdTitle).find('span')[0]).hide();
			}
			if(preIndex!=index){
				$('#line_detail'+index).show();
				$('#line_'+index).css({"background-color":"#ECF5FF"});
				$('#line_'+index).find("td").each(function(){
					$(this).css({"border-bottom":"0px"});
				});
				var tdTitle = $('#line_'+index).find("td")[1];
				$(tdTitle).css({"color":selectFontColor,"font-weight":"bold"});
				$($(tdTitle).find('span')[0]).show();
				
				
				if(search_bus_type==0){
					drawBuschangeLine(transLineAll["btOrigin"],transLineAll["btDestination"],transLineAll["lineAllInfo"][index]["BusArr"],transLineAll["lineAllInfo"][index]["WalkArr"]); 
				}
		    	else if(search_bus_type==1 || search_bus_type==2){
		    		drivingDrawLine(transLineAll["btOrigin"],transLineAll["btDestination"],transLineAll["lineAllInfo"][index]);
		    	}
		    	
			     preIndex=index;
			}
			else{
				preIndex=null;
			}
			
		}
		
		/* 
		 *公交线路查询 
		 */  
		function lineSearch(keyword) { 
			clearMark(false);
		    //加载公交线路查询插件  
		    //实例化公交线路查询类，只取回一条路线  
		    mapObj.plugin(["AMap.LineSearch"], function() {  
		       var linesearch = new AMap.LineSearch({  
		            pageIndex:1,  
		            city:'上海市',  
		            pageSize:1,  
		            extensions:'all'  
		        });  
		        //搜索“536”相关公交线路  
		        linesearch.search(keyword);  
		        AMap.event.addListener(linesearch, "complete", lineSearch_Callback);  
		        AMap.event.addListener(linesearch, "error", function(e){ 
		        	if(loadding_dialog!=null)
		    			loadding_dialog.close();
		        	//alert(e.info);  
		        });  
		    });  
		}  
		 /* 
		 * 公交路线查询服务返回数据解析概况 
		 * param Array[]  lineArr     返回公交线路总数 
		 * param String   lineName    公交线路名称 
		 * param String   lineCity    公交所在城市 
		 * param String   company     公交所属公司 
		 * param Number   stime       首班车时间 
		 * param Number   etime       末班车时间 
		 * param Number   bprice      公交起步票价 
		 * param Number   tprice      公交全程票价 
		 * param Array[]  pathArr     公交线路路径数组 
		 */  
		function lineSearch_Callback(data) {  
			  if(loadding_dialog!=null)
		    		loadding_dialog.close();
			$('#result_info').show();
			$('#map_search').hide();
			var resLine='未查到结果!';
		    var lineArr  = data.lineInfo;  
		    var lineNum  = data.lineInfo.length;  
		    if(lineNum == 0) {  
		        resLine = data.info;  
		    }  
		    else {  
		    	resLine="";
		        resLine += "<div id=\"divid" + i + "\"><table>";  
		        for(var i = 0; i < lineNum; i++) {  
		            var lineName = lineArr[i].name;  
		            var lineCity = lineArr[i].city;  
		            var distance = lineArr[i].distance;  
		            var company  = lineArr[i].company;  
		            var stime    = lineArr[i].stime;  
		            var etime    = lineArr[i].etime;  
		            var pathArr  = lineArr[i].path; 
		            var pathStops  = lineArr[i].via_stops; 
		            var stops    = lineArr[i].via_stops;  
		            var startPot = stops[0].location;  
		            var endPot   = stops[stops.length-1].location;  
		            //结果输出用DIV展现，输出内容  
		            resLine += "<tr><td style='font-size:14px;padding-bottom:10px;'><font color='#00a6ac'>" + lineName + "</font></td></tr>";  
		            resLine += "<tr style='font-size:14px;'><td><font color='#00a6ac'>首末车时间：</font>" + stime.substring(0, 2) + ":" + stime.substring(2, 4) + '-' + etime.substring(0, 2) + ":" + etime.substring(2, 4) +"</td></tr>";
		            resLine += "<tr style='font-size:14px;'><td><font color='#00a6ac'>" + "全长：</font>" + distance + "公里</td></tr>";
		            resLine += "<tr style='font-size:14px;'><td><font color='#00a6ac'>" + "所属公司：</font>" + company+"</td></tr>";  
		            resLine += "<tr style='font-size:14px;'><td><font color='#00a6ac'>经过站点：</font>";
		            if(pathStops!=undefined){
		            	 for(var hh=0;hh<pathStops.length;hh++){
				            	resLine += pathStops[hh]["name"]+"&nbsp;&nbsp;";
				          	}
		            }
		            resLine += "</td></tr>";
		            //绘制第一条路线  
		            if(i==0) drawbusLine(startPot,endPot,pathArr);  
		        }  
		        resLine += "</table></div>" ; 
		  		
		       $('#result').show();
		       $('#result').html(resLine);
		      
		    }  
		}  
		  
		/* 
		 *绘制路线 
		 */  
		function drawbusLine(startPot,endPot,BusArr) {  
		    //自定义起点，终点图标  
		     var sicon = new AMap.Icon({  
		        image: "${ctx}/images/poi.png",  
		        size: new AMap.Size(44,44),  
		        imageOffset: new AMap.Pixel(-334, -180)  
		    });  
		     var eicon = new AMap.Icon({  
		        image: "${ctx}/images/poi.png",  
		        size: new AMap.Size(44,44),  
		        imageOffset: new AMap.Pixel(-334, -134)  
		    });  
		    //绘制起点，终点  
		    var stmarker = new AMap.Marker({  
		        map:mapObj,  
		        position:new AMap.LngLat(startPot.lng,startPot.lat), //基点位置  
		        icon:sicon, //复杂图标  
		        offset:{x:-16,y:-34}, //相对于基点的位置  
		        zIndex:10  
		    });  
		    var endmarker = new AMap.Marker({  
		        map:mapObj,  
		        position:new AMap.LngLat(endPot.lng,endPot.lat), //基点位置  
		        icon:eicon, //复杂图标  
		        offset:{x:-16,y:-34}, //相对于基点的位置  
		        zIndex:10  
		    });  
		    //绘制乘车的路线  
		        busPolyline = new AMap.Polyline({  
		            map:mapObj,  
		            path:BusArr,  
		            strokeColor:"#005cb5",//线颜色  
		            strokeOpacity:0.8,//线透明度  
		            strokeWeight:6//线宽  
		        });  
		        mapObj.setFitView();  
		}  
		
		//地点查询函数       
		function placeSearch(type){   
			
			if(type==1){
				if(pageinfo["page"]>=pageinfo["tp"]){
					return;
				}
			}
			else if(type==-1){
				if(pageinfo["page"]<=1){
					return;
				}
			}
			pageinfo["page"]=pageinfo["page"]+type;
			pageinfo["size"]=20;
			
			marklist=[],inforWindowArray=[];
			clearMark(true);
			
			
		    var MSearch;  
		    mapObj.plugin(["AMap.PlaceSearch"], function() {          
		         var PlaceSearchOptions = { //设置PlaceSearch属性  
		        city: "上海", //城市  
		        type: "", //数据类别  
		        pageSize: pageinfo["size"], //每页结果数,默认10  
		        pageIndex: pageinfo["page"], //请求页码，默认1  
		        extensions: "base" //返回信息详略，默认为base（基本信息）  
		    };  
			MSearch = new AMap.PlaceSearch(PlaceSearchOptions); //构造地点查询类  
		        AMap.event.addListener(MSearch, "complete", placeSearch_CallBack); //查询成功时的回调函数  
		        AMap.event.addListener(MSearch, "error", function(error){  //打印错误信息  
		            console.log("error:", error);  
		        });   
		        MSearch.searchInBounds("公交|地铁", mapObj.getBounds()); //范围查询  
		    });    
		}  
		
		//回调函数   
		function placeSearch_CallBack(data){    
			$('#result_info').show();
			$('#map_search').hide();
			if(data.poiList.count%pageinfo["size"]==0)
    	    	pageinfo["tp"]=data.poiList.count/pageinfo["size"];
    	    else
    	    	pageinfo["tp"]=Math.ceil(data.poiList.count/pageinfo["size"]);
			
		    var resultArr = data.poiList.pois;  
		    var resultCount = data.poiList.pois.length;  
		    
		    var array=[];
    		array.push('<table width="95%" border="0" cellspacing="0" cellpadding="0">');
    		 for (var i = 0; i < resultCount; i++) {
    			addMyMarker('bus', resultArr[i],i); 
    			 
    			var str='<tr class="tr-map" value="'+i+'"><td valign="top" style="padding-top:4px;padding-bottom:4px;border:0px solid #2472df;cursor:pointer;color:#2472df;font-size:14px;">'+createMyIconSmall(i);
    			str +='&nbsp;&nbsp;&nbsp;&nbsp;</td><td style="width:187px;text-align:left;padding-bottom:10px;cursor:pointer;color:#000;font-size:14px;"><span style="color:#2472df;cursor:pointer;">'+ resultArr[i].name +'</span>'+TipContents(resultArr[i].type, resultArr[i].address, resultArr[i].tel)+'</td></tr/>';
			    array.push(str);
    		} 
    		 var str ='<table style="margin-top:20px;text-align:left;width:95%;height:30px;line-height:30px;font-size:12px;"><tr><td>'+pageinfo["page"]+'页/共'+pageinfo["tp"]+'页</span>&nbsp;&nbsp;</td><td width="114" style="text-align:right;"><ul class="ul_transfer_search">'+
	    		'<li  onclick="placeSearch(-1)" style="width:50px;height:24px;border-right:1px solid #ccc;">上页</li>'+
	    		'<li  onclick="placeSearch(1)" style="width:50px;height:24px;margin-left:4px;border-right:1px solid #ccc;">下页</li>'+
	    		'</ul></td></tr></table>';
		    $('#result').html(array.join('')+'</table>'+str);
		    initMapDataHover();
		}      
		function TipContents(type,address,tel){     
		    if (type == "" || type == "undefined" || type == null || type == " undefined" || typeof type == "undefined") {    
		        type = "暂无";    
		    }    
		    if (address == "" || address == "undefined" || address == null || address == " undefined" || typeof address == "undefined") {    
		        address = "暂无";    
		    }    
		    if (tel == "" || tel == "undefined" || tel == null || tel == " undefined" || typeof address == "tel") {    
		        tel = "暂无";    
		    }    
		    var str ='<span style="font-size:12px;color:#9a9a9c;"><br/>地址：'+address+'<br />电话：'+ tel+'</span>';    
		    return str;    
		}   
		
		
		
		//输入提示  
		function autoSearch() {  
		    var keywords = document.getElementById(currInputId).value;  
		    var auto;  
		    //加载输入提示插件  
		    mapObj.plugin(["AMap.Autocomplete"], function() {  
		        var autoOptions = {  
		            city: "上海" //城市，默认全国  
		        };  
		        auto = new AMap.Autocomplete(autoOptions);  
		        //查询成功时返回查询结果  
		        if ( keywords.length > 0) {  
		            AMap.event.addListener(auto,"complete",autocomplete_CallBack);  
		            auto.search(keywords);  
		        }  
		        else {  
		            document.getElementById("result_"+currInputId).style.display = "none";  
		        }  
		    });  
		}  
		function autocomplete_CallBack(data) {  
		    var resultStr = "";  
		    var tipArr = [];  
		    tipArr = data.tips;  
		    if (tipArr != undefined &&  tipArr.length>0) {                   
		        for (var i = 0; i < tipArr.length; i++) {  
		            resultStr += "<div id='divid" +currInputId+ (i + 1) + "' onmouseover='openMarkerTipById1(" + (i + 1)  
		                        + ",this)' onclick='selectResult(" + i + ")' onmouseout='onmouseout_MarkerStyle(" + (i + 1)  
		                        + ",this)' style=\"font-size: 13px;cursor:pointer;padding:5px 5px 5px 5px;\">" + tipArr[i].name + "<span style='color:#C1C1C1;'>"+ tipArr[i].district + "</span></div>";  
		        }  
		    }  
		    else  {  
		        resultStr = " π__π 亲,人家找不到结果!<br />要不试试：<br />1.请确保所有字词拼写正确。<br />2.尝试不同的关键字。<br />3.尝试更宽泛的关键字。";  
		    }  
		    document.getElementById("result_"+currInputId).innerHTML = resultStr;  
		    document.getElementById("result_"+currInputId).style.display = "block";  
		}  
		//鼠标移入时样式  
		function openMarkerTipById1(pointid, thiss) {      
		    thiss.style.background = '#CAE1FF';  
		}  
		//鼠标移开后样式恢复  
		function onmouseout_MarkerStyle(pointid, thiss) {      
		    thiss.style.background = "";  
		}  
		//选择输入提示关键字  
		function selectResult(index) {  
		    if (navigator.userAgent.indexOf("MSIE") > 0) {  
		        document.getElementById(currInputId).onpropertychange = null;  
		        document.getElementById(currInputId).onfocus = focus_callback;  
		    }  
		    //截取输入提示的关键字部分  
		    var text = document.getElementById("divid"+currInputId + (index + 1)).innerHTML.replace(/<[^>].*?>.*<\/[^>].*?>/g,"");  
		    document.getElementById(currInputId).value = text;  
		    document.getElementById("result_"+currInputId).style.display = "none";  
		}  
		  
		function focus_callback() {  
		    if (navigator.userAgent.indexOf("MSIE") > 0) {  
		        document.getElementById(currInputId).onpropertychange = autoSearch;  
		    }  
		}  
		var currInputId=null;
		function focus_fun(obj) { 
			currInputId=obj;
		if (navigator.userAgent.indexOf("MSIE") > 0) {  
	        document.getElementById(currInputId).onpropertychange = autoSearch;
	    }  
	    else {  
	        document.getElementById(currInputId).oninput = autoSearch; 
	    } 
		}
		 
		 function myLocation(myLocationRefresh){
			
			if(circleLocation==null){
			
				$.ajax({
				     type: "POST",
				     url : '${ctx}/user!findMyLocation.action',
				     dataType:'json',
				     data:pageinfo,
				     success: function(msg,status){
				    	if(msg.status == 200){	
				    		locationP = new AMap.LngLat(msg.rows.lng,msg.rows.lat);
				    		if(mapObj!=null){
								//在地图上绘制圆形覆盖物   
								if(myLocationRefresh){
									mapObj.setCenter(locationP);
								}
								
								if(circleLocation!=null && circleLocationSmall!=null){
									circleLocationSmall.setMap(null); 
									circleLocation.setMap(null); 
								}
								   
								circleLocation = new AMap.Circle({    
								   center:locationP,// 圆心位置   
								   radius:100, //半径   
								   strokeColor: "#00a6ac", //线颜色   
								   strokeOpacity: 1, //线透明度   
								   strokeWeight: 3, //线粗细度   
								   fillColor: "#2472df", //填充颜色   
								   fillOpacity: 0.25//填充透明度   
								   }); 
								circleLocationSmall = new AMap.Circle({    
									   center:locationP,// 圆心位置   
									   radius:10, //半径   
									   strokeColor: "#00a6ac", //线颜色   
									   strokeOpacity: 0, //线透明度   
									   strokeWeight: 0, //线粗细度   
									   fillColor: "#00a6ac", //填充颜色   
									   fillOpacity: 0.80//填充透明度   
									   }); 
								circleLocationSmall.setMap(mapObj); 
								circleLocation.setMap(mapObj); 
							}
				    	}
				    	else{
				    		if(errorFlag==0){
				    			//alert(msg.msg);
				    			errorFlag=1;
				    		}
				    		
				    	}
				     }
				});
			}
			
			
			if(locationP!=null && mapObj!=null){
				//在地图上绘制圆形覆盖物 
					if(myLocationRefresh){
						mapObj.setCenter(locationP);
					}
				
				if(circleLocation!=null && circleLocationSmall!=null){
					circleLocationSmall.setMap(null); 
					circleLocation.setMap(null); 
				}
				   
				circleLocation = new AMap.Circle({    
				   center:locationP,// 圆心位置   
				   radius:100, //半径   
				   strokeColor: "#00a6ac", //线颜色   
				   strokeOpacity: 1, //线透明度   
				   strokeWeight: 3, //线粗细度   
				   fillColor: "#2472df", //填充颜色   
				   fillOpacity: 0.25//填充透明度   
				   }); 
				circleLocationSmall = new AMap.Circle({    
					   center:locationP,// 圆心位置   
					   radius:10, //半径   
					   strokeColor: "#00a6ac", //线颜色   
					   strokeOpacity: 0, //线透明度   
					   strokeWeight: 0, //线粗细度   
					   fillColor: "#00a6ac", //填充颜色   
					   fillOpacity: 0.80//填充透明度   
					   }); 
				circleLocationSmall.setMap(mapObj); 
				circleLocation.setMap(mapObj); 
			}
			  

		}
		  function findLocation(){
			  if("${user.userId}"==""){
					alert('请登录!');
					return;
				}
			  errorFlag=0;
			  
			  myLocation(true);
		  }
		  
</script>
