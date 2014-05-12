<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />
<title>漕河泾e服务</title>

<style type="text/css">
.test a {
	border: 0px solid #000;font-family:微软雅黑;
}

.conv1 {
	float: left;
	margin-left: 10px;font-family:微软雅黑;
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
border: 0px;background-color: #CCC;font-family:微软雅黑;
margin: 0 3px;color: #9a9a9c;font-size: 10px;padding: 0px;
}
.spancomm{
 background-image:url(${ctx}/images/button12.png);
 background-color: #FFF;background-repeat: repeat;text-align:center;
 margin-top: 5px;
}
.divImag{
width: 114px; float: left; height: 135px; margin-bottom: 5px; 
margin-left: 4px;background-color: #F2A000;font-family:微软雅黑;
}
.divDivTil{
 width:330px;border-bottom:#ffc61a 3px solid;padding: 5px 10px 5px 10px;font-family:微软雅黑;
}

.pTopic{
 font-size: 12px;height: 40px;padding: 10px 0 0 5px;font-family:微软雅黑;
}
.divNum{
 float: left;margin: -23px 0 0 30px;text-align: center;width: 40px;font-family:微软雅黑;
}
</style>

</head>

<body onscroll="b()">

	<jsp:include page="/common/header.jsp" />


	<div class="main">
		<div id="main_content" class="main_content">



			<div
				style="position: relative; height: 100px;font-family:微软雅黑; padding: 10px 25px 0 25px;">
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

								<div style="float: left; width: 590px;">
									<table id="table_topic" width="100%" border="0" cellspacing="0"
										cellpadding="0">
										
										<tr>
										<td  style="border-bottom: 6px;color:#9a9a9c;" valign="top">
										
										<table style="border-bottom:#ffc61a 3px solid;background-color: #FFF;">
										<tr><td rowspan="3" width="70px" align="left" valign="top" style="padding: 8px 0 0 5px;">
										<img src="" width="60px" height="60px"/>
										</td>
										<td colspan="6" valign="middle" height="30px" style="color: #000;">电影史上有哪些令人印象深刻的反角？
										<a style="margin-left: 10px;font-family:微软雅黑;color: #FC0;">置顶</a> </td></tr>
										<tr><td colspan="6" style="font-size: 14px;font-family:微软雅黑;padding:0 5px;height: 40px;">上有哪些 刻的上有的上有些令人印象 </td></tr>
										<tr style="font-size: 12px;font-family:微软雅黑;">
										<td width="50px" height="30px">发起人：</td>
										<td width="80px">大商股份店</td>
										<td width="130px">2013-12-12 08:12:23</td>
										<td width="30px">评论</td>
										<td width="40px" class="spancomm">23</td>
										<td width="190px"><button class="btntop">获取</button><button class="btntop">获爱的取</button></td></tr>
										</table>
										
										</td>
										</tr>
										
										
										
										
									</table>
									
									<div id="pager" style="float: right;"></div>
								</div>
							</td>
							
<!-- aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa -->

							<td valign="top" style="width: 350px;">


								<div class="personal_fr1" id="jdtop6" style="width: 350px; background-color: #ffffff;padding-bottom: 5px;">
 								
 								
 								<div class="divImag" style="margin-left: 0px;">
 								<img src="" style="width: 114px;height: 100px;"/>
 								<div style="height: 30px;font-family:微软雅黑;">多个地方的方法</div>
 								</div>	
 									
 								<div class="divImag" >
 								<img src="" style="width: 114px;height: 100px;"/>
 								</div>
 								
 								<div class="divImag">
 								<img src="" style="width: 114px;height: 100px;"/>
 								</div>
 								
 								<div class="divImag" style="margin-left: 0px;">
 								<img src="" style="width: 114px;height: 100px;"/>
 								</div>
 								<div class="divImag">
 								<img src="" style="width: 114px;height: 100px;"/>
 								</div>
 								<div class="divImag">
 								<img src="" style="width: 114px;height: 100px;"/>
 								</div>									
								</div>

								<div style="float: right; margin-left: 10px;">

									<img src="${ctx}/images/topic_title_2.jpg" width="350" height="45" />
									
									<%-- 
									<div style="width: 350px;margin-bottom: 5px;background-color: #FFF;height: 100px;color:#9a9a9c;">
									<img src="${ctx}/images/topic_title_2.jpg" style="float: left;width: 100px;height: 100px;"/>
									<div style="float: right;width: 245px;height: 100px;position: relative;">
									<p>电影史上有哪些令人印象深刻角？</p>
									<p style="font-size: 12px;">电影史上有哪些令人印象深刻的反角？电影史上有哪些令人印象深刻的反角？</p>
									<p><button class="btntop">获取</button><button class="btntop">获爱的取</button></p>
									<div style="font-size: 12px;height: 30px;">
									<table>
									<tr><td height="20px" width="30px">平衡</td>
									<td width="30px" align="center" height="20px">
									
									
									 </td>
									 
									 
									<td width="40px" align="center">评分：</td><td>9.4</td></tr>
									</table> 
									</div>
									</div>
									</div> --%>
									 
									 <div id="compTopicList" style="background-color: #FFF; color:#9a9a9c;">
									
									<div style="width:330px;border-bottom:#ffc61a 3px solid;padding: 5px 10px 5px 10px;">
									<p style="color: #000;font-family:微软雅黑;">电影史上有哪些令人印象深刻角？</p>
									<p style="font-size: 12px;height: 40px;font-family:微软雅黑;padding: 10px 0 0 5px;">电影史上有哪些令人印象深刻的反角？电影史上有哪些令人印象深刻的反角？</p>
									
									<div  style="font-size: 12px;">
									<div style="width: 155px;float: left;font-family:微软雅黑;">2012/12/12 12:00:00 </div>
									<div style="float: right;width: 80px;padding-left: 10px;">
									<a style="color: #9a9a9c;float: left;margin-right: 5px;">评论</a>
									<img src="${ctx}/images/button12.png" width="40px" height="25px" style="float: left;"/>
									 <div style="float: left;margin: -23px 0 0 30px;text-align: center;width: 40px;">34</div>
									 </div>
									</div>
									</div>
								 
									
									
									
									</div>
									
									
								</div>

								<div style="float: right; margin:10px 0 0 10px;">
								 <img src="${ctx}/images/tupian16.png" width="350" height="230" />
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

	$("#pager").pager({
		pagenumber : pageinfo["page"],
		pagecount : pageinfo["tp"],
		buttonClickCallback : PageClick
	});
	findPeopleTopicList(1);
	findCompanyTopicList(1);
}) ;

