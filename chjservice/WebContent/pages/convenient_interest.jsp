<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />
<link rel=stylesheet type=text/css href="${ctx}/css/slider.css">
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
	     <div style="float:left;"><img src="${ctx}/images/menu_1.jpg" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_7.jpg" onclick="gotoPage('${ctx}/pages/convenient_brand.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_8.jpg" onclick="gotoPage('${ctx}/pages/convenient_restaurant.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_9.jpg" onclick="gotoPage('${ctx}/pages/convenient_tuiguang.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_10.jpg" onclick="gotoPage('${ctx}/pages/convenient_cuxiao.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_11.jpg" onclick="gotoPage('${ctx}/pages/convenient_categories.jsp')"/></div>
           <div><img src="${ctx}/images/menu_14.jpg" style="width:285px;" /></div>
	    </div>
  
</div>
  

 
<script>
	$(function(){
		//滚动Banner图片的显示
		$('#slides').slides({
			preload: false,
			preloadImage: '/images/loading.gif',
			effect: 'slide',
			slideSpeed: 400,
			fadeSpeed: 100,
			play: 2000,
			pause: 100,
			hoverPause: true
		});
        
    	});
	</script>
<!-- 滚动图片 -->


<div id="slides" class="banner">
<div class="bannerImg">
	<div class="slides_container">
	  <div><a href="#" ><img src="${ctx}/images/banner05.jpg" width="950" height="256"></a></div>
	  <div><a href="#" ><img src="${ctx}/images/banner04.jpg" width="950" height="256"></a></div>
	  <div><a href="#" ><img src="${ctx}/images/banner02.jpg" width="950" height="256"></a></div>
	  <div><a href="#" ><img src="${ctx}/images/banner03.jpg" width="950" height="256"></a></div>
	</div>
</div>
</div>

  
 <div id="div_tag_title" style="position:relative;height:50px; padding:10px 25px 0 25px;">
      <div style=" height:50px; width:950px; background-image:url(${ctx}/images/convenienttop_6.png)">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="93%" style="font-size:16px; color:#FFF; padding-left:20px; font-family:'黑体';"></td>
            </tr>
        </table>
   </div>
</div>

<div id="div_interest">
</div>

<div style="float:left; margin:10px 25px 0 25px; width:950px; height:40px; " >
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

	findProductInterest(1);
	
});
PageClick = function(pageclickednumber) {
    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
    findProductInterest(pageclickednumber);
}
function findProductInterest(page){
	pageinfo["page"]=page;
	
	$.ajax({
	     type: "POST",
	     url : context+'/product!findProductInterestList.action',
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
	    	   for(var i=0; i < msg.rows.length; i++){
	    		   var data = msg.rows[i];
	    		 
	    		   if(i%4==0){
	    			   array.push('<div style="float:left; padding:10px 25px 0 25px;"><div>');
	    			   array.push('<div  class="conv3" style="margin-left:0px;">');
	    		   }
	    		   else{
	    			   array.push('<div class="conv3">');
	    		   }
	    		   if(data["name"].length>12){
	    			   data["name"]=data["name"].substr(0,12)+'...';
	    		   }
	    		   var price='',oldPrice='',companyShopProductSkuId='';
	    		   if(data["sku"]!=null){
	    			   price =data["sku"]["price"];
	    			   oldPrice =data["sku"]["oldPrice"];
	    			   companyShopProductSkuId=data["sku"]["companyShopProductSkuId"];
	    		   }
	    		   var priceType="促销价";
	    		   if(data["functionType"]=="T")
	    			   priceType="推广价";
	    		  array.push('<div onclick="productDetail(3,'+data["productId"]+','+data["companyShopProductId"]+','+data["companyShopId"]+','+companyShopProductSkuId+')" style="cursor:pointer;background-image:url(${ctx}'+data["image"]+'); width:230px; height:160px;"> </div>');
	    		  array.push('<div class="brand_pic"><p>'+priceType+'：<span class="brand_pictx">￥'+price+'</span></p><p class="lable_title">市场价：<span class="brand_picx">￥'+oldPrice+'</span></p>');
	    		  array.push('<p>'+data["name"]+'</p></div></div>');
	    		  
	    		  if(i%4==3 || i==msg.rows.length-1){
	    			   array.push('</div></div>');
	    		   }
	    	   }
	    	   $('#div_interest').html(array.join(''));
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
	
		 } 
	});
}
//function search_keyword(){
//	findProductTuiguang(1);	
//}

</script>
