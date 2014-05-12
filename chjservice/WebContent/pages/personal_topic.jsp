<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />
<title>漕河泾e服务</title>
<style type="text/css">
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

.personal_fr1{
float:left;margin-left:10px;
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

ul.ul-button li{
width:40px;
list-style: none;
color:#fff;
background:#00b38b;
text-align: center;
}
ul.ul-button li:hover{
cursor:pointer;
background:#00b36b;
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
           <div class="menu1"><img src="${ctx}/images/menu_38.jpg" style="width:190px;"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_44.jpg" onclick="gotoPage('${ctx}/pages/personal_circle.jsp')"/></div>
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
   		<li style="background:#1da5bf;" onclick="topic_type(0,1)">我发表的话题</li>
   		<li onclick="topic_type(1,0)">我参与的话题</li>
  	</ul>
	<ul class="ul-search">
   		<li style="background:#1da5bf;" onclick="order_fun(0,'time')">按时间排序<img id="img_time" src="${ctx}/images/search_desc_time.png"/></li>
   		<li onclick="order_fun(1,'browse')">按人气排序<img id="img_browse" src="${ctx}/images/search_desc_browse.png"/></li>
  	</ul>
  	
		</td>
      </tr>
</table>
    </div>
   </div>



 <div id="topicdata"></div>
 

 
			
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
		
		pageinfo["userTopic"]=1;
		pageinfo["orderType"]='time';
		pageinfo["order"]='desc';
		findUserTopic(1);
	});

	var orderInfo={time:'desc',browse:'desc'};
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
		findUserTopic(1);
	}
	function searchByTagImpl(tag,time){
		pageinfo["tagList"]=tag;
		pageinfo["timeSpace"]=time;
		findUserTopic(1);
	}

	PageClick = function(pageclickednumber) {
	    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
	    findUserTopic(pageclickednumber);
	}
	function topic_type(index,type){
		$('.ul-search1 li').each(function(indexeach,data){
			if(indexeach==index)
				$(this).css("background","#1da5bf");
			else
				$(this).css("background","#17c8da");
		});
		
		pageinfo["userTopic"]=type;
		findUserTopic(1);
	}
	function findUserTopic(page){
		pageinfo["size"]=20;
		pageinfo["page"]=page;
		
		$.ajax({
			type : "POST",
			url : '${ctx}/user!findUserTopic.action',
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
			    		   var content=data["summary"];
			   			  
			   			   var delete_fun='';
			   			   if('${user.userId}'==data["userId"] && data["userId"]>0){
			   				   delete_fun='<ul class="ul-button"><li onclick="delete_fun('+data["topicId"]+')">删除</li></ul>';
			   			   }
			    		   array.push('<div style="position:relative;height:90px; padding:10px 25px 0 25px;">');
	    				   array.push('<div><div style="float:left; width:950px; height:90px;border-bottom:2px solid #1da5bf;background:#fff;">');
			   			   array.push('<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left:40px;padding-top:10px;"><tr>');
			   			  // array.push('<td width="17%"><table width="100%" border="0" cellspacing="0" cellpadding="0">');
			   			  // array.push('<tr><td height="106" align="center"><img src="${ctx}'+data["userInfo"]["headPicture"]+'" width="105" height="100" /></td></tr>');
			   			  // array.push('<tr><td align="center" style="font-size:18px; color:#57ae97;">'+data["userInfo"]["nickName"]+'</td></tr></table></td>');
			   			   array.push('<td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">');
			   			   array.push('<tr><td height="20"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr>');
			   			   array.push(' <td width="59%" style="font-size:18px; color:#57ae97; cursor:pointer;" onclick="circleTopicDetail(\''+"${user.userId}"+'\','+data["topicId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')">'+data["topicName"]+'</td><td width="18%" align="right" style="font-size:14px;">'+delete_fun+'</td>');
			   			   array.push('<td width="4%"><img src="${ctx}/images/personal_02.png" width="25" height="19" /></td><td width="7%" style="font-size:14px;">'+data["topicViews"]+'次</td>');
			   			   array.push('<td width="3%"><img src="${ctx}/images/personal_03.png" width="25" height="19" /></td><td width="9%" style="font-size:14px;">'+data["commentCount"]+'次</td></tr></table></td></tr>');
			   			   array.push('<tr><td height="20"  style="font-size:12px;">'+data["createTime"]+'</td></tr>');
			   			   
			   			   array.push('<tr><td style="font-size:12px;line-height:20px;color:#666;">'+content+'</td></tr></table></td></tr></table></div></div></div>');
		    		}
		    		 
		    		 $('#topicdata').html(array.join(''));
		    		 if(pageinfo["page"]==1 && array.length==0){
			    			$('#topicdata').html('<div style="text-align:center; margin:10px 25px 0 25px; width:950px; height:40px;line-height:40px;background:#fff;" >暂无数据!</div>');
			    	 }
			    	
				}
		    	else{
		    		alert(msg.msg);
		    	}
			}
		});
	}
	
	
	

	function delete_fun(topicId){
		//if(window.confirm('您确定删除吗?')){
			
			$.ajax({
				type:"POST",
				url : '${ctx}/user!deleteUserTopic.action',
				dataType : 'json',
				data:{topicId:topicId},
				success:function(msg, status){
					if(msg.status==200){
						alert('删除成功!');
						
					}
					else{
						alert(msg.msg);
					}	
					window.location.reload();
				}
			});
		//}	
		
	}
			   
</script>

