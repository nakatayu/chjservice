<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<style type="text/css">


.personal_fr1{
float:left;margin-left:10px;font-family:微软雅黑;
}
.personal_dataf{ font-size:14px; color:#999;font-family:微软雅黑;}
.input-color{color:#ccc;font-family:微软雅黑;}
.input-color-focus{color:#000;font-family:微软雅黑;}

.ul-tag li {text-align:left;font-family:微软雅黑;padding-left:40px;width:360px;height:40px;list-style: none;border-bottom:1px solid #ccc;}
.ul-tag li:hover {background:#00b36b;font-family:微软雅黑;}
.ul-tag li div {height:40px;font-family:微软雅黑;padding-top:15px}


.ul_tag_select li{
	border:1px solid #ccc;
	color:#fff;
	font-size:12px;font-family:微软雅黑;
	font-weight:bold;
	text-align:center;
	float:left;
	height:30px;
	max-width: 200px;/*具体数值自行修改，下一行相同*/
	word-break:keep-all;
	background:#00b36b;
	margin-left:10px;
	margin-top:10px;
	list-style:none;
}
.ul_tag_select  li:hover{
	cursor:pointer;
}


ul.ul-button{marigin:0;}
ul.ul-button li{
width:120px;
height:30px;font-family:微软雅黑;
list-style: none;
color:#fff;
float:left;
background:#65d8bd;
font-weight:bold;
border-left: #ccc solid 1px;
}
ul.ul-button li:hover{
cursor:pointer;font-family:微软雅黑;
background:#00b36b;
}
ul.ul-button li div{
text-align: center;
padding-top:5px;
}

ul.ul-image li{
 width:120px;
 height:120px;font-family:微软雅黑;
 float:left;
 list-style: none;
 margin:10px;
}
</style>



</head>
<body onscroll="b()">

<jsp:include page="/common/header.jsp" />
<script type="text/javascript" src="${ctx }/js/ajaxupload.js"></script>

<div class="main">
<div id="main_content" class="main_content">



<div style="position:relative;padding:0 25px 0 25px;">
  <div>
 
	
    <div style="width:950px; height:955px;font-family:微软雅黑; background-color:#fffef9; border-bottom:#00b38a 3px solid;">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="48" style="font-size:16px; font-family:微软雅黑; padding:20px 0 0 20px;font-weight:bold;">创建相册</td>
        </tr>
        <tr>
          <td height="37" align="center">
          图片描述:<input id="txtName" height="40" maxlength="40"/><span id="spanName">10字内</span><br/><br/>
         	<div  id="upload">
         	 <img  src="${ctx}/images/create_1.jpg" style="cursor:pointer;" width="194" height="30" />
          	</div>
           <span style="font-size:14px;color:#9a9a9a;font-family:微软雅黑;">大小(230*230,150K内)</span>
          </td>
        </tr>
        <tr>
          <td height="34" style="font-size:16px; font-family:微软雅黑; padding:0 0 0 20px;font-weight:bold;">
          <img  src="${ctx}/images/create_7.png" width="25" height="23" /> 图片</td>
        </tr>
        <tr>
          <td  align="center" style="padding-left:20px;font-family:微软雅黑;">
           <div style="border:1px solid #00b36b;height:725px;width:700px;">
           	<ul class="ul-image" id="ul-image">
          		
          		
            </ul>
         </div> 
          </td>
        </tr>
        
        <tr><td align="center">
         <ul class="ul-button">
            <li onclick="sure_circle()"><div>确&nbsp;&nbsp;&nbsp;&nbsp;认</div></li>
            </ul>
        </td></tr>
        </table>
    </div>
    
   </div>
 </div>
 
 



 <p> <br/><br/><br/></p>
	  
  <jsp:include page="/common/bottom.jsp" />

</div>
</div>


<br />
<br />
<br />




</body>
</html>

<script type="text/javascript">

var topicImage={};
var param={activityId:"${param.activityId}",type:"${param.type}"};

initInput('txtName','spanName','10字内',10);

	$(function(){

		
		 // 创建AJAX方式上传文件
        var $uploadBtn = $("#upload");
        new AjaxUpload($uploadBtn, {
            action: '${ctx}/common!uploadFile.action',
            name: 'uploadFile',
            data:{type:"activity"},
            responseType:'json',
            onChange: function (file, extension) {
            	  if($('#ul-image li').length>=30){
                	  alert('最多选择30张图片!');
                	  return false;
                  }
            },
            onSubmit: function(file, ext){
                  //ext 文件后缀
                
		    },
            onComplete: function(file, response){
            	if(response.status == 200){
            		  var index = $('#ul-image li').length;
            		  var info='';
            		  if(index<5){
            			  info = '<span  style="font-family:微软雅黑;font-size:12px;color:#9a9a9c;">还可以添加'+(30-index-1)+'张<br/></span>';
            			  info +='<br/><span style="font-size:12px;color:#9a9a9c;">'+$('#txtName').val()+'</span>';
            		  }
            		  else{
            			  info = '<span  style="font-size:12px;color:#9a9a9c;font-family:微软雅黑;"></span>';
            			  info +='<br/><span style="font-size:12px;color:#9a9a9c;">'+$('#txtName').val()+'</span>';
            		  }
            		  $('#ul-image').append('<li value="'+$('#txtName').val()+'" id="ul-image-'+index+'">'+
            	          		'<div style="position:absolute;font-family:微软雅黑;margin-left:100px;margin-top:2px;">'+
                        	    '<img src="${ctx}/images/lable_del.png" style="cursor:pointer;" onclick="removeTopicImage('+index+')"/>'+
                        	'</div>'+
                        	'<span>'+
                        	 '  <img id="topicImage'+index+'" style="border:1px solid #ccc;" src="${ctx}'+response.msg+'" width="120" height="120" />'+
                        	 info+
                        	'</span>'+
                      		'</li>');
            		  $('#txtName').val('');
            		  $('#spanName').val('10字内');
            		  initImageInfo();
            		
            		  
            	}else{
            		  alert(response.msg);
            	  }
           
            }
        });
	});
	
	

function removeTopicImage(index){
	
	$.ajax({
	     type: "POST",
	     url : context+'/common!deleteUploadFile.action',
	     dataType:'json',
	     data:{upliadFilePath:$('#topicImage'+index).attr('src')},
	     success: function(msg,status){
	    	 if(msg.status == 200){
	    		 $('#ul-image-'+index).remove();
	    		 initImageInfo();
	    	 }	    		
	    	 else
	    		 alert(msg.msg);
	     }
	});

}
function initImageInfo(){
	 var length = $('#ul-image li').length;
	 if(length<=30){
		var span = $('#ul-image li');
		for(var index=1;index<=span.length;index++){
			if(index < length){
				$($(span[index-1]).find('span span')[0]).html('');
			}
			else{
				if(index<6)
					$($(span[index-1]).find('span span')[0]).html('还可以添加'+(30-length)+'张');
				else
					$($(span[index-1]).find('span span')[0]).html('');
			}
		}
	 }
	 
}

function sure_circle(){
	
	var arrayImage=[];
	$.each($('#ul-image li'),function(){
		var name = this.getAttribute("value");
		var path = $(this).find('span:first img:last').attr('src');
		path=path.substr((path.lastIndexOf(context)+context.length));
		arrayImage.push({name:name,path:path});
	});
	if(arrayImage.length == 0){
		alert('请选择图片!');
		return;
	}
	param["imgList"]=JSON.stringify(arrayImage);
	$.ajax({
		type: "POST",
	     url : '${ctx}/community!uploadActivityUserAlbum.action',
	     dataType:'json',
	     data:param,
	     success: function(msg,status){
	    	 if(msg.status == 200){
		    	alert('创建相册成功!');
		    	history.go(-1);
		    }
		    else{
		       alert(msg.msg);
		    }
	     }	
	});
}
</script>

