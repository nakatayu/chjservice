<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
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
.conv1 img{
width:110px;height:110px;cursor:pointer;
}


	#serviceInfo{
		width: 950px;
		color:#999;
		font-size:14px;
		float:left;
		background-color:#FFF;
		border-bottom:#a67c52 solid 2px;
		margin: 10px 0 0 25px
	}
	.title{
		width: 950px;
		padding:22px 0 0 22px;
		float: left;
		color: #000000;
	}
	.display{
		width: 95px;
		padding:10px 0 0 20px;
		float: left;
	}
	.show{
		width: 600px;
		height: 63px;
		float: left;
	}
	.content{
		float: left;
		font-size:14px; line-height:22px; padding:30px 10px 0 20px;
		width:900px;
	}
	.releaseUser{
		height: 42px;
		float: left;
		color:#ffbf00;
		width:835px;
		line-height:35px;
	}
	.releaseTime{
		height: 21px;
		float: left;
	}
	.time{
		float: left;
		width: 333px;;
	}
	.seeCount{
		float: left;
		width: 40px;
	}
	.commentCount{
		float: left;
		width: 76px;
	}
	.show img{
		float: left;
		margin: 0 3px 0 3px;
	}


.tag {
			float: left;
			padding: 5px 5px 5px 5px;
			text-align: center;
			background-color: #09b3a4;
			color: #ffffff;
			line-height: 14px;
			overflow: hidden;
			height: 14px;
			margin: 5px 5px 0 0;
		}
