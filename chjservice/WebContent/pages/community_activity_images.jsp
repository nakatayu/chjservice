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
padding: 8px 10px 8px 10px;border: 0px;width: 150px;
height: 36px;font-size: 22px;font-family:微软雅黑;
}
.put_css{
height: 30px;width: 530px;padding-right: 20px;margin-right: 20px;
}
.divMess{
 border-bottom:#e4e4e4 1px solid;width: 100%;
}
.divdiv_main{
position:relative;
border-bottom:#ffc61a 3px solid;background-color: #ffffff;float:left; width: 100%;
}
.divchildern{
 width: 170px;padding: 10px; float: left;
}
.pstr{
height: 25px;color:#ffc61a;margin: 0;padding: 0;

}
.pictimg{
border:#CCC 1px solid;width: 170x;height: 100px;cursor: pointer;
}
.choImg{
 width:22; height:20;cursor: pointer;
}
</style>
</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />
<script type="text/javascript" src="${ctx }/js/ajaxupload.js"></script>

<div class="main">
<div id="main_content" class="main_content">
   
  <div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	     <div style="float:left;"><img src="${ctx}/images/menu_68.jpg" onclick="gotoPage('${ctx}/community!communityHome.action')" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_62.jpg" onclick="gotoPage('${ctx}/pages/community_topiclist.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_70.jpg" onclick="gotoPage('${ctx}/pages/community_activitylist.jsp ')"  style="width:190px;" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_63.jpg" onclick="gotoPage('${ctx}/community!findLableListCircle.action')"/></div>
           <div><img src="${ctx}/images/menu_66.png" style="width:473px;height: 100px;" /></div>
	    </div>
</div>
 
 
 <div style="position:relative;padding:10px 25px 0 25px;font-family:'微软雅黑';">
 
  <div style="color:#FFF; font-size:16px; font-weight:bold;background-color:#ffc61a; width: 100%;overflow: hidden;margin-bottom: 5px;">
  <div style="padding:15px 0 15px 15px;float: left;font-family:微软雅黑;">活动照片</div>
 
 <div id="allquert" style="float: right;padding-top: 15px;display: none;">
  <a style="margin: 0 0 0 20px;cursor: pointer;color:#fff;font-family:微软雅黑;" onclick="chooseAllpicture()">全选</a>
  <a style="margin: 0 10px 0 30px;cursor: pointer;color:#fff;font-family:微软雅黑;" onclick="deleteFromImage(0)">删除</a>
   </div>
 </div>
 
 <div class="divdiv_main" id="photoList" style="height: 650px;">
 
 
 </div> 
 
 <div style="float: left;width: 100%;">
<div id="pager" style="float:right; height:40px;display: none;" >wedrfghgfd</div>
</div>
 
 <div class="divdiv_main" id="contentText" style="display: none;">
 <div style="position:relative;padding: 20px 10px 30px 10px;width: 175px;float: left;">
 <img id="preimage" src="${ctx}/dynamic/photobig_1.png" class="pictimg"/>
 </div>
 
 <div style="float: right;height: 200px;width: 750px;padding-top: 20px;">
  
<table align="left" border="0" cellspacing="0" cellpadding="0">
<tr><td colspan="2" height="30px" valign="top">上传照片</td></tr>
<tr><td colspan="2" height="30px" valign="top">本地浏览</td></tr>
<tr><td height="40px"><input id="input-dis" disabled="disabled" class="put_css" /></td>
<td><button id="upload" class="btnbuton" >本地浏览</button></td></tr>
<tr><td height="50px" style="font-size:12px;color: #999;font-family:微软雅黑;" valign="top">建议650px*450px,300K内</td>
<td align="right"><img onclick="upload_image()" style="cursor:pointer;" src="${ctx}/dynamic/photo_submit.png" width="89" height="40" />
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
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript">
var activityId="${param.activityId}";
var circleImage='';
$(function(){
	$("#pager").pager({
		pagenumber : pageinfo["page"],
		pagecount : pageinfo["tp"],
		buttonClickCallback : PageClick
	});
	queryThePicture(1);
	
	
	 // 创建AJAX方式上传文件
    var $uploadBtn = $("#upload");
    new AjaxUpload($uploadBtn, {
        action: '${ctx}/common!uploadFile.action',
        name: 'uploadFile',
        data:{type:"actcontent",activityId:"${param.activityId}"},
        responseType:'json',
        onChange: function (file, extension) {
        	if(extension=='jpg'||extension=='JPG'||extension=='jpeg'||extension=='JPEG'||
        			extension=='png'||extension=='PNG'||extension=='gif'||extension=='GIF'){
        		return true;
        	}
        	else{
        		alert('文件格式不正确!');
        		return false;
        	}
        },
        onSubmit: function(file, ext){
              //ext 文件后缀
            
	    },
        onComplete: function(file, response){
        	if(response.status == 200){
        		circleImage=response.msg;
        		$('#input-dis').val(circleImage);
        		$('#preimage').attr("src","${imageStorePath}"+response.msg);
        	}else{
        		  alert(response.msg);
        	  }
       
        }
    });
    
});

PageClick = function(pageclickednumber) {
	$("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
	queryThePicture(pageclickednumber);
};

function queryThePicture(pagenum){
	pageinfo["size"]=15;
	pageinfo["page"]=pagenum;
	pageinfo["activityId"]=activityId;
		
	$.ajax({
	     type: "POST",
	     url : '${ctx}/community!queryThePicture.action',
	     dataType:'json',
	     data:pageinfo,
	     success: function(msg,status){
	    	if(msg.append==1){
 				$('#contentText').show();
 				$('#allquert').show();
 			}	    	 
	    	 if(msg.status == 200){
    			var num=msg.total;
    			if(num>15){
    				$("#pager").show();
    				if(num%pageinfo["size"]==0){
	    				pageinfo["tp"]=num/pageinfo["size"];
	    	    	}else{
	    	    		pageinfo["tp"]=Math.ceil(num/pageinfo["size"]);
	    	    	}
	    			$("#pager").pager({ pagenumber: pageinfo["page"],
	    				pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
    			}else{
    				$("#pager").html('');
    			}
    			
    			var str='';
	    		for(var i=0;i<msg.rows.length;i++){
	    			var t=(pagenum-1)*15+i;
	    			var data=msg.rows[i];
	    			str+='<div class="divchildern">';
	    			str+='<img src="${imageStorePath}'+data["filePath"]+'" class="pictimg" onclick="intoPictureMoreInfo('+t+')"/>';
	    			str+='<div style="height: 25px;font-family:微软雅黑;width: 170px;padding-top: 10px;">';
	    			if(data["roleUserId"]=='T'){
	    				str+='<img src="${ctx}/dynamic/photo_delt.png" class="choImg" onclick="chooseTheImg(this)" value="0" actId="'+data["activityPhotoId"]+'"/>';
		    			str+='<a style="font-family:微软雅黑;margin-left: 20px;curcor:pointer;" onclick="deleteFromImage('+data["activityPhotoId"]+')">删除</a>';
	    			}	    			
	    			str+='</div><p class="pstr">来自：'+data["nickName"]+'</p>';
	    			str+='<p class="pstr">'+data["uploadTime"]+'</p></div>';
	    		}
	    		$('#photoList').html(str);
	    		
	    	 }else
	    		 $('#photoList').html(msg.msg);
	     }	     
	});	
}

function chooseAllpicture(){
	$('img[class="choImg"]').each(function(){
		$(this).attr("src","${ctx}/dynamic/photo_del.png");
		$(this).val("1");		
	});
}

function chooseTheImg(obj){
	var i=$(obj).val();	
	if(i==0){
		$(obj).attr("src","${ctx}/dynamic/photo_del.png");
		$(obj).val("1");
	}else if(i==1){
		$(obj).attr("src","${ctx}/dynamic/photo_delt.png");
		$(obj).val("0");
	}
}

function deleteFromImage(imgId){
	if(imgId==0){
		imgId='';
		$('img[class="choImg"]').each(function(){
			if($(this).attr("value")==1){
				imgId=imgId+$(this).attr("actId")+',';
			}			
		});		
	}
	if(imgId==''){
		alert('请选择图片');
		return;
	}
	$.ajax({
	     type: "POST",
	     url : '${ctx}/community!updateThePicture.action',
	     dataType:'json',
	     data:{activityId:activityId,activityImage:imgId},
	     success: function(msg,status){
	    	 if(msg.status==200){
	    		alert('删除成功！');
	    		window.location.reload();
	    	 }else{
	    		 alert(msg.msg);
	    	 }
	    		 
	    }	     
	});
}

function intoPictureMoreInfo(actImgId){
	
	window.location.href="${ctx}/pages/community_activity_image.jsp?actImgId="+actImgId+"&activityId="+activityId;	
}
function upload_image(){
	if(circleImage==''){
		alert('请选择图片!');
		return;
	}
	$.ajax({
	     type: "POST",
	     url : '${ctx}/community!uploadActivityImage.action',
	     dataType:'json',
	     data:{activityId:"${param.activityId}",filePath:circleImage},
	     success: function(msg,status){
	    	 if(msg.status==200){
	    		 circleImage='';
	    		alert('上传成功!');
	    		window.location.reload();
	    	 }else{
	    		 alert(msg.msg);
	    	 }
	    		 
	    }	     
	});
}
</script>












