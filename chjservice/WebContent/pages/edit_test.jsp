<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="${ctx}/xheditor/common.css" type="text/css" media="screen" />
<title>漕河泾e服务</title>
<style type="text/css">
</style>

</head>

<body>
<jsp:include page="/common/header.jsp" />
<script type="text/javascript" src="${ctx}/xheditor/xheditor-1.1.14-zh-cn.js"></script>


<div class="main">
<div id="main_content" class="main_content">

<div style="width: 575px;margin-top:40px;">
    <form id="frmDemo" method="post" >
     <textarea id="elm1"  name="elm1" style="width: 575px;height:300px;">

	</textarea>

    </form>
</div>   
    
</div>
</div>

 
 
 

</body>
</html>
<script type="text/javascript">
$(pageInit);
function pageInit()
{
	$('#elm1').xheditor({upLinkUrl:"upload.jsp",upLinkExt:"zip,rar,txt",upImgUrl:"${ctx}/common!uploadHtmlFile.action",upImgExt:"jpg,jpeg,gif,png,JPG,JPEG,GIF,PNG",upFlashUrl:"upload.jsp",upFlashExt:"swf",upMediaUrl:"${ctx}/common!uploadHtmlFile.action",upMediaExt:"MP4,mp4,mp3"});
	
}

function submitForm(){$('#frmDemo').submit();}
</script>

