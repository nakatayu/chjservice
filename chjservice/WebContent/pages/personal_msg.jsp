<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>漕河泾e服务</title>

<style type="text/css">
.personal_fr1{
float:left;margin-left:10px;
}
.input-color{color:#ccc;}
.input-color-focus{color:#000;}

.ul_a{float:left;}
.ul_a li{
	color:#ccc;
	font-size:14px;
	text-align:center;
	float:left;
	height:20px;
	max-width: 200px;/*具体数值自行修改，下一行相同*/
	word-break:keep-all;
	list-style:none;
	color: #ffbf00;
}
.ul_a li:hover{
	cursor:pointer;
	background:#00b36b;
	color:#ccc;
}

</style>

</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />

<div class="main">
<div id="main_content" class="main_content">

<div style="position:relative;padding:10px 25px 0 25px;">
   <div>
   
   <div style="clear:both;float:left; width:950px;">
    <div>
	     <div style="float:left;"><img src="${ctx}/images/Legal_33.png" height="100" width="950"/></div>
      </div>
  </div> 
  
      <table style="clear:both;padding-top:5px;" id="table_msg" width="100%"  border="0" cellspacing="0" cellpadding="0">
     
     </table>
 
<div style="clear:both;float:left; width:950px;padding-top:10px;">
     <div id="loadmore" onclick="loadMore()" style="cursor:pointer;height:55px; width:950px; background-color:#FFF;"> <p id="loadMoreText" style="text-align:center; padding-top:18px;font-size:14px;color:4c4c4c;font-family:黑体;">加载更多</p> </div>
  </div> 
  
  
	</div>
 </div>
 
 
   <div style="clear:both;position:relative;padding:10px 25px 0 25px;">
   <div>
 <table id="table_replay" style="display:none;" width="950" bgcolor="#f9f9f7" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td height="10">&nbsp;</td>
  </tr>
  <tr>
   <td style="background-color:#f9f9f7;">
    <span style="margin-left:226px;color:#444;" id="toUser"></span>
   </td>
   </tr>
  <tr align="center">
    <td height="67" valign="top" style="background-color:#f9f9f7;">
     
      <textarea id="txtContent" class="input-color" cols="66" rows="5">120字内</textarea>
      <br/>
      <span id="spanTitle" style="float:right;color:#ccc;margin-right:230px;">0/120</span>
     </td>
  </tr>
  <tr>
    <td height="114" valign="top" style="padding:20px 0 0 20px;  background-color:#f9f9f7;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="68%">&nbsp;</td>
        <td width="32%">
        <a href="#table_comment" onclick="createTopicComment()">
        <img  style="cursor:pointer" src="${ctx}/images/topic_title_4.jpg" width="149" height="50" />
        </a>
        </td>
      </tr>
    </table></td>
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

$(document).ready(function(){
	initInput('txtContent','spanTitle','120字内',120);
	findUserUserMsgList();
	
});
function loadMore(){
	if(pageinfo["more"]){
		findUserUserMsgList();
	}
}
function createTopicComment(){
	if($.trim($('#txtContent').val()) == '120字内'){
		alert('请输入评论内容!');
		return;
	}
	if($.trim($('#txtContent').val()).length >120){
		alert('文字过长!');
		return;
	}
	if(recieverUserId==''){
		alert('请选择用户!');
		return;
	}
	$.ajax({
		type : "POST",
		url : '${ctx}/user!addUserComment.action',
		dataType : 'json',
		data :{title:"",content:$('#txtContent').val(),recieveUserId:recieverUserId},
		success : function(msg, status) {
			if(msg.status == 200){
				alert('评论成功!');
				toUserId='';
				toNickName='';
				$('#table_replay').hide();
				$('#toUser').html('');
				$('#txtContent').val('');
			}
			else{
				alert(msg.msg);
			}
		}
	});
}

var recieverUserId='';
var toNickName='';
function gotoReplay(toid,nickName){
	toNickName =nickName;
	recieverUserId =toid;
	
	$('#table_replay').show();
	$('#toUser').html('@  '+nickName);
}

function findUserUserMsgList(){
	pageinfo["size"]=10;
	
	$.ajax({
	     type: "POST",
	     url : context+'/user!findUserUserMsgList.action',
	     dataType:'json',
	     data:pageinfo,
	     success: function(msg,status){
	    	if(msg.status == 200){	
	    		var array = [];
	    		for(var i=0; i<msg.rows.length;i++){
	    			 var data = msg.rows[i];
	    			 var image="/images/default_image.png";
	    			 var nickName='系统消息';
	    			 if(data["fromUserInfo"] != undefined){
	    				 image=data["fromUserInfo"]["headPicture"];
	    				 nickName=data["fromUserInfo"]["nickName"];
	    			 }
	    			 var replay='<a href="#txtContent" style="color:#999;" onclick="gotoReplay('+data["sendUserId"]+',\''+nickName+'\')">回复</a>';  			 
	    			 if(data["sendUserId"]==null){
	    				 replay='';
	    			 }
	    			 var str='<tr>'+
	    			        '<td height="40" style="background:#fff;border-bottom:#ffbf00 solid 1px;padding-bottom:20px;">'+
	    		        '<table  width="100%" border="0" cellspacing="0" cellpadding="0">'+
	    		         ' <tr>'+
	    		          '  <td width="14%" rowspan="4" style="padding:10px 0 0 20px;">'+
	    		           ' <img src="${ctx}'+image+'" width="48" height="48" />'+
	    		            '</td>	    		'+          
	    		            '<td width="26%" height="32" style="color:#ffbf00; font-size:12px;">'+
	    		         	 '  <ul class="ul_a">'+
	    		         	  '  <li>发布者：'+nickName+'</li>'+
	    		         	   '</ul>'+
	    		            '</td>'+
	    		            '<td width="60%" style="color:#ffbf00; font-size:12px;">'+
	    		            data["sendDate"]+'&nbsp;&nbsp;'+replay+
	    		           '</td>'+
	    		          '</tr>'+
	    		          '<tr>'+
	    		           ' <td colspan="3"  style="color:#999; font-size:12px;">'+
	    		            data["content"]+
	    		            '</td>'+
	    		          '</tr>'+
	    		        '</table>'+
	    		        '</td>'+
	    		      '</tr>';
	    			 
	    			 array.push(str);
	    		}
	    		$('#table_msg').append(array.join(''));
	    		
	    		if(msg.rows.length<pageinfo["size"]){
			    	    $('#loadMoreText').html('没有更多!');
			    	pageinfo["more"]=false;
			    }
		    	 else{
		    		pageinfo["page"]++;
		    	 }
			    array=[];
		    	array=null;
	    	}
	    	else
	    	  alert(msg.msg);
	     }
	});
}
</script>

