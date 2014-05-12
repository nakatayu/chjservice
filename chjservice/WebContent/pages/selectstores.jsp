<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/css.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/js/dialog/dialog_subModal.css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jqu1-3.js"></script>

<style type="text/css">

.btn-button{
font-size: 20px;padding: 5px 20px 5px 20px;background-color: #CCC;border: 0px;
color: #FFF;font-size:25px;cursor: pointer;font-family: '微软雅黑';
}

</style>
</head>
<body>

<jsp:include page="/common/header.jsp" />

<div class="main" style="background-color:#FFF;" >
<div id="main_content" style="cursor:default;" class="main_content" >
  
  <div style="position:relative;height:140px; padding:10px 25px 0 25px; ">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr><td height="21"></td></tr>
      <tr>
        <td  style="font-size:12px; color:#c9c9c9;">您的位置：星巴克首页  &gt;&nbsp;门店选择 </td>
      </tr>
      <tr>
        <td><table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="85%" height="43">&nbsp;</td>
            <td width="15%" rowspan="4" align="right"><img src="${ctx}/images/starbuck_07.png" width="105" height="99" /></td>
          </tr>
          <tr>
            <td height="20"><span style="font-size:24px; font-family:'微软雅黑';">门店信息及配送范围</span></td>
          </tr>
            <tr><td><span style="font-size:12px;font-family:Arial;color: #c7c7c7;">STORE INFORMATION & ALLOCATION SCOPE</span></td></tr>
            <tr><td height="23px" align="left" valign="middle" style="padding-left: 628px;">
            <a style="cursor: pointer;color:#a19f76;font-size:12px;"  onclick="selectStore()">
            <img src="${ctx}/images/selectstores_map.png" width="16" height="16" />&nbsp;园区内其他门市</a></td></tr>
        </table></td> 
      </tr>
    </table>
  </div>
  

  <div style="position:relative;padding:15px 25px 0 25px;">
  <div style="float:left;  width:730px;">
  
  <div id="" style="width:730px;">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
	        <tr>
	          <td width="33%">
	          <table width="100%" cellspacing="0" cellpadding="0" style="border:#CCC 1px solid">
	            <tr>
	              <td style="padding:10px 0 0 15px; font-size:20px; color:#0e8a02;cursor: pointer;"
	              onclick="on_ordering(${shopInfo.company_shop_id},${shopInfo.examine_result})">${shopInfo.name}</td>
                </tr>
	            <tr>
	              <td style="padding:0 0 0 15px; color:#adadad; font-size:12px;padding-bottom: 10px;">CAOHEJING STORE</td>
                </tr>
	              
	            <tr>
	              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
	                <tr>
	                  <td width="4%" >&nbsp;</td>
	                  <td width="8%"><img src="${ctx}/images/selectstores_map.png" width="16" height="19"  style="cursor: pointer;"/></td>
	                  <td width="88%" style="color:#a19f76">
	                  <span  style="cursor: pointer;font-size:14px;">${shopInfo.address}</span><br /></td>
	                  </tr>
                  </table></td>
                </tr>
	            <tr>
	              <td><table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-bottom: 15px;">
	                <tr>
	                  <td width="4%" >&nbsp;</td>
	                  <td width="8%"><img src="${ctx}/images/selectstores_phoe.png" width="19" height="20" /></td>
	                  <td width="88%" style="color:#a19f76;font-size:14px;cursor:default;">${shopInfo.linkman_tel}</td>
	                  </tr>
	                </table></td>
                </tr>
	            <tr>
	              <td height="56" style="color: #aaaaaa;font-size:14px;"><img src="${ctx}/images/selectstores_1.png" width="238" height="42" />
	              <div style="padding-left:15px;cursor:default;">虹许路-桂菁路，漕宝路-钦江路</div></td>
                </tr>
	            <tr>
	              <td height="37" align="center" style="color:#aaaaaa; font-size:12px;"></td>
                </tr>
              </table></td>
	           <td width="77%" height="100%" valign="bottom"  style="border:#CCC 1px solid">
	           <img src="${ctx}/images/xbk_logo.png" style="width: 488px;height: 236px;cursor: pointer;"
	            onclick="on_ordering(${shopInfo.company_shop_id},${shopInfo.examine_result})">
	            </td>
            </tr>
          </table> 
  </div>
  
 <div id="" style=" width:730px;padding-top:2px;">
