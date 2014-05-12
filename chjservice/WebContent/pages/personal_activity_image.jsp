<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/css.css" />
<title>漕河泾e服务</title>
<style type="text/css">
.btnbuton{
color:#FFF; background-color:#FC0; padding: 5px 10px 5px 10px;border: 0px;cursor: pointer;
}
.divMess{
 border-bottom:#e4e4e4 1px solid;width: 100%;
}
.div_main{
position:relative;padding:30px 150px 20px 150px;
border-bottom:#ffc61a 3px solid;background-color: #ffffff;
}

.infomaid{color:#999;padding: 5px;text-align:justify;width: 490px;word-wrap:break-word;}
</style>
</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />

<div class="main">
<div id="main_content" class="main_content">
   
  <div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	     <div style="float:left;"><img src="${ctx}/images/menu_68.jpg" onclick="gotoPage('${ctx}/community!communityHome.action')" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_62.jpg" onclick="gotoPage('${ctx}/pages/community_topiclist.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_70.jpg"  onclick="gotoPage('${ctx}/pages/community_activitylist.jsp ')" style="width:190px;" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_63.jpg" onclick="gotoPage('${ctx}/community!findLableListCircle.action')"/></div>
           <div><img src="${ctx}/images/menu_66.png" style="width:473px;height: 100px;" /></div>
	    </div>
</div>
 
 
 <div style="position:relative;padding:10px 25px 0 25px;font-family:'微软雅黑';">
 
 <div style="background-color:#ffc61a; color:#FFF;padding:15px 0 15px 15px; font-size:16px; font-weight:bold;">
 活动照片 
 </div>
 <div class="div_main">
 <div>
 <img id="bigPicture" src=" " width="648px" height="425"  style="border:#CCC 1px solid;" />
 </div>
 <div style="height: 80px;color:#ffc61a;font-size: 16px;">
 <table width="650">
 <tr style="height: 50px;">
 <td width="30%" style="padding-top:25px;"></td>
 <td width="40%" align="right" id="createName"> </td>
 <td width="30%" style="padding-right: 10px;" align="right" id="createTime"> </td></tr>
 
 <tr><td style="padding-left: 10px;" width="30%" align="left">
 <button class="btnbuton" onclick="queryThePicturepeer(-1)">上一张</button>
 
 </td>
 <td width="40%" align="center" style="color: #000000;" id="pagenumber"> </td>
 <td width="30%" align="right" style="padding-right: 10px;">
 <button class="btnbuton" onclick="queryThePicturepeer(1)">下一张</button>
 </td>
 </tr> 
 </table>
 </div>
  
 </div>
 <div class="div_main"> 
 <div id="pictUreLisrg" style="font-size: 14px; color: #ffc61a;">
 
 
 <div class="divMess">

 <table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
 <tr>
 <td rowspan="2" valign="top" style="padding:10px 0 0 20px;width: 60px;">
 <img src="${ctx}/dynamic/topic_6.jpg" width="48" height="48" />
 </td>
 <td width="80px">发布者：</td>
 <td width="80px">leona_life </td>
 <td width="300px" style="color:#999;">2013年03月06日18:17 </td>
 <td width="50px">&nbsp;</td>
 </tr>
 
 <tr>
 <td colspan="3" class="infomaid"><span style="margin: 0 20px 0 -5px;color: #ffc61a;">发布者：</span>
  </td><td></td></tr>
 
 <tr><td>&nbsp;</td><td colspan="3" class="infomaid"> 速蜕变</td>
 <td valign="top" style="padding: 5px 0 0 10px;">回复</td></tr>
 </table> 
 </div>
 
 
 </div>
 
 
 <div>
  <table id="tabtabtab" width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#f9f9f7;">
 <tr>
    <td colspan="2" style="font-size:20px; color:#666;padding:20px 0 0 20px;">说点什么吧</td>
  </tr>
  <tr><td id="optionUser" width="80%" style="color:#666;padding: 0 0 10px 40px;color: red;"></td>
  <td width="20%" align="right" valign="bottom" style="padding-right: 25px;" id="countOfWord">0/250字 </td></tr>
   <tr align="center">
    <td height="60"  colspan="2">
    <input type="hidden" id="toActPictId"/>
      <textarea rows="4" cols="50" style="overflow: hidden;width: 600px;" id="mainYtext">250字以内</textarea>
     </td></tr>
<tr><td height="60" align="right" style="padding-right: 20px;"  colspan="2">
    <button class="btnbuton" onclick="fullCreateModel()">发&nbsp;&nbsp;&nbsp;表</button>
</td>
    
  </tr>
</table>
 </div>
 </div>
 </div>
 
 <jsp:include page="/common/bottom.jsp" /> 
</div>
</div>

</body>
</html>
<script type="text/javascript">
var actImgId="${param.actImgId}";
var activityId="${param.activityId}";
actImgId=1;activityId=337;
var actPhotoId=0;//图片Id
$(function(){	
	queryThePicturepeer(1);

	$('#mainYtext').blur(function(){
		if($(this).val()==''){$(this).val('250字以内');}	
	});
	$('#mainYtext').focus(function(){
		if($(this).val()=='250字以内'){$(this).val('');}		
	});
	$('#mainYtext').keyup(function(){
		if($(this).val()!=''){}
		if($(this).val().length <= 250)
			$('#countOfWord').html($(this).val().length+'/250字');
		else{
			$(this).val($(this).val().substr(0,250));
			$('#countOfWord').html(0+'/250字');
		}
	});
});

function fullCreateModel(){
	var text=$.trim($('#mainYtext').text());
	if(text.length==0){
		return;
	}
	var actPCId=$('#toActPictId').val();
	
	$.ajax({
	     type: "POST",
	     url : '${ctx}/community!addThePictureComment.action',
	     dataType:'json',
	     data:{content:text,actPhotoId:actPhotoId,activityId:activityId,pictComId:actPCId},
	     success: function(msg,status){
	    	 if(msg.status == 200){
	    		 findImgCommentityList(actPhotoId);
	    	 }else
	    		 alert(msg.msg);
	    }	     
	});
}



function queryThePicturepeer(pagenum){
	
	pageinfo["size"]=1;
	pageinfo["page"]=Number(actImgId)+pagenum;
	pageinfo["activityId"]=activityId;
	
	$.ajax({
	     type: "POST",
	     url : '${ctx}/community!queryThePicture.action',
	     dataType:'json',
	     data:pageinfo,
	     success: function(msg,status){
	    	 if(msg.status == 200){
	    		 var data=msg.rows[0];
	    		 $('#bigPicture').attr("src","${ctx}"+data["filePath"]);
	    		 $('#createName').html('来自：'+data["nickName"]);
	    		 $('#createTime').html(data["uploadTime"]);
	    		 $('#pagenumber').html('共'+msg.total+'张,当前第'+pageinfo["page"]+'张');
	    		 actImgId=pageinfo["page"];
	    		 findImgCommentityList(data["activityPhotoId"]);	    		 
	    	 }else{
	    		 alert(msg.msg);
	    	 }
	     }
	});
}
 


function findImgCommentityList(actPhId){
	actPhotoId=actPhId;	
	$.ajax({
	     type: "POST",
	     url : '${ctx}/community!queryThePictureComment.action',
	     dataType:'json',
	     data:{actPhotoId:actPhId},
	     success: function(msg,status){
	    	 if(msg.status == 200){
	    		 var str='';
	    		 for(var i =0;i<msg.rows.length;i++){
	    			 var data=msg.rows[i];
	    			 str+='<div class="divMess"><table width="100%" border="0" ';
	    			 str+='cellspacing="0" cellpadding="0" align="left">';
	    			 str+='<tr><td rowspan="3" valign="top" class="funimg" style="padding:5px 0 0 20px;width: 60px;">';
	    			 str+='<img src="${ctx}'+data["headImage"]+'" width="48" height="48" /></td>';
	    			 str+='<td width="80px">发布者：</td> <td width="80px" id="nickName'+data["activityCommentId"]+'">'+data["nickName"]+'</td>';
	    			 str+='<td width="300px" style="color:#999;">'+data["commentTime"]+'</td>';
	    			 str+='<td width="50px">&nbsp;</td></tr>';
	    			 if(data["toUserId"]>0){
	    				 str+='<tr><td colspan="3" class="infomaid">';
		    			 str+='<span style="margin: 0 20px 0 -5px;color: #ffc61a;">'+data["toNickName"]+'</span>';
		    			 str+=''+data["toContent"]+'</td> <td></td></tr>'; 
	    			 }else{
	    				 str+='<tr><td colspan="3" class="infomaid"></td> <td></td></tr>'; 
	    			 }    			
	    			 str+='<tr> <td colspan="3" class="infomaid" id="content'+data["activityCommentId"]+'">';
	    			 str+=''+data["content"]+'</td>';
	    			 str+='<td valign="top" align="right" style="padding: 5px 20px 0 10px;">';
	    			 str+='<a href="#tabtabtab" onclick="huiFuToUserText('+data["activityCommentId"]+')" ';
	    			 str+='style="curcor:pointer;">回复</a></td></tr></table></div>';
	    		 }	    		 
	    		 $('#pictUreLisrg').html(str);
	    	 }else{
	    		 $('#pictUreLisrg').html('<div style="height:80px;">'+msg.msg+'</div>');
	    	 }	    	 
	     }	     
	});
}

function huiFuToUserText(actComId){
	$('#toActPictId').val(actComId);  
	var str=$('#content'+actComId).text().substring(0,30)+'...';	
	$('#optionUser').html('@'+$('#nickName'+actComId).html()+'&nbsp;&nbsp;&nbsp;&nbsp;'+str);
}



</script>




