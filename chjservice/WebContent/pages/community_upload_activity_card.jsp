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
<table width="100%" cellpadding="5" cellspacing="0">
<tr>
<td id="popupTitle"></td>
<td colspan="2" align="right"></td>
</tr>
<tr>
<td>申请原因:</td><td colspan="2"><input id="txtReason" type="text" width="150" /></td>
</tr>
<tr>
<td>个人证件:</td>
<td><input id="filename" type="text" width="150" disabled="disabled" name="upfile"/>
</td>
<td width="200" align="left" style="font-family:微软雅黑;">
<span id="uploadbtn" class="button-caohejing">浏览</span>
</td>
</tr>
<tr><td colspan="3" height="10"></td></tr>
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
    action: '${ctx}/community!addActivityUser.action',
    name: 'uploadFile',
    autoSubmit:false,
    fileNeed:false,
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
    		response["objectId"]="${param.activityId}"+"${param.doType}";
    		response["activityId"]="${param.activityId}"
    		response["isCheck"]="${param.isCheck}";
    		response["isQrcode"]="${param.isQrcode}";
    		response["fresh"]="${param.fresh}";
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
	if("${param.isCheck}" =="T" && $('#filename').val().length==0){
		alert('请选择证件!');
		return;
	}
	ajaxuploadvar.setData({isCheck:"${param.isCheck}",isQrcode:"${param.isQrcode}",doType:"${param.doType}",type:"${param.type}",reason:$('#txtReason').val(),activityId:"${param.activityId}"});
	ajaxuploadvar.submit();
}


</script>

