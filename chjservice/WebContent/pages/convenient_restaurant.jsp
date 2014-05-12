<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />
<title>漕河泾e服务</title>

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
width:230px;height:230px;cursor:pointer;
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

ul.searchNav{
margin:0;
}
ul.searchNav  li{
	border:0px solid #ccc;
	text-align:center;
	float:left;
	width:130px;
	height:50px;
	list-style:none;
	background:#5fcacf;
	color:#fff;
	margin-left:10px;
	font-size:18px;
}

ul.searchNav  li:hover{
	cursor:pointer;
}
ul .search_menuediv{
margin:14px 0 0 0px;
}
ul.searchNav  li ul{
display:none;
position:absolute;
z-index:999999999;
position: absolute;
width:140px;
}
ul.searchNav  li ul li{
border:0px solid #ccc;
background:#5fcaa2;
font-size:14px;
padding-top:10px;
height:30px;
}
ul.searchNav  li ul li:hover{
background:#FF8040;
}

ul#search1{
width:700px;
margin-top:10px;
}


ul#search1 li{
margin-left:0px;
border:0px solid #ccc;
}
/* #search2{
width:700px;
margin-top:10px;
}
#search2 li{
margin-left:0px;
border:0px solid #ccc;
} */
</style>

</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />


<div class="main">
<div id="main_content" class="main_content">
   

<div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	     <div style="float:left;"><img src="${ctx}/images/menu_12.jpg" onclick="gotoPage('${ctx}/pages/convenient.jsp')"/></div>
            <div class="menu1"><img src="${ctx}/images/menu_7.jpg" onclick="gotoPage('${ctx}/pages/convenient_brand.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_3.jpg" onclick="gotoPage('${ctx}/pages/convenient_restaurant.jsp')" style="width:190px;"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_9.jpg" onclick="gotoPage('${ctx}/pages/convenient_tuiguang.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_10.jpg" onclick="gotoPage('${ctx}/pages/convenient_cuxiao.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_11.jpg" onclick="gotoPage('${ctx}/pages/convenient_categories.jsp')"/></div>
           <div><img src="${ctx}/images/menu_14.jpg" style="width:285px;" /></div>
	    </div>
  
</div>
  
    

 <div style="padding:10px 25px 0 25px;">
	<div>
     <ul class="searchNav" >
	  <li style="margin-left:0px;">
	  <div class="search_menuediv">要啥？</div>
	    <ul id="search1">
	    
	    </ul>
	  </li>
	<!-- <li>
	  <div class="search_menuediv">哪有？</div>
	    <ul id="search2" style="width:750px;">
	      
	    </ul>
	  </li> -->
	  <li>
	  <div class="search_menuediv">外送？</div>
	    <ul id="search2" style="margin:10px 0 0 -10px;">
	       <li value="0">全部</li>
	        <li value="T">支持外送</li>
	        <li value="L">在线预订</li>
	        <li value="F">服务展示</li>
	    </ul>
	  </li>
	  <li>
	  <div class="search_menuediv">多久？</div>
	    <ul id="search3" style="margin:10px 0 0 -10px;">
	        <li value="0">全部</li>
	        <li value="1">30分钟以内</li>
	        <li value="2">60分钟以内</li>
	        <li value="3">90分钟以内</li>
	        <li value="4">请电话确认</li>
	    </ul>
	  </li>
	
	  <li>
	  <div class="search_menuediv">多少钱？</div>
	    <ul id="search4" style="margin:10px 0 0 -10px;">
	        <li value="0">全部</li>
	      <li value="1">少于20元</li>
	       <li value="2">20元-50元</li>
	         <li value="3">多余50元</li>
	    </ul>
	  </li>
	  <li>
	  <div class="search_menuediv">起送价？</div>
	    <ul id="search5" style="margin:10px 0 0 -10px;">
	     <li value="-1">全部</li>
	      <li value="0">免费</li>
	       <li value="1">少于20元</li>
	       <li value="2">20元-50元</li>
	         <li value="3">多余50元</li>
	    </ul>
	  </li>
	   <li style="width:120px;">
	  	<div class="search_menuediv" onclick="serach_content()">走起！</div>
	  </li>
	   <li style="width:120px;">
	  	<div class="search_menuediv" onclick="reset_fun()">重来！</div>
	  </li>
	  </ul>
	  
 </div>
</div>

 
 <div style="clear:both;position:relative;height:50px; padding:10px 25px 0 25px;">
      <div style=" height:50px; width:950px; background-image:url(${ctx}/images/convenienttop_2.png)">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="94%" style="font-size:16px; color:#FFF; padding-left:20px; font-family:'黑体';"></td>
          
          </tr>
        </table>
      </div>
    </div>

<div id="div_restaraunt">
  	  
</div>


<div style="float:left; margin:10px 25px 0 25px; width:950px; height:40px;background:#fff;" >
<div id="pager" style="float:right;" ></div>
</div>


  <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>


 
 
 

</body>
</html>
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#pager").pager({ pagenumber: pageinfo["page"], pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
	
	$('. main_content img').lazyload({  
	placeholder : '<span class="Apple-style-span" style="font-family:sans serif, tahoma, verdana, helvetica;line-height:19px;white-space:normal;font-size:13px;">http://www.173it.cn/css/grey.gif</span>', //加载图片前的占位图片  
 	effect      : "fadeIn" //加载图片使用的效果(淡入)  
 });  

	initSearchMenue();
	
	findRestaraunt(1);
    findSendAreaList();
});

