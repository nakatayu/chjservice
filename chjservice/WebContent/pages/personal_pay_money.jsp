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
.btns {
	border: 1px;
	background-color: yellow;
	font-size: 16px;
	width: 80px;
	height: 30px;
}

.btns:HOVER {
	background-color: red;
}
</style>
</head>

<body>

	<c:if test="${param.retol==1}">
		<table id="depuInfo" cellpadding="0" cellspacing="0" width="400px">
			<tr>
				<td style="font-size: 20px; padding: 5px 0 0 10px; width: 100%;">请选择提货地点：</td>
			</tr>
			<tr>
				<td style="padding: 5px 0 0 10px;"><select id="selValue"
					style="width: 350px; height: 30px; padding: 5px 0 0 10px;">
						<option>漕宝路12号</option>						
				</select></td>
			</tr>
			<tr>
				<td style="padding: 5px 0 0 10px;"><button class="btns"
						onclick="createOrderInfo(${param.orderId})">确定</button></td>
			</tr>
			<tr>
				<td id="buttLike" style="padding: 5px 0 0 10px;"></td>
			</tr>
		</table>
	</c:if>

	<c:if test="${param.retol==2}">
		<table>
			<caption align="top" style="font-size: 40px;">订单信息</caption>
			<tr>
				<th>协议版本:</th>
				<td><input type="text" name="version" id="version"
					value="${user.nickName}" /></td>
			</tr>
			<tr>
				<th>字符编码:</th>
				<td><input type="text" name="charset" id="charset"
					value="${user.nickName}" /></td>
			</tr>
			<tr>
				<th>交易类型:</th>
				<td><input type="text" name="trans_type"
					value="${info.trans_type }" /></td>
			</tr>
			<tr>
				<th>商户号:</th>
				<td><input type="text" name="merchant_id" id="merchant_id"
					value="${info.merchant_id }" /></td>
			</tr>
			<tr>
				<th>商户简称:</th>
				<td><input type="text" name="merchant_name" id="merchant_name"
					value="${info.merchant_name }" /></td>
			</tr>

			<tr>
				<th>商品描述:</th>
				<td><input type="text" name="goods_content" id="goods_content"
					value="${info.goods_content }" /></td>
			</tr>
			<tr>
				<th>用户IP:</th>
				<td><input type="text" name="custome_ip" id="custome_ip"
					value="${info.custome_ip }" /></td>
			</tr>
			<tr>
				<th>订单号:</th>
				<td><input type="text" name="order_id" id="order_id"
					value="${info.order_id }" /></td>
			</tr>
			<tr>
				<th>系统内部订单号:</th>
				<td><input type="text" name="sm_billno" id="sm_billno"
					value="${info.sm_billno }" /></td>
			</tr>
			<tr>
				<th>交易时间:</th>
				<td><input type="text" name="order_time" id="order_time"
					value="${info.order_time }" /></td>
			</tr>
			<tr>
				<th>交易金额:</th>
				<td><input type="text" name="order_amount" id="order_amount"
					value="${info.order_amount }" /></td>
			</tr>
			<tr>
				<th>交易币种:</th>
				<td><input type="text" name="currency" id="currency"
					value="${info.currency }" /></td>
			</tr>
			<tr>
				<th>默认支付方式:</th>
				<td><input type="text" name="pay_kind" id="pay_kind"
					value="${info.pay_kind }" /></td>
			</tr>
			<tr>
				<th>前端通知URL:</th>
				<td><input type="text" name="front_url" id="front_url"
					value="${info.front_url }" /></td>
			</tr>
			<tr>
				<th>后台通知URL:</th>
				<td><input type="text" name="back_url" id="back_url"
					value="${info.back_url }" /></td>
			</tr>
			<tr>
				<th>附加信息:</th>
				<td><input type="text" name="merchant_attach"
					id="merchant_attach" value="${info.merchant_attach }" /></td>
			</tr>
			<tr> <th>签名类型:</th>
				<td><input type="text" name="sign_type" id="sign_type"
					value="${info.sign_type }" /></td>
			</tr>
			<tr>
				<th>数字签名:</th><td><input type="text" name="sign" id="sign" value="${info.sign }" /></td>
			</tr>
			<tr>
			<td colspan="2"><input type="submit" value="订单提交" /></td>
			</tr>
		</table>
		<div></div>

	</c:if>

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
	    		var info=msg.rows;
	    		$('#buttLike').html(info);
	    	}else{
	    		alert(msg.msg);
	    	}
	    }	    
	});	
}
</script>

