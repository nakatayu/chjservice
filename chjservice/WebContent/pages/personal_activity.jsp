<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />

<title>漕河泾e服务</title>

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
padding-left:4px;
padding-right:4px;
float:left;
color:#fff;
font-size:14px;
background:#dcdcdc;
margin-left:4px;
margin-top:2px;
text-align:center;
list-style: none;font-family:微软雅黑;
max-width: 200px;/*具体数值自行修改，下一行相同*/
word-break:keep-all;
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
           <div class="menu1"><img src="${ctx}/images/menu_44.jpg" onclick="gotoPage('${ctx}/pages/personal_circle.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_32.jpg" style="width:190px;"/></div>
            <div class="menu1"><img src="${ctx}/images/menu_47.jpg" onclick="gotoPage('${ctx}/pages/personal_collection.jsp')"/></div>
            <div class="menu1"><img src="${ctx}/images/personnel_home.png" onclick="gotoPage('${ctx}/pages/myhome.jsp')"/></div>
	    </div>
  
</div>

<div style="position:relative;height:45px; padding:10px 25px 14px 25px;">
	   <div>
<table style="float:left;" width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
		<ul class="ul-search1">
   		<li style="background:#1da5bf;" onclick="activity_type(0,1)">我创建的活动</li>
   		<li onclick="activity_type(1,0)">我参与的活动</li>
  	</ul>
  	
  	<ul class="ul-search">
   		<li style="background:#1da5bf;" onclick="order_fun(0,'time')">按时间排序<img id="img_time" src="${ctx}/images/search_desc_time.png"/></li>
   		<li  onclick="order_fun(1,'browse')">按人气排序<img id="img_browse" src="${ctx}/images/search_desc_browse.png"/></li>
   		<li  onclick="order_fun(2,'userCount')">按活动名额排序<img id="img_userCount" src="${ctx}/images/search_desc_browse.png" /></li>
  	</ul>
  </td>
  </tr>
 </table>
   </div>
 </div>
   
   
<div id="div_activity"> 

</div>
			
			
<div style="float:left; margin:10px 25px 0 25px; width:950px; height:40px;background:#fff;" >
<div id="pager" style="float:right;" ></div>
</div>


<jsp:include page="/common/bottom.jsp" />

</div>
</div>

<form id="dowloadFrom" action="${ctx }/user!dowloadQrcode.action" method="post">
		<input type="hidden" id="hiddenActivityId" name="activityId"/>
		<input type="hidden" id="hiddenActivityName" name="activityName"/>
	</form>
