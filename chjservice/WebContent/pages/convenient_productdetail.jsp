<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/css.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/input.css" />


<style type="text/css">

.conv1{
float:left;margin-left:10px;
}


ul.ul-attr li{
max-width: 120px;/*具体数值自行修改，下一行相同*/
word-break:keep-all;
height:30px;
float:left;
list-style: none;
background: #fff;
margin-left:5px;
margin-top:5px;
text-align: center;
border:1px solid #ccc;
overflow:hidden;
}
ul.ul-attr li:hover{
cursor:pointer;
border:1px solid red;
}
ul.ul-attr li div{
height:30px;
max-width: 120px;/*具体数值自行修改，下一行相同*/
word-break:keep-all;
padding-top:4px;
padding-left:6px;
padding-right:6px;
color:#444;
overflow:hidden;
}

ul.ul-tag li{
padding:4px;margin-bottom:8px;
float:left;
color:#fff;
background:#ff6533;
margin-left:4px;
margin-top:2px;
text-align:center;
list-style: none;
max-width: 200px;/*具体数值自行修改，下一行相同*/
word-break:keep-all;
}

ul.ul-buy li{
width: 130px;/*具体数值自行修改，下一行相同*/
height:46px;
float:left;
list-style: none;
background: #ff6533;
margin-left:5px;
margin-top:5px;
text-align: center;
overflow:hidden;
color:#fff;
font-weight:bold;
font-size:18px;
line-height:46px;
}
ul.ul-buy li:hover{
cursor:pointer;
}
ul.ul-buy li div{
height:46px;
width: 140px;/*具体数值自行修改，下一行相同*/
padding-top:10px;
overflow:hidden;
}
table.ul-product{width:710px;}
table.ul-product td{
width: 176px;/*具体数值自行修改，下一行相同*/
height:46px;
float:left;
list-style: none;
background: #ff8c65;
text-align: center;
overflow:hidden;
color:#fff;
}
table.ul-product td:hover{
cursor:pointer;
width: 176px;
background: #ff6533;
}
table.ul-product td div{
padding-top:4px;
width: 170px;
padding-top:10px;
overflow:hidden;
}
.td-class{font-size:14px;color:#a5a5a5;}


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


.main_content select {
width:180px;
height:24px;
}
#content{
background-color: #FFF;
border:solid 1px #CCC;
}
#productDetail0 img{max-width: 670px;}

</style>


</head>
<body onscroll="b()">

