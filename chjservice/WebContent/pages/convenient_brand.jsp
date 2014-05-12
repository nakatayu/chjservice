<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/slider.css" />
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
width:230px;height:210px;cursor:pointer;
}
.fun4{
float:left;margin-left:10px;
}
.fun4 img{
width:230px;height:230px;cursor:pointer;
}
.index_Productfont{float:left;padding-left:10px; line-height:50px;width:190px; 

</style>

</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />
<script type=text/javascript src="${ctx}/js/slides.jquery.js"></script>


<div class="main">
<div id="main_content" class="main_content">
   

<div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	     <div style="float:left;"><img src="${ctx}/images/menu_12.jpg" onclick="gotoPage('${ctx}/pages/convenient.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_2.jpg" style="width:190px;"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_8.jpg" onclick="gotoPage('${ctx}/pages/convenient_restaurant.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_9.jpg" onclick="gotoPage('${ctx}/pages/convenient_tuiguang.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_10.jpg" onclick="gotoPage('${ctx}/pages/convenient_cuxiao.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_11.jpg" onclick="gotoPage('${ctx}/pages/convenient_categories.jsp')"/></div>
           <div><img src="${ctx}/images/menu_14.jpg" style="width:285px;" /></div>
	    </div>
  
</div>
  



<div id="slides" class="banner">
<div class="bannerImg">
	<div class="slides_container">
	 <%--  <div><a href="#" ><img src="${ctx}/images/banner05.jpg" width="950" height="256"/></a></div>
	  <div><a href="#" ><img src="${ctx}/images/banner04.jpg" width="950" height="256"/></a></div>
	  <div><a href="#" ><img src="${ctx}/images/banner02.jpg" width="950" height="256"/></a></div>
	  <div><a href="#" ><img src="${ctx}/images/banner03.jpg" width="950" height="256"/></a></div> --%>
	</div>
</div>
</div>


<div style="position:relative;height:50px; padding:10px 25px 0 25px;">
      <div style=" height:50px; width:950px; background-image:url(${ctx}/images/convenienttop_1.png)">
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="94%" style="font-size:16px; color:#FFF; padding-left:20px; font-family:'黑体';"></td>
          </tr>
        </table>
      </div>
   </div>
    

<div id="div_brand">

</div>

<div style="float:left; margin:10px 25px 0 25px; width:950px;">
  <div id="loadmore" onclick="loadMore()" style="cursor:pointer;height:55px; width:950px; background-color:#FFF;"> 
  <p id="loadMoreText" style="text-align:center; padding-top:18px;font-size:14px;color:4c4c4c;font-family:黑体;">加载更多</p> 
  </div>
 </div>
 
 
  <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>


 
 
 

</body>
</html>
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$.ajax({
	     type: "POST",
	     url : '${ctx}/common!findAds.action',
	     dataType:'json',
	     data:{type:5},
	     success: function(msg,status){
	    	 var str='';
	    	 for(var i=0;i<msg.length;i++){
	    		 str+='<div><a href="'+msg[i]["linkAddress"]+'" ><img src="${imageStorePath}'+msg[i]["path"]+'" width="950" height="256" target="_blank"/></a></div>';
	    	 }
	    	 $('.slides_container').html(str);
	    	//滚动Banner图片的显示
    		$('#slides').slides({
    			preload: false,
    			preloadImage: '/images/loading.gif',
    			effect: 'slide',
    			slideSpeed: 400,
    			fadeSpeed: 100,
    			play: 30000,
    			pause: 100,
    			hoverPause: true
    		});
	     }
	});	 	
	
	pageinfo["page"]=1;
	findBrandMoreList();
	
});
function loadMore(){
	if(pageinfo["more"]){
		findBrandMoreList();
	}
}
function searchByTagImpl(tag,time){
	pageinfo["tagList"]=tag;
	pageinfo["timeSpace"]=time;
	$('#div_brand').html('');
	pageinfo["more"]=true;
	$('#loadMoreText').html('加载更多');
	pageinfo["page"]=1;
	findBrandMoreList();
}
function findBrandMoreList(){
	pageinfo["size"]=8;
	$.ajax({
	     type: "POST",
	     url : '${ctx}/product!findBrandMoreList.action',
	     dataType:'json',
	     data:pageinfo,
	     success: function(msg,status){
	    	if(msg.status == 200){
	    	
	    	
	    	   var array = [];
	    	   for(var i=0; i < msg.rows.length; i++){
	    		   var data = msg.rows[i];
	    		 	
	    		   if(i%4==0){
	    			   array.push('<div style="float:left; padding:10px 25px 0 25px;"><div>');
	    		   	   array.push('<div  class="conv2" style="margin-left:0px;">');
	    	   		}
	    		   else
	    				array.push('<div class="conv2">');
	    		   data["name"]=data["name"];
	    		   if(data["name"].length>12){
	    			   data["name"]=data["name"].substr(0,12)+'...';
	    	   	   }
	    		  array.push('<img src="${imageStorePath}'+data["logo"]+'" style="cursor:pointer;" onclick="window.location.href=\'${ctx}/pages/convenient_brandpinfo.jsp?companyId='+data["companyId"]+'\'"  />');
	    		  array.push('<div style="background-color:#FFF; height:60px; width:230px;border-top:1px solid #f00;">');
	    		  array.push(' <div class="indexbrandfont" style="height:40px;width:230px;overflow:hidden;cursor:pointer;" onclick="window.location.href=\'${ctx}/pages/convenient_brandpinfo.jsp?companyId='+data["companyId"]+'\'" >'+data["name"]+'</div>');
	    		  array.push(' <div style="float:left;width:230px;padding:0px 4px 4px 8px">');
	    		  for(var h=0;h<data["starScore"];h++){
	    			  array.push('<img src="${ctx}/images/brand_xx.png" style="width:12px;height:12px;"/>');
	    		  }
	    		  array.push('</div>');
	    		  array.push('</div>');
	    		  array.push('</div>');
	    		  
	    		  if(i%4==3 || i==msg.rows.length-1){
	    			   array.push('</div></div>');
	    		   }
	    	   }
	    		$('#div_brand').append(array.join(''));
	    		if(msg.rows.length<pageinfo["size"]){
				 if(msg.rows.length==0 && pageinfo["page"]==1){
			       window.alert('未查询到数据!');
				  }
	    			pageinfo["more"]=false;
	    			$('#loadMoreText').html('没有更多了!');
	    		}
	    		else{
	    			pageinfo["page"]++;
	    		}
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
	
		 } 
	});
}


</script>
