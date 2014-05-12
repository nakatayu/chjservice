<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>漕河泾e服务</title>

<style type="text/css">
.test a {
	border: 0px solid #000;font-family:微软雅黑;
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

.personal_fr1 {
	float: left;
	margin-left: 10px;
}

.btntop{
border: 0px;background-color: #dcdcdc;font-family:微软雅黑;
margin-left:2px;color: #fff;font-size: 14px;padding: 0px;
}
.spancomm{
 background-image:url(${ctx}/images/button12.png);
 background-color: #FFF;background-repeat: repeat;text-align:center;
 /* margin-top: 5px;
 */ color:#fff;font-family:微软雅黑;
}
.divImag{
width: 114px; float: left;  margin-bottom: 5px; 
margin-left: 4px;background-color: #89ccd5;font-family:微软雅黑;
}
.divDivTil{
 width:330px;border-bottom:#ffc61a 2px solid;padding: 2px 10px 0px 10px;
cursor: pointer;background:#fff;margin-bottom:4px;font-family:微软雅黑;
}

.pTopic{
 font-size: 12px;height: 16px;padding-top: 5px;font-family:微软雅黑;
}
.divNum{
 float: left;height:34px;text-align: center;width: 40px;
/*  padding-top:6px; */
 color:#fff;
 background: url(${ctx}/images/button12.png)  0 2px no-repeat;
}
.ul-create-activity li{cursor:pointer;float:left;font-size:18px;
color:#fff;list-style: none;height:50px;line-height:50px;text-align: center;}
/* 新版列表样式 */
.com_list_u { list-style-type: none;}
.com_list_u  li{
margin: 0; padding: 0;
display:block;
height:90px;
width:590px;

border-bottom: #ffc61a 2px solid;
}
.itemcom{
background-color:#FFFFFF;
height:30px;line-height:30px;text-align: left;
}
.itemcom div{
width:120px;float:left;
}
/* 新版列表样式 结束 */
</style>
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />
</head>

<body onscroll="b()">

	<jsp:include page="/common/header.jsp" />


	<div class="main">
		<div id="main_content" class="main_content">



			<div
				style="position: relative; height: 100px; padding: 10px 25px 0 25px;">
				<div>
					<div style="float: left;">
						<img src="${ctx}/images/menu_68.jpg"
							onclick="gotoPage('${ctx}/community!communityHome.action')" />
					</div>
					<div class="menu1">
						<img src="${ctx}/images/menu_69.jpg" onclick="gotoPage('${ctx}/pages/community_topiclist.jsp')" style="width: 190px;" />
					</div>
					<div class="menu1">
						<img src="${ctx}/images/menu_65.jpg"
							onclick="gotoPage('${ctx}/pages/community_activitylist.jsp')" />
					</div>
					<div class="menu1">
						<img src="${ctx}/images/menu_63.jpg"
							onclick="gotoPage('${ctx}/community!findLableListCircle.action')" />
					</div>
					<div>
						<img src="${ctx}/images/menu_66.png" style="width: 473px;height: 100px;" />
					</div>
				</div>

			</div>


			<div style="position: relative; padding: 10px 25px 0 25px;font-family:微软雅黑;">
				<div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td valign="top">

								<div style="float: left; width: 590px;" id="com_top_list">
									<table id="table_topic" width="100%" border="0" cellspacing="0"
										cellpadding="0">
									 </table>
									
								</div>
								<div style="float:left;width:590px; height:40px;background:#fff;margin-top:10px;" >

								<div id="pager" style="float:right;" ></div>

								</div>
							</td>
							


							<td valign="top" style="width: 350px;">

  <div style="margin-left: 10px;width:350px;float:right;cursor: pointer;">
   <ul class="ul-create-activity">
   	<li style="width:350px;cursor:pointer;background:url(${ctx}/images/cjht_1.png)" onclick="window.location.href='${ctx}/community!createTopic.action?type=0'"></li>
   </ul>
 </div>


								<div class="personal_fr1" id="jdtop6" style="width: 350px; background-color: #ffffff;padding-bottom: 5px;">
 								
 								
 															
								</div>

								<div style="float: right; margin-left: 10px;">

									<img src="${ctx}/images/topic_title_2.jpg" width="350" height="45" />
									
									<!-- <div style="width: 350px;height: 45px;background-color:#F2A000;">菁典</div>
									 -->
									 
									 <div id="compTopicList" style="color:#9a9a9c;">
									
									
									
									
									</div>
									
									
								</div>

								<div style="float: right; margin:10px 0 0 10px;" id="advatrit">
								 </div>
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
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$.ajax({
	     type: "POST",
	     url : '${ctx}/common!findAds.action',
	     dataType:'json',
	     data:{type:10},
	     success: function(msg,status){
	    	 $('#advatrit').html('<a href="'+msg[0]["linkAddress"]+
	    			 '" target="-_blank" style="cursor: pointer;"><img src="${imageStorePath}'+
	    			 msg[0]["path"]+'" width="350" height="230"/></a>');
	     }
	});

	findPeopleTopicList(1);
	findCompanyTopicList(1);
}) ;

