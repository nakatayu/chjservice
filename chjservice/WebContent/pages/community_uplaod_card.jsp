<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>漕河泾e服务</title>
<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${ctx }/js/ajaxupload2.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/css/input.css" />
<style type="text/css">

ul.ul-button li{
width:100px;
height:30px;
line-height:30px;
list-style: none;
color:#fff;font-family:微软雅黑;
text-align:center;
background:#ffbf00;
font-weight:bold;
}
ul.ul-button li:hover{
cursor:pointer;font-family:微软雅黑;
background:#ffbf50;
}

/* line 189, ../scss/partials/_buttons.scss */
.button-caohejing {
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    -webkit-transition-property: background;
    -moz-transition-property: background;
    -o-transition-property: background;
    transition-property: background;
    -webkit-transition-duration: 0.3s;
    -moz-transition-duration: 0.3s;
    -o-transition-duration: 0.3s;
    transition-duration: 0.3s;
    background: #9cddd9;
    color: white;
    text-shadow: none;
    border: none;
    padding:8px;
    padding-left:10px;
    padding-right:10px;
    font-size:14px;
}

/* line 198, ../scss/partials/_buttons.scss */
.button-caohejing:hover {
    background: #00b38b;
    cursor:pointer;
}

/* line 201, ../scss/partials/_buttons.scss */
.button-caohejing:active {
    -webkit-transition-duration: 0s;
    -moz-transition-duration: 0s;
    -o-transition-duration: 0s;
    transition-duration: 0s;
    background: #00b38b;
    color: #00647f;
}
table td{background:#ffffff;}
</style>
</head>

<body>

<div style="border:0px solid #999;">
<table width="100%"  cellpadding="5" cellspacing="0">
<tr>
<td>申请原因:</td>
<td><input id="txtReason" type="text" width="150" /></td>
</tr>
<tr>
<td>个人证件:</td>
<td><input id="filename" type="text" width="150px" disabled="disabled" name="upfile"/>
</td>
<td width="130px" align="left" style="text-align: left;">
<span id="uploadbtn" class="button-caohejing">
浏览</span>
</td>
</tr>
<tr>
<td style="border-top:1px solid #ccc;padding-top:20px;" colspan="3" align="center">
<span class="button-caohejing" onclick="upload_image()">确定</span>&nbsp;&nbsp;&nbsp;&nbsp;
<span class="button-caohejing" onclick="window.top.diag.close()">取消</span>
</td>
</tr>
</table>
</div>

</body>
</html>
<script type="text/javascript">
var $uploadBtn = $("#uploadbtn");
var ajaxuploadvar = new AjaxUpload($uploadBtn, {
    action: '${ctx}/community!uploadPersonnalApplyCard.action',
    name: 'uploadFile',
    autoSubmit:false,
    responseType:'json',
    onChange: function (file, extension) {
    	if(extension=='jpg'||extension=='JPG'||extension=='jpeg'||extension=='JPEG'||
    			extension=='png'||extension=='PNG'||extension=='gif'||extension=='GIF'){
    		$('#filename').val(file);
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
    		response["objectId"]="${param.objectId}"+"${param.doType}";
    		
    		window.top.alert('申请成功,请等待审核',function(){
    			window.top.diag.close();
        		window.top.apply_add_level_suss(response);
    		});
    		
    	}else{
    		  alert(response.msg);
    	  }
   
    }
});
function upload_image(){
	if($.trim($('#txtReason').val()).length==0){
		alert('请输入申请原因!');
		return;
	}
	if($.trim($('#filename').val()).length==0){
		alert('请选择证件!');
		return;
	}
	ajaxuploadvar.setData({doType:"${param.doType}",type:"${param.type}",reason:$('#txtReason').val(),objectId:"${param.objectId}"});
	ajaxuploadvar.submit();
}


</script>

