<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@page import="com.chj.util.*" %>
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
float:left;margin-left:10px;height:272px;
}
.conv4 img{
width:170px;height:170px;cursor:pointer;
}
.conv5{
width:170px;height:272px;
overflow:hidden;
background:#000000;filter:alpha(opacity=65);-moz-opacity:0.65;opacity:0.65; 
float:left;margin-left:10px;
color:#fff;
font-size:16px;
}

.index_Productfont{float:left;padding-left:10px; line-height:51px;width:110px; }

ul.ul-tag{

}
ul.ul-tag li{
float:left;
list-style: none;
background: #F63;
display: inline-block;
margin-left:5px;
margin-top:5px;
font-size:14px; 
cursor:pointer;
text-align:center;
max-width: 200px;/*具体数值自行修改，下一行相同*/
word-break:keep-all;
color:#fff;
padding:4px;
}
ul.ul-tag li:hover{
background: #F64;
}

ul.ul-category{
margin:0px;
width:710px;
}
ul.ul-category li{
float:left;
list-style: none;
background:#333;
color:#fff;
font-weight:bold;
margin-left:1px;
margin-top:1px;
}
ul.ul-category li:hover{
background:#F63;
color:#FFF;
cursor:pointer;
}
ul.ul-category li div{
width:117px;
height:40px;
padding-top:10px;
text-align: center;
}
</style>

</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />


<div class="main">
<div id="main_content" class="main_content">
   

 <div class="shareweb"">
<div class="jiathis_style_24x24">
	<a class="jiathis_button_qzone" ><span style="font-size:14px; font-family: 微软雅黑;">qq空间</span></a>
	<a class="jiathis_button_tsina"><span style="font-size:14px; font-family: 微软雅黑;">新浪</span></a>
	<a class="jiathis_button_tqq"><span style="font-size:14px; font-family: 微软雅黑;">腾讯微博</span></a>
	<a class="jiathis_button_renren"><span style="font-size:14px; font-family: 微软雅黑;">人人网</span></a>
<img src="${ctx}/images/close.gif" onclick="$('.shareweb').hide()"/>
</div>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
</div>


