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


<div class="main">
<div id="main_content" class="main_content">
   
<div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	     <div style="float:left;"><img src="${ctx}/images/menu_12.jpg" onclick="gotoPage('${ctx}/pages/convenient.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_7.jpg" onclick="gotoPage('${ctx}/pages/convenient_brand.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_8.jpg" onclick="gotoPage('${ctx}/pages/convenient_restaurant.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_9.jpg" onclick="gotoPage('${ctx}/pages/convenient_tuiguang.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_10.jpg" onclick="gotoPage('${ctx}/pages/convenient_cuxiao.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_6.jpg" onclick="gotoPage('${ctx}/pages/convenient_categories.jsp')"   style="width:190px;" /></div>
           <div><img src="${ctx}/images/menu_14.jpg" style="width:285px;" /></div>
	    </div>
  
</div>
  

 <div id="div_product">
 
 </div>
 
 
 <div style="float:left; padding:10px 25px 0 25px;">
     <div id="loadmore" onclick="loadMore()" style="cursor:pointer;height:55px; width:950px; background-color:#FFF;"> <p id="loadMoreText" style="text-align:center; padding-top:18px;font-size:14px;color:4c4c4c;font-family:黑体;">加载更多</p> </div>
 </div> 



  
  <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>


 
 
 

</body>
</html>
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	findProductList();
	
});
function loadMore(){
	if(pageinfo["more"]){
		findProductList();
	}
}
function findProductList(){
	pageinfo["size"]=6;
	$.ajax({
	     type: "POST",
	     url : context+'/product!findProductByFirstCategory.action',
	     dataType:'json',
	     data:pageinfo,
	     success: function(msg,status){
	    	if(msg.status == 200){
	    	var colors=["#9fe0e6","#31A1E9","#c34cdc","#a8c604"];
	    	 var array = [];
	    	   for(var i=0; i < msg.rows.length; i++){
	    		   var data = msg.rows[i];
	    		   if(data["name"].length>8){
	    			   data["name"]=data["name"].substr(0,8)+'...';
	    		   }
	    		   if(data["color"]==null||data["color"].length==0){
	    			   data["color"]="#30a0e8";
	    		   }
	    		   var str='<div style="float:left; padding:10px 25px 0 25px;"><div style="width:950px;">'+
	    		   '<div><div style=" float:left; height:250px; width:230px;background-image:url(${imageStorePath}'+data["image"]+');">'+
	    		   ' <div style="padding:190px 0 0 20px; font-size:18px; color:#FFF; font-family:黑体";>'+
	    		   '<span onclick="categoryDetail(\''+data["color"]+'\','+data["productCategoryId"]+
	    			')" style="cursor:pointer;width:160px;">'+data["name"]+'</span>'+
	    		   '<img onclick="categoryDetail(\''+data["color"]+'\','+data["productCategoryId"]+')" src="${ctx}/dynamic/categories_more1.png" '+
	    		   ' width="32" height="32" style="cursor:pointer;float:right; margin:8px 5px 0 0 ;" /></div>'+
				   '</div></div>';
	    		  for(var h=0;h<data["proList"].length;h++){
	    			 var datadata=data["proList"][h];
	    			 if(datadata["productInfo"]["name"].length>11){
	    				 datadata["productInfo"]["name"]=datadata["productInfo"]["name"].substr(0,11)+'...';
	    			 }
	    				 str +='<div class="conv3" style="height:250px; width:230px;background-color:#ffffff;">'+
	    		          '<img onclick="productDetail(3,'+datadata["productId"]+','+datadata["companyShopProductId"]+','+datadata["companyShopId"]+','+datadata["sku"]["companyShopProductSkuId"]+
	    		          ')" style="cursor:pointer;width:180px; height:180px; border:none;margin-left:25px;margin-top:10px;" src="${imageStorePath}'+datadata["image"]+'"/>'+
	    		          '<div class="brand_pic" style="background-color:'+data["color"]+';">'+
	    		          ' <p style="color:#FFF;cursor:pointer;">实售价：<span class="brand_pictx" style="color:#FFF;">'+datadata["sku"]["price"]+'元</span></p>'+
	    		          //'<p style="color:#FFF;">参考价：<span class="brand_picx" >￥'+datadata["sku"]["oldPrice"]+'</span></p>'+
	    		          '<p style="color:#FFF;cursor:pointer;" onclick="productDetail(3,'+datadata["productId"]+','+datadata["companyShopProductId"]+','+datadata["companyShopId"]+
	    		          ','+datadata["sku"]["companyShopProductSkuId"]+')">'+datadata["productInfo"]["name"]+'</p></div></div>';
	    			 
	    		  }
	    		  if(data["proList"].length==0){
	    			  str +='<div class="conv3" style="background:#fff; height:250px; width:230px;">'+
   		          			'暂无商品!</div>';
	    		  }
	    		  str +='</div></div>';
	    		  array.push(str);
	    		  
	    	   }
	    	   
	    	   $('#div_product').append(array.join(''));
	    	   if(msg.rows.length<pageinfo["size"]){
		    	    $('#loadMoreText').html('没有更多!');
		    	    pageinfo["more"]=false;
		    }
	    	 else{
	    		pageinfo["page"]++;
	    	 }
		    	array=[];
	    		array=null;
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
	
		 } 
	});
}

function categoryDetail(color,id){
	$('#formturn').attr('action',"${ctx}/product!findProductCategorySecondList.action");
	$('#hiddenCategoryId').val(id);
	$('#colorHidden').val(color);
	$('#formturn').submit();
}
</script>
