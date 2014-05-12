<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>

<style type="text/css">

.conv1{
float:left;margin-left:10px;
}
.conv1 img{
width:110px;height:110px;cursor:pointer;
}

.comm2{
	
float:left;margin-left:10px;
	
	}


.personal_fr1{
float:left;margin-left:10px;
}
ul.ul-tag{
width:300px;
}
ul.ul-tag li{
width:50px;
padding:2px;
float:left;
background:#ccc;
margin-left:4px;
margin-top:2px;
text-align:center;
}
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
           <div class="menu1"><img src="${ctx}/images/menu_42.jpg" onclick="gotoPage('${ctx}/product!findUserOrder.action')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_377.jpg" style="width:190px;"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_49.jpg" onclick="gotoPage('${ctx}/pages/personal_topic.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_44.jpg" onclick="gotoPage('${ctx}/pages/personal_circle.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_45.jpg" onclick="gotoPage('${ctx}/pages/personal_activity.jsp')"/></div>
			<div class="menu1"><img src="${ctx}/images/menu_47.jpg" onclick="gotoPage('${ctx}/pages/personal_collection.jsp')"/></div>
            <div class="menu1"><img src="${ctx}/images/personnel_home.png" onclick="gotoPage('${ctx}/pages/myhome.jsp')"/></div>
	    </div>
  
</div>
  
  
 <div style="position:relative;height:190px;padding:10px 25px 5px 25px;">
  <div id="circlefriendList" >
    
    </div>
    </div>
  
 
<jsp:include page="/common/bottom.jsp" />
	
</div>
</div>
</body>
</html>
<script type="text/javascript">

var circleId="${param.circleId}";

$(document).ready(function() {
	$.ajax({
		type : "POST",
		url : '${ctx}/user!findTheCirclePerple.action',
		dataType : 'json',
		data :{circleId:circleId},
		success : function(msg, status) {
			if(msg.status == 200){
				var users=msg.rows;
				var str='';
				for(var i=0;i<users.length;i++){
					var user=users[i]["user"];
					var t=users[i]["status"];
					if(t<4){
						if(i%3==0){
							str+='<div style="float:left;width:310px; height:190px;background-image:url(${ctx}/images/personal_fr033.png);">';
					    }else{
					    	str+='<div class="personal_fr1" style="width:310px; height:190px;background-image:url(${ctx}/images/personal_fr033.png);">';
					    }
						str+='<table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding-top:10px;">';
					    str+='<tr><td width="45%" height="106" align="center"><img src="${ctx}'+user["head_picture"]+'" width="105" height="100" /></td>';
					    str+='<td width="55%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">';
					    var info=user["info"];
					    if(info.length>35){
					    	info=info.substring(0,30)+'...';
					    }					
					    str+='<tr><td height="90" valign="top">简介：'+info+'</td></tr>';
					    var add=user["work_address"];
					    if($.trim(add)==""){
					    	add=user["city"];
					    	if($.trim(add)==""){
					    		add="未知";
					    	}
					    }
					    str+='<tr><td>地址：'+add+'</td></tr></table></td></tr>';
					    var name=user["nick_name"];
					    if($.trim(name)==""){
					    	name=user["email"];
					    }
					    str+='<tr><td height="34" align="center" style="font-size:16px; color:#57ae97;">'+name+'</td>';
					    str+='<td>&nbsp;</td></tr>';
					  
					    var type=users[i]["status"];
					    
					    if(type==1){
					    	str+='<tr><td height="38" align="center" style="font-size:16px; color:#13c4d4;">未审核</td>';
							str+='<td align="center"><a><img src="${ctx}/images/per_cirf1.png" width="65" height="28" /></a>&nbsp;<a>';
					        str+='<img src="${ctx}/images/per_cirf2.png" width="65" height="28" /></a>';
					    }else if(type==2){
					    	str+='<tr><td height="38" align="center" style="font-size:16px; color:#13c4d4;">审核未通过</td>';
							str+='<td align="center"><img src="${ctx}/images/per_cirf1.png" width="65" height="28" />';
							str+='<span style="width:65px;">&nbsp;</span>';
					    }else if(type==3){
					    	str+='<tr><td height="38" align="center" style="font-size:16px; color:#13c4d4;">已审核</td>';
							str+='<td align="center">&nbsp;';
					    }
					    str+='</td></tr></table></div>';
					}
				}
				
				$('#circlefriendList').html(str);				
			}else{
				alert(msg.msg);
			}			
		}		
	});
	
});

</script>

