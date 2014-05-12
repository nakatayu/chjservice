<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>漕河泾e服务</title>
<style type="text/css">
/* 我的订单 */

.myorder_font{ color:#00b38a; font-size:14px;  font-weight:bold; text-align:center; padding-top:15px;padding-bottom:15px;}

.orderinfo-title{
margin-left:10px;float:left;	width:310px; height:50px; background-color:#FFF;

}

ul.ul-button li{
width:80px;
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
padding-top:4px;
}
ul.ul-buy {
margin:0px;
}
ul.ul-buy li{
width:100px;
height:40px;
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
padding-top:10px;
}
.orderinfo {
color:#999;
font-size:14px; 
 font-weight:bold;
}
.orderinfo a{
text-decoration: underline;
color:#999;cursor:pointer;
 font-size:14px;  font-weight:bold;
}
.myorder_font6{ color:#00b38a; font-size:14px; text-align:left; padding-left:15px;padding-top:15px;padding-bottom:15px;}
</style>
</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />

<div class="main">
<div id="main_content" class="main_content">
   
   <div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	     <div style="float:left;"><img src="${ctx}/images/menu_48.jpg" onclick="gotoPage('${ctx}/pages/personal_set.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_41.jpg" onclick="gotoMyCart()"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_35.jpg" style="width:190px;" onclick="gotoPage('${ctx}/product!findUserOrder.action')" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_43.jpg" onclick="gotoPage('${ctx}/pages/personal_friend.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_49.jpg" onclick="gotoPage('${ctx}/pages/personal_topic.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_44.jpg" onclick="gotoPage('${ctx}/pages/personal_circle.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_45.jpg" onclick="gotoPage('${ctx}/pages/personal_activity.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_46.jpg" onclick="gotoPage('${ctx}/pages/personal_share.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_47.jpg" onclick="gotoPage('${ctx}/pages/personal_collection.jsp')"/></div>
	    </div>
  
</div>
<div style="position:relative;height:110px;  padding:10px 25px 0 25px;">
	   <div>
	       <table style="height:100px;margin-left:0px;font-weight:bold;width:950px;background:#fff;">
	       <tr><td style="padding-left: 40px;">订单信息：</td></tr>
	       <tr>
	       <td valign="middle"  style="padding-left: 40px;">
	        <p class="myorder_font6">
		    			   <span style="color:#999">订单编号：</span>${order.flowNo}<br/>
		    			  <span style="color:#999">成交时间：</span>${order.orderTime}<br/>
		    			   <span style="color:#999">店铺名称：</span>${order.shopName}<br/>
		    </p>
	       </td>
	        <td valign="middle"  style="padding-left: 40px;">
	        <p class="myorder_font6">
		    			   <span style="color:#999">总费用：</span>${order.total}<br/>
		    			  <span style="color:#999">商品总费用：</span>${order.sendCost}<br/>
		    			   <span style="color:#999">运费：</span>${order.money}<br/>
		    </p>
	       </td>
	       </tr>
	       </table>
   </div>
</div>
  
  <c:forEach items="${orderProductList}" var="item" varStatus="index1">
  
 <div style="position:relative;height:200px;  padding:10px 25px 0 25px;">
	   <div>
	       <table style="height:200px;margin-left:0px;font-weight:bold;width:950px;background:#fff;">
	       <tr><td valign="middle" colspan="3" style="padding-left: 40px;">
	       	商品：${item.product.name}&nbsp;
	       	<c:if test="${item.sku !=null && item.sku.skuKind!=null}">
	       	${item.sku.skuKind}
	       	</c:if>
	       	</td></tr>
	        <tr>
	        <td valign="top" style="padding-left: 40px;width:140px;color:#999;">
	        <img src="${imageStorePath}${item.product.image}" style="width:120px;height:120px;"/>
	        </td>
	        <td valign="top">
	          <c:if test="${item.commentText==null || item.commentText==''}">
	           <textarea  id="txtContent${index1.index}" class="input-info" style="height:120px;width:630px;color:#999;">200字内</textarea>
	          </c:if>
	          <c:if test="${item.commentText!=null && item.commentText!=''}">
	           <input type="hidden" value="2" id="txtHiddenCommentFlag${index1.index}"/>
	           <textarea  id="txtContent${index1.index}" disabled="disabled" class="input-info" style="height:120px;width:630px;color:#999;">${item.commentText}</textarea>
	          </c:if>
	        </td>
	        <td valign="bottom" style="font-size:14px;color:#9a9a9c;padding-bottom:40px;padding-right:40px;">
	         评价内容<br/>
	        (<span id="spanInfo${index1.index}">200/200</span>)
	         <ul class="ul-button"><li onclick="addOrderComment('${index1.index}','${item.productId}','${item.companyShopProductId}','${item.orderItemId}')"><div>提交</div></li></ul>
	        </td>
	        </tr>
	        
	       
	       </table>
	   </div>
</div>

  </c:forEach>

  
  <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>


 
 
 

</body>
</html>
<script type="text/javascript">


$(function(){
	var count = parseInt("${fn:length(orderProductList)}",10);
	for(var i=0;i<count;i++){
		initInput("txtContent"+i,"spanInfo"+i,"200字内",200);
	}
	
})

var loadding_dialog=null;
function show_loading(){
	if(loadding_dialog==null){
		loadding_dialog = new Dialog();
		loadding_dialog.Width = 300;
		loadding_dialog.Height = 100;
		loadding_dialog.Title = "";
		loadding_dialog.InnerHtml='<div style="text-align:center;font-size:14px;padding-top:20px;">loading......</div>';
		loadding_dialog.show();
	}
	else{
		loadding_dialog.show();
	}
	
}
function addOrderComment(index,productId,companyShopProductId,orderItemId){
	if($.trim($('#txtHiddenCommentFlag'+index).val()) =="2"){
		alert('已评论!');
		return;
	}
	if($.trim($('#txtContent'+index).val()).length ==0 || $.trim($('#txtContent'+index).val())=="200字内"){
	   alert('请输入评论内容!');
	}
	else{
		$.ajax({
		    type: "POST",
		    url : '${ctx}/user!KeywordFliter.action',
		    dataType:'json',
		    data:{word:$.trim($('#txtContent'+index).val())},
		    success: function(msg,status){
		    	
		    	if(msg.status==200){
		    		if(msg.rows.length>0){
		    			
		    			if(loadding_dialog!=null){
		    	    		loadding_dialog.close();
		    	    	}
		    			alert('您提交的内容含有敏感词:'+msg.rows.join(','));
		    		}
		    		else{
		    			addOrderCommentSubmit(index,productId,companyShopProductId,orderItemId);
		    		}
		        }
		    }
		   });
	}
}

function addOrderCommentSubmit(index,productId,companyShopProductId,orderItemId){
	
	
		$.ajax({
		    type: "POST",
		    url : '${ctx}/product!saveOrderProductComment.action',
		    dataType:'json',
		    data:{star:1,productId:productId,companyShopProductId:companyShopProductId,orderItemId:orderItemId,content:$('#txtContent'+index).val()},
		    success: function(msg,status){
		   		if(msg.status == 200){
		   			alert('评论成功!');
		   			$('#txtContent'+index).attr("disabled","disabled");
		   		} 
		   		else{
		   			alert(msg.msg);
		   		}
		    }
		});
	
	
}
</script>
