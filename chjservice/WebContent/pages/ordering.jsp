<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/css.css" />
<script type="text/javascript" src="${ctx}/js/selectstores.js"></script>
<style type="text/css">

.conv1{
float:left;margin-left:10px;
}
.comm2{	
float:left;margin-left:10px;
	
	}
.bottom_nav{
margin:0px;
}
.bottom_nav  li{    /*顶端--菜单样式*/
	border-right:1px solid #ccc;
	text-align:center;
	float:left;
	width:115px;
	height:60px;
	list-style:none;
	color:#fff;
}
.bottom_nav  li:hover{
	cursor:pointer;
	color:blue;
}
.bottom_nav  li div{
margin:20px 0 0 6px;
}

img{cursor:pointer;}

*{margin:0;}
a,img{border:0;}
/* shutter */
.shutter{position:relative;overflow:hidden;height:230px;width:350px;}
.shutter li{position:absolute;left:0;top:0;}
.shutter-nav{display:inline-block;margin-right:8px; margin-top:0px;color:#fff;padding:2px 5px;font-family:微软雅黑;font-weight:bold;font-size:12px;cursor:pointer;}
.shutter-cur-nav{display:inline-block;margin-right:8px; margin-top:0px;color:#f00;padding:2px 5px;font-family:微软雅黑;font-weight:bold;font-size:12px;cursor:pointer;}


/* 我的订单 */

.myorder_font{ color:#00b38a; font-size:14px;  font-weight:bold; text-align:center; padding-top:15px;}
.myorder_font1{ color:#00b38a; font-size:14px;  font-weight:bold; text-align:center; padding-top:45px;}
.myorder_font2{  font-size:14px;font-weight:bold; text-align:center; padding-top:45px;}
.myorder_font02{ color:#00b38a; font-size:14px; font-weight:bold; }
.myorder1{
float:left;margin-left:10px;
}
.myorder1 img{
width:110px;height:115px;cursor:pointer;
}
.gray-font{color:#9a9a9c; font-size:14px; }
.myorder_font4{ color:#9a9a9c; font-size:14px;  text-align:center; padding-top:15px;}

ul.ul-button{
}
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


.input-color{color:#ccc;}
.input-color-focus{color:#000;}


#cart_sure  input{
height: 30px;     
width:180px;
line-height: 30px;
border-radius:6px;
border:1px solid #ccc;
-webkit-border-radius:6px;
-moz-border-radius:6px;
-webkit-transition: box-shadow 0.30s ease-in-out;
-moz-transition:  box-shadow 0.30s ease-in-out;
}
#cart_sure input:focus
 {
 outline:none;
 border:#87C6F9 1px solid;
 box-shadow: 0 0 2px rgba(103, 166, 217, 1);
}
.main_content textarea{
border:1px;

}
.main_content select {
width:180px;
height:24px;
}

.input-color{color:#ccc;}
.input-color-focus{color:#000;}
</style>
<style type="text/css">

.xbk_menu1{font-size:14px;background:url(${ctx}/images/ordering_1.png) no-repeat;height:44px; width:126px;color: #fff;cursor: pointer;}
.xbk_menu2{font-size:14px;background:url(${ctx}/images/ordering_3.jpg) no-repeat;height:44px; width:126px;color: #fff;cursor: pointer;}
.xbk_menu2:hover{background-image:url(${ctx}/images/ordering_1.png);}
.td_gg{font-size: 12px;color:#898989;}
.input_middle{vertical-align: middle;height: 18px;width:30px;margin: 0px;padding: 0px;text-align: center;}
body{font-family:微软雅黑}
</style>
</head>
<body>
<jsp:include page="/common/header.jsp" />
<script type="text/javascript" src="${ctx }/js/My97DatePicker/WdatePicker.js"></script>

<div id="main_style" class="main" style="background-color:#FFF;">
<div id="main_content" class="main_content">
  
  <div id="companytitle" style="position:relative;height:140px; padding:10px 25px 0 25px; ">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr><td height="21"></td></tr>
      <tr>
        <td style="font-size:12px; color:#c9c9c9;">您的位置：星巴克首页 &gt;&nbsp;
        <a href="javascript:void(0);" id="shopName" style="font-size:12px; color:#c9c9c9;cursor: pointer;" onclick="gotodianpupage(${param.shopId})">门店选择 </a> &gt;&nbsp;
        <a href="#"  style="font-size:12px; color:#c9c9c9;">外送饮品</a></td>
      </tr>
      <tr>
        <td><table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="85%" height="23px" style="font-size:25px;">&nbsp;</td>
            <td width="15%" rowspan="4" align="right"><img src="${ctx}/images/starbuck_07.png" width="105" height="99" /></td>
          </tr>
          <tr>
            <td height="20px"><span style="font-size:26px; font-family:'微软雅黑';">请选择您需要的饮品</span></td>
            </tr>
          <tr>
            <td style="font-size:12px;color: #c7c7c7;">PLEASE SELECT THE DRINKS WHICH YOU NEED</td>
            </tr>
            <tr>
            <td style="font-size:12px;color: #c7c7c7;">提示：网站页面的产品照片仅供参考，所有外送饮料皆使用星巴克外带纸杯或星巴克外带冰杯盛放。</td>
            </tr>
        </table></td>
      </tr><tr><td height="23px">&nbsp;</td></tr>
    </table>
  </div>
  

  <div id="companymain" style="position:relative;padding:10px 25px 0 25px;">
	    <div style="float:left;  width:730px;">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:#CCC 1px solid;">
     
      <tr>
        <td height="70">
        <table width="100%" id="titleList" border="0" cellspacing="3" cellpadding="0">
          
        </table>
        </td>
      </tr>              
       <tr>
        <td>

        <table id="productList" width="100%" border="0" cellspacing="0" cellpadding="0">
        </table>

        </td>
        </tr>      
    </table>
        </div>
       
       
       
       <div style="float:right;  width:210px; height:1000px;">
         <table width="100%" border="0" cellspacing="0" height="335" cellpadding="0" style="padding-top:10px;border:#CCC 1px solid;" >
           <tr>
       <td height="28" style="font-family:微软雅黑;padding-left:5px; color:#6b5142;font-size: 13px">推荐饮品</td>
     </tr>
      <tr>
       <td height="25" style="padding-left:5px;" ><img src="${ctx}/images/starbuck_16.jpg" width="196" height="16" onclick="findrecProduct(-1,'recommended')"/></td>
     </tr>
      <tr>
       <td height="191" valign="top" id="recommended" style="font-family:微软雅黑;font-size: 12px;color: #757575;">
       
       </td>
     </tr>
      <tr>
       <td style="padding-left:5px;"><img src="${ctx}/images/starbuck_17.jpg" width="196" height="16" onclick="findrecProduct(1,'recommended')"/></td>
     </tr>
 </table>
   
   
   <table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding-top:10px;" >
     <tr>
       <td style="color:#6b5142;font-size:12px; font-weight:bold;height: 28px;"> &gt;查看全部饮品 </td>
     </tr>
   </table>
   
 <table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding-top:10px;" >
     <tr>
       <td><img src="${ctx}/images/xbk_right.png" width="210" /></td>
     </tr>
   </table>

</div>
 </div>
 
 
 
 <div id="cart_sure" style="display:none;">
	
	 <div style="position:relative; padding:10px 25px 0 25px;">
	   <div>
	      <div style="float:left; width:950px;">      
	       
            <div style="float:left; width:950px; height:55px;margin-bottom:10px; background-color:#FFF">
            
          	     <table id="table_address" width="950" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	        <td width="120"  style="font-weight:bold; padding-left:15px;">
	          	确认收货信息
	        </td>
	       <td align="right" style="padding-top:8px;padding-right:40px;padding-left:15px;">
	          <ul class="ul-button">
	          	<li onclick="gotoPage('${ctx}/pages/personal_set.jsp')"><div>管理收货地址</div></li>
	          	</ul>
	        </td>
	        </tr>
            </table>
	      </div> 
	      
           <div style="float:left; width:540px; height:55px;background-color:#FFF">
	      <p class="myorder_font" style="padding-left:15px;text-align:left;">收货人地址 </p></div> 
          <div class="conv1" style="width:180px; height:55px; background-color:#FFF">
            <p class="myorder_font">收货人信息</p></div> 
          <div class="conv1" style="width:210px; height:55px; background-color:#FFF">
            <p class="myorder_font">联系电话</p></div>
	      </div> 
	      
	      <div id="div_address">	      
	      </div>
</div>
</div> 
	
	 <div style="clear:both;position:relative; margin-top:10px;padding:10px 25px 0 25px;">
	   <div>
	     
	       <div style="float:left; width:950px; height:55px;margin-bottom:10px; background-color:#FFF">
            
          	    <table width="950"  border="0" cellspacing="0" cellpadding="0">
	        <tr>
	        <td  width="200px" style="font-weight:bold; padding-left:15px;padding-top: 8px;">
	          	确认订单信息
	        </td>
	        <td width="500px" valign="middle" style="font-weight:bold; padding-left:15px;padding-top: 8px;">
	          	店铺：<span style="color:#00b38a" id="selectShop"></span>
	        </td>
	         <td width="100px"  style="font-weight:bold; padding-left:15px;">
	          	运费：<span style="color:#00b38a" id="txtOrderDeliver"></span>
	        </td>
	        <td  style="padding-right:40px;padding-top: 8px;">
	          	<ul class="ul-button">
	          	<li onclick="updateProduct()"><div>修改</div></li>
	          	</ul>
	        </td>
	        </tr>
	        </table>
	      </div> 
	      
	     
	       <div style="float:left; width:950px;margin-top:0px;">
	       <div style="float:left; width:440px; height:55px;background-color:#FFF">
	       <p class="myorder_font" style="padding-left:15px;text-align:left;">商品信息 </p></div> 
          <div class="conv1" style="width:160px; height:55px; background-color:#FFF">
            <p class="myorder_font">单价</p></div> 
          <div class="conv1" style="width:160px; height:55px; background-color:#FFF">
            <p class="myorder_font">数量</p></div> 
	      <div class="conv1" style="width:160px; height:55px; background-color:#FFF">
            <p class="myorder_font">小计</p></div>
	      </div>   
	    
	    <div  id="div_cartsure">    	      
	     </div> 
	        
	     <div align="right" style="float:left;padding-top:20px; width:950px;height:45px;margin-top:10px;background:#fff;">
	      	<span style="color:#000;font-size:20px;"> 合计</span>
	      	<span id="txtOrderDeliverInfo">(不含运费):</span>
	      	<span id="totaltotal" style="color:#00b38b;font-size:22px;margin-right:40px;">6666</span>
	      </div>
	</div>   
</div>
<div style="clear:both;position:relative;margin-top:10px;padding:10px 25px 0 25px;">
	   <div>
	      <div style="float:left; width:950px;background:#fff;border-bottom:#57ae97 solid 2px;">
	      
	        <table width="950" style="margin:10px;" border="0" cellspacing="0" cellpadding="0">
	        <tr><td  width="400px" style="font-weight:bold; padding-left:15px;" colspan="2">
	          	生成订单</td>
	        
	        <td  align="right" colspan="2" style=" padding-right:40px;">
	          	 <ul class="ul-button"><li onclick="submit_order()"><div>&nbsp;&nbsp;提交订单&nbsp;&nbsp;</div></li>
	          	</ul></td></tr>
	       
	        <tr><td colspan="4"><p>&nbsp;</p></td></tr>
	        
 		 <tr>
	        <td width="18%" align="left" class="gray-font" style="padding-left:45px;">
	         送&nbsp;货&nbsp;方&nbsp;式 : </td><td width="20%" >
	         <select  id="sendType">
	         <option value="1">配送</option>
	          <option value="2">自取</option>
	         </select>
	        </td>
	        <td width="15%"  align="left" class="gray-font">
	            付款方式 : </td><td width="70%" >
	         <select id="payType">
	         </select>
	        </td>
	        </tr>
	        
	        <tr><td colspan="2"><p>&nbsp;</p></td></tr>
	        
	        <tr>
	        <td  align="left" class="gray-font" style="padding-left:45px;">
	           要求到货日期:&nbsp; </td><td> <input  id="txtSendDate" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"/>
	         </td>
	        
	          <td   align="left" class="gray-font">
	          备  &nbsp;&nbsp;&nbsp;&nbsp;注: </td><td>
	      <input  id="txtInfo" maxlength="30" class="input-color" value=""/><span id="spanInfo" style="color:#9a9a9c;">&nbsp;30字内</span>
	         </td>
	         </tr>
	        <tr id="mm"><td colspan="4" height="45px" class="gray-font" style="padding-top: 10px;padding-left: 45px;">请注意，本店外送时间是：<span id="workTime"></span>&nbsp;<span id="serviceTime"></span>，请在服务时间内下单。</td></tr>
	        </table>
	         <p><br/></p>
	      </div>   
	    </div>   
</div>

 </div>
 
 <jsp:include page="/common/bottom.jsp" />
 
</div>
</div>

</body>
</html>
<script type="text/javascript">

var companyShopId="${param.shopId}";
var param={};
var cartItem={};
var addressArray=[];
var selectAddress=-1;

$(document).ready(function(){
	initInput('txtInfo','spanInfo','备注30字以内',30);
	loadUserAddress();
	findShopPayTypeAndisDeliver(companyShopId);
	
	findrecProduct(1,'recommended');	
	$.ajax({
		type:"POST",
		url:'${ctx}/product!findSBUXShopProduct2.action',
		dataType:'json',
		data:{companyShopId:companyShopId,companyId:companyId},
		success:function(msg,status){
		if(msg.status==200){
			var data=msg.rows;
			param["shopName"]=data["shopName"];
			$('#shopName').html(data["shopName"]);
			param["sendCost"]=data["sendCost"];
			deliverOk=data["deliverOk"];
			statusMsg=data["statusMsg"];
			var array=[];
			array.push('<tr valign="top"><td width="2" height="44"></td>');
			for ( var i = 0; i <6; i++) {
				var info=data["productShopCategory"][i];				
				array.push('<td align="center"');
				if(info!=null){
					array.push('class="xbk_menu2" style="padding:6px 0 0 0;" id="txd'+info["product_shop_category_id"]+'" onclick="productList('+info["product_shop_category_id"]+')"> '+info["name"]+'</td>');
				}else{
					array.push('>&nbsp;</td>');
				}
			}
			array.push('</tr>');
			$('#titleList').html(array.join(''));
			
			productList(data["productShopCategory"][0]["product_shop_category_id"]);
		}else
			alert(msg.msg);
		}
	});
	
});



function productList(index){
	$('td[id^="txd"]').each(function(){
		$(this).attr("class","xbk_menu2");
	});
	$('#txd'+index).attr("class","xbk_menu1");	
	$.ajax({
		type:"POST",
		url:'${ctx}/product!findSBUXShopProduct1.action',
		dataType:'json',
		data:{productType:index,companyShopId:companyShopId},
		success:function(msg,status){
		if(msg.status==200){
			var array=[];
			var data=msg.rows;
			var info=data["productAttrInfo"];
			for(var i=0;i<info.length;i++){
				array.push('<tr><td width="4%"></td><td width="7%" valign="top"><img src="${imageStorePath}/'+info[i]["productImg"]+'" width="39" height="39"');
				array.push(' onclick="slefSetProduct('+info[i]["company_shop_product_id"]+','+info[i]["product_id"]+')"/></td><td width="1%">&nbsp;</td>');
				array.push('<td width="20%"><table onclick="slefSetProduct('+info[i]["company_shop_product_id"]+','+info[i]["product_id"]+')"');
				array.push(' width="100%" border="0" cellspacing="1" cellpadding="0"><tr><td id="nickName'+info[i]["product_id"]+'" style="color:#0e8a02;font-size:14px">'+info[i]["nickName"]+'</td></tr>');
				array.push('<tr><td height="22" style="color:#aaa; font-size:12px;">'+info[i]["foreign_name"]+'</td></tr>');
				array.push('<tr><td><img id="img'+info[i]["company_shop_product_id"]+'" src="${ctx}/images/ordering_6.jpg" width="96" height="25" ');
				array.push('/></td></tr></table></td>');
				
				array.push('<td width="8%">&nbsp;</td><td width="45%"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr>');
				
				var shopPro=info[i]["shopProduct"];
				for(var j=0;j<shopPro.length;j++){
					array.push('<td width="15%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">');
					if(j==0){
						array.push('<tr><td height="33" colspan="2"><span style="color:#0e8a02;font-size:13px;">'+info[i]["name"]+'：</span></td></tr>');
						array.push('<tr><td width="20%" style="color:red;vertical-align: top;"><input type="radio" checked="ckecked" id="'+shopPro[j]["product_sku_id"]+'" name="radiotype'+info[i]["company_shop_product_id"]+'" value="'+shopPro[j]["price"]+'"/></td>');
					}else{
						array.push('<tr><td height="33" colspan="2">&nbsp;</td></tr>');
						array.push('<tr><td width="20%" style="color:red;vertical-align: top;"><input type="radio" id="'+shopPro[j]["product_sku_id"]+'" name="radiotype'+info[i]["company_shop_product_id"]+'" value="'+shopPro[j]["price"]+'"/></td>');
					}
					array.push('<td width="80%" class="td_gg" id="typeName'+shopPro[j]["product_sku_id"]+'">'+shopPro[j]["attrValName"]+'</td></tr>');
					array.push('<tr><td><input type="hidden" id="proSkuId'+shopPro[j]["product_sku_id"]+'" value="'+shopPro[j]["product_sku_id"]+'"/>'+
					          '<input type="hidden" id="shopProSkuId'+shopPro[j]["product_sku_id"]+'" value="'+shopPro[j]["company_shop_product_sku_id"]+'"/>'+
					          '<input type="hidden" id="oldPrice'+shopPro[j]["product_sku_id"]+'" value="'+shopPro[j]["old_price"]+'"/>'+
					          '</td><td class="td_gg">￥'+shopPro[j]["price"]+'</td></tr></table></td>');
					if(j==0&&j==shopPro.length-1){
						array.push('<td width="15%"></td><td width="15%"></td>');
					}else if(j==1&&j==shopPro.length-1){
						array.push('<td width="15%"></td>');
					}
				}
				array.push('</tr></table></td>');
				
				array.push('<td width="15%" valign="top">'+
				          '<table width="100%" border="0" cellspacing="0" cellpadding="0">'+
				          '<tr><td height="33" style="color:#0e8a02;font-size:13px">数量选择：</td></tr>'+
				          '<tr><td height="33" align="center" valign="middle"><img src="${ctx}/images/orderpage_xz.png" width="20" height="20" onclick="updtfield(1,'+info[i]["product_id"]+')" />'+
				          '<input class="input_middle"  maxlength="2" name="number'+info[i]["product_id"]+'" type="text" id="number'+info[i]["product_id"]+'" value="1" size="2" onblur="ckeck_val(this)"/>'+
				          '<img src="${ctx}/images/orderpage_jt.png" width="20" height="20" onclick="updtfield(2,'+info[i]["product_id"]+')"/></td>'+
				          '<td height="33">&nbsp;</td></tr></table></td>');
				
				array.push('<td width="3%"></td>');
				array.push('<td width="15%" valign="top">'+
				          '<table width="100%" border="0" cellspacing="0" cellpadding="0">'+
				          '<tr><td height="39" align="center"><img src="${ctx}/images/ordering_7.png" width="103" height="32" onclick="atOnceBuy('+info[i]["product_id"]+','+info[i]["company_shop_product_id"]+')" /></td></tr>'+
				          '<tr><td align="center"><img src="${ctx}/images/ordering_8.png" width="103" height="32" onclick="addUserCart('+info[i]["product_id"]+','+info[i]["company_shop_product_id"]+')"/></td>'+
				          '</tr></table></td><td width="8%">&nbsp;&nbsp;</td></tr>');
				
				array.push('<tr><td heigth="1%" colspan="7">&nbsp;</td></tr>');
				if(i<info.length-1){
					array.push('<tr><td width="4%"></td><td colspan="8"><hr style="1px solid #fcfcfc;"/></td></tr>');
					array.push('<tr><td width="4%">&nbsp;</td></tr>');
				}
			}
			$('#productList').html(array.join(''));
			
		}else
			alert(msg.msg);
		}
	});
}
	
function ckeck_val(obj){
	var val=$(obj).val();
	var tsd=/^\d+$/;
	var bolon=tsd.test(val);
	if(bolon==false){
		$(obj).val(1);
	}else{
		if(val>99){
			$(obj).val(99);
		}
	}	
}

function addUserCart(productid,shopproid){
	if(productid!=XBUXProductId){		
		addusercartin(productid,shopproid);
	}else{	
		$.ajax({
		     type: "POST",
		     async:false,
		     url : '/chjservice/product!checkProduct.action',
		     dataType:'json',
		     data:{productId:productid},
		     success: function(msg,status){
		    	if(msg.status == 200){
		    		var obj=msg.rows;
		    		if(obj==1){
		    			alert('活动期间，该商品每人限购一次，每次限购一个。你已将其加入购物车，请前往购物车购买或取消！');
		    		}else if(obj==2){
		    			alert('活动期间，该商品每人限购一次，每次限购一个。你已将其加入订单中，请您完成订单或取消！');
		    		}else if(obj==0){
		    			addusercartin(productid,shopproid);
		    		}
		    	}else{
		    		alert(msg.msg);
		    	}	    		
		     }	     
		});		
	}
}
	
	
function addusercartin(productid,shopproid){
	
	param["qty"]=$("#number"+productid).val();
	if(param["qty"]==""||param["qty"]=="0"){
		alert('请输入购买数量!');
		return;
	}
	var dex=$('input:radio[name="radiotype'+shopproid+'"]:checked').attr("id");
	if(dex==null){
		alert('请选择大小杯！');
		return;
	}	
	param["typeName"]=$('#typeName'+dex).html();
	param["companyShopProductSkuId"] =$('#shopProSkuId'+dex).val();
	param["skuId"]=$('#proSkuId'+dex).val();
	
	param["oldPrice"]=$('#oldPrice'+dex).val();
	param["price"]=$('input:radio[name="radiotype'+shopproid+'"]:checked').val();
	param["productId"]=productid;
	param["companyShopId"]=companyShopId;
	param["companyShopProductId"] =shopproid;
	
    $.ajax({
	     type: "POST",
	     url : '${ctx}/product!addUserProductCart.action',
	     dataType:'json',
	     async:false,
	     data:param,
	     success: function(msg,status){
	    	if(msg.status == 200){	
	    	  alert('成功加入购物车!');
	    	  finduserCartItemCount();
	    	}else{
	    		alert('已在购物车中！');	    		
	    	}
	     }
	});
}

	

function slefSetProduct(shopProId,productId){
	
	window.location.href="${ctx}/pages/orderpage.jsp?companyShopProductId="+shopProId+"&companyShopId="+companyShopId+"&productId="+productId;
}

function atOnceBuy(productid,shopproid){
	
	if(!shopStatusMsg(statusMsg,deliverOk)){
		return;
	}		
	if(productid!=XBUXProductId){		
		atOnceBuyto(productid,shopproid);
	}else{	
		$.ajax({
		     type: "POST",
		     async:false,
		     url : '/chjservice/product!checkProduct.action',
		     dataType:'json',
		     data:{productId:productid},
		     success: function(msg,status){
		    	if(msg.status == 200){
		    		var obj=msg.rows;
		    		if(obj==1){
		    			alert('活动期间，该商品每人限购一次，每次限购一个。你已将其加入购物车，请前往购物车购买或取消！');
		    		}else if(obj==2){
		    			alert('活动期间，该商品每人限购一次，每次限购一个。你已将其加入订单中，请您完成订单或取消！');
		    		}else if(obj==0){
		    			atOnceBuyto(productid,shopproid);
		    		}
		    	}else{
		    		alert(msg.msg);
		    	}	    		
		     }	     
		});		
	}
}
function atOnceBuyto(productid,shopproid){
	
	param["qty"]=$("#number"+productid).val();
	if(param["qty"]==""||param["qty"]=="0"){
		alert('请输入购买数量!');
		return;
	}
	var dex=$('input:radio[name="radiotype'+shopproid+'"]:checked').attr("id");
	if(dex==null){
		alert('请选择大小杯！');
		return;
	}	
	param["typeName"]=$('#typeName'+dex).html();
	param["companyShopProductSkuId"] =$('#shopProSkuId'+dex).val();
	param["skuId"]=$('#proSkuId'+dex).val();
	
	param["oldPrice"]=$('#oldPrice'+dex).val();
	param["price"]=$('input:radio[name="radiotype'+shopproid+'"]:checked').val();
	param["productId"]=productid;
	param["companyShopId"]=companyShopId;
	param["companyShopProductId"] =shopproid;
	
	param["money"]=param["qty"]*param["price"];
	$('#selectShop').html(param["shopName"]);
	param["nickName"]=$('#nickName'+productid).html();
	
	if(param["money"]<100){
		alert('此交易总额少于100元，无法生成订单！');
		return;
	}
	 	
	$('#main_style').attr("style","");
	$('#companytitle').hide();
	$('#companymain').hide();
	$('#cart_sure').show();
		
	var array=[];
	 var str='<div style="float:left; width:950px;margin-top:10px;">'
		       +'<div style="float:left;padding-left:15px; width:425px; height:55px;background-color:#FFF;border-bottom:#57ae97 solid 2px;">'
		       +'<p class="myorder_font4" style="text-align:left;">'+param["nickName"]+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+param["typeName"]+'</p></div> '
		       +'<div class="conv1" style="width:160px; height:55px; background-color:#FFF;border-bottom:#57ae97 solid 2px;">'
		       +'<p class="myorder_font4">'+param["price"]+'</p></div> '
		       +'<div class="conv1" style="width:160px; height:55px; background-color:#FFF;border-bottom:#57ae97 solid 2px;">'
		       +'<p class="myorder_font4">'+param["qty"]+'</p></div> '
		       +'<div class="conv1" style="width:160px; height:55px; background-color:#FFF;border-bottom:#57ae97 solid 2px;">'
		       +'<p class="myorder_font4">'+param["money"]+'</p></div>'
		       +'</div>';
		      
			array.push(str);
			
 $('#div_cartsure').html(array.join(''));
 $('#totaltotal').html((param["money"]+param["sendCost"]).toFixed(2));
 $('#txtOrderDeliver').html(param["sendCost"]);
 if(param["sendCost"]>0)
	 $('#txtOrderDeliverInfo').html('(含运费)');
 else
	 $('#txtOrderDeliverInfo').html('(不含运费)');
}


function submit_order(){
	if(selectAddress == -1){
		alert('请选择送货地址!');
		return;
	}
	param["shopId"]="${param.shopId}";
	param["areaId"]= addressArray[selectAddress]["areaId"];
	param["name"]=addressArray[selectAddress]["name"];
	param["address"]=addressArray[selectAddress]["parentArea"]+addressArray[selectAddress]["childArea"]+addressArray[selectAddress]["address"];
	param["phone"]=addressArray[selectAddress]["phone"];
	
	param["payType"]=$('#payType').val();
	param["sendType"]=$('#sendType').val();
	param["sendTime"]= $('#txtSendDate').val();
	param["info"]= $('#txtInfo').val();
	
	$.ajax({
	     type: "POST",
	     url : '${ctx}/product!addUserAndProduct.action',
	     dataType:'json',
	     data:param,
	     success: function(msg,status){
	    	if(msg.status == 200){
	    		
	     		window.location.href="${ctx}/product!findUserOrder.action";
	    	}else{
	    		alert(msg.msg);
	    	}	    		
		 } 
	});
}
function updateProduct(){
	$('#cart_sure').hide();
	$('#main_style').attr("style","background-color:#FFF;");
	$('#companytitle').show();
	$('#companymain').show();
}
function updtfield(i,va){
	var t=$('#number'+va).val();
	var n=parseInt(t);
	if(i==1){
		if(va==XBUXProductId){
			alert('活动期间，该商品每人限购一次，每次限购一个。');
			return;
		}		
		n+=1;
		}else if(i==2){n-=1;}
	if(n<1){n=1;}else if(n>99){n=99;}
	$('#number'+va).attr('value',n);
}
</script>