PageClick = function(pageclickednumber) {
    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
    findRestaraunt(pageclickednumber);
}
function serach_content(){
	$('#div_restaraunt').html('');
	findRestaraunt(1);
}
function searchByTagImpl(tag,time){
	pageinfo["tagList"]=tag;
	pageinfo["timeSpace"]=time;
	$('#div_restaraunt').html('');
	findRestaraunt(1);
}
function findRestaraunt(page){
	pageinfo["page"]=page;
	 
	$.ajax({
	     type: "POST",
	     url : context+'/product!findRestarauntMoreList.action',
	     dataType:'json',
	     data:pageinfo,
	     success: function(msg,status){
	    	if(msg.status == 200){	
	    		
	    	    if(msg.total%pageinfo["size"]==0)
	    	    	pageinfo["tp"]=msg.total/pageinfo["size"];
	    	    else
	    	    	pageinfo["tp"]=Math.ceil(msg.total/pageinfo["size"]);
	    		$("#pager").pager({ pagenumber: pageinfo["page"], pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
	    		
	    	   var array = [];
	    	   array.push('<table  width="100%" border="0" cellspacing="0" cellpadding="0">');
	    		  
	    	   for(var i=0; i < msg.rows.length; i++){
	    		   var data = msg.rows[i];
	    		  if(data["name"].length>10){
	    			  data["name"]=data["name"].substr(0,10)+'...';
	    		  }
	    		  var tag='';
	    		  if(data["tagList"].length>0)
	    			  tag += data["tagList"][0]["tagName"]+",";
	    		  if(data["tagList"].length>1)
	    			  tag += data["tagList"][1]["tagName"]+",";
	    		  tag = tag.substr(0,tag.length-1);
    		   var str='';
    		   if(i%4==0){
   			   str +='<tr><td  style="background:url(${ctx}/images/back_body.jpg);">'
   			       +'<div style="clear:both;float:left; padding:10px 25px 0 25px;"><div>'
   			       +'<div id="con'+i+'"  class="conv4" style="margin-left:0px;">';
   		   } else{
   			   str +='<div id="con'+i+'"  class="conv4">';
   			}    		   
   		  str +='<div class="flashNews"><img src="${imageStorePath}'+data["logo"]+'"/>'
	      +'<div class="bg1" style="cursor:pointer"'
	      +' onclick="gotoDetail('+data["companyShopId"]+')">&nbsp;'+data["name"]+'</div>'
	  	  +'</div>'
		  +'<div style="background-color:#FFF; height:50px; width:230px;">'
		  +'<div class="index_Productfont" style="color:#FF8040;overflow: hidden;height:50px;width:200px;">'+
		  '<span></span><span class="lable_title">'+tag+'</span></div>'
		  +'<div style="float:right;"><img src="${ctx}/images/od.png" style="width:20px;height:45px;"/>'
		  +'</div></div></div>';
		  
		  var star='';
 		  for(var h=0;h<data["starScore"];h++){
 			 star +=' <img src="${ctx}/images/brand_xx.png" style="width:12px;height:12px;"/>';
 		  }
 		  var collection='';
 		  if(data["isCollection"] ==0){
 			 collection = '<div style="color:#FF5809;overflow:hidden;width:220px;height:30px;"><a style="color:#FF5809;" href="javascript:void(0)" '+
 			 ' onclick="event.cancelBubble=true;user_collection('+data["companyShopId"]+')">收藏</a></div>';
 		  }else if(data["isCollection"]>0){
 			 collection='<div style="overflow:hidden;width:220px;height:30px;color:#FF5809;">已收藏</div>';
 		  }
 		 
 		  var gotoResta = '<span style="cursor:pointer;margin-left:74px;color:#fff;background:#ff6532;padding:6px 10px 6px 10px;" '+
 		  '>进入店铺</span>';
 		 if(i%4==0){
   			   str +='<div id="con'+i+'-con'+i+'" class="conv5" style="display:none;cursor:pointer;margin-left:0px;" onclick="gotoDetail('+data["companyShopId"]+')">';
   		  }else{
   			   str +='<div id="con'+i+'-con'+i+'" class="conv5" style="display:none;cursor:pointer;" onclick="gotoDetail('+data["companyShopId"]+')">';
   		  }
   		 str +='<div style="maring-top:10px;margin-left:10px;padding-top:10px;">'
	      +'<div style="overflow:hidden;width:210px;height:30px;color:#FF5809;font-size:20px;font-weight:bold;">'+data["name"]+'</div>'
		  + '<div style="overflow:hidden;width:220px;height:30px;">'+star+'</div>'
		  +'<div style="overflow:hidden;width:220px;height:30px;font-size:14px;">人均:&nbsp;<span style="color:#FF5809;">'+data["consumptionPer"] +'</span></div>'
		  + '<div style="overflow:hidden;width:220px;height:68px;font-size:14px;">简介:&nbsp;';
	   	 
		  var content=removeHTMLTag(data["content"]);
		 
		  if(content.length>44){
			  str +=content.substr(0,44)+'...';
		  }else{
			  str+=content;
		  }
		  
		 
		 str +='</div><div style="overflow:hidden;width:220px;height:30px;font-size:14px;margin-top:10px;">月销量:&nbsp;'+
		 '<span style="color:#FF5809;">'+data["sellCount"]+'</span></div>'
		  +collection
		  +  '<div style="overflow:hidden;width:220px;height:30px;color:#FFF;font-size:14px;">'
		  + gotoResta+'</div>'
		  +'</div></div>';
	   	  if(i%4==3 || i==msg.rows.length-1){
	    	 str +='</div></div></td></tr>';
	    	 }
	      array.push(str);
		 }
			    	   
	 	   $('#div_restaraunt').html(array.join('')+'</table>');
	 	  if(msg.rows.length==0 && pageinfo["page"]==1){
	 		 window.alert(pageinfo["emtMsg"]);
   		   $('#div_restaraunt').html('<div style="float:left; margin:10px 25px 0 25px; width:950px; height:40px;line-height:40px;text-align:center;background:#fff; ">'+pageinfo["emtMsg"]+'</div>');
   	   }
	 	   
	 	   
	 	   $("#div_restaraunt .conv4").click(function() {
	  		  var obj = $(this);
	  		  obj.hide();
	  		  $('#'+obj.attr('id')+'-'+obj.attr('id')).show();
	  		  
	  		
	  	  });
				    			
		   	
	   	$("#div_restaraunt .conv5").hover(function() {
	   	  }, function() {
	   		 var obj = $(this);
			obj.hide();
			 $('#'+obj.attr('id').split('-')[0]).show();
	   	 });  		
	   	} else{
	   		alert(msg.msg);
	   	}
	 } 
	});
}

//function search_keyword(){
//	findRestaraunt(1);
//}
function productDetail(id){
	location.href="${ctx}/product!productDetail.action?productId="+id;
}

function findSendAreaList(){
	$.ajax({
	     type: "POST",
	     url : context+'/product!findSendAreaList.action',
	     dataType:'json',
	     data:pageinfo,
	     success: function(msg,status){
	    	if(msg.status == 200){	
	    		
	    		var array=[];
	    		array.push(' <li style="width:140px;" value="0">全部</li>');
	    		var total=0;
	    		if((msg.rows.area.length+1)%5==0)
	    			total = msg.rows.area.length+1;
	    		else
	    			total = Math.ceil((msg.rows.area.length+1)/5)*5;
	    		/**for(var i=0; i<total-1;i++){
	    			if(i < msg.rows.area.length)
	    				array.push(' <li style="width:140px;" value="'+msg.rows.area[i]["areaId"]+'">'+msg.rows.area[i]["areaName"]+'</li>');
	    			else
	    				array.push('<li  style="width:140px;" value="-1"></li>');
	    		}
	    		$('#search2').html(array.join(''));*/
	    		array=[];
	    		array.push(' <li value="0">全部</li>');
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
function reset_fun(){
	$.each($(".searchNav li ul li"),function(){
		var selVal = this.getAttribute("value");
		var title = $(this).parent().parent().find('div');
		if($(this).parent().attr("id")=="search1"){
			if(selVal==0){
				title.html('要啥？');
				pageinfo["categoryId"]="";
			}
		}
		else if($(this).parent().attr("id")=="search2"){
			if(selVal==0){
				/* title.html('哪有？');
				pageinfo["areaThirdId"]=""; */
				title.html('外送？');
				pageinfo["deliverOk"]="";
			}
		}
		else if($(this).parent().attr("id")=="search3"){
			if(selVal==0){
				title.html('多久？');
				pageinfo["sendTime"]="";
			}
		}
		else if($(this).parent().attr("id")=="search4"){
			if(selVal==0){
				title.html('多少钱？');
				pageinfo["consumptionPer"]="";
				
			}
		}
		else if($(this).parent().attr("id")=="search5"){
			if(selVal==-1){
				title.html('起送价?');
				pageinfo["sendPrice"]="";
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
			title.html('要啥？');
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
			/* title.html('哪有？');
			pageinfo["areaThirdId"]=""; */
			title.html('外送？');
			pageinfo["deliverOk"]="";
		}
		else{
			if(selVal==-1){
				
			}
			else{
				title.html($(this).text().length>5?$(this).text().substr(0,5)+'...':$(this).text());
				//pageinfo["areaThirdId"]=selVal;
				pageinfo["deliverOk"]=selVal;
			}
			
		}
			
	}
	else if($(this).parent().attr("id")=="search3"){
		if(selVal==0){
			title.html('多久？');
			pageinfo["sendTime"]="";
		}
		else{
				title.html($(this).text());
				pageinfo["sendTime"]=selVal;
		}
			
	}
    else if($(this).parent().attr("id")=="search4"){
    	if(selVal==0){
    		title.html('多少钱？');
    		pageinfo["consumptionPer"]="";
    	}
    	else{
    		title.html($(this).text());
    		pageinfo["consumptionPer"]=selVal;
    	}
    	
    }
    else if($(this).parent().attr("id")=="search5"){
    	if(selVal==-1){
    		title.html('起送价？');
    		pageinfo["sendPrice"]="";
    	}
    	else{
    		title.html($(this).text());
    		pageinfo["sendPrice"]=selVal;
    	}	
    }
	
	 });
}
var userCollectionFlag={};
function user_collection(shopId){
	if(userCollectionFlag[""+shopId]){
		alert('已收藏!');
		return;
	}
	$.ajax({
	     type: "POST",
	     url : context+'/user!collectionUserRestarant.action',
	     dataType:'json',
	     data:{objectId:shopId,type:1},
	     success: function(msg,status){
	    	if(msg.status == 200){	
	    	  userCollectionFlag[""+shopId]=true;
	    	  alert('收藏成功!');
	    	}
	    	else
	    	  alert('收藏失败!');
	     }
	});
}
function gotoDetail(shopId){
	$('#formturn').attr('action',"${ctx}/product!findRestarauntDetail.action");
	$('#companyShopId').val(shopId);
	$('#formturn').submit();
}

</script>