PageClick = function(pageclickednumber) {
	$("#pager").pager({
		pagenumber : pageclickednumber,
		pagecount : pageinfo["tp"],
		buttonClickCallback : PageClick
	});
	findPeopleTopicList(pageclickednumber);
};
	
function findCompanyTopicList(pagnum){
	pageinfo["page"] = pagnum;
	pageinfo["size"]=15;
	pageinfo["coumfiled"]='company_id';
	pageinfo["classics"]=0;
	$.ajax({
		type : "POST",
		url : context + '/community!findTopicList.action',
		dataType : 'json',
		data : pageinfo,
		success : function(msg, status) {
			var str='';
			var imgStr='';
			if (msg.status == 200) {
				
				for(var i=0;i<msg.rows.length;i++){
					var data=msg.rows[i];
					var summary=data["summary"];
					if(summary.length>50){
						summary=summary.substring(0,50)+'...';
					}
					str+='<div class="divDivTil"><p style="color: #000;">'+data["topicName"]+'</p>';
					str+='<p class="pTopic">'+summary+'</p>';
					str+='<div  style="font-size: 12px;"><div style="width: 155px;font-family:微软雅黑;float: left;">'+data["createTime"]+' </div>';
					str+='<div style="float: right;width: 80px;padding-left: 10px;">';
					str+='<a style="color: #9a9a9c;float: left;margin-right: 5px;font-family:微软雅黑;">评论</a>';
					str+='<img src="${ctx}/images/button12.png" width="40px" height="25px" style="float: left;"/>';
					str+='<div class="divNum">'+data["commentCount"]+'</div> </div> </div> </div>';
					if(i<6){
						if(i%3==0){
							imgStr+='<div class="divImag" style="margin-left: 0px;">';
						}else{
							imgStr+='<div class="divImag">';
						}						
						imgStr+='<img src="${ctx}'+data["topicImage"]+'" style="width: 114px;height: 100px;"/>';
						imgStr+='<div style="height: 30px;">'+data["topicName"]+'</div></div>';
					}					
				}
				$('#jdtop6').html(imgStr);
				$('#compTopicList').html(str);
				
			}else{
				alert(msg.msg);
			}			
		}	
	});	
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
				
				if(msg.total>pageinfo["size"]){
				if (msg.total % pageinfo["size"] == 0)
					pageinfo["tp"] = msg.total / pageinfo["size"];
				else
					pageinfo["tp"] = Math.ceil(msg.total/ pageinfo["size"]);
				$("#pager").pager({
					pagenumber : pageinfo["page"],
					pagecount : pageinfo["tp"],
					buttonClickCallback : PageClick
				});
				}else{
					$("#pager").hide();
				}
				
				var str='';
				for(var i=0;i<msg.rows.length;i++){
					var data=msg.rows[i];
					var summary=data["summary"];
					if(summary.length>65){
						summary=summary.substring(0,65)+'...';
					}
					
					str+='<tr><td valign="top" style="border-bottom: 6px;color:#9a9a9c;">';		
					str+='<table style="border-bottom:#ffc61a 3px solid;background-color: #FFF;">';
					str+='<tr><td rowspan="3" width="70px" align="left" valign="top" style="padding: 8px 0 0 5px;">';
					str+='<img src="${ctx}'+data["userNamePict"]["headPicture"]+'" width="60px" height="60px"/></td>';
					str+='<td colspan="6" height="20px" style="color: #000;padding-top:5px;">'+data["topicName"];
					if(data["listTop"]==1){
						str+='<a style="margin-left: 10px;color: #FC0;font-family:微软雅黑;">置顶</a>';
					}					
					str+='</td></tr>';
					
					str+='<tr><td colspan="6" style="font-size: 14px;font-family:微软雅黑;padding:0 15px 0 5px;height: 40px;">'+summary+' </td></tr>';
					str+='<tr style="font-size: 12px;font-family:微软雅黑;"><td width="50px" height="30px">发起人：</td>';
					str+='<td width="80px">'+data["userNamePict"]["nickName"]+'</td><td width="130px">2013-12-12 08:12:23</td>';
					str+='<td width="30px">评论</td><td width="40px" class="spancomm">'+data["commentCount"]+'</td>';
					str+='<td width="190px">';
					for(var j=0;j<data["tagList"].length;j++){
						str+='<button class="btntop">'+data["tagList"][j]["tagName"]+'</button>';
					}
					str+='</td></tr></table></td></tr>';
				}
				$('#table_topic').html(str);
				
			}else{
				aler(msg.msg);
			}			
		}	
	});
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	function circleTopicDetail(id) {
		$('#formturn').attr('action',
				"${ctx}/community!circleTopicDetail.action");
		$('#topicIdHidden').val(id);
		$('#formturn').submit();
	}
	
	 
</script>