</body>
</html>
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#pager").pager({ pagenumber: pageinfo["page"], pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
		
		pageinfo["userActivity"]=1;
		pageinfo["orderType"]='time';
		pageinfo["order"]='desc';
		findActivityList(1);
		
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
		findActivityList(1);
	}
	function searchByTagImpl(tag,time){
		pageinfo["tagList"]=tag;
		pageinfo["timeSpace"]=time;
		findActivityList(1);
	}
	function activity_type(index,type){
		$('.ul-search1 li').each(function(indexeach,data){
			if(indexeach==index)
				$(this).css("background","#1da5bf");
			else
				$(this).css("background","#17c8da");
		});
		
		pageinfo["userActivity"]=type;
		findActivityList(1);
	}
	PageClick = function(pageclickednumber) {
	    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
	    findActivityList(pageclickednumber);
	}
	function findActivityList(page){
		pageinfo["size"]=10;
		pageinfo["page"]=page;
		$.ajax({
		    type: "POST",
		    url : '${ctx}/user!findUserActivityList.action',
		    dataType:'json',
		    data:pageinfo,
		    success: function(msg,status){
		    	if(msg.status==200){
		    		if(msg.total%pageinfo["size"]==0)
		    	    	pageinfo["tp"]=msg.total/pageinfo["size"];
		    	    else
		    	    	pageinfo["tp"]=Math.ceil(msg.total/pageinfo["size"]);
		    		$("#pager").pager({ pagenumber: pageinfo["page"], pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
		    		
			    		
		    		var array=[];
		    		for(var i=0; i<msg.rows.length;i++){
		    			var data = msg.rows[i];
		    			var tagArray=[];
		    			for(var k=0;k<data["tagList"].length;k++){
		    				tagArray.push('<li>'+data["tagList"][k]["tagName"]+'</li>');
		    			}
		    			var img ='${ctx}/images/tupian2.png';
		    			
		    			if(data["activityImage"]!=null && data["activityImage"].length>0){
		    				img ='${imageStorePath}'+data["activityImage"];
		    			}
		    			var title=data["title"];
		    			if(title.length>30){
		    				title = title.substr(0,30);
		    			}
		    			var summary = data["summary"];
		    			if(summary.length>100){
		    				summary = summary.substr(0,100);
		    			}
		    			var addActivity='';
		    			if(data["isQrcode"]=='T' && data["qrcodePath"].length>0){
		    				addActivity ='<img style="cursor:pointer;" onclick="findActivityQrcode('+data["activityId"]+',\''+data["title"]+'\')" src="${ctx}/images/btn_qrcode.jpg" width="150" height="49" />';
		    			}
		    			
		    			var top=10;
		    			if(pageinfo["page"]==1 && i==0){
		    				top=0;
		    			}
		    			
		    			data["commentCount"]=data["commentCount"]>999?999:data["commentCount"];
		    			var str='<div style="position:relative;height:230px; padding:'+top+'px 25px 0 15px;">'+
		    				   '<div>'+
		    			   '<table width="590" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" class="comm2">'+
		    		  '<tr>'+
		    		   ' <td width="230" height="230"><img src="'+img+'" style="cursor:pointer;" onclick="activity_detail(\''+"${user.userId}"+'\','+data["activityId"]+',\''+data["createUserId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')" width="230px" height="230px" /></td>'+
		    		    '<td width="360" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		     ' <tr>'+
		    		      '  <td height="52"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		       '   <tr>'+
		    		        '    <td width="88%" class="comm_ys" style="cursor:pointer;" onclick="activity_detail(\''+"${user.userId}"+'\','+data["activityId"]+',\''+data["createUserId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')">'+title+'</td>'+
		    		         '   <td width="12%"></td>'+
		    		          '</tr>'+
		    		        '</table></td>'+
		    		      '</tr>'+
		    		      '<tr>'+
		    		       ' <td height="108" valign="top" class="comm_ysdis">'+
		    		       summary+'</td>'+
		    		      '</tr>'+
		    		      '<tr>'+
		    		       ' <td><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		        '  <tr>'+
		    		        '  <td width="38" valign="top" style="font-family:微软雅黑;color:#666;padding-left:14px;">评论</td>'+
		    		         '   <td width="34" height="30" align="center" valign="top"><div style="height:40px;color:#fff;background:url(${ctx}/images/search_number_yellow.png) no-repeat;">'+data["commentCount"]+'</div></td>'+
		    		          '  <td width="247" valign="top"><div style="margin-left:20px;width:247px;height:54px;overflow:hidden;">'+
		    		         '<ul class="ul-tag">'+
		    		         tagArray.join('')+
		    		         '   </td>'+
		    		         ' </tr>'+
		    		        '</table></td>'+
		    		     ' </tr>'+
		    		    '</table></td>'+
		    		  '</tr>'+
		    		  '     </table>'+
		    		' <div style="float:right; font-family:微软雅黑; width:350px; height:230px;">'+
		    		'   <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f9f9f7">'+
		    		 '    <tr>'+
		    		  '     <td><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		  '       <tr>'+
		    		   '        <td width="32%" align="center" background="${ctx}/images/map9.png" style="height:70px"><p>可参与人数</p><p><strong>'+(data["userMax"]-data["userCount"])+'</strong></p></td>'+
		    		   '        <td width="1" align="center"></td>'+
		    		   '        <td width="32%" align="center" background="${ctx}/images/map9.png" style="height:70px"><p>已参加人数</p><p><strong>'+data["userCount"]+'</strong></p></td>'+
		    		   '        <td width="1" align="center"></td>'+
		    		   '        <td width="34%" align="center" background="${ctx}/images/map9.png" style="height:70px"><p>活动名额</p><p><strong>'+data["userMax"]+'</strong></p></td>'+
		    		   '      </tr>'+
		    		   '    </table></td>'+
		    		   '  </tr>'+
		    		   '  <tr>'+
		    		    '   <td height="72" align="center"><p style="font-family:微软雅黑;">活动时间:</p><p><strong>'+data["chinaBeginTime"]+'</strong></p></td>'+
		    		   '  </tr>'+
		    		   '  <tr>'+
		    		   '    <td height="88" align="center">'+
		    		    addActivity+
		    		    '</td>'+
		    		   '  </tr>'+
		    		  ' </table>'+
		    		' </div>'+
		    		'</div>'+
		    		' </div>';
		    		array.push(str);
		    		}
		    		$('#div_activity').html(array.join(''));
		    		if(pageinfo["page"]==1 && array.length==0){
		    			$('#div_activity').html('<div style="text-align:center; margin:10px 25px 0 25px; width:950px; height:40px;line-height:40px;background:#fff;" >暂无数据!</div>');
		    		}
		    		array=[];
		    		array=null;
			    		
			    		
		    	}
		    	else
		    		alert(msg.msg);
		    }
		});
		
	}
function findActivityQrcode(id,name){
	
	$.ajax({
	    type: "POST",
	    url : '${ctx}/user!checkUserDouwloadQrcode.action',
	    dataType:'json',
	    data:{activityId:id},
	    success: function(msg,status){
	    	if(msg.status==200){
	    		$('#hiddenActivityId').val(id);
	    		$('#hiddenActivityName').val(name);
	    		$('#dowloadFrom').submit();
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
	    }
	});
	
	
}

function generActivityQrcode(id){
	$.ajax({
	    type: "POST",
	    url : '${ctx}/community!generActivityQrcode.action',
	    dataType:'json',
	    data:{activityId:id},
	    success: function(msg,status){
	    	if(msg.status==200){
	    		alert('已生成二维码,请到我的活动中查看!');
	    	}
	    	else{
	    		alert('已生成二维码!');
	    	}
	    }
	});
}
	
</script>