<jsp:include page="/common/header.jsp" />
<script type="text/javascript" src="${ctx }/js/My97DatePicker/WdatePicker.js"></script>
<SCRIPT src="${ctx}/js/jquery-1.2.6.pack.js" type=text/javascript></SCRIPT>
<SCRIPT src="${ctx}/js/base.js" type=text/javascript></SCRIPT>
<SCRIPT src="${ctx}/js/selectstores.js" type=text/javascript></SCRIPT>

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
       <c:if test="${type ==1}">
           <div style="float:left;"><img src="${ctx}/images/menu_12.jpg" onclick="gotoPage('${ctx}/pages/convenient.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_7.jpg" onclick="gotoPage('${ctx}/pages/convenient_brand.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_8.jpg" onclick="gotoPage('${ctx}/pages/convenient_restaurant.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_9.jpg" onclick="gotoPage('${ctx}/pages/convenient_tuiguang.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_5.jpg" onclick="gotoPage('${ctx}/pages/convenient_cuxiao.jsp')"    style="width:190px;"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_11.jpg" onclick="gotoPage('${ctx}/pages/convenient_categories.jsp')"/></div>
           <div><img src="${ctx}/images/menu_14.jpg" style="width:285px;" /></div>
       </c:if>
        <c:if test="${type ==2}">
           <div style="float:left;"><img src="${ctx}/images/menu_12.jpg" onclick="gotoPage('${ctx}/pages/convenient.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_7.jpg" onclick="gotoPage('${ctx}/pages/convenient_brand.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_8.jpg" onclick="gotoPage('${ctx}/pages/convenient_restaurant.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_4.jpg"  onclick="gotoPage('${ctx}/pages/convenient_tuiguang.jsp')" style="width:190px;"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_10.jpg" onclick="gotoPage('${ctx}/pages/convenient_cuxiao.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_11.jpg" onclick="gotoPage('${ctx}/pages/convenient_categories.jsp')"/></div>
           <div><img src="${ctx}/images/menu_14.jpg" style="width:285px;" /></div>
       </c:if>
        <c:if test="${type ==3}">
          <div style="float:left;"><img src="${ctx}/images/menu_12.jpg" onclick="gotoPage('${ctx}/pages/convenient.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_7.jpg" onclick="gotoPage('${ctx}/pages/convenient_brand.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_8.jpg" onclick="gotoPage('${ctx}/pages/convenient_restaurant.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_9.jpg" onclick="gotoPage('${ctx}/pages/convenient_tuiguang.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_10.jpg" onclick="gotoPage('${ctx}/pages/convenient_cuxiao.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_6.jpg" onclick="gotoPage('${ctx}/pages/convenient_categories.jsp')"  style="width:190px;" /></div>
           <div><img src="${ctx}/images/menu_14.jpg" style="width:285px;" /></div>
       </c:if>
       </div>
 </div>
  
 <div id="product_div">
 <div style="position:relative;padding:10px 25px 0 25px;">
	   <div>
    <table  style="float:left;" width="710"  border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td height="60" style="width:710px;border-bottom:1px solid red;background:#fff;">
    <table width="100%" border="0" align="right" cellpadding="0" cellspacing="0">
      <tr>
        <td width="86%" style="color:#f00;font-size:18px;font-weight:bold;padding-left:20px;">商品详情</td>
        <td width="7%" align="right">
        <img id="share_img" style="cursor:pointer"  src="${ctx}/images/pro_button2.png" width="46" height="50" />
       
</td>
        <td width="7%" align="right">
        <c:if test="${product.isCollection==null ||product.isCollection==0}">
        	<img style="cursor:pointer" onclick="user_collection(${product.companyShopProductId})" src="${ctx}/images/pro_button1.png" width="47" height="50" />
        </c:if>
         <c:if test="${product.isCollection > 0}">
            <img src="${ctx}/images/pro_button1.png" width="47" height="50" alt="已收藏"/>
         </c:if>
        </td>
      </tr>
    </table>
    </td>
  </tr>
     <tr>
       <td height="50">
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td valign="top"  style="padding-top:10px;background:#fff;border-bottom:#F00 solid 1px; border-right:#F00 solid 1px;">
    
<div id=preview style="width:290px;">
	<div class=jqzoom id="spec-n1" style="width:290px;height:240px;">
	   <img style="height:180px;width:180px;"
	    src="${imageStorePath}${product.image}" 
	    jqimg="${imageStorePath}${product.image}" />
	</div>
	
	<div id="spec-n5" style="float:center;margin-top:-30px;">
		<div  id="spec-left" style="margin-left:10px;">
			<img src="${ctx}/dynamic/left.gif" />
		</div>
		<div id="spec-list" style="width:244px;overflow:hidden;">
			<ul class=list-h>
			<c:forEach var="item" items="${product.imgList}">
			    <li><img src="${imageStorePath}${item}" /> </li>
			</c:forEach>
				
			</ul>
		</div>
		<div  id=spec-right>
			<img src="${ctx}/dynamic/right.gif" />
		</div>
		
    </div>
</div>
           
           </td>
           <td width="420" height="320" valign="top" style="padding-left:30px;padding-right:10px;padding-top:20px;background-color:#fff;border-bottom:#F00 solid 1px;">
				<table border="0" cellspacing="4" cellpadding="0">
				  <tr>
				    <td colspan="4" style="font-weight:bold;font-size:18px;">${product.name}</td>
				  </tr>
				   <tr>
				    <td colspan="4" height="10"></td>
				  </tr>
				  <c:if test="${product.shopInfo.deliverOk=='T' ||product.shopInfo.deliverOk=='TZ'}">
				  <tr>
				    <td width="50" class="td-class" style="padding-top:3px;text-align:left;">月销量:</td>
				    <td colspan="3" class="td-class">${product.sellCount}个</td>
				  </tr>
				  </c:if>
				   <tr>
				    <td  class="td-class" style="padding-top:3px;text-align:left;">库存:</td>
				    <td colspan="3" class="td-class"><span id="stock">${product.sku.stock}</span></td>
				  </tr>
				   <tr>
				   <td class="td-class" style="padding-top:3px;text-align:left;">价格:</td>
				    <td colspan="3" class="td-class">
				    <span id="price">${product.sku.price}</span>元
				    </td>
				  </tr>
				 <c:forEach var="item" items="${product.allAttrList}">
				   <tr>
				    <td class="td-class" valign="top" style="padding-top:3px;text-align:left;">${item.name}:</td>
				    <td colspan="3">
				    <ul class="ul-attr" id="ul-attr${item.productAttributeId}">
				       <c:forEach var="item2" items="${item.values}">
				       	<li value="${item2.productAttributeValueId}" id="attr-child${item.productAttributeId}${item2.productAttributeValueId}" onclick="selectAttr(${item.productAttributeId},${item2.productAttributeValueId})"><div>${item2.name}</div></li>
				       </c:forEach>
				    </ul>
				    </td>
				  </tr>
				 </c:forEach>
				
				  <tr><td height="20">&nbsp;</td></tr>
				  
				  <tr>
				    <td class="td-class" style="padding-top:3px;width:65px;text-align:left;">购买数量:</td>
				   <td width="1" height="38" align="left">
              
               </td>
               <td valign="middle" style="width:100px;text-align: center;">
                <img src="${ctx}/images/num_1.png" onclick="addQty(-1)" style="margin-top:10px;width:15px;height:15px;cursor:pointer;"/>
                 <input type="text"  onkeyup="value=value.replace(/[^\d]/g,'')" 
                	 onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" 
                 onblur="inputBlur(this)"
                  style="text-align: center;border:0px;width:60px;height:40px;" id="txtQty" value="1" />
                   <img src="${ctx}/images/num_2.png"  onclick="addQty(1)" style="margin-top:10px;width:15px;height:15px;cursor:pointer;"/>
               </td>
               <td align="left">
              
               </td>
               </tr>
              <tr>
				   <td class="td-class" style="padding-top:3px;text-align:left;">小计金额:</td>
				    <td colspan="3" class="td-class">
				      &nbsp;<span id="spanTotal" style="color:red;font-size:23px;">${product.sku.price}</span>&nbsp; 元
				    </td>
			  </tr>
		
		<tr>
		<td colspan="4">
		  <ul class="ul-buy">
		  <li style="margin-left:0px;" onclick="buyProduct()">立即预订</li>
		  <li onclick="addUserCart()">加入到购物车</li>
		  </ul>
		</td>
		</tr>
		
		
		<tr><td>&nbsp;</td></tr>
		</table>
		   </td>
         
         </tr>
         
       </table></td>
     </tr>
     
   
     <tr>
       <td style="overflow:hidden;">
         <table class="ul-product" id="ul-product" cellpadding="0" cellspacing="0">
         <tr>
         <td id="productdetail_li0" style="background:#ff6533;margin-left: 0px;" onclick="selectDetailFun(this,0)" value="0"><div>商品说明</div></td>
         <td id="productdetail_li1" onclick="selectDetailFun(this,1)" value="1"><div>商品评价</div></td>
         <td id="productdetail_li2" onclick="selectDetailFun(this,2)" value="2"><div>售后服务</div></td>
         <td style="width:182px;" id="productdetail_li3" onclick="selectDetailFun(this,3)" value="3"><div>商品特性</div></td>
         </tr>
         </table>
       </td>
     </tr>
      <tr><td height="10"></td></tr>
     <tr id="productDetail0">
		<td style="background:#fff;padding:20px;" valign="top">
		  <table  cellpadding="0" cellspacing="0">
		  <c:if test="${fn:length(tagList)>0}">
		  <tr>
		  <td>
		   <img src="${ctx}/images/tags.png" width="23" height="23" alt="标签" />
		  </td>
		  <td width="690" valign="top" align="left">
		 
		   <ul class="ul-tag">
		  <c:forEach var="item" items="${tagList}">
		   <li>${item.tagName}</li>
		  </c:forEach>
		 </ul>
		  </td>
		  </tr>
		  </c:if>
		  <tr><td colspan="2" valign="top" style="Color:#333">
		   ${product.content}    
		  </td>
		  </tr>
		  </table>
		 
	    </td>
	</tr>
	
	<tr id="productDetail1" style="display:none;">
		<td style="background:#fff;" valign="top">
		 <table  id="product_comment" width="100%" border="0" cellspacing="0" cellpadding="0">
		 
		 </table>  
	    </td>
	</tr>
	
	<tr>
	<td id="td-loadmore" onclick="loadMore()" valign="middle" style="display:none;cursor:pointer;height:50px;text-align:center;background:#fff;">
	 加载更多
	</td>
	</tr>
	
	<tr id="productDetail2" style="display:none;">
		<td style="background:#fff;padding:20px;" valign="top">
		 <table  width="100%" border="0" cellspacing="0" cellpadding="0">
		 <tr><td valign="top" style="Color:#333">
		   ${product.summary}    
		  </td></tr>
		 </table>  
	    </td>
	</tr>
	<tr id="productDetail3" style="display:none;">
		<td style="background:#fff;padding:20px;" valign="top">
		 <table  width="100%" border="0" cellspacing="0" cellpadding="0">
		 <tr><td valign="top" style="Color:#333">
		    ${product.feature}   
		  </td></tr>
		 </table>  
	    </td>
	</tr>
  </table>
  
 
  
  

 <div style="float:right;  width:230px;">
 
 <table width="100%" cellspacing="0" cellpadding="0" >
     <tr>
       <td><img style="cursor:pointer;" onclick="gotoDetail(${product.shopInfo.companyShopId})" src="${imageStorePath}${product.shopInfo.logo}" width="230" height="230" /></td>
     </tr>
     <tr><td height="10"></td></tr>
     <tr><td height="10" style="color:#fff;background:#fe8c67;padding:10px 0 0 10px;">
     <img src="${ctx}/images/pro_button3.png" width="25" height="25" />&nbsp;${product.shopInfo.name}</td>

     </tr>
     <tr><td class="td-class" style="color:#fff;background:#fe8c67;padding:10px 0 5px 10px;">
       	 营业时间:<div id="td-worktime"></div>
      
      <c:if test="${product.shopInfo.deliverOk=='T' || product.shopInfo.deliverOk=='TZ'}">
      <br/> 外送时间:<div id="td-servicetime"></div>
      <br/>	配送范围:
      <c:forEach var="item" items="${areaList}" varStatus="index">
         <br/>${item.areaName}
     </c:forEach>
     </c:if>
     
     </td>
     </tr>
   </table>
   <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
     <tr>
       <td><img src="${ctx}/images/shopdat_2.jpg" width="230" height="50" /></td>
     </tr>
     </table>
     <c:forEach var="item" items="${proTuiGuang}">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background:#fff;margin-top:10px;">
     <tr>
       <td height="145" align="center">
       <img onclick="productDetail(3,${item.productId},${item.companyShopProductId},${item.companyShopId},${item.sku.companyShopProductSkuId})"
        style="cursor:pointer;" src="${imageStorePath}${item.image}" width="110" height="117" /></td>
     </tr>
     <tr>
       <td style="border-bottom:#F00 solid 1px;"></td>
     </tr>
     <tr>
       <td style="padding-left:10px;">促销价：<span class="brand_pictx">￥${item.sku.price}</span></td>
     </tr>
     <tr>
       <td height="25" class="brand_picx"  style="padding-left:10px; color:#999;">参考价：￥${item.sku.oldPrice}</td>
     </tr>
     <tr>
       <td height="25"  style="padding-left:10px; font-size:14px;">${item.name}</td>
     </tr>
     <tr>
       <td style="border-bottom:#F00 solid 1px;"></td>
     </tr>
     <tr>
       <td height="30" style="padding-left:15px;">
       <c:forEach  begin="1" end="${item.starScore}">
       <img src="images/brand_xx.png" width="12" height="12" />
       </c:forEach>
       </td>
     </tr>
     </table>
    </c:forEach>
    
      
 </div>


</div>
 </div>
 </div>
 
 <div id="cart_sure" style="display:none;">
	<div style="position:relative;padding:10px 25px 0 25px;">
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
	      </div>
	    <div style="float:left; width:950px;">
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
	          	店铺：<span style="color:#00b38a" id="selectShop">${product.shopInfo.name}</span>
	        </td>
	         <td width="100px"  style="font-weight:bold; padding-left:15px;padding-top: 8px;">
	          	运费：<span style="color:#00b38a" id="txtOrderDeliver">${product.shopInfo.deliverMoney}</span>
	        </td>
	        <td  style="padding-right:40px;padding-top: 8px;">
	          	<ul class="ul-button">
	          	<li onclick="$('#product_div').show();$('#cart_sure').hide();"><div>修改</div></li>
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
	      	<span id="txtOrderDeliverInfo" style="padding-top: 25px;">
	      	(不含运费):
	      	</span>
	      	<span id="totaltotal" style="color:#00b38b;font-size:22px;margin-right:40px;"></span>
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
	        <tr id="mm"><td colspan="4" height="45px" class="gray-font" style="padding-top: 10px;padding-left: 45px;">
	        <c:if test="${product.shopInfo.deliverOk=='T' || product.shopInfo.deliverOk=='TZ'}">
	        	请注意，本店外送时间是：<span id="serviceTime"></span>，请在服务时间内下单。
	        </c:if>
	        </td></tr>
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
<SCRIPT type=text/javascript>
var statusMsg = ${statusMsg};
var allSkuList=${product.allSkuList};
var initSelectedSkuAttr=${product.selectedSkuAttr};//默认 SKU
var selectAttrMap={};
var changedSelectSkuIndex=-1;//-1原始默认sku，-2位匹配到SKU

	$(function(){	
		$('#share_img').mousemove(function(e){
			$('.shareweb').show();
			$('.shareweb').css({"left":(e.pageX-200)+"px","top":(e.pageY-104)+"px"});
		});
		//sku初始化
		$.each(initSelectedSkuAttr,function(index,data){
			selectAttrMap[""+data["productAttributeId"]]=data["productAttributeValueId"];
			$('#attr-child'+data["productAttributeId"]+data["productAttributeValueId"]).css('border','1px solid red');
		});
		//sku初始化
		
		var worktime ='${product.shopInfo.workTime}}';
		var servicetime ='${product.shopInfo.serviceTime}';
		$('#td-worktime').html(initWorkServiceTime(worktime));
		$('#td-servicetime').html(initWorkServiceTime(servicetime));
		
		initInput('txtInfo','spanInfo','备注30字以内',30);
		loadUserAddress();
		findShopPayTypeAndisDeliver("${product.shopInfo.companyShopId}");
		loadProductComment();
		
		 $(".jqzoom").jqueryzoom({
				xzoom:300,
				yzoom:300,
				offset:10,
				position:"center",
				preload:1,
				lens:1
			});
			$("#spec-list").jdMarquee({
				deriction:"left",
				width:280,
				height:56,
				step:2,
				speed:4,
				delay:10,
				control:true,
				_front:"#spec-right",
				_back:"#spec-left"
			});
			$("#spec-list ul li img").bind("mouseover",function(){
				var src=$(this).attr("src");
				$("#spec-n1 img").eq(0).attr({
					src:src.replace("\/n5\/","\/n1\/"),
					jqimg:src.replace("\/n5\/","\/n0\/")
				});
				$(this).css({
					"border":"2px solid #ff6600",
					"padding":"1px"
				});
			}).bind("mouseout",function(){
				$(this).css({
					"border":"1px solid #ccc",
					"padding":"2px"
				});
			});	
		
			
			
			
	});
	var selectDetail=0;
	function selectDetailFun(obj,type){
		selectDetail = type;
		for(var i=0; i < 4; i++){
			if(selectDetail == i){
				$('#productdetail_li'+i).css("background","#ff6533");
				$('#productDetail'+i).show();
			}
			else{
				$('#productdetail_li'+i).css("background","#ff8c65");
				$('#productDetail'+i).hide();
			}
				
		}
		$('#ul-product td').hover(function(){
			$(this).css("background","#ff6533");
		},
		function(){
			var selVal = this.getAttribute("value");
			if(selectDetail !=selVal)
				$(this).css("background","#ff8c65");
		});
	}
	function loadMore(){
		loadProductComment();
	}
	function loadProductComment(){
		pageinfo["companyShopProductId"]="${product.companyShopProductId}";
		$.ajax({
		     type: "POST",
		     url : '${ctx}/product!loadProductComment.action',
		     dataType:'json',
		     data:pageinfo,
		     success: function(msg,status){
		    	if(msg.status == 200){
		    		if(msg.total%pageinfo["size"]==0)
		    	    	pageinfo["tp"]=msg.total/pageinfo["size"];
		    	 else
		    	    	pageinfo["tp"]=Math.ceil(msg.total/pageinfo["size"]);
		    		
		    		var array=[];
		    		for(var i=0; i<msg.rows.length;i++){
		    			var data = msg.rows[i];
		    			
		    			var str='<tr>'
		    			     +'<td width="120" align="center" style="border-bottom:#F00 solid 1px;padding:10px 0 10px 0;">'
		    			     +'<img src="${imageStorePath}'+data["userImage"]+'" height="50" width="50"/><br/>'+data["userName"]
		    			     +'</td>'
		    			     +'<td valign="top" height="50" style="border-bottom:1px solid #f00;padding:10px;color:#9a9a9c;">'
		    			     +data["content"]
		    			     +'</td>'
		    			     +'</tr>';
		    			array.push(str);
		    		}
		    		$('#product_comment').append(array.join(''));
		    		pageinfo["page"]++;
		    	    if(pageinfo["tp"]<pageinfo["page"]){
		    	    	$('#td-loadmore').hide();
		    	    }
		    	    else{
		    	    	$('#td-loadmore').show();
		    	    }
		    		
		    	}
		    	else{
		    		alert(msg.msg);
		    	}
		     }
		});
	}
	
	
	function selectAttr(attrId,attrValId){
		$.each($('#ul-attr'+attrId).find('li'),function(data){
			var selVal = this.getAttribute("value");
			if(attrValId==selVal){
				if(selectAttrMap[""+attrId]==selVal){
					selectAttrMap[""+attrId]=null;
					$(this).css('border','1px solid #ccc');
				}
				else{
					selectAttrMap[""+attrId]=selVal;
					$(this).css('border','1px solid red');
				}
			}
			else{
				$(this).css('border','1px solid #ccc');
			}
		});
		isHasSku(attrId);
	}
	function isHasSku(attrId){
		   changedSelectSkuIndex=-2;
		   var selectAttrCount=0;
		   $.each(selectAttrMap,function(key,data){
			   if(data !=null)
				   selectAttrCount++;
		   });
		   
		   for(var i=0;i<allSkuList.length;i++){
			   var count=0;
			   var sku = allSkuList[i]["attributeValueId"];
			   $.each(selectAttrMap,function(key,data){
				   for(var h=0;h<sku.length;h++){
					   if(sku[h]==data)
						   count++;
				   }
			   });
			   if(selectAttrCount == count &&sku.length==count  && count>0){
				   changedSelectSkuIndex=i;
				   break;
			   }
			   else{
				   changedSelectSkuIndex=-2;
			   }
			   
		   }
		   
		   if(changedSelectSkuIndex >=0){
			   $('#stock').html(allSkuList[changedSelectSkuIndex]["stock"]);
			   $('#price').html(allSkuList[changedSelectSkuIndex]["sku"]["price"]);
			   $('#oldPrice').html(allSkuList[changedSelectSkuIndex]["sku"]["oldPrice"]);
		   }
		   else{
			   $('#stock').html('0');
			   $('#price').html(0);
			   $('#oldPrice').html(0);
		   }
		    
		   computerTotal();
		
	}
	function addQty(type){
		var value = $('#txtQty').val();
		if(type == -1 && value <=1){
			return;
		}
		else{
			if($.trim(value).length==0){
				$('#txtQty').val(0);
				return;
			}
			var qty = parseInt(value,10)+type;
			$('#txtQty').val(qty);
		
			computerTotal();
		}
	}
	function inputBlur(){
		 $('#txtQty').val($('#txtQty').val().replace(/[^\d]/g,''));
		var value = $('#txtQty').val();
		if($.trim(value).length==0){
			$('#txtQty').val(1);
			value=1;
		}
		computerTotal();
		
	}
	function computerTotal(){
		if(changedSelectSkuIndex==-2){
			$('#spanTotal').html(0);
		}
		else{
			var qty = parseInt($('#txtQty').val(),10);
			var price=0;
			if(changedSelectSkuIndex !=-1){
				price=allSkuList[changedSelectSkuIndex]["sku"]["price"];
			}
			else{
				price=parseFloat("${product.sku.price}");
			}
			$('#spanTotal').html((price*qty).toFixed(2));
		}
		
	}
	function addUserCart(){
		var user="${user}";
		if(user.length==0){
			alert('请登录！');
			return;
		}
		var deliverOk="${product.shopInfo.deliverOk}";
		 if(!shopStatusMsg(statusMsg,"${product.shopInfo.deliverOk}")){
			 return;
		 }
		
		var param={};
		param["qty"]=$("#txtQty").val();
		if(param["qty"]==""||param["qty"]=="0"){
			alert('请输入购买数量!');
			return;
		}
		var stock = $('#stock').html();
		if(parseInt(stock,10)<parseInt(param["qty"],10)){
			alert('存货不足!');
			return;
		}
		if(changedSelectSkuIndex >=0){
			param["companyShopProductSkuId"] = allSkuList[changedSelectSkuIndex]["companyShopProductSkuId"];
			param["skuId"]=allSkuList[changedSelectSkuIndex]["sku"]["productSkuId"];
			param["price"]=allSkuList[changedSelectSkuIndex]["sku"]["price"];
			param["oldPrice"]=allSkuList[changedSelectSkuIndex]["sku"]["oldPrice"];
		}
		else{
			param["companyShopProductSkuId"]= "${product.sku.companyShopProductSkuId}";
			param["skuId"]="${product.sku.productSkuId}";
			param["price"]="${product.sku.price}";
			param["oldPrice"]="${product.sku.oldPrice}";
		}
		param["productId"]="${product.productId}";
		param["companyShopId"]="${companyShopId}";
		param["companyShopProductId"] = "${product.companyShopProductId}";
		
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
	function user_collection(id){
		if('${user.userId}'.length==0){
			alert('请登录!');
			return;
		}
		$.ajax({
		     type: "POST",
		     url : context+'/user!collectionUserRestarant.action',
		     dataType:'json',
		     data:{objectId:id,type:5,doType:1},
		     success: function(msg,status){
		    	if(msg.status == 200){	
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
	var cartItem={};
	function buyProduct(){
		var user="${user}";
		if(user.length==0){
			alert('请登录！');
			return;
		}
		
		 if(!shopStatusMsg(statusMsg,"${product.shopInfo.deliverOk}")){
			 return;
		 }
		var param={};
		param["qty"]=$("#txtQty").val();
		if(param["qty"]==""||param["qty"]=="0"){
			alert('请输入购买数量!');
			return;
		}
		var stock = $('#stock').html();
		if(parseInt(stock,10)<parseInt(param["qty"],10)){
			alert('存货不足!');
			return;
		}
		if(changedSelectSkuIndex>=0){
			param["companyShopProductSkuId"] = allSkuList[changedSelectSkuIndex]["companyShopProductSkuId"];
			param["skuId"]=allSkuList[changedSelectSkuIndex]["sku"]["productSkuId"];
			param["price"]=allSkuList[changedSelectSkuIndex]["sku"]["price"];
			param["oldPrice"]=allSkuList[changedSelectSkuIndex]["sku"]["oldPrice"];
		}
		else{
			param["companyShopProductSkuId"]= "${product.sku.companyShopProductSkuId}";
			param["skuId"]="${product.sku.productSkuId}";
			param["price"]="${product.sku.price}";
			param["oldPrice"]="${product.sku.oldPrice}";
		}
		
		
		$('#cart_sure').show();
		$('#product_div').hide();
	
		
		param["name"]="${product.name}";
		param["productId"]="${product.productId}";
		param["companyShopProductId"]="${product.companyShopProductId}";
		param["cartItemId"]=0;
		
		cartItem["shopId"]="${companyShopId}";
		cartItem["sendCost"]="${product.shopInfo.deliverMoney}";
		cartItem["item"]=[];
		cartItem["item"].push(param);
		cartItem["money"] = param["qty"]*param["price"];
		
		var str='<div style="float:left; width:950px;margin-top:10px;">'
			       +'<div style="float:left;padding-left:15px; width:425px; height:55px;background-color:#FFF;border-bottom:#57ae97 solid 2px;">'
			       +'<p class="myorder_font4" style="text-align:left;">${product.name}</p></div> '
			       +'<div class="conv1" style="width:160px; height:55px; background-color:#FFF;border-bottom:#57ae97 solid 2px;">'
			       +'<p class="myorder_font4">'+param["price"]+'</p></div> '
			       +'<div class="conv1" style="width:160px; height:55px; background-color:#FFF;border-bottom:#57ae97 solid 2px;">'
			       +'<p class="myorder_font4">'+param["qty"]+'</p></div> '
			       +'<div class="conv1" style="width:160px; height:55px; background-color:#FFF;border-bottom:#57ae97 solid 2px;">'
			       +'<p class="myorder_font4">'+cartItem["money"].toFixed(2)+'</p></div>'
			       +'</div>';
			
	 $('#div_cartsure').html(str);
	 $('#totaltotal').html((cartItem["money"]+parseInt(cartItem["sendCost"],10)).toFixed(2));
	 $('#txtOrderDeliver').html(cartItem["sendCost"]);
	 if(cartItem["sendCost"]>0)
		 $('#txtOrderDeliverInfo').html('(含运费)');
	 else
		 $('#txtOrderDeliverInfo').html('(不含运费)');
	 
		
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
	
	function submit_order(){
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
</SCRIPT>
<SCRIPT src="${ctx}/js/lib.js" type=text/javascript></SCRIPT>
<SCRIPT src="${ctx}/js/163css.js" type=text/javascript></SCRIPT>