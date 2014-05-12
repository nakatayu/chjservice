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
width:100px;
height:40px;
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
padding-top:10px;
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

</style>
</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />

<div class="main">
<div id="main_content" class="main_content">
   
 <div style="position:relative;height:250px;  padding:10px 25px 0 25px;">
	   <div>
	    
	       <table style="height:250px;margin-left:0px;font-weight:bold;width:950px;background:#fff;">
	       <tr><td valign="middle" colspan="2" style="padding-left: 40px;">商品：${name}</td></tr>
	      <tr><td valign="middle" colspan="2">&nbsp;</td></tr>
	        <tr><td valign="top" style="padding-left: 40px;width:140px;color:#999;">评价内容：<br/>
	        (<span id="spanInfo">200/200</span>)</td>
	        <td valign="top">
	           <textarea id="txtContent" class="input-info" style="height:100px;width:650px;color:#999;">200字内</textarea>
	           <br/> <br/>
	           <ul class="ul-button"><li onclick="addOrderComment()"><div>提交</div></li></ul>
	        </td>
	        </tr>
	       
	       </table>
	  
	   </div>
</div>
 
 

  <div style="height:500px;">
 

  </div>
  
  <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>


 
 
 

</body>
</html>
<script type="text/javascript">
var rt=false;

$(function(){
	initInput("txtContent","spanInfo","200字内",200);
})

function addOrderComment(){
	if(rt){
		alert('已评论过!');
		return;
	}
	if($.trim($('#txtContent').val()).length ==0 || $.trim($('#txtContent').val())=="200字内"){
	   alert('请输入评论内容!');
	}
	else{
		$.ajax({
		    type: "POST",
		    url : '${ctx}/product!saveOrderProductComment.action',
		    dataType:'json',
		    data:{star:1,productId:"${productId}",companyShopProductId:"${companyShopProductId}",orderItemId:"${orderItemId}",content:$('#txtContent').val()},
		    success: function(msg,status){
		   		if(msg.status == 200){
		   			alert('评论成功!');
		   			rt=true;
		   		} 
		   		else{
		   			alert(msg.msg);
		   		}
		    }
		});
	}
	
	
}
</script>
