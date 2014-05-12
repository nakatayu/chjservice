<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>漕河泾e服务</title>
<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${ctx }/js/ajaxupload.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/css/input.css" />
<style type="text/css">

</style>
</head>

<body>
<div style="height: 40px;width: 100%;background: url('${ctx}/images/deputitl.png') no-repeat;">
<img src="${ctx}/images/depudel.png"  width="22PX" height="22PX" style="margin:10px 0 0 400px;cursor: pointer;" onclick="top.hidePopWin(false);"/>
</div>
	 
	<div style="height=110px;padding: 30px 15px 15px 20px;background:url('${ctx}/images/depuback.png') no-repeat;">
		<table cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td style="color: #957171;font-size: 12px;padding-bottom: 10px;font-weight: bold;" align="left" colspan="2">请选择提货地点</td>
			</tr>
			<tr>
				<td><select id="selValue" style="width: 300px; height: 40px; padding: 5px 0 0 10px;">
						<option>虹漕路461号软件大厦一楼公共餐厅</option>
				</select></td>
				<td style="padding-left: 5px;">
				<img src="${ctx}/images/depubtn.png" height="38px" width="100%" onclick="createOrderInfo(${param.orderId})"/>
				</td>
			</tr>
			<tr>
				<td id="buttLike" colspan="2" style="padding: 20px 20px 0 0;">
				
				<table cellpadding="0" cellspacing="0" style="height: 100px;">
				<tr><td align="center" style="padding: 0 5px;">
				<%-- 
				<tr><td align="center" width="380px"><img src="${ctx}/images/depuopp.png"/></td></tr>
				<tr><td align="center" style="padding: 0 5px;"><a style="cursor: pointer;" href="">前往支付宝在线支付</a></td></tr>
				<tr><td align="center" style="color: red;font-weight: bold;">支付总额￥21.00</td></tr>
				 --%>
				</td></tr></table>
				
				</td>
			</tr>
		</table>
	</div>

</body>
</html>
<script type="text/javascript">

function createOrderInfo(orderId){	
	var addr=$('#selValue').val();
	$.ajax({
	    type: "POST",
	    url : '${ctx}/common!createDepuOrder.action',
	    dataType:'json',
	    data:{orderId:orderId,pointAddr:addr},
	    success: function(msg,status){
	    	if(msg.status==200){
	    		var str='<table cellpadding="0" cellspacing="0" style="height: 100px;">'+
					'<tr><td align="center" width="380px"><img src="${ctx}/images/depuopp.png"/></td></tr>'+
					'<tr><td align="center" style="padding: 0 5px;">'+
					'<a style="cursor: pointer;" href="'+msg.rows+'"  target="_blank">前往支付宝在线支付</a></td></tr>'+
					'<tr><td align="center" style="color: red;font-weight: bold;">支付总额￥'+msg.total+'</td></tr>'+
					'</table>';
	    		$('#buttLike').html(str);
	    	}else{
	    		$('#buttLike').html('<table cellpadding="0" cellspacing="0" style="height: 100px;">'+
	    		'<tr><td align="center" style="padding: 0 5px;">'
	    		+msg.msg+'</td></tr></table>');
	    	}
	    }	    
	});	
}
</script>

