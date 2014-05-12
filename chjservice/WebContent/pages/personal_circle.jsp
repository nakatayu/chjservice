<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />

<title>漕河泾e服务</title>
<!-- 公共css,js -->
<link rel="stylesheet" type="text/css" href="${ctx}/css/header.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/bottom.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/btn.css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>

<style type="text/css">
/* 我的订单 */
.myorder_font {
	color: #00b38a;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	padding-top: 15px;
}

.myorder_font1 {
	color: #00b38a;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	padding-top: 45px;
}

.myorder_font2 {
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	padding-top: 45px;
}

.myorder_font02 {
	color: #00b38a;
	font-size: 14px;
	font-weight: bold;
}

.myorder1 {
	float: left;
	margin-left: 10px;
}

.myorder1 img {
	width: 110px;
	height: 115px;
	cursor: pointer;
}

.personal_fr1 {
	float: left;
	margin-left: 10px;
}

.conv1 {
	float: left;
	margin-left: 10px;
}

.conv1 img {
	width: 110px;
	height: 110px;
	cursor: pointer;
}

.comm2 {
	float: left;
	margin-left: 10px;
}
ul.ul-tag li{
padding:2px;
float:left;
background:#999;
color:#fff;
font-size:14px;
margin-left:4px;
margin-top:2px;
text-align:center;
list-style: none;
max-width: 200px;/*具体数值自行修改，下一行相同*/
word-break:keep-all;
height:18px;
}