PageClick = function(pageclickednumber) {
    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
	findPeopleTopicList(pageclickednumber);
};

var pageinfoCom={page:1,size:15,tp:0,total:0};
function findCompanyTopicList(pagnum){
	pageinfoCom["page"] = pagnum;
	pageinfoCom["size"]=15;
	pageinfoCom["classics"]=0;
	
	$.ajax({
		type : "POST",
		url : context + '/community!findClassicTopicList.action',
		dataType : 'json',
		data : pageinfoCom,
		success : function(msg, status) {
			var str='';			
			if (msg.status == 200) {
				
				for(var i=0;i<msg.rows.classicTopic.length;i++){
					var data=msg.rows.classicTopic[i];
					var name=data["topicName"];
					if(name.length>13){
						name=name.substring(0,13)+'...';
					}
					
					var summary=data["summary"];
					if(summary.length>20){
						summary=summary.substring(0,20)+'...';
					}
					
					str+='<div class="divDivTil">';
					str+='<div style="color: #000;font-family:微软雅黑;cursor: pointer;" onclick="circleTopicDetail(\''+"${user.userId}"+'\','+data["topicId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')">'+name+'</div>';
					str+='<div class="pTopic">'+summary+'</div>';
					str+='<div  style="font-size: 12px;line-height: 34px;  height: 34px;margin-bottom: 0px;"><div style="width: 155px;float: left;">'+data["createTime"]+' </div>';
					str+='<div style="float: right;width: 80px;padding-left: 10px;">';
					str+='<a style="color: #9a9a9c;float: left;margin-right: 5px;">评论</a>';
					str+='<div class="divNum">'+data["commentCount"]+'</div> </div> </div> </div>';
							
				}
				
				$('#compTopicList').html(str);
				
				var imgStr='';
				for(var i=0; i<msg.rows.topTopic.length;i++){
					var data=msg.rows.topTopic[i];
					var name=data["topicName"];
					if(name.length>13){
						name=name.substring(0,13)+'...';
					}
					
					var summary=data["summary"];
					if(summary.length>20){
						summary=summary.substring(0,20)+'...';
					}
					if(i<6){
						if(i%3==0){
							imgStr+='<div class="divImag" style="margin-left: 0px;">';
						}else{
							imgStr+='<div class="divImag">';
						}						
						imgStr+='<img src="${imageStorePath}'+data["topicImage"]+'" style="cursor:pointer;width: 114px;height: 100px;" onclick="circleTopicDetail(\''+"${user.userId}"+'\','+data["topicId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')"/>';
						imgStr+='<div style="height: 25px;line-height:25px;color:#fff;font-size:15px;padding-left:5px;text-align: center;">'+(name.length>6?(name.substring(0,5)+'...'):name)+'</div></div>';
					}			
				}
				$('#jdtop6').html(imgStr);
				
			}else{
				alert(msg.msg);
			}			
		}	
	});	
}
function searchByTagImpl(tag,time){
	pageinfo["tagList"]=tag;
	pageinfo["timeSpace"]=time;
	$('#table_topic').html('');
	findPeopleTopicList(1);
}
function findPeopleTopicList(pagnum){
	pageinfo["page"] = pagnum;
	pageinfo["size"]=20;
	pageinfo["coumfiled"]='user_id';

	$.ajax({
		type : "POST",
		url : context + '/community!findTopicList.action',
		dataType : 'json',
		data : pageinfo,
		success : function(msg, status) {
			if (msg.status == 200) {
				
			
				if (msg.total % pageinfo["size"] == 0)
					pageinfo["tp"] = msg.total / pageinfo["size"];
				else
					pageinfo["tp"] = Math.ceil(msg.total/ pageinfo["size"]);
				$("#pager").pager({ pagenumber: pageinfo["page"], pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
	    		
				
				
				//var str='';
				var str='<ul class="com_list_u">';
				for(var i=0;i<msg.rows.length;i++){
					var data=msg.rows[i];
					var summary=data["summary"];
					if(summary.length>31){
						summary=summary.substring(0,31)+'...';
					}
					var name=data["topicName"];
					if(name.length>24){
						name=name.substring(0,24)+'...';
					}
					var top=0;
					if(i>0){
						top=4;
					}
					str+='<li style="padding-top:'+top+'px;">';
					str+='<div>';
					str+='<div style="float:left;width:90px;height:90px;line-height:90px;background-color:#FFFFFF;">';
					str+='<img src="${imageStorePath}'+data["userNamePict"]["headPicture"]+'" style="margin-top:15px;margin-left:15px;" width="60px" height="60px" onclick=""/>';
					 str+='</div>';
						str+='<div style="float:left;">';
						 str+=' <div class="itemcom" style="width:500px;cursor: pointer;"  onclick="circleTopicDetail(\''+"${user.userId}"+'\','+data["topicId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')">'+name;
						 
					
							if(data["listTop"]==1){
								str+='<a style="margin-left: 10px;font-family:微软雅黑;color: #FC0;">置顶</a>';
							}	
						 str+='</div>'; 
						 str+=' <div class="itemcom" style="width:500px;font-size: 14px;font-family:微软雅黑;color:#676767">'+summary+'</div>'; 
						 str+=' <div class="itemcom" style="width:500px;font-size: 12px;color:#D5D6D8;">';
						 if(data["userNamePict"]["nickName"].length>8){
								data["userNamePict"]["nickName"]=data["userNamePict"]["nickName"].substr(0,8)+'...';
							}
						 str+='<div >发起人:'+data["userNamePict"]["nickName"]+'</div>'; 
						 str+='<div style="font-size:10px;width:120px;margin-left:10px;">'+data["createTime"]+'</div>'; 
						 str+='<div  style="width:30px;margin-left:20px;">评论:</div>';
						 str+='<div  class="spancomm" style="width:36px;margin-bottom:5px;">'+data["commentCount"]+'</div>';
						 str+='<div style="line-height:20px;height:20px;margin-left:10px;margin-top:5px;" >';
							for(var j=0;j<data["tagList"].length;j++){
								if(j<2){
									if(data["tagList"][j]["tagName"].length>3)
										data["tagList"][j]["tagName"]=data["tagList"][j]["tagName"].substr(0,3);
									str+='<button class="btntop" style="height:20px;">'+data["tagList"][j]["tagName"]+'</button>';
								}
							}
						 
						 
						 str+='</div>'; 
						 str+='</div>'; 
						 str+='</div>'; 
					 str+='</div>'; 
					str+="</li>";
					
				}
				str+="</ul>";
				
				$('#table_topic').html('<tr><td>'+str+'</tr></td>');
			
				if(msg.rows.length==0 && pageinfo["page"]==1){
					window.alert(pageinfo["emtMsg"]);
					$('#table_topic').html('<tr><td height="50" align="center" style="background:#fff;">'+pageinfo["emtMsg"]+'</td></tr>');
				}				
			}else{
				alert(msg.msg);
			}			
		}	
	});
}

	 
</script>

