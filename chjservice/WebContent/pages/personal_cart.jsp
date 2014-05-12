<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="${ctx}/css/input.css" />
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

/* 我的订单 */

.myorder_font{ color:#00b38a; font-size:14px;  font-weight:bold; text-align:center; padding-top:15px;}
.myorder_font1{ color:#00b38a; font-size:14px;  font-weight:bold; text-align:center; padding-top:45px;}
.myorder_font2{  font-size:14px;  font-weight:bold; text-align:center; padding-top:45px;}
.myorder_font02{ color:#00b38a; font-size:14px; font-weight:bold; }
.myorder1{
float:left;margin-left:10px;
}
.myorder1 img{
width:110px;height:115px;cursor:pointer;
}
.gray-font{color:#9a9a9c; font-size:14px; }
.myorder_font4{ color:#9a9a9c; font-size:14px;text-align: center;}


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

.main_content select {
width:180px;
height:24px;
}
#content{
background-color: #FFF;
border:solid 1px #CCC;
}
</style>

</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />
<script type="text/javascript" src="${ctx }/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/js/msgbox/msgbox.js"></script>
<script src="${ctx}/js/selectstores.js" type="text/javascript"></script>

<div class="main">
<div id="main_content" class="main_content">

<div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	     <div style="float:left;"><img src="${ctx}/images/menu_48.jpg" onclick="gotoPage('${ctx}/pages/personal_set.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_31.jpg" style="width:190px;"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_42.jpg" onclick="gotoPage('${ctx}/product!findUserOrder.action')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_43.jpg" onclick="gotoPage('${ctx}/pages/personal_friend.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_49.jpg" onclick="gotoPage('${ctx}/pages/personal_topic.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_44.jpg" onclick="gotoPage('${ctx}/pages/personal_circle.jsp')"/></div>
          <div class="menu1"><img src="${ctx}/images/menu_45.jpg" onclick="gotoPage('${ctx}/pages/personal_activity.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_47.jpg" onclick="gotoPage('${ctx}/pages/personal_collection.jsp')"/></div>
            <div class="menu1"><img src="${ctx}/images/personnel_home.png" onclick="gotoPage('${ctx}/pages/myhome.jsp')"/></div>
	    </div>
  
</div>
 
 <div id="cart_info">

  <div style="position:relative;height:55px; padding:10px 25px 0 25px;">
	   <div>
	      <div style="float:left; width:350px; height:55px; background-color:#FFF">
	      <p class="myorder_font">商品
         </p></div> 
          <div class="conv1" style="width:180px; height:55px; background-color:#FFF">
            <p class="myorder_font">商品信息</p></div> 
          <div class="conv1" style="width:110px; height:55px; background-color:#FFF">
            <p class="myorder_font">单价（元）</p></div> 
          <div class="conv1" style="width:160px; height:55px; background-color:#FFF">
            <p class="myorder_font">数量</p></div> 
         <div class="conv1" style="width:110px; height:55px; background-color:#FFF">
            <p class="myorder_font">小计（元）</p></div>
	   </div>
 </div>
 
<c:forEach var="cart" items="${cartList}" varStatus="index1">

 <div style="position:relative;height:55px; padding:10px 25px 0 25px;">
	   <div>
	      <div style="float:left;width:950px; height:55px; background-color:#fffef9">
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	        <td width="20px;" style="padding-left:5px;">
	          	<img id="imgCheckBox${index1.index}" onclick="selectAll(this,'${index1.index}','${fn:length(cart.cartProductList)}','imgCheckBox${index1.index}')"   width="28" height="28" src="${ctx}/images/check_box.png"/>
	        </td>
	      
	            <td height="52" style="padding-left:25px;"> 
	            <input type="hidden" id="companyShopId${index1.index}" value="${cart.companyShopId}"/>
	             店铺：
	            <span style="color:#00b38a" id="shopName${index1.index}">${cart.name}</span>
			
	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            
	               外送费：<span style="color:#00b38a" id="txtDeliverMoney${index1.index}">
	               <c:if test="${cart.deliverMoney=='' || cart.deliverMoney==null}">
	                 0
	               </c:if>
	              <c:if test="${cart.deliverMoney !=''}">
	                 ${cart.deliverMoney}
	               </c:if>
	             </span>元
	           
	            </td>
              </tr>
            </table>
	      </div> 
      
	   </div>
 </div>
 
<c:forEach var="carProduct" items="${cart.cartProductList}" varStatus="index2">



   
   <div style="position:relative;height:115px; padding:10px 25px 0 25px;">
	   <div>
	      <div style="float:left; width:350px; height:115px; background-image:url(${ctx}/images/myorder_116.png);">
	     <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
   <td width="20px"  valign="middle" style="height:115px;padding-left:5px;">
	          	<img class="imgCheckBox${index1.index}" onclick="selectProduct('${fn:length(cart.cartProductList)}',this,'${index1.index}','${index2.index}')" id="imgCheckBox${index1.index}${index2.index}"  width="28" height="28"  src="${ctx}/images/check_box.png"/>
	</td>
    <td width="100px" align="center" valign="middle" style="height:115px;padding-top:0px;">
    <img src="${imageStorePath}${carProduct.product.image}" width="80"  height="80" />
    </td>
    <td  valign="top" style="height:115px;padding-left:4px;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="2" style="color:#00b38a; font-weight:bold; font-size:12px;">
        <div id="txtProductName${index1.index}${index2.index}" 
        style="overflow: hidden;margin-top:10px;width:200px;height:14px;">
        ${carProduct.product.name}
        </div>
        </td>
      </tr>
      <tr>
      <td style="color:#9a9a9c;font-size:12px;padding-top:6px;padding-bottom:6x;">
        <div class="appendInfo" style="cursor:pointer;overflow: hidden;height:46px;width:210px;">
        ${carProduct.appendInfo.multiSelDetails}<br/>${carProduct.appendInfo.SingleSelDetails} 
        </div>
      </td>
     </tr>
     <tr>
        <td height="36" style="color:#9a9a9c; font-size:12px;">
        <c:choose>
        <c:when test="${carProduct.isCollection ==0 }">
      		<a style="cursor:pointer; color:#00b38a;font-size:12px;" onclick="addUserCollection(${carProduct.productId})">收藏</a>
        </c:when>
        </c:choose>
        
        <c:if test="${carProduct.appendInfo.multiSelDetails !=null ||carProduct.appendInfo.SingleSelDetails !=null}">
        <a style="cursor:pointer; color:#00b38a; font-size:12px;"  onclick="showAppend('divAppend${index1.index}${index2.index}')">
                            详细
        </a>
        </c:if>
        </td>
        </tr>
    </table></td>
  </tr>
</table>
</div>

         <div class="myorder1" style="overflow:hidden;padding:10px 0 10px 0;width:180px; height:95px;background-image:url(${ctx}/images/myorder_117.png);">
          <table width="90%" style="maring:10px;height: 107px" border="0" align="center" cellpadding="0" cellspacing="0">
             <tr>
               <td height="36" style="padding-left:15px;color:#00b38a;font-size:12px; font-weight:bold;">
                 <span id="spanSkuKind${index1.index}${index2.index}"> ${carProduct.sku.skuKind}</span>
                  <input id="txtProductId${index1.index}${index2.index}" type="hidden" value="${carProduct.productId}"/>
                 <input id="txtCartItemId${index1.index}${index2.index}" type="hidden" value="${carProduct.cartItemId}"/>
                 <input id="txtSkuId${index1.index}${index2.index}" type="hidden" value="${carProduct.productSkuId}"/>
                <input id="txtCompanyShopProductId${index1.index}${index2.index}" type="hidden" value="${carProduct.companyShopProductId}"/>
                <input id="txtCompanyShopProductSkuId${index1.index}${index2.index}" type="hidden" value="${carProduct.companyShopProductSkuId}"/>
               </td>
             </tr>
  
           
           </table>
         </div>
          <div class="myorder1" style="width:110px; height:115px;background-image:url(${ctx}/images/myorder_117.png);">
            <table width="90%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="58" align="center" class="brand_picx"><span id="txtOldPrice${index1.index}${index2.index}"> ${carProduct.oldPrice}</span></td>
              </tr>
              <tr>
                <td height="51" align="center"><span class="myorder_font1" id="txtPrice${index1.index}${index2.index}">${carProduct.price}</span></td>
              </tr>
            </table>
         <p class="myorder_font2">&nbsp;</p></div>
         <div class="myorder1" style="width:160px; height:115px;background-image:url(${ctx}/images/myorder_117.png);">
           <table width="90%" border="0" cellspacing="0" cellpadding="0">
             <tr>
               <td width="60" height="109" align="right">
               <img src="${ctx}/images/num_j.png" onclick="addQty(-1,'${index1.index}${index2.index}','${index1.index}')" width="33" height="35" style="height:35px; width:33px;" /></td>
               <td style="text-align: center;">
                 <input type="text" maxlength="6" onkeyup="value=value.replace(/[^\d]/g,'')"  onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" 
                  onblur="inputBlur('${index1.index}${index2.index}','${index1.index}')"
                  style="text-align: center;border:0px;width:60px;height:40px;line-height:40px;background:url(${ctx}/images/input_cart.png) no-repeat;" id="txtQty${index1.index}${index2.index}" value="${carProduct.qty}" />
               </td>
               <td width="40">
               <img src="${ctx}/images/num_z.png"  onclick="addQty(1,'${index1.index}${index2.index}','${index1.index}')" width="33" height="35" style="height:35px; width:33px;" /></td>
             </tr>
           </table>
           <p class="myorder_font1">&nbsp;</p></div>
         <div class="myorder1" style="width:110px; height:115px;background-image:url(${ctx}/images/myorder_117.png);">
           
           <p class="myorder_font1"><span  id="total${index1.index}${index2.index}"  class="littleTotalMoney${index1.index}"><fmt:formatNumber value="${carProduct.qty *carProduct.price}" pattern="#.##" minFractionDigits="2" />  

           </span></p>
           
           </div>
	   </div>
   </div>
   
    <div id="divAppend${index1.index}${index2.index}" style="display:none;clear:both;position:relative;padding:10px 25px 0px 25px;">
	   <div>
	      <div style="float:left;font-size:13px;background:#fff;color:#9a9a9c; width:930px;padding-left:20px; padding-top:20px;padding-bottom:20px;">
	      ${carProduct.appendInfo.multiSelDetails}<br/><br/>${carProduct.appendInfo.SingleSelDetails}
	      </div>
	       <div style="float:left;height:10px;color:#9a9a9c; width:950px;">
	        &nbsp;
	      </div>
	   </div>
	</div>
	 
	 
   </c:forEach>
  
   
</c:forEach> 
   
   
   
   
   
   
   <div style="clear:both;position:relative; padding:10px 25px 0 25px;">
      <div style="height:55px;color:#9a9a9c;  width:950px; background-color:#FFF;"> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="17%" align="center"><a style="color:#9a9a9c;" href="javascript:void(0)" onclick="cancelCarProduct()">取消商品</a></td>
            <td width="15%"></td>
            <td width="19%"></td>
            <td width="13%">已选商品  <span style="color:#00b38a;" id="totalCountProduct">0</span>  件</td>
            <td width="24%">
                <span id="txtDeliverInfo">合计(不含运费):</span> 
            <span style="color:#00b38a;" id="totalMoneyProduct">0.00</span>  元</td>
            <td width="12%"><img src="${ctx}/images/jiesuan.png" onclick="computerTotal()" width="116" height="54" /></td>
          </tr>
        </table>
      <p style=" padding-top:15px;">&nbsp;</p> </div>
   </div>
</div>
	
	<div id="cart_sure" style="display:none;">
	
	 <div id="cart_address" style="position:relative; padding:10px 25px 0 25px;">
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
	        <td width="500px" style="font-weight:bold; padding-left:15px;padding-top: 8px;">
	          	店铺：<span style="color:#00b38a" id="selectShop"></span>
	        </td>
	         <td width="100px"  style="font-weight:bold; padding-left:15px;padding-top: 8px;">
	          	运费：<span style="color:#00b38a" id="txtOrderDeliver"></span>
	        </td>
	        <td  style="padding-right:40px;padding-top: 8px;">
	          	<ul class="ul-button">
	          	<li onclick="$('#cart_info').show();$('#cart_sure').hide();"><div>修改</div></li>
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
	      	<span id="txtOrderDeliverInfo" style="padding-top: 25px;">(不含运费):</span>
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
 
  <p> <br/><br/><br/></p>
	  
  <jsp:include page="/common/bottom.jsp" />
  
	
	
</div>
</div>



<div id="showDiv" onclick="$('#showDiv').hide()" style="display:none;background:red;cursor:pointer;width:500px;height:400px;position:absolute;z-index:99999999999;left:100px;top:400px;">

</div>



</body>
</html>

<script type="text/javascript">
var statusMsg = ${statusMsg};
$(function(){
	
	initInput('txtInfo','spanInfo','备注30字以内',30);
	loadUserAddress();
	$.each($('.appendInfo'),function(){
		var con = $(this).html();
		if(con.length>75){
			$(this).html(con.substr(0,70)+'...');
		}
	});
});
function initInput(txtId,spanId,text,lengthTxt){
	var title=document.getElementById(txtId);
	title.onfocus=function(){
	if(this.value ==text){
		this.value='';
	}
	else
		this.className='input-color-focus';
	};
	title.onblur=function(){
	if(this.value==''){
	  this.value=text;
	  this.className='input-color';
	}
	else
		this.className='input-color-focus';
	};
	title.onkeyup=function(){
		if(this.value !=''){
			this.className='input-color-focus';
		}
		if(this.value.length <= lengthTxt)
			$('#'+spanId).html(this.value.length+'/'+lengthTxt);
		
	};
	
}
function addQty(type,index12,index1){
	var value = $('#txtQty'+index12).val();
	
	if(XBUXProductId==$('#txtProductId'+index12).val()){
		if(type>0&&value>=1){
			$('#txtQty'+index12).val(1);
			alert('活动期间，该商品每人限购一次，每次限购一个。');
			return;
		}
	}
	
	if(type == -1 && value ==0){
		return;
	}else{
		if($.trim(value).length==0){
			$('#txtQty'+index12).val(0);
			return;
		}
		
		var deliverMoney = parseInt($('#txtDeliverMoney'+index1).html(),10);
		var qty = parseInt(value,10)+type;
		$('#txtQty'+index12).val(qty);
		var price = parseFloat($('#txtPrice'+index12).html());
		$('#total'+index12).html((qty*price+deliverMoney).toFixed(2));
		
		productTotal(index1);
	};
}
function inputBlur(index12,index1){
	 $('#txtQty'+index12).val($('#txtQty'+index12).val().replace(/[^\d]/g,''));
	var value = $('#txtQty'+index12).val();
	if($.trim(value).length==0){
		$('#txtQty'+index12).val(1);
		value=1;
	}
	var qty = parseInt(value,10);
	var price = parseFloat($('#txtPrice'+index12).html());
	$('#total'+index12).html((qty*price).toFixed(2));
	
	productTotal(index1);
}
function productTotal(index1){
	var total=0;
	var str = 0;
	$.each($('.imgCheckBox'+index1),function(index,data){
		if($(data).attr('src').indexOf('check_box_sel.png') !=-1){
			var money =	$('.littleTotalMoney'+index1)[index];
			str += parseFloat($(money).html());
			total +=parseFloat($('#txtQty'+index1+""+index).val());
		}
	});
	if(str>0){
		var val = parseInt($('#txtDeliverMoney'+index1).html(),10);
		str +=val;
		if(val>0)
			$('#txtDeliverInfo').html('合计(含运费):');
		else
			$('#txtDeliverInfo').html('合计(不含运费):');
	}
		
	$('#totalMoneyProduct').html(str.toFixed(2));
	$('#totalCountProduct').html(total);
}

var selectShop=0;//当前店铺
var preSelectIndex='';//上个店铺
var isSelect={};
function selectAll(obj,index,childCount,classname){
	if(preSelectIndex!='' && preSelectIndex!=index){
		isSelect[""+preSelectIndex]=0;
		$('#imgCheckBox'+preSelectIndex).attr("src","${ctx}/images/check_box.png");
		$('.imgCheckBox'+preSelectIndex).attr("src","${ctx}/images/check_box.png");
	}
	selectShop=index;
	preSelectIndex=index;
	isSelect["count"+index]=childCount;
	for(var i=0; i<childCount;i++){
		isSelect[""+index+""+i]=1;
	}
	if(isSelect[""+index]==undefined || isSelect[""+index]==0){
		$('#totalCountProduct').html(childCount);
		
		$(obj).attr("src","${ctx}/images/check_box_sel.png");
		isSelect[""+index]=1;
		$('.'+classname).attr("src","${ctx}/images/check_box_sel.png");
	}else if(isSelect[""+index]==1){
		$(obj).attr("src","${ctx}/images/check_box.png");
		isSelect[""+index]=0;
		$('.'+classname).attr("src","${ctx}/images/check_box.png");
	}
	

	productTotal(index);
}
function selectProduct(childCount,obj,index1,index2){
	var flag=false;
	if(index1 != preSelectIndex && preSelectIndex!=''){
		var count=0;
		$.each($('.imgCheckBox'+preSelectIndex),function(index,data){
			if($(data).attr('src').indexOf('check_box_sel.png') !=-1)
			   count++;
		});
		if(count>0)
			alert('只能选择同一家店铺!');
		else
			flag=true;
	}else
		flag=true;
	if(flag){
		selectShop=index1;
		preSelectIndex=index1;
		isSelect["count"+index1]=childCount;
		
		if(isSelect[""+index1]!= 1 && isSelect[""+index1+""+index2]==undefined || isSelect[""+index1+""+index2]==0){
			isSelect[""+index1+""+index2]=1;
			$(obj).attr("src","${ctx}/images/check_box_sel.png");
			
			var count=0;
			$.each($('.imgCheckBox'+index1),function(index,data){
				if($(data).attr('src').indexOf('check_box_sel.png') !=-1)
				   count++;
			});
			if(childCount == count){
				isSelect[""+preSelectIndex]=1;
				$('#imgCheckBox'+index1).attr("src","${ctx}/images/check_box_sel.png");
			};				
		}else{
			isSelect[""+index1]=0;
			$('#imgCheckBox'+index1).attr("src","${ctx}/images/check_box.png");
			isSelect[""+index1+""+index2]=0;
			$(obj).attr("src","${ctx}/images/check_box.png");
		}
		productTotal(index1);
	};
}
var cartItem={};
function computerTotal(){
	if($('#totalCountProduct').html() ==0){
		alert('请选择商品!');
	}else{
		
		cartItem["shopId"]=$('#companyShopId'+selectShop).val();
		cartItem["sendCost"]=parseInt($('#txtDeliverMoney'+selectShop).html(),10);
		cartItem["money"]=0;
		cartItem["item"]=[];
		var array=[];
		$.each($('.imgCheckBox'+selectShop),function(index,data){
			
			if($(data).attr('src').indexOf('check_box_sel.png') !=-1){
				var item={};
				item["total"]=	$('#total'+selectShop+""+index).html();
				cartItem["money"] +=parseFloat(item["total"]);				
				item["price"]=$('#txtPrice'+selectShop+""+index).html();
				item["oldPrice"]=$('#txtOldPrice'+selectShop+""+index).html();
				item["qty"]=$('#txtQty'+selectShop+""+index).val();
				item["name"]=$('#txtProductName'+selectShop+""+index).html();
				item["productId"]=$('#txtProductId'+selectShop+""+index).val();
				item["cartItemId"]=$('#txtCartItemId'+selectShop+""+index).val();
				item["skuId"]=$('#txtSkuId'+selectShop+""+index).val();
				item["companyShopProductId"]=$('#txtCompanyShopProductId'+selectShop+""+index).val();
				item["companyShopProductSkuId"]=$('#txtCompanyShopProductSkuId'+selectShop+""+index).val();			
				cartItem["item"].push(item);
				var selectSKu = $('#spanSkuKind'+selectShop+""+index).html();
				if($.trim(selectSKu).length>0){
					selectSKu="("+selectSKu+")";
				}
				 var str='<div style="float:left; width:950px;margin-top:10px;">'
			       +'<div style="float:left;padding-left:15px; width:425px; height:55px;background-color:#FFF;border-bottom:#57ae97 solid 2px;">'
			       +'<p class="myorder_font4" style="text-align:left;">'+item["name"]+selectSKu+'</p></div> '
			       +'<div class="conv1" style="width:160px; height:55px; background-color:#FFF;border-bottom:#57ae97 solid 2px;">'
			       +'<p class="myorder_font4">'+item["price"]+'</p></div> '
			       +'<div class="conv1" style="width:160px; height:55px; background-color:#FFF;border-bottom:#57ae97 solid 2px;">'
			       +'<p class="myorder_font4">'+item["qty"]+'</p></div> '
			       +'<div class="conv1" style="width:160px; height:55px; background-color:#FFF;border-bottom:#57ae97 solid 2px;">'
			       +'<p class="myorder_font4">'+item["total"]+'</p></div>'
			       +'</div>';
				array.push(str);
			};
		});
		if(cartItem["shopId"]==192&&cartItem["money"]<100){
			alert('此'+$('#shopName'+selectShop).html()+'店铺交易总额少于100元，无法生成订单！');
			return;
		}
		findShopPayTypeAndisDeliver($('#companyShopId'+selectShop).val());
		$('#cart_info').hide();
		$('#cart_sure').show();
		$('#selectShop').html($('#shopName'+selectShop).html());	
		
		 $('#div_cartsure').html(array.join(''));
		 $('#totaltotal').html((cartItem["money"]+cartItem["sendCost"]).toFixed(2));
		 $('#txtOrderDeliver').html(cartItem["sendCost"]);
		 if(cartItem["sendCost"]>0)
			 $('#txtOrderDeliverInfo').html('(含运费)');
		 else
			 $('#txtOrderDeliverInfo').html('(不含运费)');
		}
}
function cancelCarProduct(){
	var array=[];
	$.each($('.imgCheckBox'+selectShop),function(index,data){
		
		if($(data).attr('src').indexOf('check_box_sel.png') !=-1){
			var item={};
			item["shopId"]=$('#companyShopId'+selectShop).val();
			item["productId"]=$('#txtProductId'+selectShop+""+index).val();
			item["cartItemId"]=$('#txtCartItemId'+selectShop+""+index).val();
			item["skuId"]=$('#txtSkuId'+selectShop+""+index).val();
			array.push(item);
		};
	});
	if(array.length > 0){
		$.ajax({
		     type: "POST",
		     url : '${ctx}/product!cancelCarProduct.action',
		     dataType:'json',
		     data:{cart:JSON.stringify(array)},
		     success: function(msg,status){
		    	if(msg.status == 200){
		    		SetCookie("userCartCount","");
		    		alert('取消成功!');
		    		window.location.reload();
		    	}else{
		    		alert(msg.msg);
		    	};
		     }
		});
	};
	
	
}
function addUserCollection(productId){
	
		$.ajax({
		     type: "POST",
		     url : '${ctx}/user!collectionUserRestarant.action',
		     dataType:'json',
		     data:{objectId:productId,type:5},
		     success: function(msg,status){
		    	if(msg.status == 200){
		    		alert('收藏成功!');
		    	}
		    	else{
		    		alert('已收藏成功!');
		    	}
		     }
		});
}

var addressArray=[];
var selectAddress=-1;

function selectAddress_fun(index){
	selectAddress=index;
	for(var i=0;i<addressArray.length;i++){
		if(i==index){
			$('#td-address'+i).css('color','#00b38b');
			$('#address'+i).attr('src',"${ctx}/images/check_box_sel.png");
		}
		else{
			$('#td-address'+i).css('color','#9a9a9c');
			$('#address'+i).attr('src',"${ctx}/images/check_box.png");
		}
	}
}
function sendTypeChanged(obj){
	if($(obj).val()=="2"){//自取
		
		$('#cart_address').hide();
		selectAddress=-1;
	}
	else{
		$('#cart_address').show();
	}
}
function submit_order(){
	
	 if(!shopStatusMsg(statusMsg,cartItem["deliverOK"])){
		 return;
	 }
	if(selectAddress == -1){
		alert('请选择送货地址!');
	}else{
		
		var info='';
		if($.trim($('#txtInfo').val()) == '备注30字以内'){
			info='';
		}
		else
			info=$('#txtInfo').val();
		
		cartItem["areaId"]= addressArray[selectAddress]["areaId"];
		cartItem["name"]=addressArray[selectAddress]["name"];
		cartItem["address"]=addressArray[selectAddress]["parentArea"]+addressArray[selectAddress]["childArea"]+addressArray[selectAddress]["address"];
		cartItem["phone"]=addressArray[selectAddress]["phone"];
		cartItem["payType"]=$('#payType').val();
		cartItem["sendType"]=$('#sendType').val();
		cartItem["sendTime"]= $('#txtSendDate').val();
		cartItem["info"]= info;
		cartItem["cart"]=JSON.stringify(cartItem["item"]); 
		$.ajax({
		     type: "POST",
		     url : '${ctx}/product!createOrder.action',
		     dataType:'json',
		     data:cartItem,
		     success: function(msg,status){
		    	if(msg.status == 200){
		    		SetCookie("userCartCount","");
		    		alert(msg.msg,function(){
		    			window.location.href="${ctx}/product!findUserOrder.action";
		    		});
		    	}else{
		    		alert(msg.msg);
		    	}
		    		
			 } 
		});
	}
}

var divAppend={};
function showAppend(index12){
	if(divAppend[""+index12]==undefined || divAppend[""+index12]==0){
		$('#'+index12).show();
		divAppend[""+index12]=1;
	}else{
		divAppend[""+index12]=0;
		$('#'+index12).hide();
	}
}

</script>

