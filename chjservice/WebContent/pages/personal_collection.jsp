<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
ul.ul-tag-circle li{padding-left:4px;
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
ul.ul-tag-shop{margin-right:10px;}
ul.ul-tag-shop li{
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

.ul-button{margin-left:100px;}
.ul-button li{cursor:pointer;float:left;font-size:18px;font-weight:bold;
color:#fff;padding-top:4px;padding-bottom:6px;list-style: none;width:150px;
background:#ffbe00;text-align: center;font-family:微软雅黑;}
</style>
</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />
<script type="text/javascript" src="${ctx}/js/activity.js"></script>

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
           <div class="menu1"><img src="${ctx}/images/menu_45.jpg" onclick="gotoPage('${ctx}/pages/personal_activity.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_34.jpg" style="width:190px;"/></div>
           <div class="menu1"><img src="${ctx}/images/personnel_home.png" onclick="gotoPage('${ctx}/pages/myhome.jsp')"/></div>
	    </div>
  
</div>
 
 
 
 <div id="div_data">
 
 
 </div>
 
 
  <div style="clear:both;position:relative;height:55px; padding:10px 25px 0 25px;">
     <div id="loadmore" onclick="loadMore()" style="cursor:pointer;height:55px; width:950px; background-color:#FFF;"> <p id="loadMoreText" style="text-align:center; padding-top:18px;font-size:14px;color:4c4c4c;font-family:黑体;">加载更多</p> </div>
 </div>
 




  
  <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>


 
 
 

</body>
</html>
<script type="text/javascript">

$(document).ready(function(){
	pageinfo["circlePage"]=1;
	pageinfo["actPage"]=1;
	pageinfo["topicPage"]=1;
	pageinfo["proPage"]=1;
	pageinfo["restaPage"]=1;
	
	findUserCollection();
});
function loadMore(){
	if(pageinfo["more"]){
		findUserCollection();
	}
}
function findUserCollection(){
	pageinfo["dotype"]=1;
		$.ajax({
			type : "POST",
			url : '${ctx}/user!findUserCollection.action',
			dataType : 'json',
			data :pageinfo,
			success : function(msg, status) {
				if(msg.status == 200){
		    		var array = [];
		    		for(var i=0; i<msg.rows["shopList"].length;i++){
		    			 var data = msg.rows["shopList"][i]["shopInfo"];
		    			 if(data==null)
			    			   continue;
		    			 var tag={tagId:"",tagName:"暂无",tagId1:"",tagName1:"暂无"};
		    			 if(data["tagList"].length>0){
		    				 tag["tagId"]=data["tagList"][0]["tagId"];
		    				 tag["tagName"]=data["tagList"][0]["tagName"];
		    				
		    				 if(tag["tagName"].length>5){
		    					 tag["tagName"]=tag["tagName"].substr(0,5)+'...';
		    				 }
		    			 }
		    			 if(data["tagList"].length>1){
		    				 tag["tagId1"]=data["tagList"][1]["tagId"];
		    				 tag["tagName1"]=data["tagList"][1]["tagName"];
		    				 if(tag["tagName1"].length>5){
		    					 tag["tagName1"]=tag["tagName1"].substr(0,5)+'...';
		    				 }
		    			 }
		    			 
		    			 if(data["name"].length>7){
		    				 data["name"]=data["name"].substr(0,7)+'...';
		    			 }
		    			 var str='';
			    		  if(i%3==0){
			    			  str +='<div style="position:relative;height:230px; padding:10px 25px 0 25px;"><div>';
							  str +='<div style="float:left; width:310px; height:230px;background-image:url(${ctx}/images/personal_fr04.png);">';
			    		  }
			    		  else{
			    			  str +='<div class="personal_fr1" style="width:310px; height:230px;background-image:url(${ctx}/images/personal_fr04.png);">';
			    		  }	
			    		  str +='<table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:15px 0 0 15px">'+
				    	        '<tr>'+
			    	         ' <td width="67%" height="178" align="center"><img src="${imageStorePath}'+data["logo"]+'" width="162" height="162" /></td>'+
			    	          '<td width="33%" valign="top"><table width="100%" height="185" border="0" cellpadding="0" cellspacing="0">'+
			    	          '  <tr>'+
			    	           '   <td height="39" colspan="2">人均￥'+data["consumptionPer"]+'</td>'+
			    	           ' </tr>'+
			    	           ' <tr>'+
			    	           '   <td height="33" colspan="2"><ul class="ul-tag-shop"><li>'+tag["tagName"]+'</li><li>'+tag["tagName1"]+'</li></ul></td>'+
			    	            '</tr>'+
			    	            '<tr>'+
			    	            '  <td width="24%" height="28"><img src="${ctx}/images/personal_02.png" width="25" height="19" /></td>'+
			    	            ' <td width="76%"><span style="font-size:12px;">'+data["browseCount"]+'次</span></td>'+
			    	            '</tr>'+
			    	            '<tr>'+
			    	             ' <td height="66" colspan="2" style="cursor:pointer;" onclick="gotoDetail('+data["companyShopId"]+')">进入店铺</td>'+
			    	            '</tr>'+
			    	          '</table></td>'+
			    	        '</tr>'+
			    	        '<tr>'+
			    	         ' <td align="center" style="font-size:16px; color:#57ae97;">'+data["name"]+'</td>'+
			    	         ' <td>&nbsp;</td>'+
			    	        '</tr>'+
			    	      '</table>'+
			    	    '</div>';
			    	    
			    	    
			    		if(i%3==2 || i==msg.rows["shopList"].length-1){
			    			if(i==msg.rows["shopList"].length-1){
			    				if(msg.rows["shopList"].length==1){
					    	    	str +='<div class="personal_fr1" style="width:310px; height:230px;background-image:url(${ctx}/images/personal_fr04.png);">暂无</div>';
					    	    	str +='<div class="personal_fr1" style="width:310px; height:230px;background-image:url(${ctx}/images/personal_fr04.png);">暂无</div>';
					    	    }
					    	    else if(msg.rows["shopList"].length==2){
					    	    	str +='<div class="personal_fr1" style="width:310px; height:230px;background-image:url(${ctx}/images/personal_fr04.png);">暂无</div>';
					    	    }
			    			}
			    			str +='</div></div>';
			    		}
			    		array.push(str);
		    		}
		    		for(var i=0; i<msg.rows["proList"].length;i++){
		    			 var data = msg.rows["proList"][i]["proPart"];
		    			 if(data==null)
			    			   continue;
		    			 var tag={tagId:"",tagName:"暂无",tagId1:"",tagName1:"暂无"};
		    			 if(data["tagList"].length>0){
		    				 tag["tagId"]=data["tagList"][0]["tagId"];
		    				 tag["tagName"]=data["tagList"][0]["tagName"];
		    				
		    				 if(tag["tagName"].length>5){
		    					 tag["tagName"]=tag["tagName"].substr(0,5)+'...';
		    				 }
		    			 }
		    			 if(data["tagList"].length>1){
		    				 tag["tagId1"]=data["tagList"][1]["tagId"];
		    				 tag["tagName1"]=data["tagList"][1]["tagName"];
		    				 if(tag["tagName1"].length>5){
		    					 tag["tagName1"]=tag["tagName1"].substr(0,5)+'...';
		    				 }
		    			 }
		    			 
		    			  var price='',companyShopProductSkuId='';
			    		   if(data["sku"]!=null){
			    			   price =data["sku"]["price"];
			    			   companyShopProductSkuId=data["sku"]["companyShopProductSkuId"];
			    		   }
			    		   if(data["productInfo"]["name"].length>7){
			    				 data["productInfo"]["name"]=data["productInfo"]["name"].substr(0,7)+'...';
			    			 }
			    		   if(i%3==0){
			    			   array.push('<div style="position:relative;height:230px; padding:10px 25px 0 25px;"><div>');
			    			   array.push('<div style="float:left; width:310px; height:230px;background-image:url(${ctx}/images/personal_fr04.png);">');
			    		   }
			    		   else{
			    			   array.push('<div class="personal_fr1" style="width:310px; height:230px;background-image:url(${ctx}/images/personal_fr04.png);">');
			    		   }	
			    		   var str=' <table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:15px 0 0 15px">'+
				    	        '<tr>'+
			    	         ' <td width="67%" height="178" align="center"><img src="${imageStorePath}'+data["image"]+'" width="162" height="162" /></td>'+
			    	          '<td width="33%" valign="top"><table width="100%" height="185" border="0" cellpadding="0" cellspacing="0">'+
			    	          '  <tr>'+
			    	           '   <td height="39" colspan="2">￥'+price+'</td>'+
			    	           ' </tr>'+
			    	           ' <tr>'+
			    	           '   <td height="33" colspan="2">'+
			    	           '<ul class="ul-tag-shop"><li>'+tag["tagName"]+'</li><li>'+tag["tagName1"]+'</li></ul>'+
			    	           '</td>'+
			    	            '</tr>'+
			    	            '<tr>'+
			    	            '  <td width="24%" height="28"><img src="${ctx}/images/personal_02.png" width="25" height="19" /></td>'+
			    	            ' <td width="76%"><span style="font-size:12px;">'+data["productInfo"]["browseCount"]+'次</span></td>'+
			    	            '</tr>'+
			    	            '<tr>'+
			    	             ' <td height="19"><img src="${ctx}/images/personal_03.png" width="25" height="19" /></td>'+
			    	            '  <td><span style="font-size:12px;">'+data["commentCount"]+'次</span></td>'+
			    	            '</tr>'+
			    	            '<tr>'+
			    	             ' <td height="23" colspan="2" style="cursor:pointer;" onclick="productDetail(3,'+data["productId"]+','+data["companyShopProductId"]+','+data["companyShopId"]+','+companyShopProductSkuId+')">进入详情</td>'+
			    	            '</tr>'+
			    	          '</table></td>'+
			    	        '</tr>'+
			    	        '<tr>'+
			    	         ' <td align="center" style="font-size:16px; color:#57ae97;">'+data["productInfo"]["name"]+'</td>'+
			    	         ' <td>&nbsp;</td>'+
			    	        '</tr>'+
			    	      '</table>'+
			    	    '</div>';
			    	    
			    	    if(msg.rows["proList"].length==1){
			    	    	str +='<div class="personal_fr1" style="width:310px; height:230px;background-image:url(${ctx}/images/personal_fr04.png);">暂无</div>';
			    	    	str +='<div class="personal_fr1" style="width:310px; height:230px;background-image:url(${ctx}/images/personal_fr04.png);">暂无</div>';
			    	    }
			    	    else if(msg.rows["proList"].length==2){
			    	    	str +='<div class="personal_fr1" style="width:310px; height:230px;background-image:url(${ctx}/images/personal_fr04.png);"></div>';
			    	    }
			    	    	
			    		   if(i%3==2 || i==msg.rows["proList"].length-1){
			    			   str +='</div></div>';
			    		   }
			    		   array.push(str);
		    		}
		    		
		    	 
		    		for(var i=0; i<msg.rows["activityList"].length;i++){
		    			var data = msg.rows["activityList"][i]["activityPart"];
		    			 if(data==null)
			    			   continue;
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
			    			var titleClick='我要参加';
			    			if(data["joinType"]=='2' && data["isQrcode"]=='T'){
			    				titleClick='我要订票';
			    			}
			    			var addActivity='<ul class="ul-button"><li id="enrolldiv'+data["activityId"]+'" onclick="addActivityUser(\'加入活动\',2,'+data["activityId"]+',\''+data["isCheck"]+'\',\''+data["isQrcode"]+'\')">'+titleClick+'</li></ul>';
			    			if(data["hasAdd"]>0 || "${user.userId}"==data["createUserId"]){
			    				addActivity='';
			    			}
			    					    			
			    			
			    			data["commentCount"]=data["commentCount"]>999?999:data["commentCount"];
			    			var str='<div style="position:relative;height:230px; padding:10px 25px 0 15px;">'+
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
		    		for(var i=0; i<msg.rows["topicList"].length; i++){
			    		  var data = msg.rows["topicList"][i]["topicPart"];
			    		  if(data==null)
			    			   continue;
			    		  var str ='<table style="margin-left:25px;margin-top:10px;background:#fff;" width="950"height="150" border="0" cellspacing="0" cellpadding="0" style="padding-top:15px;" >'+
			    		     '   <tr>'+
			    		     '     <td width="17%" style="border-bottom:2px solid #57ae97;"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
			    		      '      <tr>'+
			    		     '         <td height="106" align="center"><img src="${imageStorePath}'+data["userInfo"]["headPicture"]+'" width="105" height="100" /></td>'+
			    		     '       </tr>'+
			    		      '      <tr>'+
			    		      '        <td align="center" style="font-size:16px; color:#57ae97;">'+data["userInfo"]["nickName"]+'</td>'+
			    		      '      </tr>'+
			    		      '      </table></td>'+
			    		      '    <td width="83%" valign="top" style="border-bottom:2px solid #57ae97;"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
			    		       '     <tr>'+
			    		        '      <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
			    		         '      <tr>'+
			    		           '       <td width="59%" style="font-size:16px; color:#57ae97; font-weight:bold;cursor:pointer;" onclick="circleTopicDetail(\''+"${user.userId}"+'\','+data["topicId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')">'+data["topicName"]+'</td>'+
			    		            '      <td width="18%">&nbsp;</td>'+
			    		             '     <td width="4%"><img src="${ctx}/images/personal_02.png" width="25" height="19" /></td>'+
			    		              '    <td width="7%" style="font-size:12px;">'+data["topicViews"]+'次</td>'+
			    		               '   <td width="3%"><img src="${ctx}/images/personal_03.png" width="25" height="19" /></td>'+
			    		                '  <td width="9%" style="font-size:12px;">'+data["commentCount"]+'次</td>'+
			    		                '</tr>'+
			    		              '</table></td>'+
			    		            '</tr>'+
			    		           ' <tr>'+
			    		            '  <td height="30"  style="font-size:12px;">2013.09.06</td>'+
			    		            '</tr>'+
			    		            '<tr>'+
			    		            '  <td style="font-size:13px;">'+data["summary"]+'</td>'+
			    		           ' </tr>'+
			    		         ' </table></td>'+
			    		       ' </tr>'+
			    		      '</table>';
			    		 array.push(str);
		    		}
		    		for(var i=0; i<msg.rows["circleList"].length; i++){
			    		   var data = msg.rows["circleList"][i]["circlePart"];
			    		   if(data==null)
			    			   continue;
			    		  /** if(i%4==0){
			    			   array.push('<table style="margin-top:10px;margin-left:25px;" width="950" border="0" cellspacing="0" cellpadding="0"><tr>');
			    			   array.push('<td  style="float:left;margin-left:0px;width:230px; height:310px;border-bottom:2px solid #1da5bf;">');
			    		   }
			    		   else{
			    			   array.push('<td style="float:left;margin-left:10px;width:230px; height:310px;border-bottom:2px solid #1da5bf;">');
			    		   }	
			    		  
			    		  array.push('<table width="230" border="0" cellspacing="0" cellpadding="0"><tr><td><img  onclick="circle_detail(\'${user.userId}\','+data["circleId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')" style="cursor:pointer;width:230px;height:230px;" src="${ctx}'+data["circleImage"]+'" /></td></tr>');
			    		  array.push('<tr style="background:#fff;"><td height="22" style="font-size:14px; color:#57ae97; font-weight:bold; padding-left:10px;"><div onclick="circle_detail(\'${user.userId}\','+data["circleId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')" style="cursor:pointer;width:230px;height:20px;overflow:hidden;">'+data["name"]+'</div></td></tr>');
			    		  array.push('<tr style="background:#fff;"><td><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td height="20" style="font-size:14px; padding-left:10px;"><div style="width:110px;height:20px;overflow:hidden;">圈主：'+data["nickName"]+'</div></td>');
			    		  array.push('<td width="20" height="20" align="right"><img src="${ctx}/images/personal_02.png" width="25" height="19" /></td><td width="40"  height="20"><span style="font-size:12px;">'+data["circleViews"]+'次</span></td>');
			    		  array.push('<td width="20" height="20"><img src="${ctx}/images/personal_03.png" width="25" height="19" /></td><td width="60" height="20"><span style="font-size:12px;">'+data["topicCount"]+'次</span></td></tr></table></td></tr>');
			    		  array.push('<tr style="background:#fff;">');
			    		  
			    		  array.push('<td  width="230" height="30" align="left" style="color:#000"><div style="width:230px;height:30px;overflow:hidden;"><ul class="ul-tag-circle">');
			    		  var list = data["tagList"];
			    		  for ( var j = 0; j < list.length; j++) {
			    			  array.push('<li><div>'
			    					  +list[j]["tagName"]+'</div></li>');
			    			 
						   }
			    		  array.push('</ul></div></td></tr></table></td>');
			    		 
			    		  if(i%4==3 || i==msg.rows["circleList"].length-1){
			    			  if(i==msg.rows["circleList"].length-1){
			    				  if(msg.rows["circleList"].length==1){
				    				  array.push('<td  class="personal_fr1" style="width:230px; height:310px;background:#fff;border-bottom:2px solid #1da5bf;">暂无</td>');
				    				  array.push('<td  class="personal_fr1" style="width:230px; height:310px;background:#fff;border-bottom:2px solid #1da5bf;">暂无</td>');
				    				  array.push('<td  class="personal_fr1" style="width:230px; height:310px;background:#fff;border-bottom:2px solid #1da5bf;">暂无</td>');
				    			  }
				    			  else if(msg.rows["circleList"].length==2){
				    				  array.push('<td  class="personal_fr1" style="width:230px; height:310px;background:#fff;border-bottom:2px solid #1da5bf;">暂无</td>');
				    				  array.push('<td  class="personal_fr1" style="width:230px; height:310px;background:#fff;border-bottom:2px solid #1da5bf;">暂无</td>');
				    			  }
				    			  else if(msg.rows["circleList"].length==3){
				    				  array.push('<td  class="personal_fr1" style="width:230px; height:310px;background:#fff;border-bottom:2px solid #1da5bf;">暂无</td>');
				    			  }
			    			  }
			    			   array.push('</tr></table>');
			    		   }
			    		  */
			    		  
			    		   
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
		    		
		    	   $('#div_data').append(array.join(''));
		    	   
		    	   if(msg.rows["circleList"].length==0&&
		    			   msg.rows["activityList"].length==0&&
		    			   msg.rows["topicList"].length==0&&
		    			   msg.rows["proList"].length==0&&
		    			   msg.rows["shopList"].length==0){
			    	    $('#loadMoreText').html('没有更多!');
			    	    pageinfo["more"]=false;
			    	}
		    	   else{
		    		    pageinfo["circlePage"]++;
		    			pageinfo["actPage"]++;
		    			pageinfo["topicPage"]++;
		    			pageinfo["proPage"]++;
		    			pageinfo["restaPage"]++;
		    	   }
			    	array=[];
		    		array=null;
				}
		    	else{
		    		alert(msg.msg);
		    	}
			}
		});
	
}

function gotoDetail(shopId){
	$('#formturn').attr('action',"${ctx}/product!findRestarauntDetail.action");
	$('#companyShopId').val(shopId);
	$('#formturn').submit();
}

</script>