<div style=" width:730px;">
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:#CCC 1px solid; margin-top:10px;font-size: 14px; color:#c9c9c9;">
<tr>
<td style="background-color:#049519; color:#FFF; padding:4px 0px 4px 14px;font-size:17px;">外送服务条件：<br /></td></tr>
<tr>
<td>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-family: '微软雅黑';"> 
<tr>
<td width="40%" style="padding-top:20px;padding-left:20px;padding-right:20px;padding-bottom:20px;">
<p class="public_ggg" style="color: #aaaaaa;font-size:13px;">开放时间：工作日9:00-17:00，节假日除外</p>
<p class="public_ggg" style="color: #aaaaaa;font-size:13px;">起送金额：100元起</p>
<p class="public_ggg" style="color: #aaaaaa;font-size:13px;">外送产品：仅限手工调制产品</p>
<p class="public_ggg" style="color: #aaaaaa;font-size:13px;">到货时间：1小时（仅限接受当日订单）</p>
<p class="public_ggg" style="color: #aaaaaa;font-size:13px;">支付方式：${shopInfo.pay_type}</p></td>
<td width="35%">
<p class="public_ggg" style="color: #aaaaaa;font-size:13px;">其他：</p>
<p class="public_ggg" style="color: #aaaaaa;font-size:13px;">不可使用各类免费券、星享券、员工券、买一送一券、升杯券等纸质券或电子券。</p>
<p class="public_ggg" style="color: #aaaaaa;font-size:13px;">不参加门店折扣及优惠活动。</p>
<p class="public_ggg" style="color: #aaaaaa;font-size:13px;">不可使用星享卡积分，不参加星享卡活动，不可使用星享卡内各类优惠券。</p></td>
<td width="25%" align="center" valign="middle">
<button class="btn-button" style="height:50px;background-color:#aea98c;padding: 5px 20px 5px 20px;" onclick="on_ordering(${shopInfo.company_shop_id},${shopInfo.examine_result})">开始点单</button>
</td>
</tr>
</table></td></tr></table>
<!-- 
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding-top:22px;">
<tr><td height="26"></td></tr>
<tr>
<td style="font-size:24px;"><span style="font-size:25px; font-family:'微软雅黑';">我们还提供宴会式服务：</span></td>
</tr>
<tr>
<td style="font-size:12px; font-family:Arial; color:#d8d8d8;">BANQUEST SERVICE:</td></tr>
</table>
 -->
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:#CCC 1px solid; margin-top:20px;">
<tr><td valign="top"  style="font-size:14px; color:#c9c9c9;" align="center">
<img  style="width:728px;" src="${ctx}/images/xbk_yanhui.png"/></td>
</tr>
</table>
<div>

</div> 
</div>
</div>
</div>
<div style="float:right;  width:210px;">
         <table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding-top:10px;border:#CCC 1px solid;height:345px;" >
           <tr>
       <td height="28" style="padding-left:5px; color:#6b5142;font-size: 13px">推荐饮品</td>
     </tr>
      <tr>
       <td height="25" style="padding-left:5px;" ><img src="${ctx}/images/starbuck_16.jpg" width="196" height="16" onclick="findrecProduct(-1,'recommend')"/></td>
     </tr>
      <tr>
       <td height="191" valign="top" id="recommend" style="font-size: 12px;color: #757575;">
       
       </td>
     </tr>
      <tr>
       <td style="padding-left:5px;"><img src="${ctx}/images/starbuck_17.jpg" width="196" height="16" onclick="findrecProduct(1,'recommend')" /></td>
     </tr>
 </table>
   
   
   <table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding-top:10px;" >
     <tr>
       <td onclick="on_ordering(${shopInfo.company_shop_id},${shopInfo.examine_result})" style="cursor:pointer;color:#6b5142;font-size:12px; font-weight:bold;height: 28px;">  &gt; 查看全部饮品 </td>
     </tr>
   </table>
   
 <table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding-top:10px;" >
     <tr>
       <td align="justify"><img src="${ctx}/images/xbk_right.png" width="210" /></td>
     </tr>
   </table>
   
</div>

</div>

<jsp:include page="/common/bottom.jsp" />
  
</div>
</div>
<script type="text/javascript" src="${ctx}/js/dialog/dialog_common.js"></script>
<script type="text/javascript" src="${ctx}/js/dialog/dialog_subModal.js"></script>
<script type="text/javascript" src="${ctx}/js/selectstores.js"></script>

</body>
</html>

<script type="text/javascript">
var compayshopId="${shopInfo.company_shop_id}";

$(function(){
	findrecProduct(1,'recommend');
}); 

function on_ordering(compayshopid,result){
	if(result!=1){
		alert('店铺正在调整中！');
		return;
	}
	showPopWin('','${ctx}/pages/sbxucart.jsp?type=1', 440, 340, gotopage);		
}

function gotopage(){
	window.location.href="${ctx}/pages/ordering.jsp?shopId="+compayshopId;
}

function selectStore(){
	showPopWin('','${ctx}/pages/sbxucart.jsp?type=2&shopId='+compayshopId, 930, 570, '');
}
</script>

    