</style>
</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />

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
	    <c:if test="${param.serviceType==1}">
	     <div style="float:left;"><img src="${ctx}/images/menu_29.jpg" onclick="gotoPage('${ctx}/pages/share_index.jsp')" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_16.jpg" style="width:190px;"   onclick="gotoPage('${ctx}/pages/share_service.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_23.jpg" onclick="gotoPage('${ctx}/pages/share_corperate.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_24.jpg" onclick="gotoPage('${ctx}/pages/share_lifetips.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_25.jpg" onclick="gotoPage('${ctx}/pages/share_policy.jsp')"/></div>
		     <div class="menu1"><img src="${ctx}/images/menu_27.jpg" onclick="gotoPage('${ctx}/pages/share_publicgoods.jsp')"/></div>
           <div><img src="${ctx}/images/menu_30.jpg" style="width:285px;height: 100px;" /></div>
	   </c:if>
	   <c:if test="${param.serviceType==2}">
	     <div style="float:left;"><img src="${ctx}/images/menu_29.jpg"
				                              onclick="gotoPage('${ctx}/pages/share_index.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_22.jpg"
				                        onclick="gotoPage('${ctx}/pages/share_service.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_23.jpg"
				                        onclick="gotoPage('${ctx}/pages/share_corperate.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_18.jpg" style="width:190px;"  onclick="gotoPage('${ctx}/pages/share_lifetips.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_25.jpg"
				                        onclick="gotoPage('${ctx}/pages/share_policy.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_27.jpg" onclick="gotoPage('${ctx}/pages/share_publicgoods.jsp')"/></div>
				<div><img src="${ctx}/images/menu_30.jpg"  style="width:285px;height: 100px;"/></div>
			
	   </c:if>
	    <c:if test="${param.serviceType==3}">
	    <div style="float:left;"><img src="${ctx}/images/menu_29.jpg"
				                              onclick="gotoPage('${ctx}/pages/share_index.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_22.jpg"
				                        onclick="gotoPage('${ctx}/pages/share_service.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_23.jpg"
				                        onclick="gotoPage('${ctx}/pages/share_corperate.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_24.jpg"
				                        onclick="gotoPage('${ctx}/pages/share_lifetips.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_19.jpg" style="width:190px;" onclick="gotoPage('${ctx}/pages/share_policy.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_27.jpg" onclick="gotoPage('${ctx}/pages/share_publicgoods.jsp')"/></div>
				<div><img src="${ctx}/images/menu_30.jpg" style="width:285px;height: 100px;"/></div>
	   </c:if>
	    <c:if test="${param.serviceType==4}">
	     <div style="float:left;"><img src="${ctx}/images/menu_29.jpg"
				                              onclick="gotoPage('${ctx}/pages/share_index.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_22.jpg"
				                        onclick="gotoPage('${ctx}/pages/share_service.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_23.jpg"
				                        onclick="gotoPage('${ctx}/pages/share_corperate.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_24.jpg"
				                        onclick="gotoPage('${ctx}/pages/share_lifetips.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_25.jpg"
				                        onclick="gotoPage('${ctx}/pages/share_policy.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_21.jpg"  style="width: 190px;" onclick="gotoPage('${ctx}/pages/share_publicgoods.jsp')"/></div>
				<div><img src="${ctx}/images/menu_30.jpg" style="width:285px;height: 100px;"/></div>
	   </c:if>
	    <c:if test="${param.serviceType==5}">
	     <div style="float:left;"><img src="${ctx}/images/menu_29.jpg" onclick="gotoPage('${ctx}/pages/share_index.jsp')" /></div>
				<div class="menu1"><img src="${ctx}/images/menu_22.jpg" onclick="gotoPage('${ctx}/pages/share_service.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_17.jpg" style="width:190px;" onclick="gotoPage('${ctx}/pages/share_corperate.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_24.jpg" onclick="gotoPage('${ctx}/pages/share_lifetips.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_25.jpg" onclick="gotoPage('${ctx}/pages/share_policy.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_27.jpg" onclick="gotoPage('${ctx}/pages/share_publicgoods.jsp')"/></div>
				<div><img src="${ctx}/images/menu_30.jpg" style="width:285px;height: 100px;" /></div>
	   </c:if>
	    </div>
</div>
  
    
  <div style="position:relative; padding:10px 25px 0 25px;">
   <div>
   <table  width="100%"  border="0" cellspacing="0" cellpadding="0">
   <tr>
   <td style="float:center;padding-left:20px;background-color:#fff;">
   <table  id="table_data"  width="910" border="0" cellspacing="0" cellpadding="0">
    
    </table>
</td>
</tr>
</table>

     
	

</div>
</div>
  
  <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>


 
 
 

</body>
</html>
<script type="text/javascript">
var serviceId=1,page=1,total=0;
$(function () {
	serviceId ="${param.serviceId}";
	page = "${param.page}";
	total = "${param.total}";
		findServiceDetail();
	});
	function findServiceDetail() {
		//todo  get serviceId
		if(serviceId==""){
			serviceId=1;
		}
		$.ajax({
			type: "POST",
			url: '${ctx}/share!findServiceDetailByServiceId.action?serviceType=${param.serviceType}&serviceId=${param.serviceId}&page=${param.page}',
			dataType: 'json',
			success: function (msg, status) {
				if (msg.status == 200) {
					var data=msg.rows;
					var tags =[];
					for (var j = 0; j < data["tagList"].length; j++) {
						tags.push('<a class="tag button-flat-primary" href="#" style="font-size:12px;">'+data["tagList"][j]["tag_name"]+'</a>');
					}
 					var widht=80;
 					if(data["company_id"]>0){
 						widht=100;
 					}
 					else{
 						widht=80;
 					}
					
					var str ='<tr>'+
				      '<td  width="120" rowspan="2" style="padding-top:10px;width:90px;background-color:#fff;height:80px;border-bottom:2px solid #ccc;">'+
				      '<div style="border:0px solid #ccc;height:80px;width:'+widht+'px;float:right;"><img src="${imageStorePath}'+data["head_picture"]+'"  style="width:'+widht+'px;"/></div></td>'+
				      '<td  style="background-color:#fff;padding-top:10px;padding-left:20px;">'+
				      '<table  width="100%" border="0" cellspacing="0" cellpadding="0">'+
				      '<tr>'+
				      '<td>'+data["title"]+'</td>'+
				      '<td width="200" valign="middle"  style="float:right;font-size:12px;color:#9a9a9c;">  <table  width="100%" border="0" cellspacing="0" cellpadding="0">   '+
				         '<tr><td><td>'+data["release_time"]+'</td>'+
				      ' <td width="25"><img src="${ctx}/images/personal_02.png" width="25" height="19"/></td>'+
				      ' <td >'+data["see_count"]+'&nbsp;</td>'+
				     '  <td></td>'+
					 ' <td><img src="${ctx}/images/fenxiang.png" width="19" height="19" style="cursor: pointer;" id="share_img"/></td>'+
				  ' </tr></table></td>'+
				   '   </tr>'+
				      '</table>'+
				     '  </td>'+
				   '  </tr>'+
				    '  <tr>'+
				     '  <td colspan="2" valign="top" style="background-color:#fff;padding-left:20px;border-bottom:2px solid #ccc;">'+
				    '    <table  width="100%" border="0" cellspacing="0" cellpadding="0">'+
				   '   <tr>'+
				     ' <td  style="color:#FF8F59;font-size:12px;">服务提供者:'+data["nick_name"]+'</td>'+
				  '     <td style="text-align1: right;float:right;">'+
				  tags.join('')+
				    '    </td>'+
				     '  </tr>'+
				    '</table> '+
				    '</td>'+
				   '   </tr>'+
				     '  <tr>'+
				     '  <td colspan="2"  style="padding-bottom:20px;padding-top:20px;">'+
				    data["content"]+
				   '    </td>'+
				    '   </tr> '+
				     '   <tr>'+
				     '  <td colspan="2"  style="width:910px;padding-bottom:20px;padding-top:20px;">';
				 	if(page>1){
				 		str +=  '  <div style="padding:0 0 20px 15px;float:left;"><a href="${ctx}/pages/share_serviceinfo.jsp?serviceType=${param.serviceType}&total=${param.total}&page=${param.page-1}" style="color:#999;">上一篇</a></div>';
				 	}
					if(page!=-1 && page!=total){
						str +=  ' <div style="padding:0 15px 20px 0;float:right;"><a href="${ctx}/pages/share_serviceinfo.jsp?serviceType=${param.serviceType}&total=${param.total}&page=${param.page+1}" style="color:#999;">下一篇</a></div>';
					}
				    
					str += '  </td></tr>';
				       
					$('#table_data').html(str);
					$('#share_img').mousemove(function(e){
						$('.shareweb').show();
						$('.shareweb').css({"left":(e.pageX-200)+"px","top":(e.pageY-104)+"px"});
					});
					
				} else {
					alert(msg.msg);
				}
			}

		});
	}

	function request(paras) {
		var url = location.href;
		var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
		var paraObj = {};
		for (i = 0; j = paraString[i]; i++) {
			paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=") + 1, j.length);
		}
		var returnValue = paraObj[paras.toLowerCase()];
		if (typeof (returnValue) == "undefined") {
			return "";
		} else {
			return returnValue;
		}
	}


	function user_collection(){

		if('${user.userId}'.length==0){
			alert('请登录');
			return;
		}
		$.ajax({
			type: "POST",
			url : context+'/user!collectionUserRestarant.action',
			dataType:'json',
			data:{objectId:serviceId,type:6,doType:1},
			success: function(msg,status){
				if(msg.status == 200){
					alert(msg["msg"]);
				}
				else
					alert(msg["msg"]);
			}
		});
	}


	var shareTimer;
	function mouseOutEvent() {
//Hide share after 1 second when the mouse move out of the share zone
		shareTimer = setTimeout(hideFlyout, 500);
	}
	function mouseOverEvent() {
//Clear the timer when the mouse move over the share
		clearTimeout(shareTimer);
	}
	function hideFlyout() {
		document.getElementById("share").style.display = "none";
	}
	function showFlyout() {
		document.getElementById("share").style.display = "block";
		mouseOutEvent();
	}

</script>

