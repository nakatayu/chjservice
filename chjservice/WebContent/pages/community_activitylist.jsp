<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="${ctx}/js/dialog/dialog_subModal.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />

<title>漕河泾e服务</title>

<style type="text/css">
.test a{
border:0px solid #000;font-family:微软雅黑;
}
.conv1{
float:left;margin-left:10px;
}
.conv1 img{
width:110px;height:110px;cursor:pointer;
}

.comm2{
	
float:left;margin-left:10px;
	
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
.ul-search li{cursor:pointer;float:left;font-size:18px;
color:#fff;list-style: none;height:50px;line-height:50px;font-family:微软雅黑;
background:#ffc61a;text-align: center;}

.ul-create-activity li{cursor:pointer;float:left;font-size:18px;font-family:微软雅黑;
color:#fff;list-style: none;height:50px;line-height:50px;text-align: center;}

.ul-button{margin-left:100px;}
.ul-button li{cursor:pointer;float:left;font-size:18px;font-weight:bold;
color:#fff;padding-top:4px;padding-bottom:6px;list-style: none;width:150px;
background:#ffbe00;text-align: center;font-family:微软雅黑;}






</style>

</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />
<script type="text/javascript" src="${ctx}/js/dialog/dialog_common.js"></script>
<script type="text/javascript" src="${ctx}/js/dialog/dialog_subModal.js"></script>
<script type="text/javascript" src="${ctx}/js/activity.js"></script>
<div class="main">
<div id="main_content" class="main_content">
   
   
     
 <div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	     <div style="float:left;"><img src="${ctx}/images/menu_68.jpg" onclick="gotoPage('${ctx}/community!communityHome.action')" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_62.jpg" onclick="gotoPage('${ctx}/pages/community_topiclist.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_70.jpg" onclick="gotoPage('${ctx}/pages/community_activitylist.jsp ')"style="width:190px;" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_63.jpg" onclick="gotoPage('${ctx}/community!findLableListCircle.action')"/></div>
   
           <div><img src="${ctx}/images/menu_66.png" style="width:473px;height: 100px;" /></div>
	    </div>
  
</div>

  
  
 <div style="position:relative;padding:10px 25px 0 25px">
	<div>
	<table style="float:left;" width="590" border="0" cellspacing="0" cellpadding="0" bgcolor="#f0b543">
	<tr>
		<td>
  	<ul class="ul-search">
   		<li style="width:230px;background:#f0b543;font-family:微软雅黑;" onclick="order_fun(0,'time')">按时间排序<img id="img_time" src="${ctx}/images/search_desc_time.png"/></li>
   		<li style="width:162px;font-family:微软雅黑;" onclick="order_fun(1,'browse')">按人气排序<img id="img_browse" src="${ctx}/images/search_desc_browse.png"/></li>
   		<li style="width:196px;font-family:微软雅黑;" onclick="order_fun(2,'userCount')">按活动名额排序<img id="img_userCount" src="${ctx}/images/search_desc_browse.png" /></li>
  	</ul>
  </td>
  </tr>
 </table>
 
 <div style="width:350px;float:right;cursor: pointer; padding:0 0 5px 0;">
   <ul class="ul-create-activity">
   	<li style="width:350px;cursor:pointer;background:url(${ctx}/images/cjhd_1.png)" onclick="window.location.href='${ctx}/community!createActivity.action?type=0'"></li>
   </ul>
 </div>
 
</div>
</div>

<div id="div_activity" style="clear:both;"> 



</div>
   
   
<div style="float:left; margin:10px 25px 0 25px;font-family:微软雅黑; width:950px; height:40px; background:#fff;margin-top:10px;" >
<div id="pager" style="float:right;font-family:微软雅黑;" ></div>
</div>

  <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>


 
 
 

</body>
</html>
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	pageinfo["orderType"]='time';
	pageinfo["order"]='desc';
	findActivityList(1);
});

PageClick = function(pageclickednumber) {
    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
    findActivityList(pageclickednumber);
}
var orderInfo={time:'desc',browse:'desc',userCount:'desc'};
function order_fun(index,type){
	
	$('.ul-search li').each(function(indexeach,data){
		if(indexeach==index)
			$(this).css("background","#f0b543");
		else
			$(this).css("background","#ffc61a");
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
	$('#div_activity').html('');
	findActivityList(1);
}
function findActivityList(page){
	pageinfo["size"]=10;
	pageinfo["page"]=page;
	
	$.ajax({
	    type: "POST",
	    url : '${ctx}/community!findHotActivityList.action',
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
		    			var titleClick='我要报名';
		    			if(data["joinType"]=='2' && data["isQrcode"]=='T'){
		    				titleClick='我要订票';
		    			}
		    			var addActivity='<ul class="ul-button"><li id="enrolldiv'+data["activityId"]+'" onclick="addActivityUser(\'加入活动\',2,'+data["activityId"]+',\''+data["isCheck"]+'\',\''+data["isQrcode"]+'\')">'+titleClick+'</li></ul>';
		    			if(data["hasAdd"]>0 || "${user.userId}"==data["createUserId"]){
		    				addActivity='';
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
		    		array=[];
		    		array=null;
		    		
		    		if(msg.rows.length==0 && pageinfo["page"]==1){
		    			window.alert(pageinfo["emtMsg"]);
						$('#div_activity').html('<div style="float:left;text-align:center; margin:10px 25px 0 25px; width:950px; height:40px;line-height:40px; background:#fff;margin-top:10px;" >'+pageinfo["emtMsg"]+'</div>');
					}	
		    		
	    	}
	    	else
	    		alert(msg.msg);
	    }
	});
	
}

</script>

