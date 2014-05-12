<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>漕河泾e服务</title>
<!-- 公共css,js -->
<link rel="stylesheet" type="text/css" href="${ctx}/css/css.css" />

<style type="text/css">

.conv_category{
float:left;
margin-left:10px;
background:#fff;
height:300px; 
width:230px;
}
.conv_category img{
width:230px;height:230px;cursor:pointer;
}
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
background:#fff;
height:320px; 
width:230px;
}
.conv3 img{
width:230px;height:230px;cursor:pointer;
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
img {cursor:pointer}
.index_Productfont{float:left;padding-left:10px; line-height:50px;width:190px; 


</style>

</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />
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
  

  <div id="hotpic" style="padding-top:10px;">
        <div id="NewsPic">
            <%-- <a  href="#" style="visibility: visible; display: block;">
                <img width="950" height="285" src="${ctx}/images/cov1.jpg" class="Picture"  /></a>
            <a style="visibility: hidden; display: none;"  href="#">
                <img class="Picture" src="${ctx}/images/cov2.jpg" style="width:950px; height:285px;"  /></a>
            <a style="visibility: hidden; display: none;" href="#">
                <img class="Picture" src="${ctx}/images/cov3.jpg" style="width:950px; height:285px;" /></a>
			<div class="Nav">
                <span class="Normal">3</span>
                <span class="Normal">2</span>
                <span class="Cur">1</span>
            </div> --%>
        </div> 
    </div>
    
    
    

    
    
<div style="position:relative;height:50px; padding:10px 25px 0 25px;">
      <div style=" height:50px; width:950px; background-image:url(${ctx}/images/convenienttop_1.png)">
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="94%" style="font-size:16px; color:#FFF; padding-left:20px;"></td>
            <td width="6%"><img onclick="location.href='${ctx}/pages/convenient_brand.jsp'" src="${ctx}/images/sharechj_more.png" width="61" height="42" /></td>
          </tr>
        </table>
      </div>
   </div>
    
    
<div style="padding-top:10px;">
  <div style="position:relative; padding:0 25px 0 25px;">
	   <div id="div_brand">
	     
	   </div>
 </div>
 </div>
 
 
 

 
 <div style="clear:both;position:relative;height:50px; padding:10px 25px 0 25px;">
      <div style=" height:50px; width:950px; background-image:url(${ctx}/images/convenienttop_2.png)">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="94%" style="font-size:16px; color:#FFF; padding-left:20px;"></td>
            <td width="6%"><img onclick="location.href='${ctx}/pages/convenient_restaurant.jsp'"  src="${ctx}/images/sharechj_more.png" width="61" height="42" /></td>
          </tr>
        </table>
      </div>
    </div>
    
 <div style="clear:both;position:relative; padding:10px 25px 0 25px;height:280px;">
<div>
	   <div id="div_restaurant">
       <!-- 
       <div class="fun4" style="margin-left:0px;">
		<div class="flashNews"><img src=""/>
	   <div class="bg">
 		<div style="color:#fff;float:left;padding-left:4px;overflow: hidden;">dd</div>
	   <div style="float:right;text-align:right;overflow: hidden;width:120px;">
	   <span style="font-size:12px;">人均</span>
	   <span style="padding-right:4px;font-size:18px;">34</span>
	   </div></div></div>
	    <div style="background-color:#FFF; height:50px; width:230px;">
	   <div class="index_Productfont" style="color:#FF8040;overflow: hidden;height:50px;width:200px;"><span></span><span class="lable_title">sdf</span></div>
	   <div style="float:right;"><img src="${ctx}/images/od.png" style="width:20px;height:45px;"/></div>'
	   </div>
	   </div>
	   
	    <div class="fun4">
		<div class="flashNews"><img src=""/>
	   <div class="bg">
 		<div style="color:#fff;float:left;padding-left:4px;overflow: hidden;">dd</div>
	   <div style="float:right;text-align:right;overflow: hidden;width:120px;">
	   <span style="font-size:12px;">人均</span>
	   <span style="padding-right:4px;font-size:18px;">34</span>
	   </div></div></div>
	    <div style="background-color:#FFF; height:50px; width:230px;">
	   <div class="index_Productfont" style="color:#FF8040;overflow: hidden;height:50px;width:200px;"><span class="lable_title">sdf</span></div>
	   <div style="float:right;"><img src="${ctx}/images/od.png" style="width:20px;height:45px;"/></div>'
	   </div>
	   </div>
	   
	   <div class="fun4">
		<div class="flashNews"><img src=""/>
	   <div class="bg">
 		<div style="color:#fff;float:left;padding-left:4px;overflow: hidden;">dd</div>
	   <div style="float:right;text-align:right;overflow: hidden;width:120px;">
	   <span style="font-size:12px;">人均</span>
	   <span style="padding-right:4px;font-size:18px;">34</span>
	   </div></div></div>
	    <div style="background-color:#FFF; height:50px; width:230px;">
	   <div class="index_Productfont" style="color:#FF8040;overflow: hidden;height:50px;width:200px;"><span class="lable_title">sdf</span></div>
	   <div style="float:right;"><img src="${ctx}/images/od.png" style="width:20px;height:45px;"/></div>'
	   </div>
	   </div>
	   
	   <div class="fun4">
		<div class="flashNews"><img src=""/>
	   <div class="bg">
 		<div style="color:#fff;float:left;padding-left:4px;overflow: hidden;">dd</div>
	   <div style="float:right;text-align:right;overflow: hidden;width:120px;">
	   <span style="font-size:12px;">人均</span>
	   <span style="padding-right:4px;font-size:18px;">34</span>
	   </div></div></div>
	    <div style="background-color:#FFF; height:50px; width:230px;">
	   <div class="index_Productfont" style="color:#FF8040;overflow: hidden;height:50px;width:200px;"><span class="lable_title">sdf</span></div>
	   <div style="float:right;"><img src="${ctx}/images/od.png" style="width:20px;height:45px;"/></div>'
	   </div>
	   </div>
	    -->
	    		  
	    </div>
</div>
</div>
    
    
 
 
 <div style="height:50px; padding:10px 25px 0 25px;">
      <div style=" height:50px; width:950px; background-image:url(${ctx}/images/convenienttop_3.png)">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="94%" style="font-size:16px; color:#FFF; padding-left:20px;"></td>
            <td width="6%"><img onclick="location.href='${ctx}/pages/convenient_tuiguang.jsp'" src="${ctx}/images/sharechj_more.png" width="61" height="42" /></td>
          </tr>
        </table>
      </div>
    </div>
 <div style="clear:both;position:relative; padding:10px 25px 0 25px;height:300px;">
	   <div id="div_tuiguang">
	      
	   </div>
 </div>
 
 
 <div style="position:relative;height:50px; padding:10px 25px 0 25px;">
      <div style=" height:50px; width:950px; background-image:url(${ctx}/images/convenienttop_4.png)">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="94%" style="font-size:16px; color:#FFF; padding-left:20px;"></td>
            <td width="6%"><img onclick="location.href='${ctx}/pages/convenient_cuxiao.jsp'" src="${ctx}/images/sharechj_more.png" width="61" height="42" /></td>
          </tr>
        </table>
      </div>
    </div>
    <div style="clear:both;position:relative; padding:10px 25px 0 25px;height:320px;">
	   <div id="div_cuxiao">
	     
	   </div>
 </div>

  
 
 
 <div style="position:relative;height:50px; padding:10px 25px 0 25px;">
      <div style=" height:50px; width:950px; background-image:url(${ctx}/images/convenienttop_5.png)">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="94%" style="font-size:16px; color:#FFF; padding-left:20px;"></td>
            <td width="6%"><img style="cursor:pointer;" onclick="gotoPage('${ctx}/pages/convenient_categories.jsp')" src="${ctx}/images/sharechj_more.png" width="61" height="42" /></td>
          </tr>
        </table>
      </div>
    </div>
    
<div style="clear:both;position:relative; padding:10px 25px 0 25px;height:300px;">
	   <div id="div_category">
	    
	   </div>
 </div>
 
 
  <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>


</body>
</html>

<script src="${ctx}/js/jquery.litenav.js" type="text/javascript"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	
$('. main_content img').lazyload({  
	placeholder : '<span class="Apple-style-span" style="font-family:sans serif, tahoma, verdana, helvetica;line-height:19px;white-space:normal;font-size:13px;">http://www.173it.cn/css/grey.gif</span>', //加载图片前的占位图片  
 	effect      : "fadeIn" //加载图片使用的效果(淡入)  
 });  

	findadvertisementPicture();
	
	findBrandTop4List();
	findRestaurantList();
	findProductByFunction();
	
});

