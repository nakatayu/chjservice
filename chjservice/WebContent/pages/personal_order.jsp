<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/js/dialog/dialog_subModal.css" />
<title>漕河泾e服务</title>
<style type="text/css">
/* 我的订单 */

.myorder_font{ color:#00b38a; font-size:14px;   text-align:center; padding-top:15px;padding-bottom:15px;}
.myorder_font6{ color:#00b38a; font-size:14px; text-align:left; padding-left:15px;padding-top:15px;padding-bottom:15px;}

.myorder_font1{ color:#00b38a; font-size:14px; text-align:center; padding-top:45px;}
.myorder_font2{  font-size:14px;text-align:center; padding-top:45px;}
.myorder_font02{ color:#00b38a; font-size:14px; }
.myorder1{
float:left;margin-left:10px;
width:110px; height:115px;background-image:url(${ctx}/images/myorder_117.png);
}
.myorder1 img{width:80px;height:80px;}

.personal_fr1{
float:left;margin-left:10px;
}

.conv1{
float:left;margin-left:10px;
width:110px; height:55px; background-color:#FFF;
}
.conv1 img{
width:110px;height:110px;cursor:pointer;
}

.comm2{float:left;margin-left:10px;}
.orderinfo{float:left;height:100px; background-color:#FFF;}
.orderinfo-title{
float:left;	width:120px; height:50px; background-color:#FFF;
}
.myorder_font a{
text-decoration: underline;
}
.myorder_font a:hover{
color:red;
}

ul.ul-button li{
width:100px;
height:30px;
list-style: none;
color:#fff;
background:#65d8bd;
font-weight:bold;
}
ul.ul-button li:hover{
cursor:pointer;
background:#00b36b;
}
ul.ul-button li div{
text-align: center;
padding-top:6px;
}
ul.ul-buy {
margin:0px;
}
ul.ul-buy li{
width:100px;
height:30px;
list-style: none;
color:#fff;
background:#f15f48;
font-weight:bold;
}
ul.ul-buy li:hover{
cursor:pointer;
background:#f15f22;
}
ul.ul-buy li div{
text-align: center;
padding-top:6px;
}

ul.ul-menue {
margin:0px;
}
ul.ul-menue li{
width:474px;
height:40px;
list-style: none;
color:#fff;
float:left;
background:#65d8bd;
font-weight:bold;
border-left: #ccc solid 1px;
}
ul.ul-menue li:hover{
cursor:pointer;
background:#00b36b;
}
ul.ul-menue li div{
text-align: center;
padding-top:10px;
}
.ul-menue-sel{
background:#f15f22;
}
.orderinfo {
color:#999;
font-size:14px;

}
.orderinfo a{
text-decoration: underline;
color:#999;cursor:pointer;
 font-size:14px; 
}

</style>
</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />
<script type="text/javascript" src="${ctx}/js/dialog/dialog_common.js"></script>
<script type="text/javascript" src="${ctx}/js/dialog/dialog_subModal.js"></script>

<div class="main">
<div id="main_content" class="main_content">
   
  
   

<div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	     <div style="float:left;"><img src="${ctx}/images/menu_48.jpg" onclick="gotoPage('${ctx}/pages/personal_set.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_41.jpg" onclick="gotoMyCart()"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_35.jpg" style="width:190px;" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_43.jpg" onclick="gotoPage('${ctx}/pages/personal_friend.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_49.jpg" onclick="gotoPage('${ctx}/pages/personal_topic.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_44.jpg" onclick="gotoPage('${ctx}/pages/personal_circle.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_45.jpg" onclick="gotoPage('${ctx}/pages/personal_activity.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_47.jpg" onclick="gotoPage('${ctx}/pages/personal_collection.jsp')"/></div>
            <div class="menu1"><img src="${ctx}/images/personnel_home.png" onclick="gotoPage('${ctx}/pages/myhome.jsp')"/></div>
	    </div>
  
</div>
  
<div style="position:relative; height:40px;padding:10px 25px 0 25px;">
	   <div>
	      <ul class="ul-menue">
	      <li  id="menue_li0" style="background:#00b36b;font-size:16px;" value="0"><div>待付款</div></li>
	       <li  id="menue_li1"  value="1" style="font-size:16px;"><div>已付款</div></li>
	      </ul>
	   </div>
</div>

 <div style="position:relative;height:50px;  padding:10px 25px 0 25px;">
	   <div>
	      <div style="float:left; width:410px; height:50px; background-color:#FFF">
	      <p class="myorder_font">订单信息</p></div> 
          <div class="orderinfo-title" style="width:80px"><p class="myorder_font">总费用</p></div> 
          <div class="orderinfo-title" style="width:80px"><p class="myorder_font">附加费</p></div> 
          <div class="orderinfo-title" style="width:80px"><p class="myorder_font">商品总费</p></div> 
          <div class="orderinfo-title" ><p class="myorder_font">交易状态</p></div> 
          <div class="orderinfo-title" style="width:180px;"><p class="myorder_font">交易操作</p></div> 
	   </div>
 </div>

  
   
<div id="allOrder" style="height:auto;">

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
	placeholder : '<span class="Apple-style-span" style="line-height:19px;white-space:normal;font-size:13px;">http://www.173it.cn/css/grey.gif</span>', //加载图片前的占位图片  
 	effect      : "fadeIn" //加载图片使用的效果(淡入)  
 });  
	
	findUserOrderList(1,0);
	
	$(".ul-menue li").click(function(index) {
		
		selectMenueIndex = this.getAttribute("value");
		for(var i=0; i < 3; i++){
			if(selectMenueIndex == i){
				$('#menue_li'+i).css("background","#00b36b");
			}
			else{
				$('#menue_li'+i).css("background","#65d8bd");
			}	
		}
		$(".ul-menue li").hover(function() {
			$(this).css("background","#00b36b");
		},function(){
			var selValChild = this.getAttribute("value");
			if(selValChild !=selectMenueIndex)
			    $(this).css("background","#65d8bd");
		});
		findUserOrderList(1,selectMenueIndex);
	});
	 
});

var selectMenueIndex=0;

PageClick = function(pageclickednumber) {
    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
    findUserOrderList(pageclickednumber,selectMenueIndex);
};
var payTypeArray=["到店支付","货到付款(现金)","货到付款(一卡通)","货到付款(银行卡)","线上支付(一卡通)","线上支付(银行卡)"];
var orderStatusArray=["未处理","已接受","已拒绝","配送中","交易完成","已取消"];

function findUserOrderList(page,type){
	pageinfo["page"]=page;
	pageinfo["size"]=10;
	pageinfo["type"]=type;
	$.ajax({
	    type: "POST",
	    url : '${ctx}/product!findUserOrderList.action',
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
		    		   var status="未付款";
		    		   var operator=[];
		    		   operator.push(payTypeArray[data["payType"]-1]);
		    		   operator.push(orderStatusArray[data["status"]-1]);
		    		  if(data["payStatus"] !="2"){
		    			  status="未付款";
		    			  if(data["status"]=='1'){
		    				   operator.push('<a style="color:#999;cursor:pointer;" onclick="order_cancle('+data["orderId"]+')">取消订单</a>');
		    			   }
		    			   if(data["payType"]==5 || data["payType"]==6){
 
		    				   if(data["status"]!='6')
		    				     operator.push('<ul class="ul-buy"><li onclick="operatorMoney('+data["orderId"]+')"><div>付款</div></li></ul>');

		    			   }
		    		  }
		    		  else {
		    			  status="已付款";
		    		  	  if(data["status"]=="5"){
		    		  		  if(data["productCommentCount"]>=data["orderItemList"].length){
		    		  			   operator.push('<ul class="ul-button"><li onclick="order_comment('+data["orderId"]+')"><div>查看评价</div></li></ul>');
		    		  		  }
		    		  		  else{
		    		  			   operator.push('<ul class="ul-button"><li onclick="order_comment('+data["orderId"]+')"><div>待评价</div></li></ul>');
		    		  		  }
		    			 
		    		   	  }
		    		  }
		    		  var info=data["info"];
		    		  if(info.length>30){
		    			  info = info.substr(0,30)+"...";
		    		  }
		    		 
		    		   var str='<div id="theOrder'+data["orderId"]+'" style="positon:relative;height:100px;  padding:10px 25px 0 25px;">'
		    			   +'<div>'
		    			   +'<div style="float:left; width:410px; height:100px; background-color:#FFF">'
		    			   +'<p class="myorder_font6">'
		    			   +'<span style="color:#999">订单编号：</span>'+data["flowNo"]+'<br/>'
		    			   +'<span style="color:#999">成交时间：</span>'+data["orderTime"]+'<br/>'
		    			   +'<span style="color:#999">店铺名称：</span>'+data["shopName"]+'<br/>'
		    			   +'<span style="color:#999">订单备注：</span>'+info
		    			   +'</p>'
		    			   +'</div>'
		    			   +'<div class="orderinfo" style="width:80px"><table width="80" height="100"><tr><td valign="middle" align="center"><p class="myorder_font">'+data["total"]+'</p></td></tr></table></div> '
		    			   +' <div class="orderinfo" style="width:80px"><table width="80" height="100"><tr><td valign="middle" align="center"><p class="myorder_font">'+data["sendCost"]+'<br/><span style="color:#999">(运费)</span></p></td></tr></table></div> '
		    			   +'<div class="orderinfo" style="width:80px"><table width="80" height="100"><tr><td valign="middle" align="center"><p class="myorder_font">'+data["money"]+'</p></td></tr></table></div> '
		    			   +'<div class="orderinfo" >'
		    			   +'<table width="120" height="100"><tr><td valign="middle" align="center"><p class="myorder_font">'+status+'<br/>'
		    			   +'<a style="color:#999;cursor:pointer;" onclick="order_detail('+i+')">订单详情</a><br/>'
		    			   +'<a style="color:#999;cursor:pointer;" onclick="order_flow('+data["orderId"]+')">查看物流</a>'
		    			   +'</p></td></tr></table></div> '
		    			   +' <div class="orderinfo" style="width:180px;"><table height="90" width="180"><tr><td valign="middle" align="center">'+operator.join('<br/>')+'</td></tr></table></div> '
		    			   +'</div>'
		    			   +' </div>'
		    			   +' </div>';
		    			   
		    			   str +='<div id="orderDetail'+i+'" style="display:none;">';
		    			   str +='<div style="position:relative;height:55px; padding:10px 25px 0 25px;">';
	    					  
	    				   var count=0;
	    				   var children='';
		    			   for(var h=0; h <data["orderItemList"].length;h++){
		    				   var datadata = data["orderItemList"][h];
		    				   count += parseFloat(datadata["qty"]);
		    				   var detail='';
		    				   if(datadata["appendInfo"]["multiSelDetails"].length>0||
		    						   datadata["appendInfo"]["multiSelDetails"].length>0){
		    					   detail='<a onclick="showAppend(\'divAppend'+(i+''+h)+'\')" style="cursor:pointer; color:#00b38a; font-size:12px;">详细</a>';
							   }
		    				   
		    				  var appendInfo=datadata["appendInfo"]["multiSelDetails"]+'<br/>'+datadata["appendInfo"]["SingleSelDetails"];
		
		    				   if(appendInfo.length>50){
		    					   appendInfo = appendInfo.substr(0,46)+"...";
		    				   }
		    				   
		    				   children +='<div style="position:relative;height:115px; padding:10px 25px 0 25px;">'
		    					   +'  <div>'
		    					   +' <div  class="myorder1" style="float:left;margin-left:0px;width:350px;">'
		    					   +'<table width="100%" border="0" cellspacing="0" cellpadding="0">'
		    					   +'<tr>'
		    					   +' <td width="100px" align="center" valign="middle" style="height:115px;padding-top:0px;">'
		    					   +'<img src="${imageStorePath}'+datadata["product"]["image"]+'" width="80" height="80" />'
		    					   +'</td>'
		    					   +'<td  valign="top" style="height:115px;padding-left:4px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">'
		    					   +'<tr>'
		    					   +'<td  colspan="2" style="color:#00b38a; font-size:12px;">'
		    					   +'<div style="overflow: hidden;margin-top:10px;width:200px;height:14px;">'+datadata["product"]["name"]+'</div></td>'
		    					   +'</tr>'
		    					   +'<tr>'
		    					   +'<td style="color:#9a9a9c;font-size:12px;padding-top:6px;padding-bottom:6x;">'
		    					   +'<div style="cursor:pointer;overflow: hidden;height:46px;width:210px;">'+appendInfo+'</div>'
		    					   +'</td>'
		    					   +'</tr>'
		    					   +'<tr>'
		    					   +' <td width="250" style="color:#999; font-size:12px;padding-top:6px;">'
		    					   +detail
		    					   +'</td></tr>'
		    					   +' </table></td>'
		    					   +' </tr>'
		    					   +'</table>'
		    					   +'</div>'
		    					   +' <div class="myorder1" style="width:230px;" ><p class="myorder_font1">'+datadata["sku"]["skuKind"]+'</p></div> '
		    					   +' <div class="myorder1"><p class="myorder_font1">'+datadata["price"]+'</p></div>'
		    					   +'<div class="myorder1"><p class="myorder_font2">'+datadata["qty"]+'</p></div>'
		    					   +' <div class="myorder1"><p class="myorder_font1">'+datadata["total"]+'</p></div>'
		    					   +' </div>'
		    					   +'</div>';
		    					   
		    			  children +=' <div id="divAppend'+(i+''+h)+'" style="display:none;clear:both;position:relative;padding:10px 25px 0px 25px;">'+
		    				   '<div>'+
		    				   '   <div style="float:left;font-size:13px;background:#fff;color:#9a9a9c; width:930px;padding-left:20px; padding-top:20px;padding-bottom:20px;">'+
		    				     datadata["appendInfo"]["multiSelDetails"]+'<br/><br/>'+datadata["appendInfo"]["SingleSelDetails"]+
		    				     ' </div>'+
		    				      ' <div style="float:left;height:10px;color:#9a9a9c; width:950px;">&nbsp;</div>'+
		    				   '</div>'+
		    				 '</div>';
		    			
		    			   }
		    			 str += ' <div>'
    					   +'<div class="conv1" style="margin-left:0px;width:350px;"><p class="myorder_font">商品详情</p></div> '
    					   +' <div class="conv1" style="width:230px;" ><p class="myorder_font">商品信息(sku)</p></div> '
    					   +'<div class="conv1" ><p class="myorder_font">单价(元)</p></div> '
    					   +'<div class="conv1" ><p class="myorder_font">数量<br/>'+count.toFixed(2)+'</p></div> '
    					   +'<div class="conv1" ><p class="myorder_font">实付款(元)</p></div> '
    					   +'</div>'
    					   +' </div>'
    					   +children;
    					  
		    			   str +="</div>";
		    			   array.push(str);
		    	   }
		    	   $("#allOrder").html(array.join(''));
	   		}
	   		else{
	   			alert(msg.msg);
	   		}
	   	} 
	});
}
var IsOrderDetail={};
function order_detail(index){
	if(IsOrderDetail[""+index] ==undefined || IsOrderDetail[""+index]==0){
		IsOrderDetail[""+index]=1;
		$('#orderDetail'+index).show();
	}
	else{
		IsOrderDetail[""+index]=0;
		$('#orderDetail'+index).hide();
	}
}
function order_cancle(obj){
		
	window.confirm('您确定取消该订单吗?',function(){
		
		$.ajax({
		    type: "POST",
		    url : '${ctx}/product!cancelUserOrder.action',
		    dataType:'json',
		    data:{orderId:obj},
		    success: function(msg,status){
		    	if(msg.status==200){
		    		alert('取消成功!');
		    		window.location.reload();
		    	}
		    	else{
		    		alert(msg.msg);
		    	}
		    }
		});		
	}); 	
}
function order_flow(id){
	$('#hiddenOrderId').val(id);
	$('#formturn').attr('action',"${ctx}/product!findOrderFlow.action");
	$('#formturn').submit();
}
function order_comment(id){
	$('#hiddenOrderId').val(id);
	$('#formturn').attr('action',"${ctx}/product!findOrderProductList.action");
	$('#formturn').submit();
}
var divAppend={};
function showAppend(index12){
	if(divAppend[""+index12]==undefined || divAppend[""+index12]==0){
		$('#'+index12).show();
		divAppend[""+index12]=1;
	}
	else{
		divAppend[""+index12]=0;
		$('#'+index12).hide();
	}
}
function commentOrder(name,productId,companyShopProductId,orderItemId){
	$('#hiddenOrderItemId').val(orderItemId);
	$('#hiddenProductId').val(productId);
	$('#hiddenCompanyShopProductId').val(companyShopProductId);
	$('#hiddenProName').val(name);
	$('#formturn').attr('action',"${ctx}/product!findOrderProductComment.action");
	$('#formturn').submit();
}

function operatorMoney(orderId){
	$.ajax({
	    type: "POST",
	    url : '${ctx}/product!operatorMoney.action',
	    dataType:'json',
	    data:{orderId:orderId},
	    success: function(msg,status){
	    	if(msg.status==200){
	    		var i=msg.total;
	    		createShandOrderInfo(orderId);
	    		if(i==1){
	    			createTheDepuOrderInfo(orderId);
	    		}else{
	    			createShandOrderInfo(msg.rows);
	    		}
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
	    }
	});	
}

function createShandOrderInfo(orderId){
	showPopWin('杉德卡支付平台','${ctx}/common!goodsInfo.action?&orderId='+orderId, 500, 250,  payMoneySss);
}

function createTheDepuOrderInfo(orderId){

	showPopWin(null,'${ctx}/pages/depu/pay_money.jsp?&orderId='+orderId, 460, 290,  payMoneySss);
}

function payMoneySss(){
	alert(0);
}

</script>

