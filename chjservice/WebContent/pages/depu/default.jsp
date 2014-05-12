<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>漕河泾e服务</title>
<link rel="stylesheet" type="text/css" href="${ctx}/css/css.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/css/header.css"/>
<style type="text/css">

.fun4{
float:left;margin-left:10px;margin-top: 10px;
}
.fun4 img{
width:230px;height:230px;cursor:pointer;
}

.topMenu{
width:230px; height:40px;background-image:url(${ctx}/images/dp_1.png);cursor:pointer;
}

.setMenu{
width:230px; height:33px;background-image:url(${ctx}/images/dp_2.png);cursor:pointer;
}

.sianFont{
font-size: 16px;padding-left: 10px;
}
.singFont{
font-size: 16px;padding-left: 35px;
}


</style>
</head>
<body onscroll="b()">

<jsp:include page="../../common/header.jsp" />


<div class="main">
<div id="main_content" class="main_content">


<div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	   <div>
       <img src="${ctx}/images/defu_menu.png" width="950" height="100" />
       </div>
 </div>
 
 
<div style="position:relative;height:114px; padding:10px 25px 0 25px;">
	   <div style=" background-image:url(${ctx}/images/dp_button3.png);height:114px;">
   
     </div>
 </div>

<div style="clear:both;position:relative; padding:0 25px 0 25px;">
  <div>
	   <div>
       
	      <div style="margin-left:0px;margin-top:10px;float:left;width: 230px;">
           
          <div style="height: 1000px;">
            <table id="menuShowList" width="100%" border="0" cellspacing="0" cellpadding="0">
              
            </table>
          </div>
	      </div>  
	      
	      <div id="productList" style="width: 720px;float: right;display: block;">
	      
	   </div>
</div>


</div>
</div>
 
<jsp:include page="../../common/bottom.jsp" /> 
 
  
  
</div>
</div>

</body>
</html>
<script type="text/javascript">
var companyId=283;
var companyShopId=198;

$(document).ready(function(){
	  $.ajax({
		  type: "POST",
		  url : '${ctx}/product!findDepuShopCategory.action',
		  dataType:'json',
		  data:{companyShopId:companyShopId},
		  success: function(msg,status){
			  if(msg.status==200){
				  var str='';
				  for(var i=0;i<msg.rows.length;i++){
					  var data=msg.rows[i];
					  str+='<tr onclick="on_clickParentCategory(0,'+data["product_shop_category_id"]+',0)">';
					  str+='<td id="ddt'+data["product_shop_category_id"]+'" class="topMenu"';
					  
					  str+='><span class="sianFont">'+data["name"]+'</span></td></tr>';
					  for ( var j = 0; j < data["childCate"].length; j++) {
						  var cdata=data["childCate"][j];
						  str+='<tr onclick="on_clickParentCategory(1,'+data["product_shop_category_id"]+',';
						  str+=cdata["product_shop_category_id"]+')" style="display: none;" '; 
						  str+='id="next'+data["product_shop_category_id"]+cdata["product_shop_category_id"]+'">';
						  str+='<td class="setMenu"><span class="singFont">'+cdata["name"]+'</span></td></tr>';
					  }
				  }
				 
				  $('#menuShowList').html(str);
				  on_clickParentCategory(0,msg.rows[0]["product_shop_category_id"],0);
			  }else{
				  alert(msg.msg);
			  }
		  } 
	  });
});

function on_clickParentCategory(k,i,j){
	var category="";
	if(k==0){
		category=i;
		
		$('tr[id^="next"]').each(function(){
			$(this).hide();
		});
		$('tr[id^="next'+i+'"]').each(function(){
			$(this).show();
		});
		
	}else if(k==1){
		category=j;		
	} 
	
	$.ajax({
		  type: "POST",
		  url : '${ctx}/product!findDepuShopProductList.action',
		  dataType:'json',
		  data:{companyShopId:companyShopId,categoryId:category,levelRank:k},
		  success: function(msg,status){
			  if(msg.status==200){
				  var str='';
				  for(var i=0;i<msg.rows.length;i++){
					  var data=msg.rows[i];
					  var product=data["product"];
					  var name=product["name"];
					  var strs=name.split(" ");
					  cname=strs[0];
					  if(cname.length<4){
						  cname=product["name"];
					  }else{
						  cname=cname.split("（")[0];
						  if(cname.length>5){
							  cname=cname.substring(0,4)+"...";
						  }
					  }
					  
					  var reg = /[\$,%]/g;
					  var price=product["price"];
					  var key = parseFloat( String(price).replace(reg, '')).toFixed(2); // toFixed小数点后两位   
				      price=isNaN(key) ? 0.00 : key; 
					  
					  str+='<div class="fun4"><div class="flashNews" onclick="productDetail(3,'+
					  data["product_id"] + ',' + data["company_shop_product_id"]+',' + data["company_shop_id"] + 
					  ',' + product["company_shop_product_sku_id"] + ')">'+
					  '<img src="${imageStorePath}'+product["image"]+'" />'+					  
			          '<div class="bg"><div style="font-size:18px;color:#fff; margin-left:-120px;width: 120px;float: left;">'+
			          cname+'</div><div style="width: 90px;text-align: right;">'+
			          '<span style="font-size :12px;color:#b3b3b3;">RMB</span>'+price+'</div></div></div>'+ 
			          '<div style="background-color:#FFF; height:50px; width:230px;"><div class="index_Productfont">'+
			          '<table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td>'+			          
			          '<img src="${ctx}/images/dp_button1.png" style="width:85px; height:30px;" onclick="productDetail(3,'+
					  data["product_id"] + ',' + data["company_shop_product_id"]+',' + data["company_shop_id"] + 
					  ',' + product["company_shop_product_sku_id"] + ')"/>'+
			          '</td><td>&nbsp;</td><td>'+
			          '<img src="${ctx}/images/dp_button2.png" style="width:85px; height:30px;" onclick="addUserTheCart('+
					  data["product_id"] + ',' + data["company_shop_product_id"]+','
					   + product["product_sku_id"] +','+product["company_shop_product_sku_id"]+
					  ','+product["price"]+','+product["old_price"]+')"/></td>'+
			          '</tr></table></div><div style="float:right;">'+
			          '<img src="${ctx}/images/od.png" style="width:20px;height:45px;"/></div>'+
			          '</div></div>';
				  }
				  $('#productList').html(str);
			  }else{
				  alert(msg.msg);
			  }
		  }
	});
}

/*添加购物车*/
function addUserTheCart(productId,companyShopProductId,productSkuId,companyShopProductSkuId,price,oldPrice){

	var param={};
	param["qty"]=1;
	param["price"]=price;
	param["oldPrice"]=oldPrice;
	
	param["companyShopProductSkuId"]=companyShopProductSkuId;
	param["skuId"]=productSkuId;
	param["productId"]=productId;
	param["companyShopId"]=companyShopId;
	param["companyShopProductId"] =companyShopProductId;
	 
	$.ajax({
	     type: "POST",
	     url : '${ctx}/product!addUserCart.action',
	     dataType:'json',
	     data:param,
	     success: function(msg,status){
	    	if(msg.status == 200){	
	    	  alert('成功加入购物车!');
	    	  finduserCartItemCount();
	    	}
	    	else
	    		alert(msg.msg);
	     }
	});
}
</script>