function findadvertisementPicture(){
	$.ajax({
	     type: "POST",
	     url : '${ctx}/common!findAds.action',
	     dataType:'json',
	     data:{type:4},
	     success: function(msg,status){
    		var str='';
    		var strspan='';
    		for(var i=0;i<msg.length;i++){
    			var data=msg[i];
    			str+='<a href="'+data["linkAddress"]+'" style="visibility: visible; display: block;" target="_blank">'+
    			'<img width="950" height="285" src="${imageStorePath}'+data["path"]+'" class="Picture"/></a>';
    			strspan='<span class="Normal">'+(i+1)+'</span>'+strspan;
    		}    		 
    		$('#NewsPic').html(str+'<div class="Nav">'+strspan+'</div>');	
    		$('#hotpic').liteNav(30000);
	     }
	});
}


function findBrandTop4List(){
	$.ajax({
	     type: "POST",
	     url : context+'/product!findBrandTop4List.action',
	     dataType:'json',
	     data:{},
	     success: function(msg,status){
	    	if(msg.status == 200){
	    	   var array = [];
	    	   for(var i=0; i < msg.rows.length; i++){
	    		   var data = msg.rows[i];
	    		   if(data["name"].length>12){
	    			   data["name"]=data["name"].substr(0,12)+'...';
	    		   }
	    		   if(i==0)
	    		   		array.push('<div  class="conv2" style="margin-left:0px;">');
	    		   else
	    				array.push('<div class="conv2">');
	    		   if(data["logo"]!=null)
	    		  	 	array.push('<div style="float:left;"><img src="${imageStorePath}'+data["logo"]+'"/>');
	    		   else
	    			   array.push('<div style="float:left;"><img style="cursor:pointer;" onclick="window.location.href=\'${ctx}/pages/convenient_brandpinfo.jsp?companyId='+data["companyId"]+'\'" alt="暂无图片" src="${ctx}/images/logo.png"/>');
	    		   
	    		  array.push('<div style="background-color:#FFF; height:60px; width:230px;">');
	    		  array.push(' <div class="indexbrandfont" style="cursor:pointer;width:230px;height:40px;overflow:hidden;" onclick="window.location.href=\'${ctx}/pages/convenient_brandpinfo.jsp?companyId='+data["companyId"]+'\'">'+data["name"]+'</div>');
	    		  array.push(' <div style="width:230px;padding-left:10px;">');
	    		  for(var h=0;h<data["starScore"];h++){
	    			  array.push(' <img src="${ctx}/images/brand_xx.png" style="width:12px;height:12px;"/>');
	    		  }
	    		  array.push('</div>');
	    		  array.push('</div>');
	    		  array.push('</div>');
	    		  
	    	   }
	    	   $('#div_brand').html(array.join(''));
	    	   
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
	
		 } 
	});
}
function findProductByFunction(){
	$.ajax({
	     type: "POST",
	     url : context+'/product!findProductByFunction.action',
	     dataType:'json',
	     data:{},
	     success: function(msg,status){
	    	if(msg.status == 200){
	    	   var array = [];
	    	   for(var i=0; i < msg.rows["cuxiao"].length; i++){
	    		   var data = msg.rows["cuxiao"][i];

	    		   if(data["name"].length>12){
	    			   data["name"]=data["name"].substr(0,12)+'...';
	    		   }
	    		   if(i==0)
	    		   		array.push('<div  class="conv3" style="margin-left:0px;">');
	    		   else
	    				array.push('<div class="conv3">');
	    		   var price='',oldPrice='',companyShopProductSkuId='';
	    		   if(data["sku"]!=null){
	    			   price =data["sku"]["price"];
	    			   oldPrice =data["sku"]["oldPrice"];
	    			   companyShopProductSkuId=data["sku"]["companyShopProductSkuId"];
	    		   }
	    		  array.push('<div onclick="productDetail(1,'+data["productId"]+','+data["companyShopProductId"]+','+data["companyShopId"]+','+companyShopProductSkuId+')" style="cursor:pointer; width:230px; height:230px;">'
	    		  +'<img src="${imageStorePath}'+data["image"]+'" /></div>');
	    		  array.push('<div style="border-bottom:2px solid #f00;"></div>');
	    		  array.push('<div class="brand_pic"><p>促销价：<span class="brand_pictx">￥'+price+'</span></p><p class="lable_title">参考价：<span class="brand_picx">￥'+oldPrice+'</span></p>');
	    		  array.push('<p>'+data["name"]+'</p></div>');
	    		  array.push('</div>');
	    	   }
	    	   $('#div_cuxiao').html(array.join(''));
	    	   
	    	   array=[];
	    	   for(var i=0; i < msg.rows["tuiguang"].length; i++){
	    		   var data = msg.rows["tuiguang"][i];

	    		   if(data["name"].length>12){
	    			   data["name"]=data["name"].substr(0,12)+'...';
	    		   }
	    		   if(i==0)
	    		   		array.push('<div  class="conv3" style="margin-left:0px;height:300px;">');
	    		   else
	    				array.push('<div class="conv3" style="height:300px;">');
	    		   var price='',oldPrice='',companyShopProductSkuId='';
	    		   if(data["sku"]!=null){
	    			   price =data["sku"]["price"];
	    			   oldPrice =data["sku"]["oldPrice"];
	    			   companyShopProductSkuId=data["sku"]["companyShopProductSkuId"];
	    		   }
	    		  array.push('<div onclick="productDetail(2,'+data["productId"]+','+data["companyShopProductId"]+','+data["companyShopId"]+','+companyShopProductSkuId+')" style="cursor:pointer; width:230px; height:230px;">'
	    		  +'<img src="${imageStorePath}'+data["image"]+'" /></div>');
	    		  array.push('<div style="border-bottom:2px solid #f00;"></div>');
	    		  array.push('<div class="brand_pic"><p>推广价：<span class="brand_pictx">￥'+price+'</span></p>');
	    		  array.push('<p>'+data["name"]+'</p></div>');
	    		  array.push('</div>');
	    	   }
	    	   $('#div_tuiguang').html(array.join(''));
	    	   
	    	   array = [];
	    	   for(var i=0; i < msg.rows["categoryList"].length; i++){
	    		   var data = msg.rows["categoryList"][i];

	    		   if(data["name"].length>12){
	    			   data["name"]=data["name"].substr(0,12)+'...';
	    		   }
	    		   if(i==0)
	    		   		array.push('<div  class="conv_category" style="margin-left:0px;">');
	    		   else
	    				array.push('<div class="conv_category">');
	    		   var price='',oldPrice='',companyShopProductSkuId='';
	    		   if(data["sku"]!=null){
	    			   price =data["sku"]["price"];
	    			   oldPrice =data["sku"]["oldPrice"];
	    			   companyShopProductSkuId=data["sku"]["companyShopProductSkuId"];
	    		   }
	    		  
	    		  array.push('<div onclick="productDetail(3,'+data["productId"]+','+data["companyShopProductId"]+','+data["companyShopId"]+','+companyShopProductSkuId+')" style="cursor:pointer; width:230px; height:230px;">'
	    				  +'<img src="${imageStorePath}'+data["image"]+'" /></div>');
	    		  array.push('<div style="border-bottom:2px solid #f00;"></div>');
	    		  if(data["sku"] !=null)
	    			  array.push('<div class="brand_pic"><p>实售价：<span class="brand_pictx">￥'+price+'</span></p><p></p>');
	    		  else
	    			  array.push('<div class="brand_pic"></p>');
	    		  
	    		  array.push('<p>'+data["name"]+'</p></div>');
	    		  array.push('</div>');
	    	   }
	    	   $('#div_category').html(array.join(''));
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
	
		 } 
	});
}
function findProductByCategory(){
	$.ajax({
	     type: "POST",
	     url : context+'/product!findProductByCategory.action',
	     dataType:'json',
	     data:{},
	     success: function(msg,status){
	    	if(msg.status == 200){
	    	   var array = [];
	    	   for(var i=0; i < msg.rows.length; i++){
	    		   var data = msg.rows[i];

	    		   if(data["name"].length>12){
	    			   data["name"]=data["name"].substr(0,12)+'...';
	    		   }
	    		   if(i==0)
	    		   		array.push('<div  class="conv3" style="margin-left:0px;">');
	    		   else
	    				array.push('<div class="conv3">');
	    		   var price='',oldPrice='',companyShopProductSkuId='';
	    		   if(data["sku"]!=null){
	    			   price =data["sku"]["price"];
	    			   oldPrice =data["sku"]["oldPrice"];
	    			   companyShopProductSkuId=data["sku"]["companyShopProductSkuId"];
	    		   }
	    		   
	    		   
	    		  array.push('<div onclick="productDetail(3,'+data["productId"]+','+data["companyShopProductId"]+','+data["companyShopId"]+','+companyShopProductSkuId+')" style="cursor:pointer; width:230px; height:230px;">'
	    				  +'<img src="${imageStorePath}'+data["image"]+'" /></div>');
	    		  array.push('<div style="border-bottom:2px solid #f00;"></div>');
	    		  if(data["sku"] !=null)
	    			  array.push('<div class="brand_pic"><p>实售价：<span class="brand_pictx">￥'+price+'</span></p>');
	    		  else
	    			  array.push('<div class="brand_pic"></p>');
	    		  
	    		  array.push('<p>'+data["name"]+'</p></div>');
	    		  array.push('</div>');
	    	   }
	    	   $('#div_category').html(array.join(''));
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
		 } 
	});
}

function findRestaurantList(){
	$.ajax({
	     type: "POST",
	     url : context+'/product!findRestaurantList.action',
	     dataType:'json',
	     data:{},
	     success: function(msg,status){
	    	if(msg.status == 200){
	    	   var array = [];
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
	    		   if(i==0)
	    		   		str = '<div class="fun4" style="margin-left:0px;">';
	    		   else
	    			   str ='<div class="fun4">';
	    		   
	    		   str +='<div class="flashNews"><img src="${imageStorePath}'+data["logo"]+'" style="cursor:pointer;" onclick="gotoDetail('+data["companyShopId"]+')"/>'
	    		   +'<div class="bg1" style="cursor:pointer;" onclick="gotoDetail('+data["companyShopId"]+')">&nbsp;'+data["name"]+'</div>'
	  		  	 +'</div>'
	    		  +'<div style="background-color:#FFF; height:50px; width:230px;">'
	    		  +'<div class="index_Productfont" style="color:#FF8040;overflow: hidden;height:50px;width:200px;"><span></span><span class="lable_title">'+tag+'</span></div>'
	    		  +'<div style="float:right;"><img src="${ctx}/images/od.png" style="width:20px;height:45px;"/></div>'
	    		  +' </div></div>';
	    		  array.push(str);
	    	   }
	    	   $('#div_restaurant').html(array.join(''));
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
	
		 } 
	});
}

function findProductByUserTag(){
	$.ajax({
	     type: "POST",
	     url : context+'/product!findProductByUserTag.action',
	     dataType:'json',
	     data:{},
	     success: function(msg,status){
	    	if(msg.status == 200){
	    	 if(msg.rows.length>0){
	    		 $('#div_tag_title').show();
		    	 $('#div_tag_content').show();
		    	 
		    	  var array = [];
		    	   for(var i=0; i < msg.rows.length; i++){
		    		   var data = msg.rows[i];
		    		   
		    		   if(data["name"].length>12){
		    			   data["name"]=data["name"].substr(0,12)+'...';
		    		   }
		    		   var price='',companyShopProductSkuId='';
		    		   if(data["sku"]!=null){
		    			   price =data["sku"]["price"];
		    			   companyShopProductSkuId=data["sku"]["companyShopProductSkuId"];
		    		   }
		    		   
		    		  var tag='';
		    		  if(data["tagList"].length>0)
		    			  tag += data["tagList"][0]["tagName"]+",";
		    		  if(data["tagList"].length>1)
		    			  tag += data["tagList"][1]["tagName"]+",";
		    		  tag = tag.substr(0,tag.length-1);
		    		 var str='';
		    		  if(i==0)
		    			  str='<div class="fun4" style="margin-left:0px;">';
		    		else
		    			str='<div class="fun4">';
		    		str +='<div class="flashNews1"><img onclick="productDetail(3,'+data["productId"]+','+data["companyShopProductId"]+','+data["companyShopId"]+','+companyShopProductSkuId+')" style="cursor:pointer;" src="${imageStorePath}'+data["image"]+'"/>'
		 			      +'<div style="height:41px; width:230px;padding-top:10px;background:#000000;filter:alpha(opacity=65);-moz-opacity:0.65;opacity:0.65; color:#FFF;">&nbsp;'+data["name"]+'<br/><div style="text-align:right;"><span style="color:#ff6532;">RMB&nbsp;'+price+'</span></div></div>'
		 			  	+'</div>'+
		              '<div style="background-color:#FFF; height:60px; width:230px;">'+
		              '<table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		  '<tr><td width="91%" style=" padding:5px 0 0 10px;"><span style="color:#FF8040;"></span><span class="lable_title">'+tag+'</span></td>'+
		              '<td width="9%" rowspan="2"><img src="${ctx}/images/share.png" width="20" height="56" style="height:56px; width:20px;" /></td>'+
		              '</tr>'+
		            '<tr>'+
		     		 ' <td><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		        	' <tr style="font-size:12px">'+
		            ' <td width="19%" align="center"><img src="${ctx}/images/share_3.png" width="16" height="16" style="height:16px; width:16px;" /></td>'+
		           '<td width="21%">'+data["commentCount"]+'</td>'+
		           '<td width="15%"><img src="${ctx}/images/share_4.png" width="16" height="12" style="height:12px; width:16px;" /></td>'+
		           '<td width="16%">'+data["browseCount"]+'</td>'+
		           '<td width="11%"><img src="${ctx}/images/share_5.png" width="14" height="12" style="height:14px; width:12px;" /></td>'+
		           '<td width="18%">'+data["starScore"]+'</td>'+
		          '</tr>'+
		          '</table></td>'+
		          ' </tr>'+
		   		  '</table>'+
		          '</div>'+
		          ' </div>';
			        array.push(str);
		    	 }
		    	 $('#div_tag_product').html(array.join(''));
		    	
	    	 } 
	    	}
	    	else if(msg.status == 300){
	    	 	$('#div_tag_title').hide();
	    	 	$('#div_tag_content').hide();
	    	}
		 } 
	});
}
function gotoDetail(shopId){
	$('#formturn').attr('action',"${ctx}/product!findRestarauntDetail.action");
	$('#companyShopId').val(shopId);
	$('#formturn').submit();
}
</script>
