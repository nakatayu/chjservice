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
ul.ul-tag-circle li{
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
ul.ul-tag-activity li{
padding:4px;
padding-top:8px;
padding-bottom:8px;
float:left;
color:#fff;
background:#fb0;
margin-left:4px;
margin-top:2px;
text-align:center;
list-style: none;
max-width: 200px;/*具体数值自行修改，下一行相同*/
word-break:keep-all;
}
ul.ul-tag-shop{margin-right:10px;}
ul.ul-tag-shop li{
padding:2px;
background:#999;
color:#fff;
font-size:16px;
margin-left:4px;
margin-top:2px;
text-align:center;
list-style: none;
max-width: 90px;/*具体数值自行修改，下一行相同*/
word-break:keep-all;
height:18px;
overflow: hidden;
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
           <div class="menu1"><img src="${ctx}/images/menu_43.jpg" onclick="gotoPage('${ctx}/pages/personal_friend.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_49.jpg" onclick="gotoPage('${ctx}/pages/personal_topic.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_44.jpg" onclick="gotoPage('${ctx}/pages/personal_circle.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_45.jpg" onclick="gotoPage('${ctx}/pages/personal_activity.jsp')"/></div>
           <div class="menu1"><img src="/chjservice/images/menu_33.jpg" style="width:190px;"/></div>
           <div class="menu1"><img src="/chjservice/images/menu_47.jpg" onclick="gotoPage('/chjservice/pages/personal_collection.jsp')"/></div>
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
	pageinfo["dotype"]=2;
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
		    			 var tag={tagId:"",tagName:"暂无",tagId1:"",tagName1:"暂无"};
		    			 if(data["tagList"].length>0){
		    				 tag["tagId"]=data["tagList"][0]["tagId"];
		    				 tag["tagName"]=data["tagList"][0]["tagName"];
		    			 }
		    			 if(data["tagList"].length>1){
		    				 tag["tagId1"]=data["tagList"][1]["tagId1"];
		    				 tag["tagName1"]=data["tagList"][1]["tagName1"];
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
			    	         ' <td width="67%" height="178" align="center"><img src="${ctx}'+data["logo"]+'" width="162" height="162" /></td>'+
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
		    			 var tag={tagId:"",tagName:""};
		    			 if(data["tagList"].length>0){
		    				 tag=data["tagList"][0];
		    			 }
		    			  var price='',companyShopProductSkuId='';
			    		   if(data["sku"]!=null){
			    			   price =data["sku"]["price"];
			    			   companyShopProductSkuId=data["sku"]["companyShopProductSkuId"];
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
			    	         ' <td width="67%" height="178" align="center"><img src="${ctx}'+data["image"]+'" width="162" height="162" /></td>'+
			    	          '<td width="33%" valign="top"><table width="100%" height="185" border="0" cellpadding="0" cellspacing="0">'+
			    	          '  <tr>'+
			    	           '   <td height="39" colspan="2">￥'+price+'</td>'+
			    	           ' </tr>'+
			    	           ' <tr>'+
			    	           '   <td height="33" colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
			    	            '    <tr>'+
			    	             '     <td width="69%" height="25" align="center" background="${ctx}/images/personal_bg.jpg" style="color:#FFF">'+tag["tagName"]+'</td>'+
			    	              '    <td width="31%">&nbsp;</td>'+
			    	               ' </tr>'+
			    	              '</table></td>'+
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
			    	             ' <td height="66" colspan="2" style="cursor:pointer;" onclick="productDetail(3,'+data["productId"]+','+data["companyShopProductId"]+','+data["companyShopId"]+','+companyShopProductSkuId+')">进入详情</td>'+
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
		    			var tagArray=[];
		    			for(var k=0;k<data["tagList"].length;k++){
		    				tagArray.push('<li>'+data["tagList"][k]["tagName"]+'</li>');
		    			}
		    			var img ='${ctx}/images/tupian2.png';
		    			if(data["activityImage"]!=null && data["activityImage"].lenght>0){
		    				img ='${ctx}'+data["activityImage"];
		    			}
		    			var title=data["title"];
		    			if(title.length>30){
		    				title = title.substr(0,30);
		    			}
		    			var summary = data["title"];
		    			if(summary.length>100){
		    				summary = summary.substr(0,100);
		    			}
		    			var addActivity='<img style="cursor:pointer;" onclick="addActivityUser('+data["activityId"]+',\''+data["isCheck"]+'\')" src="${ctx}/images/button1.jpg" width="150" height="49" />';
		    			if(data["hasAdd"]>0){
		    				addActivity='';
		    			}
		    			var getTicket='<img style="cursor:pointer;" onclick="generActivityQrcode('+data["activityId"]+')" src="${ctx}/images/activity_3.jpg" width="150" height="49" />';
		    			if(data["isQrcode"]=='F' || data["hasQrcode"]>0){
		    				getTicket='';
		    			}
		    			var str='<div style="clear:both;position:relative;height:230px; padding:10px 25px 0 15px;">'+
		    				   '<div>'+
		    			   '<table width="590" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" class="comm2">'+
		    		  '<tr>'+
		    		   ' <td width="230" height="230"><img src="'+img+'" style="cursor:pointer;" onclick="activity_detail('+data["activityId"]+')" width="230px" height="230px" /></td>'+
		    		    '<td width="360" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		     ' <tr>'+
		    		      '  <td height="52"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		       '   <tr>'+
		    		        '    <td width="88%" class="comm_ys" style="cursor:pointer;" onclick="activity_detail('+data["activityId"]+')">'+title+'</td>'+
		    		         '   <td width="12%"><img src="${ctx}/images/button8.png" width="33" height="33" /></td>'+
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
		    		         '   <td width="47" align="center">标签</td>'+
		    		          '  <td width="180"><div style="width:180px;height:40px;overflow:hidden;">'+
		    		         '<ul class="ul-tag-activity">'+
		    		         tagArray.join('')+
		    		         '   </td>'+
		    		          '  <td width="38">评论</td>'+
		    		         '   <td width="66" align="center" background="${ctx}/images/button9.png" class="comm_pinglun" style="width:54px; height:50px;">'+data["commentCount"]+'</td>'+
		    		         '   <td width="30">&nbsp;</td>'+
		    		         ' </tr>'+
		    		        '</table></td>'+
		    		     ' </tr>'+
		    		    '</table></td>'+
		    		  '</tr>'+
		    		  '     </table>'+
		    		' <div style="float:right;  width:350px; height:230px;">'+
		    		'   <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f9f9f7">'+
		    		 '    <tr>'+
		    		  '     <td><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		  '       <tr>'+
		    		   '        <td width="32%" align="center" background="${ctx}/images/map9.png" style="height:70px"><p>可参与人数</p><p><strong>'+(data["userMax"]-data["userCount"])+'人</strong></p></td>'+
		    		   '        <td width="1" align="center"></td>'+
		    		   '        <td width="32%" align="center" background="${ctx}/images/map9.png" style="height:70px"><p>已参加人数</p><p><strong>'+data["userCount"]+'人</strong></p></td>'+
		    		   '        <td width="1" align="center"></td>'+
		    		   '        <td width="34%" align="center" background="${ctx}/images/map9.png" style="height:70px"><p>人数限制</p><p><strong>'+data["userMax"]+'人</strong></p></td>'+
		    		   '      </tr>'+
		    		   '    </table></td>'+
		    		   '  </tr>'+
		    		   '  <tr>'+
		    		    '   <td height="72" align="center"><p>活动时间:</p><p><strong>'+data["chinaBeginTime"]+'</strong></p></td>'+
		    		   '  </tr>'+
		    		   '  <tr>'+
		    		   '    <td height="88" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		    '     <tr>'+
		    		    '       <td align="center">'+addActivity+'</td>'+
		    		    '       <td align="center">'+getTicket+'</td>'+
		    		    '     </tr>'+
		    		   '    </table></td>'+
		    		   '  </tr>'+
		    		  ' </table>'+
		    		' </div>'+
		    		'</div>'+
		    		' </div>';
		    		array.push(str);
		    		}
		    		for(var i=0; i<msg.rows["topicList"].length; i++){
			    		  var data = msg.rows["topicList"][i]["topicPart"];
			    		  var str ='<table style="margin-left:25px;margin-top:10px;background:#fff;" width="950"height="150" border="0" cellspacing="0" cellpadding="0" style="padding-top:15px;" >'+
			    		     '   <tr>'+
			    		     '     <td width="17%" style="border-bottom:2px solid #57ae97;"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
			    		      '      <tr>'+
			    		     '         <td height="106" align="center"><img src="${ctx}" width="105" height="100" /></td>'+
			    		     '       </tr>'+
			    		      '      <tr>'+
			    		      '        <td align="center" style="font-size:16px; color:#57ae97;">'+data["userInfo"]["nickName"]+'</td>'+
			    		      '      </tr>'+
			    		      '      </table></td>'+
			    		      '    <td width="83%" valign="top" style="border-bottom:2px solid #57ae97;"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
			    		       '     <tr>'+
			    		        '      <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
			    		         '      <tr>'+
			    		           '       <td width="59%" style="font-size:16px; color:#57ae97; font-weight:bold;cursor:pointer;" onclick="circleTopicDetail('+data["topicId"]+')">'+data["topicName"]+'</td>'+
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
			    		   if(i%3==0){
			    			   array.push('<table style="margin-top:10px;margin-left:25px;" width="950" border="0" cellspacing="0" cellpadding="0"><tr>');
			    			   array.push('<td  style="width:310px; height:240px;background:url(${ctx}/images/personal_sharebg.png) repeat-x;">');
			    		   }
			    		   else{
			    			   array.push('<td  class="personal_fr1" style="width:310px; height:240px;background-image:url(${ctx}/images/personal_sharebg.png);">');
			    		   }	
			    		  
			    		  array.push('<table width="310" border="0" cellspacing="0" cellpadding="0"><tr><td><img  onclick="circle_detail('+data["circleId"]+')" style="cursor:pointer;" src="${ctx}'+data["circleImage"]+'" /></td></tr>');
			    		  array.push('<tr><td height="22" style="font-size:14px; color:#57ae97; font-weight:bold; padding-left:10px;"><div onclick="circle_detail('+data["circleId"]+')" style="cursor:pointer;width:290px;height:20px;overflow:hidden;">圈子标题：'+data["name"]+'</div></td></tr>');
			    		  array.push('<tr><td><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td width="37%" height="20" style="font-size:14px; padding-left:10px;"><div style="width:120px;height:20px;overflow:hidden;">圈主：'+data["nickName"]+'</div></td>');
			    		  array.push('<td width="26%" height="20" align="right"><img src="${ctx}/images/personal_02.png" width="25" height="19" /></td><td width="14%" height="20"><span style="font-size:12px;">'+data["circleViews"]+'次</span></td>');
			    		  array.push('<td width="8%" height="20"><img src="${ctx}/images/personal_03.png" width="25" height="19" /></td><td width="15%" height="20"><span style="font-size:12px;">'+data["topicCount"]+'次</span></td></tr></table></td></tr>');
			    		  array.push('<tr>');
			    		  
			    		  array.push('<td  width="100%" height="30" align="left" style="color:#000"><div style="width:310px;height:30px;overflow:hidden;"><ul class="ul-tag-circle">');
			    		  var list = data["tagList"];
			    		  for ( var j = 0; j < list.length; j++) {
			    			  array.push('<li><div>'
			    					  +list[j]["tagName"]+'</div></li>');
			    			 
						   }
			    		  array.push('</ul></div></td></tr></table></td>');
			    		 
			    		  if(i%3==2 || i==msg.rows["circleList"].length-1){
			    			  if(i==msg.rows["circleList"].length-1){
			    				  if(msg.rows["circleList"].length==1){
				    				  array.push('<td  class="personal_fr1" style="width:310px; height:240px;background-image:url(${ctx}/images/personal_sharebg.png);">暂无</td>');
				    				  array.push('<td  class="personal_fr1" style="width:310px; height:240px;background-image:url(${ctx}/images/personal_sharebg.png);">暂无</td>');
				    			  }
				    			  else if(msg.rows["circleList"].length==2){
				    				  array.push('<td  class="personal_fr1" style="width:310px; height:240px;background-image:url(${ctx}/images/personal_sharebg.png);">暂无</td>');
				    			  }
			    			  }
			    			   array.push('</tr></table>');
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


function addActivityUser(id,isCheck){
	$.ajax({
	    type: "POST",
	    url : '${ctx}/community!addActivityUser.action',
	    dataType:'json',
	    data:{activityId:id,isCheck:isCheck},
	    success: function(msg,status){
	    	if(msg.status==200){
	    		if(isCheck=='T')
	    		 alert('加入成功,请耐心等待审核!');	
	    		else
	    		 alert('恭喜您!该活动成员!');
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
	    		alert(msg.msg);
	    	}
	    }
	});
}
function activity_detail(id){
	$('#formturn').attr('action',"${ctx}/community!findActivityDetail.action");
	$('#activityIdHidden').val(id);
	$('#formturn').submit();
}
function circle_detail(id){
	$('#formturn').attr('action',"${ctx}/community!findCircleDetail.action");
	$('#circleIdHidden').val(id);
	$('#formturn').submit();
}
function gotoDetail(shopId){
	$('#formturn').attr('action',"${ctx}/product!findRestarauntDetail.action");
	$('#companyShopId').val(shopId);
	$('#formturn').submit();
}
function circleTopicDetail(id){
	$('#formturn').attr('action',"${ctx}/community!circleTopicDetail.action");
	$('#topicIdHidden').val(id);
	$('#formturn').submit();
}

</script>