.ul-search li{width:190px;cursor:pointer;float:left;font-size:18px;
color:#fff;list-style: none;height:50px;line-height:50px;
background:#17c8da;text-align: center;}

.ul-search1 li{width:190px;cursor:pointer;float:left;font-size:18px;
color:#fff;list-style: none;height:50px;line-height:50px;
background:#17c8da;text-align: center;}

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
             <div class="menu1"><img src="${ctx}/images/menu_43.jpg" onclick="gotoPage('${ctx}/pages/personal_friend.jsp')"/></div>
             <div class="menu1"><img src="${ctx}/images/menu_49.jpg" onclick="gotoPage('${ctx}/pages/personal_topic.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_39.jpg" style="width:190px;"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_45.jpg" onclick="gotoPage('${ctx}/pages/personal_activity.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_47.jpg" onclick="gotoPage('${ctx}/pages/personal_collection.jsp')"/></div>
            <div class="menu1"><img src="${ctx}/images/personnel_home.png" onclick="gotoPage('${ctx}/pages/myhome.jsp')"/></div>
	    </div>
  
</div>

 
 <div style="position:relative;height:45px; padding:10px 25px 4px 25px;">
	   <div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="5%"  >
    <ul class="ul-search1">
   		<li style="background:#1da5bf;" onclick="circle_type(0,1)">我创建的圈子</li>
   		<li onclick="circle_type(1,0)">我参与的圈子</li>
  	</ul>
	<ul class="ul-search">
   		<li style="background:#1da5bf;" onclick="order_fun(0,'time')">按时间排序<img id="img_time" src="${ctx}/images/search_desc_time.png"/></li>
   		<li onclick="order_fun(1,'browse')">按人气排序<img id="img_browse" src="${ctx}/images/search_desc_browse.png"/></li>
   		<li onclick="order_fun(2,'userCount')">按圈子等级排序<img id="img_userCount" src="${ctx}/images/search_desc_browse.png" /></li>
  	</ul>
  	
		</td>
      </tr>
</table>
    </div>
   </div>


<div id="circledata">

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
	$(document).ready(function() {
		
		
		$("#pager").pager({ pagenumber: pageinfo["page"], pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
		
		pageinfo["userCircle"]=1;
		pageinfo["orderType"]='time';
		pageinfo["order"]='desc';
		findUserCircle(1);
		
	});
	var orderInfo={time:'desc',browse:'desc',userCount:'desc'};
	function order_fun(index,type){
		$('.ul-search li').each(function(indexeach,data){
			if(indexeach==index)
				$(this).css("background","#1da5bf");
			else
				$(this).css("background","#17c8da");
		});
		if(orderInfo[type]=="desc")
			orderInfo[type]="asc";
		else
			orderInfo[type]="desc";
		$('#img_'+type).attr('src',"${ctx}/images/search_"+orderInfo[type]+"_"+type+".png");
		pageinfo["orderType"]=type;
		pageinfo["order"]=orderInfo[type];
		findUserCircle(1);
	}
	function searchByTagImpl(tag,time){
		pageinfo["tagList"]=tag;
		pageinfo["timeSpace"]=time;
		findUserCircle(1);
	}
	function circle_type(index,type){
		$('.ul-search1 li').each(function(indexeach,data){
			if(indexeach==index)
				$(this).css("background","#1da5bf");
			else
				$(this).css("background","#17c8da");
		});
		
		pageinfo["userCircle"]=type;
		findUserCircle(1);
	}
	
	function findUserCircle(page){
		pageinfo["page"]=page;
		pageinfo["size"]=9;
		$.ajax({
			type : "POST",
			url : '${ctx}/circle!findUserCircle.action',
			dataType : 'json',
			data :pageinfo,
			success : function(msg, status) {
				if(msg.status == 200){
					if(msg.total%pageinfo["size"]==0)
		    	    	pageinfo["tp"]=msg.total/pageinfo["size"];
		    	    else
		    	    	pageinfo["tp"]=Math.ceil(msg.total/pageinfo["size"]);
		    		$("#pager").pager({ pagenumber: pageinfo["page"], pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
		    		
		    		var array = [];
		    		for(var i=0; i < msg.rows.length; i++){
		    		   var data = msg.rows[i];
		    		   
		    		   if(i%4==0){
		    			   array.push(' <div style="position:relative;height:310px; padding:10px 25px 0 25px;"><div>');
		    			   array.push('<div  style="float:left; width:230px; height:310px;background:#fff;border-bottom:2px solid #1da5bf;">');
		    		   }
		    		   else{
		    			   array.push('<div  class="personal_fr1" style="width:230px; height:310px;background:#fff;border-bottom:2px solid #1da5bf;">');
		    		   }		
		    		   
		    		  if(data["name"].length>13){
		    			  data["name"]=data["name"].substr(0,13)+'...';
		    		  }
		    		
		    		  array.push('<table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td><img  onclick="circle_detail(\'${user.userId}\','+data["circleId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')" style="cursor:pointer;width:230px;height:230px;" src="${imageStorePath}'+data["circleImage"]+'" /></td></tr>');
		    		  array.push('<tr><td height="22" style="font-size:14px; color:#57ae97; font-weight:bold; padding-left:10px;"><div style="cursor:pointer;width:230px;height:20px;overflow:hidden;" onclick="circle_detail(\'${user.userId}\','+data["circleId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')">'+data["name"]+'</div></td></tr>');
		    		  array.push('<tr><td><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td  height="20" style="font-size:14px; padding-left:10px;"><div style="width:110px;height:20px;overflow:hidden;">圈主：'+data["nickName"]+'</div></td>');
		    		  array.push('<td width="20" height="20" align="right"><img src="${ctx}/images/personal_02.png" width="25" height="19" /></td><td width="40" height="20"><span style="font-size:12px;">'+data["circleViews"]+'</span></td>');
		    		  array.push('<td width="20" height="20"><img src="${ctx}/images/personal_03.png" width="25" height="19" /></td><td width="60" height="20"><span style="font-size:12px;">'+data["topicCount"]+'</span></td></tr></table></td></tr>');
		    		  array.push('<tr>');
		    		  array.push('<td  width="100%" height="30" align="left" style="padding-bottom:2px;color:#000"><div style="width:260px;height:30px;overflow:hidden;"><ul class="ul-tag">');
		    		  var list = data["tagList"];
		    		  for ( var j = 0; j < list.length; j++) {
		    			  if(j<2){
		    				  list[j]["tagName"]=list[j]["tagName"];
		    				  if(list[j]["tagName"].length>6){
		    					  list[j]["tagName"] = list[j]["tagName"].substr(0,6)+'...';
		    				  }
		    				  array.push('<li>'
			    					  +list[j]["tagName"]+'</li>');
		    			  }
		    			 
		    			 
					   }
		    		  array.push('</ul></div></td></tr></table></div>');
		    		  if(i%4==3 || i==msg.rows.length-1){
		    			   array.push('</div></div>');
		    		   }
		    	   }
		    	   $('#circledata').html(array.join(''));
		    	   if(pageinfo["page"]==1 && array.length==0){
		    			$('#circledata').html('<div style="text-align:center; margin:10px 25px 0 25px; width:950px; height:40px;line-height:40px;background:#fff;" >暂无数据!</div>');
		    	 }
				}
		    	else{
		    		alert(msg.msg);
		    	}
			}
		});
	}
	PageClick = function(pageclickednumber) {
	    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
	    findUserCircle(pageclickednumber);
	}


	function addTheNewCircleUser(circleId){
		window.location.href="${ctx}/pages/personal_circlefriend.jsp?circleId="+circleId;
	}
	
</script>