<div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	   <div>
       <div style="float:left;"><img src="${ctx}/images/menu_12.jpg" onclick="gotoPage('${ctx}/pages/convenient.jsp')"/></div>
            <div class="menu1"><img src="${ctx}/images/menu_7.jpg" onclick="gotoPage('${ctx}/pages/convenient_brand.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_3.jpg"  onclick="gotoPage('${ctx}/pages/convenient_restaurant.jsp')" style="width:190px;"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_9.jpg" onclick="gotoPage('${ctx}/pages/convenient_tuiguang.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_10.jpg" onclick="gotoPage('${ctx}/pages/convenient_cuxiao.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_11.jpg" onclick="gotoPage('${ctx}/pages/convenient_categories.jsp')"/></div>
           <div><img src="${ctx}/images/menu_14.jpg" style="width:285px;" /></div>
	    </div>
 </div>
 
 
 <div style="position:relative;padding:0px 25px 0 25px;">
	   <div>
	   <table  style="float:left;" width="710"  border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td height="59" style="background:#fff;font-size:24px; color:#ff6532; padding:20px 0 0 20px; font-weight:bold;">
    
<table  style="float:left;" width="100%"  border="0" cellspacing="0" cellpadding="0" >
<tr>
<td>${restaraunt.name}</td>
<td width="46">
<img id="share_img" style="float:right;cursor:pointer"  src="${ctx}/images/pro_button2.png" width="46" height="50" />
</td>
<td width="46">
<c:if test="${restaraunt.isCollection==null || restaraunt.isCollection==0}">
<img style="float:right;cursor:pointer"  onclick="user_collection_shop('${restaraunt.companyShopId}')" src="${ctx}/images/pro_button1.png" width="46" height="50" />
</c:if>
<c:if test="${restaraunt.isCollection>0}">
<img src="${ctx}/images/pro_button1.png" width="46" height="50" alt="已收藏"/>
</c:if>
</td>
</tr>
</table>
     
     
    </td>
 </tr>
  <tr>
    <td height="20"  style="background:#fff;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="3%" align="center">
        <c:forEach var="x"  begin="1" end="${restaraunt.starScore}" step="1">        
         	<img src="${ctx}/images/brand_xx.png" width="12" height="12" />
         </c:forEach> 
        </td>
        
        <td width="20%" style="font-size:14px; ">人均<span style="color:#000;">&nbsp;&nbsp;${restaraunt.consumptionPer}</span>&nbsp;&nbsp;元；&nbsp;</td>
        <c:if test="${restaraunt.deliverOk == 'T' || restaraunt.deliverOk == 'TZ'}">
        <td width="19%" style="font-size:14px;">起送&nbsp;&nbsp;${restaraunt.sendPrice}&nbsp;&nbsp;元；</td>
        <td width="35%" style="font-size:14px; color:#000;">外 送 费&nbsp;&nbsp;<span style="color:#000">${restaraunt.deliverMoney}</span>&nbsp;&nbsp;元；</td>
        </c:if>
        <c:if test="${restaraunt.deliverOk != 'T' || restaraunt.deliverOk == 'TZ'}">
         <td width="19%" style="font-size:14px;">&nbsp;</td>
         <td height="18" style="font-size:14px;">&nbsp;</td>
        </c:if>
        <td width="12%" style="font-size:14px;"></td>
        <td width="6%" style="font-size:14px;"><img onclick="openwin(${restaraunt.lat},${restaraunt.lng})" src="${ctx}/images/restaurant_map.jpg" style="cursor:pointer;" width="22" height="22" /></td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td height="10" style="background:#fff; border-bottom:#F00 solid 1px;"></td>
  </tr>
  <tr>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="table_product">
      <tr>
        <td width="265px" valign="top" style="background:#fff;">
        <table width="99%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td style="height:180px;padding:20px 0 0 15px;" >
            <img src="${imageStorePath}${restaraunt.logo}" width="230" height="230" />
            </td>
          </tr>
          <tr>
            <td height="61" style="padding:0px 0 0 10px;">
          
                  <ul class="ul-tag">
                 <c:forEach var="item" items="${tagList}">
                        <li>${item.tagName}</li>
                 </c:forEach>
                  </ul>
              </td>
          </tr>
          <tr>
            <td style="padding:20px 0 10px 20px; font-size:16px; color:#F00;"></td>
          </tr>
        </table></td>
        <td width="445px" valign="top" style="background:#fff;">
        <table width="100%" border="0" cellspacing="6" cellpadding="0">
          <tr>
            <td height="22"  valign="top"  style="font-size:14px;color:#999;padding-top:6px;">
            地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：
            </td>
            <td style="font-size:14px;color:#999;padding-top:6px;">
             ${restaraunt.address} 
            </td>
          </tr>
           <tr>
            <td height="22"  valign="top"  style="font-size:14px; color:#999;">联&nbsp;系&nbsp;人&nbsp;&nbsp;：</td>
            <td style="font-size:14px; color:#999;">${restaraunt.linkman}</td>
          </tr>
          <tr>
            <td height="22"  valign="top"  style="font-size:14px; color:#999;">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：</td>
            <td style="font-size:14px; color:#999;">${restaraunt.linkmanTel}</td>
          </tr>
          <tr>
            <td height="22"  valign="top"  style="font-size:14px; color:#999;">店铺类型：</td>
            <td style="font-size:14px; color:#999;">${restaraunt.categoryName}</td>
          </tr>
          <tr>
            <td height="22"  valign="top"  style="font-size:14px; color:#999;">营业时间：</td>
            <td style="font-size:14px; color:#999;" id="td-worktime"></td>
          </tr>
          <c:if test="${restaraunt.deliverOk == 'T' || restaraunt.deliverOk == 'TZ'}">
           <tr>
            <td height="22"   valign="top"  style="font-size:14px; color:#999;">外送时间：</td>
            <td style="font-size:14px; color:#999;" id="td-servicetime"></td>
          </tr>
         
        
          <tr>
            <td height="22"  valign="top"  style="font-size:14px; color:#999;">配送范围：</td>
            <td style="font-size:14px; color:#999;">
              <c:forEach var="item" items="${areaList}">
                   ${item.areaName}&nbsp;&nbsp;
              </c:forEach>
            </td>
          </tr>
          </c:if>
          
           <tr>
            <td height="22"  valign="top"  style="font-size:14px; color:#999;">付款方式：</td>
            <td style="font-size:14px; color:#999;"><span id="payType"></span></td>
          </tr>      
          <tr>
            <td height="22"  valign="top" style="font-size:14px; color:#999;">
           介&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;绍：</td>
            <td style="font-size:14px; color:#999;">
             <div style="LINE-HEIGHT:24px;">${restaraunt.content}</div>
             </td>
          </tr>
          <tr>
            <td colspan="2" style="height:20px;"></td>
          </tr>
         
        </table>
        </td>
        
      </tr>
      
       
      
      <tr>
      <td colspan="2" style="height:10px;background:url(${ctx}/images/back_body.jpg);">
      
      </td>
      </tr>
        <tr>
      <td id="td-ul-category" colspan="2" style="background: #333;" >
           <ul class="ul-category">
          
           </ul>
      </td>
      </tr>
            
    </table>
    </td>
  </tr>
       </table>

 <div style="float:right;  width:230px; height:620px;">
   <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
     <tr>
       <td id="topadv"><img src="${ctx}/images/restaurant_01.png" width="230" height="279" /></td>
     </tr>
   </table>
   <table width="100%" border="0" cellspacing="0" cellpadding="0"  style="padding-top:20px;">
     <tr>
       <td id="bottomadv"><img src="${ctx}/images/restaurant_02.png" width="230" height="279" /></td>
     </tr>
   </table>
 </div>
</div>
 </div>


  <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>


 

 
 

</body>
</html>
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript">
var payTypeArray=["到店支付","货到付款(现金)","货到付款(一卡通)","货到付款(银行卡)","线上支付(一卡通)","线上支付(银行卡)"];
var payType="${restaraunt.payType}".split(",");

var statusMsg = ${statusMsg};

$(document).ready(function(){
	
	$('. main_content img').lazyload({  
	placeholder : '<span class="Apple-style-span" style="font-family:sans serif, tahoma, verdana, helvetica;line-height:19px;white-space:normal;font-size:13px;">http://www.173it.cn/css/grey.gif</span>', //加载图片前的占位图片  
 	effect      : "fadeIn" //加载图片使用的效果(淡入)  
 });  
	var worktime ='${restaraunt.workTime}';
	var servicetime ='${restaraunt.serviceTime}';
	$('#td-worktime').html(initWorkServiceTime(worktime));
	$('#td-servicetime').html(initWorkServiceTime(servicetime));
	
	
 var str=[];
 for(var i=0;i<payType.length;i++){
	 str.push(payTypeArray[payType[i]-1]);
 }
 $('#payType').html(str.join("&nbsp;&nbsp;"));
  
 findRestarauntProduct();
 addadvertantion(8,'topadv');
 addadvertantion(9,'bottomadv');
 
});


function addadvertantion(type,obj){
	$.ajax({
	     type: "POST",
	     url : '${ctx}/common!findAds.action',
	     dataType:'json',
	     data:{type:type},
	     success: function(msg,status){
	    	 $('#'+obj).html('<a href="'+msg[0]["linkAddress"]+
	    			 '" target="-_blank" style="cursor: pointer;"><img src="${ctx}'+
	    			 msg[0]["path"]+'" width="230" height="279"/></a>');
	     }	     
	});
}

var userShopCollectionFlag={};
function user_collection_shop(shopId){
	if(userShopCollectionFlag[""+shopId]){
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
	    		userShopCollectionFlag[""+shopId]=true;
	    	  alert('收藏成功!');
	    	}
	    	else
	    	  alert('收藏失败!');
	     }
	});
}
function findRestarauntProduct(){
	$.ajax({
	     type: "POST",
	     url : context+'/product!findRestarauntProduct.action',
	     dataType:'json',
	     data:{companyShopId:"${restaraunt.companyShopId}",companyId:"${restaraunt.companyId}"},
	     success: function(msg,status){
	    	if(msg.status == 200){	
	    		 
	    		   var array = [];
	    		 for(var i=0; i < msg.rows.length; i++){
	    			 if(i==0)
	    			 	array.push('<li id="category_li'+i+'" style="background:#F63;" value="'+i+'"><div style="margin:0px;padding:0px;line-height:50px;height:50px;">'+msg.rows[i]["name"]+'</div></li>');
	    			 else
	    			    array.push('<li  id="category_li'+i+'" value="'+i+'"><div style="margin:0px;padding:0px;line-height:50px;height:50px;">'+msg.rows[i]["name"]+'</div></li>');
	    			 
	    		 }
	    		 if(array.length>0)
	    			$('.ul-category').html(array.join(''));
	    		 else{
	    			 $('#td-ul-category').hide();
	    		 }
	    		
	    	   array=[];
	    	   for(var h=0; h < msg.rows.length; h++){
	    		   var dataPara = msg.rows[h];
	    	    var hidden = 'style="display:none;"';
	    	    if(h==0)
	    	    	hidden="";
	    	   
    		   var str='<table  '+hidden+' id="product'+h+'" width="100%" border="0" cellspacing="0" cellpadding="0">';
    		   for(var i=0;i<dataPara["productList"].length;i++){
  				 var data=dataPara["productList"][i];
  				 if(data["name"].length>8){
  					 data["name"]=data["name"].substr(0,8)+'...';
  				 }
	    		  var tag='';
 	    		  if(data["tagList"].length>0)
 	    			  tag += data["tagList"][0]["tagName"]+",";
 	    		  if(data["tagList"].length>1)
 	    			  tag += data["tagList"][1]["tagName"]+",";
 	    		  tag = tag.substr(0,tag.length-1);
 	    		  if(tag.length>9){
 	    			 tag = tag.substr(0,9)+'...';
 	    		  }
 	    		 if(i%4==0){
 	    			   str +='<tr><td  style="background:url(${ctx}/images/back_body.jpg);">'
 	    			   +'<div style="clear:both;float:left;padding-top:10px;"><div>'
 	    			   +'<div id="con'+(h+""+i)+'"  class="conv4" style="margin-left:0px;">';
 	    		   }
 	    		   else
 	    			   str +='<div id="con'+(h+""+i)+'"  class="conv4">';
 	    		   var sku={price:0,stock:0,oldPrice:0,productSkuId:0,companyShopProductSkuId:0};
 	    		   if(data["sku"] !=null){
 	    			  sku["price"] = data["sku"]["price"];
 	    			  sku["stock"] = data["sku"]["stock"];
 	    			  if(data["sku"]["oldPrice"]==null||data["sku"]["oldPrice"]=='')
 	    			  	sku["oldPrice"] = 0.0;
 	    			  else
 	    				 sku["oldPrice"] = data["sku"]["oldPrice"];
 	    			  sku["productSkuId"] = data["sku"]["productSkuId"];
 	    			  sku["companyShopProductSkuId"] = data["sku"]["companyShopProductSkuId"];
 	    		   }
 	    			
 	    		  
 	    	  str +='<div class="flashNews1"><img src="${imageStorePath}'+data["image"]+'"/>'
 			  +'<div style="cursor: default;height:41px; width:170px;padding-top:10px;background:#333; color:#FFF;">&nbsp;'+data["name"]+'<br/><div style="text-align:right;"><span style="color:#ff6532;">RMB&nbsp;'+sku["price"]+'</span></div></div>'
 			  +'</div>'
 			  +'<div style="background-color:#FFF; height:51px; width:170px;">'
 			  +'<div class="shop_productfont" style="color:#F63;overflow: hidden;"><span></span><span class="lable_title">'+tag+'</span></div>'
 			  +'<div style="float:right;"><img src="${ctx}/images/od.png" style="width:20px;height:40px;"/></div>'
 			  +' </div></div>';
 			  
 			   var star="";
 	 		  for(var k=0;k<data["starScore"]&k<5;k++){
 	 			 star +=' <img src="${ctx}/images/brand_xx.png" style="width:12px;height:12px;"/>';
 	 		  }
 	 		  var collection="";
 	 		  if(data["isCollection"] <=0){
 	 			 collection = '<div style="overflow:hidden;width:160px;height:30px;"><a href="javascript:void(0)"  style="color:#FF5809;" onclick="event.cancelBubble=true;user_collection('+data["companyShopProductId"]+')">收藏</a></div>';
 	 		  }
 	 		  else if(data["isCollection"]>0){
 	 			 collection='<div style="color:#FF5809;overflow:hidden;width:160px;height:30px;">已收藏</div>';
 	 		  }
 	 		  var yuding="";
 	 		  var gotoResta = '';
 	 		  if(sku["stock"] <=0){
 	 			 yuding='<span style="color:#FF5809;font-size:16px;">已售完</span>';
 	 		 	  gotoResta='';
 		      }
 	 		  else{
 	 			yuding='库存:&nbsp;<span style="color:#FF5809;font-size:16px;">'+sku["stock"]+'</span>';
 	 			
 	 			if(sku["companyShopProductSkuId"]>0)
 	 				gotoResta = '&nbsp;&nbsp;&nbsp;<span style="cursor:pointer;color:#fff;background:#ff6532;padding:8px 20px 8px 20px;" onclick="event.cancelBubble=true;addUserCart(\''+sku["stock"]+'\','+sku["productSkuId"]+','+sku["price"]+','+sku["oldPrice"]+','+data["productId"]+',${restaraunt.companyShopId},'+sku["companyShopProductSkuId"]+','+data["companyShopProductId"]+')">立即预订</span>';
 	 			}
 	 		 
 	    		 if(i%4==0){
 	   			   str +='<div id="con'+(h+""+i)+'-con'+(h+""+i)+'"  class="conv5" style="cursor:pointer;display:none;margin-left:0px;" onclick="productDetail(3,'+data["productId"]+','+data["companyShopProductId"]+',${restaraunt.companyShopId},'+sku["companyShopProductSkuId"]+')">';
 	   		   }
 	   		   else
 	   			   str +='<div id="con'+(h+""+i)+'-con'+(h+""+i)+'"    class="conv5" style="cursor:pointer;display:none;" onclick="productDetail(3,'+data["productId"]+','+data["companyShopProductId"]+',${restaraunt.companyShopId},'+sku["companyShopProductSkuId"]+')">';
 	    	
 	   		  var content=removeHTMLTag(data["content"]);
 	   		 
 	  		  if(content.length>26){
 	  			  content = content.substr(0,26)+'...';
 	  		  }
 	  		  var sellCount='';
 	  		  if("${restaraunt.deliverOk}"=="T"||"${restaraunt.deliverOk}"=="TZ"){
 	  			  sellCount='<div style="overflow:hidden;width:160px;height:25px;font-size:14px;margin-top:10px;">月销量:&nbsp;<span style="color:#FF5809;">'+data["sellCount"]+'</span></div>';
 	  		  }
 	  		  str +='<div style="maring-top:10px;margin-left:10px;"><br/>'
 	   		      +'<div style="overflow:hidden;width:160px;height:30px;color:#FF5809;font-weight:bold;cursor:pointer;">'+data["name"]+'</div>'
 	   			  + '<div style="overflow:hidden;width:160px;">'+star+'</div>'
 	   			  +'<div style="overflow:hidden;width:160px;height:25px;font-size:14px;">价格:&nbsp;<span style="color:#FF5809;">'+sku["price"] +'</span></div>'
 	   			  + '<div style="overflow:hidden;width:160px;height:64px;font-size:14px;">简介:&nbsp;'+content+'</div>'
 	   			  +sellCount
 	   			  +collection
 	   			  +  '<div style="overflow:hidden;width:160px;height:25px;color:#FFF;font-size:14px;">'+yuding+'</div>'
 	   			  + '<div style="overflow:hidden;width:160px;height:30px;">'+gotoResta+'</div>'
 	   			  +'</div></div>';
 			  
 		    	if(i%4==3 || i==dataPara["productList"].length-1){
 		    		str +='</div></div></td></tr>';
 		    	}
 		    		 
    		   }
    		   str +='</table>';
    		   array.push(str);
    		}
	    	  $('#table_product').append('<tr><td colspan="2" style="background:url(${ctx}/images/back_body.jpg);">'+array.join('')+'</td></tr>');
	    		
	    	  $("#table_product .conv4").click(function() {
	    		  var obj = $(this);
	    		  obj.hide();
	    		  $('#'+obj.attr('id')+'-'+obj.attr('id')).show();
	    		  
	    		 // $('#'+obj.attr('id')+'-'+obj.attr('id')).css({height:0});
	    		 // $('#'+obj.attr('id')+'-'+obj.attr('id')).animate({height:280 }, 300,function(){
	    		 // });
	    	  });
	    			
	    	
	    		$("#table_product .conv5").hover(function() {
	    	  }, function() {
	    		  var obj = $(this);
  				obj.hide();
  				 $('#'+obj.attr('id').split('-')[0]).show();
	    	 });
	    		
	    		categoryLength = msg.rows.length;
	    		initCategoryHover();
	    		
	    		array=[];
	    		array=null;
	    		msg.rows=null;
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
	
		 } 
	});
}
var  categoryLength =0;
var selectCategoryIndex=0;
function initCategoryHover(){
	$(".ul-category li").hover(function() {
		$(this).css("background","#F63");
	},
	function(){
		var selVal = this.getAttribute("value");
		if(selectCategoryIndex !=selVal)
			$(this).css("background","#333");
	});
	
	$(".ul-category li").click(function(index) {
		
		var selVal = this.getAttribute("value");
		selectCategoryIndex = selVal;
		for(var i=0; i < categoryLength; i++){
			if(selVal == i){
				$('#category_li'+i).css("background","#F63");
				$('#product'+i).show();
			}
			else{
				$('#category_li'+i).css("background","#333");
				$('#product'+i).hide();
			}
				
		}
	});
}
var productFlag={};
function user_collection(id){
	if(productFlag[""+id]){
		alert('已收藏!');
		return;
	}
	$.ajax({
	     type: "POST",
	     url : context+'/user!collectionUserRestarant.action',
	     dataType:'json',
	     data:{objectId:id,type:5},
	     success: function(msg,status){
	    	if(msg.status == 200){	
	    		productFlag[""+id]=true;
	    	  alert('收藏成功!');
	    	}
	    	else
	    		alert('收藏失败!');
	     }
	});

}

function addUserCart(stock,productSkuId,price,oldPrice,proId,shopId,companyShopProductSkuId,companyShopProductId){
	
	 if(!shopStatusMsg(statusMsg,"${restaraunt.deliverOk}")){
		 return;
	 }
	
	if(parseInt(stock,10)<1){
		alert('库存不足!');
		return;
	}
	
	$.ajax({
	     type: "POST",
	     url : context+'/product!addUserCart.action',
	     dataType:'json',
	     data:{deliverOk:"${restaraunt.deliverOk}",skuId:productSkuId,productId:proId,companyShopId:shopId,price:price,oldPrice:oldPrice,companyShopProductSkuId:companyShopProductSkuId,companyShopProductId:companyShopProductId},
	     success: function(msg,status){
	    	if(msg.status == 200){	
	    	  alert('预订成功!');
	    	  finduserCartItemCount();
	    	}
	    	else
	    		alert(msg.msg);
	     }
	});

}

function openwin(lat,lng) { 
	if(lat==0 || lng==0){
		alert('经纬度获取错误!');
		return;
	}
	$('#latHidden').val(lat);
	$('#lngHidden').val(lng);
	$('#addressHidden').val("${restaraunt.address}");
	$('#hiddenProName').val("${restaraunt.name}");
	$('#companyShopId').val("${restaraunt.companyShopId}");
	
	$('#formturn').attr('target',"_blank");
	$('#formturn').attr('action',"${ctx}/pages/convenient_resta_map.jsp");
	$('#formturn').submit();
}


</script>
