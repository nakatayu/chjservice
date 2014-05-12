<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${ctx}/xheditor/common.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/input.css" />

<style type="text/css">


.personal_fr1{
float:left;margin-left:10px;
}
.personal_dataf{ font-size:14px; color:#999;}


.tag-title li {
text-align:center;
padding-left:4px;
padding-right:4px;
float:left;
height:30px;
line-height:30px;
list-style: none;
border:1px solid #ccc;
width: 60px;/*具体数值自行修改，下一行相同*/
background: #2ecedd;
margin-left:10px;margin-top:10px;
color:#fff;
}

.ul-tag li {
text-align:left;
padding-left:10px;
padding-right:10px;
float:left;
height:30px;
line-height:30px;
list-style: none;
border:1px solid #ccc;
max-width: 200px;/*具体数值自行修改，下一行相同*/
word-break:keep-all;
margin-left:10px;margin-top:10px;
color:#fff;
cursor:pointer;
}
.ul-tag li:hover {background:#00b36b;}


.ul_tag_select li{
	color:#fff;
	padding-left:4px;
	padding-right:4px;
	font-size:12px;
	font-weight:bold;
	text-align:center;
	float:left;
	height:30px;
	line-height:30px;
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
height:30px;
list-style: none;
float:left;margin-top:20px;margin-left:10px;
color:#fff;
float:left;
background:#65d8bd;
font-weight:bold;
border-left: #ccc solid 1px;
}
ul.ul-button li:hover{
cursor:pointer;
background:#00b36b;
}
ul.ul-button li div{
text-align: center;
padding-top:5px;
}
</style>



</head>
<body onscroll="b()">

<jsp:include page="/common/header.jsp" />
<script type="text/javascript" src="${ctx}/xheditor/xheditor-1.1.14-zh-cn.js"></script>
<script type="text/javascript" src="${ctx }/js/ajaxupload.js"></script>
<script type="text/javascript" src="${ctx }/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.easyui.min.js"></script>
<script language="javascript" src="${ctx}/js/JQueryHexBackgroundColor.js"></script>

<div class="main">
<div id="main_content" class="main_content">

   
 <div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	     <div style="float:left;"><img src="${ctx}/images/menu_68.jpg" onclick="gotoPage('${ctx}/community!communityHome.action')" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_62.jpg" onclick="gotoPage('${ctx}/pages/community_topiclist.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_70.jpg" onclick="gotoPage('${ctx}/pages/community_activitylist.jsp ')" style="width:190px;" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_63.jpg" onclick="gotoPage('${ctx}/community!findLableListCircle.action')"/></div>
   
           <div><img src="${ctx}/images/menu_66.png" style="width:473px;height: 100px;" /></div>
	    </div>
  
</div>


<div style="position:relative;height:365px; padding:0 25px 0 25px;">
  <div>
  <form id="formSubmit" method="post" action="">
  
	<input type="hidden" name="joinType" id="hiddenJoinType" />
	<input type="hidden" name="isCheck" id="hiddenIsCheck" />
	<input type="hidden" name="activityImage" id="hiddenActivityImage" />
	<input type="hidden" name="tagList" id="hiddenTagList" />
	<input type="hidden" name="isQrcode" id="hiddenIsQrcode" />
	<input type="hidden" name="isMoney" id="hiddenIsMoney" />
	<input type="hidden" name="payType" id="hiddenPayType" />
	<input type="hidden" name="lat" value="${activity.lat}" id="hiddenAddressLat" />
	<input type="hidden" name="lng" value="${activity.lng}" id="hiddenAddressLng" />
	<input type="hidden" name="activityId" value="${activity.activityId}" id="activityIdHidden" />
	
    <div style="float:left; width:572px; height:365px; background-color:#fffef9; border-bottom:#00b38a 3px solid;">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
          <td  width="80" style="font-size:16px; padding:40px 0 0 20px;font-weight:bold;">活动名称</td>
          <td style="padding:40px 0 0 0;">
            <c:if test="${activity==null}">
            <input name="title" class="input-color" style="width:392px;padding-left:4px;" type="text" id="txtTitle" value="标题40字以内" size="45" maxlength="40" />
            <span id="spanTitle" style="color:#ccc;">0/40</span>
         	</c:if>
         	 <c:if test="${activity!=null}">
            <input name="title" class="input-color" style="width:392px;padding-left:4px;" type="text" id="txtTitle" 
            value="${activity.title}" size="45" maxlength="40" />
            <span id="spanTitle" style="color:#ccc;">${fn:length(activity.title)}/40</span>
         	</c:if>
          </td>
        </tr>
        <tr>
          <td   style="font-size:16px; padding:10px 0 0 20px;font-weight:bold;">活动摘要</td>
          <td style="padding:10px 0 0 0;">
            <c:if test="${activity==null}">
            <textarea name="summary" style="height:50px;width:392px;maxwidth:392px;maxheight:50px;" id="txtSummary" class="address">摘要40字以内</textarea>
            <span id="spanSummary" style="color:#ccc;">0/40</span>
            </c:if>
            <c:if test="${activity!=null}">
            <textarea name="summary" style="height:50px;width:392px;maxwidth:392px;maxheight:50px;" id="txtSummary" class="address">${activity.summary}</textarea>
            <span id="spanSummary" style="color:#ccc;">${fn:length(activity.summary)}/40</span>
            </c:if>
          </td>
        </tr>
         <tr>
          <td valign="top"  style="font-size:16px; padding:10px 0 0 20px;font-weight:bold;">费用说明</td>
          <td style="padding:10px 0 0 0;" align="left">
           
           <table border="0" cellspacing="5" cellpadding="0">
            <tr>
              
              <td  align="left" colspan="2">
             	是否收费:
             </td>
             
             <td align="left" colspan="2">
              <table border="0" cellspacing="0" cellpadding="0">
            <tr>
            <c:if test="${activity!=null}">
             <td  align="left">
               <c:if test="${activity.isMoney=='T'}">
              <img id="money_ok" onclick="check_isok('money_ok','money_not',1)" src="${ctx}/images/is_check_ok.png"  />
              </c:if>
               <c:if test="${activity.isMoney!='T'}">
              <img id="money_ok" onclick="check_isok('money_ok','money_not',1)" src="${ctx}/images/is_check.png"  />
              </c:if>
               </td>
             
              <td width="50"  align="left">付费</td>
              <td  width="80" align="right">
               <c:if test="${activity.isMoney=='T'}">
              <img id="money_not" onclick="check_isok('money_ok','money_not',0)" src="${ctx}/images/is_check.png" />
              </c:if>
               <c:if test="${activity.isMoney!='T'}">
              <img id="money_not" onclick="check_isok('money_ok','money_not',0)" src="${ctx}/images/is_check_ok.png" />
              </c:if>
              </td>
              
              <td >免费</td>
            </c:if>
            
            <c:if test="${activity==null}">
             <td  align="left">
              <img id="money_ok" onclick="check_isok('money_ok','money_not',1)" src="${ctx}/images/is_check.png"  /></td>
              <td width="50"  align="left">付费</td>
              <td  width="80" align="right">
              <img id="money_not" onclick="check_isok('money_ok','money_not',0)" src="${ctx}/images/is_check_ok.png" /></td>
              <td >免费</td>
            </c:if>
            
            
            </tr>
            </table>
            </td>
            </tr>
            
            <tr class="tr-money" style="display:none;">
              <td  align="left" colspan="2">
             	付款方式:
             </td>
             <td align="left" colspan="2">
              <table border="0" cellspacing="0" cellpadding="0">
            <tr >
              <td  align="left">
              <c:if test="${fn:contains(activity.payType,'杉德卡')}">
              	<img alt="杉德卡" class="paytype" src="${ctx}/images/is_check_ok.png"  />
              </c:if>
              <c:if test="${!fn:contains(activity.payType,'杉德卡')}">
              	<img alt="杉德卡" class="paytype" src="${ctx}/images/is_check.png"  />
              </c:if>
              </td>
              <td width="50"  align="left">杉德卡</td>
              <td width="80" align="right">
              <c:if test="${fn:contains(activity.payType,'银行卡')}">
              <img  alt="银行卡" class="paytype"  src="${ctx}/images/is_check_ok.png" />
              </c:if>
               <c:if test="${!fn:contains(activity.payType,'银行卡')}">
              	<img  alt="银行卡" class="paytype"  src="${ctx}/images/is_check.png" />
              </c:if>
              </td>
              <td >银行卡</td>
               <td width="80" align="right">
               <c:if test="${fn:contains(activity.payType,'现金')}">
              <img   alt="现金" class="paytype"  src="${ctx}/images/is_check_ok.png" />
              </c:if>
               <c:if test="${!fn:contains(activity.payType,'现金')}">
              <img   alt="现金" class="paytype"  src="${ctx}/images/is_check.png" />
              </c:if>
              
              </td>
              <td >现金</td>
            </tr>
            </table>
              </td>
            </tr>
            <tr class="tr-money"  style="display:none;">
              <td  align="left" colspan="2">
             	活动费用:
             </td>
             <td>
              
               <table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td  align="left">
              
              <input name="moneynum" id="txtMoney" value="${activity.moneynum}" style="color:#444;height:20px;line-height:20px;width:80px;padding:4px 0 0 4px;" onkeyup="value=value.replace(/[^\d]/g,'')"/>
              
              </td>
              <td width="50"  align="left">元</td>
              
            </tr>
            </table>	
             </td>
           
             </tr>
             <tr class="tr-money"  style="display:none;">
              <td  align="left" colspan="2" width="100">
             	费用明细:
             </td>
             <td>
             <textarea name="moneyDetail" style="height:50px;width:310px;maxwidth:140px;maxheight:50px;" id="txtMoneyDetail">${activity.moneyDetail}</textarea>
             <br/><span id="spanMoneyDetail" style="color:#ccc;">100字以内</span>
             </td>
             </tr>
             
          </table>
          </td>
        </tr>
      
       
      </table>
    </div>
       
  
    
    <div class="personal_fr1" style="width:366px; height:365px; background-color:#fffef9; border-bottom:#00b38a 3px solid;">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="48" style="font-size:16px;  padding:20px 0 0 20px;font-weight:bold;">上传活动图片</td>
        </tr>
        <tr>
          <td height="37" align="center">
         	<div  id="upload">
         	 <img  src="${ctx}/images/create_1.jpg" style="cursor:pointer;" width="194" height="30" />
          	</div>
           	大小(230*230,300K内)
          </td>
        </tr>
        <tr>
          <td height="34" style="font-size:16px;  padding:0 0 0 20px;font-weight:bold;">
          <img  src="${ctx}/images/create_7.png" width="25" height="23" /> 图片</td>
        </tr>
        <tr>
          <td height="96" align="center">
           <div id="div_image" style="text-align:center;width:100px;height:100px;padding:10px;border:1px solid #00b36b;">
          		<c:if test="${activity!=null}">
          			<div style="position:absolute;margin-left:70px;margin-top:4px;">
            	      <img src="${ctx}/images/lable_del.png" style="cursor:pointer;" onclick="removeCircleImage()"/>
            	    </div>
            	 <span>
            	     <img id="circleImage" style="border:1px solid #ccc;" src="${imageStorePath}${activity.activityImage}" width="94" height="95" />
            	 </span>
            	 </c:if>
           </div>
             
          </td>
        </tr>
        
        </table>
    </div>
    
   </div>
 </div>
 
 <div style="position:relative;height:400px; padding:10px 25px 0 25px;">
<div style="float:left; width:948px; height:400px; background-color:#fffef9;border-bottom:#00b38a 3px solid;" ">
 <table width="100%" border="0" cellspacing="10" cellpadding="0">
       
        <tr>
          <td colspan="2"  style="font-size:16px; padding:10px 0 0 20px;font-weight:bold;">活动介绍</td>
        </tr>
        <tr>
        <td style="padding-left:80px;">
        <textarea name="content" id="txtContent" style="width:800px;height:300px;">${activity.content}</textarea>
        </td>
        </tr>
   </table>
 
 </div>
 </div>
 
 <div style="position:relative;height:460px; padding:10px 25px 0 25px;">
<div style="float:left; width:948px; height:460px; background-color:#fffef9; ">

 <div style="float:left; width:948px; height:460px; background-color:#fffef9; border-bottom:#00b38a 3px solid;">
      <table width="100%" border="0" cellspacing="10" cellpadding="0">
       <tr>
          <td colspan="2"  style="font-size:16px; padding:10px 0 0 20px;font-weight:bold;">报名时间</td>
        </tr>
        <tr>
            <td width="50%" style="padding-left:120px;">
          	开始时间
            <input name="enrollBeginTime" value="${activity.enrollBeginTime}"  class="Wdate" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'txtEnrollEndTime\');}',dateFmt:'yyyy-MM-dd HH:mm'})" style="height:20px;padding:4px 0 0 4px;" type="text" id="txtEnrollBeginTime" />
           </td>
           <td width="50%">
           	结束时间
            <input name="enrollEndTime" value="${activity.enrollEndTime}" class="Wdate" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'txtEnrollBeginTime\');}',dateFmt:'yyyy-MM-dd HH:mm'})" style="width:246px;height:20px;padding:4px 0 0 4px;" type="text" id="txtEnrollEndTime" />
           
          </td>
        </tr>
        <tr>
          <td colspan="2"  style="font-size:16px; padding:10px 0 0 20px;font-weight:bold;">活动时间</td>
        </tr>
        <tr>
            <td width="50%" style="padding-left:120px;">
          	开始时间
            <input name="beginTime" value="${activity.beginTime}"  class="Wdate" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'txtEndTime\');}',minDate:'#F{$dp.$D(\'txtEnrollEndTime\');}',dateFmt:'yyyy-MM-dd HH:mm'})" style="height:20px;padding:4px 0 0 4px;" type="text" id="txtBeginTime" />
           </td>
           <td width="50%">
           	结束时间
            <input name="endTime" value="${activity.endTime}"  class="Wdate" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'txtBeginTime\');}',dateFmt:'yyyy-MM-dd HH:mm'})" style="width:246px;height:20px;padding:4px 0 0 4px;" type="text" id="txtEndTime" />
           
          </td>
        </tr>
        
        <tr>
          <td colspan="2" style="font-size:16px; padding:10px 0 0 20px;font-weight:bold;">活动地点</td>
        </tr>
        <tr>
            <td width="50%" style="padding-left:120px;">
          	所属区域
            <select id="select_areafirst" style="width:184px;" onchange="select_area(this)"></select>
           </td>
           <td width="50%">
           	下属区域
            <select id="select_areathree" style="width:254px;" onchange="select_area_three(this)"></select>
          </td>
        </tr>
         <tr>
            <td colspan="2" width="50%" style="padding-left:120px;">
                                    详细地址:<input name="address" style="height:30px;width:600px;" id="txtAddress" value="${activity.address}"/>
            <span id="spanAddress" style="color:#ccc;">100字内</span>
            <span id="spanLatLng"></span>
            <img  src="${ctx}/images/activity_map.png" style="cursor:pointer;" onclick="openwindow('${ctx}/common/map_address2.jsp','地址',600,400)"/>
            </td>
        </tr>
         <tr>
          <td colspan="2" style="font-size:16px; padding:10px 0 0 20px;font-weight:bold;">交通推荐</td>
        </tr>
         <tr>
           <td colspan="2" width="50%" style="padding-left:120px;" valign="top">
            <textarea name="traffic" style="height:70px;width:670px;" id="txtTraffic" class="input-color">${activity.traffic}</textarea>
            <span id="spanTraffic" style="color:#ccc;">200字以内</span>
          </td>
        </tr>
      </table>
    </div>

</div>
</div>
 
 
 <div style="position:relative; height:210px; padding:10px 25px 0 25px;">
<div style="float:left; width:948px; height:210px; background-color:#fffef9; ">

 <div style="float:left; width:948px; height:210px;  background-color:#fffef9; border-bottom:#00b38a 3px solid;">
      <table width="100%" border="0" cellspacing="10" cellpadding="0">
       
        <tr>
          <td  style="font-size:16px; padding:10px 0 0 20px;font-weight:bold;">活动类型</td>
           <td  style="font-size:16px; padding:10px 0 0 0px;font-weight:bold;">活动人数</td>
        </tr>
        <tr>
            <td width="50%" style="padding-left:40px;">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              
              <td width="26%" align="right">
               <c:if test="${activity.joinType=='2'}">
              <img id="line_ok" onclick="check_isok('line_ok','line_not',1)" src="${ctx}/images/is_check.png"  />
              </c:if>
               <c:if test="${activity.joinType!='2'}">
              <img id="line_ok" onclick="check_isok('line_ok','line_not',1)" src="${ctx}/images/is_check_ok.png"  />
              </c:if>
              </td>
              <td width="9%" align="center">普通</td>
              <td width="9%" align="center">
              <c:if test="${activity.joinType=='2'}">
              <img id="line_not" onclick="check_isok('line_ok','line_not',0)" src="${ctx}/images/is_check_ok.png" />
              </c:if>
              <c:if test="${activity.joinType!='2'}">
              <img id="line_not" onclick="check_isok('line_ok','line_not',0)" src="${ctx}/images/is_check.png" />
              </c:if>
              </td>
              <td width="56%">订票</td>
              
            </tr>
          </table>
           </td>
           <td width="50%" valign="middle" style="padding-left:150px;">
             	上限<input name="userMax" value="${activity.userMax}" style="width:60px;height:20px;line-height:20px;padding:4px 0 0 4px;" type="text" id="txtUserMax" onkeyup="value=value.replace(/[^\d]/g,'')" size="45" maxlength="6" />人
          </td>
        </tr>
        <tr>
          <td  style="font-size:16px; padding:10px 0 0 20px;font-weight:bold;">是否需要生成二维码签到</td>
           <td  style="font-size:16px; padding:10px 0 0 0px;font-weight:bold;">对活动成员是否进行审核</td>
        </tr>
         <tr>
            <td width="50%" style="padding-left:40px;">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="26%" align="right">
               <c:if test="${activity.isQrcode=='T'}">
              	<img id="qrcode_ok" onclick="check_isok('qrcode_ok','qrcode_not',1)" src="${ctx}/images/is_check_ok.png"  />
              </c:if>
               <c:if test="${activity.isQrcode!='T'}">
              	<img id="qrcode_ok" onclick="check_isok('qrcode_ok','qrcode_not',1)" src="${ctx}/images/is_check.png"  />
              </c:if>
              </td>
              <td width="9%" align="center">是</td>
              <td width="9%" align="center">
              <c:if test="${activity.isQrcode=='T'}">
              <img id="qrcode_not" onclick="check_isok('qrcode_ok','qrcode_not',0)" src="${ctx}/images/is_check.png" />
              </c:if>
               <c:if test="${activity.isQrcode!='T'}">
              <img id="qrcode_not" onclick="check_isok('qrcode_ok','qrcode_not',0)" src="${ctx}/images/is_check_ok.png" />
              </c:if>
              </td>
              <td width="56%">否</td>
            </tr>
          </table>
            </td>
           <td width="50%" style="padding-left:80px;">
           <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="26%" align="right">
              <c:if test="${activity.isCheck=='T'}">
              <img id="check_ok" onclick="check_isok('check_ok','check_not',1)" src="${ctx}/images/is_check_ok.png"  />
              </c:if>
              <c:if test="${activity.isCheck!='T'}">
              <img id="check_ok" onclick="check_isok('check_ok','check_not',1)" src="${ctx}/images/is_check.png"  />
              </c:if>
              </td>
              <td width="9%" align="center">是</td>
              <td width="9%" align="center">
               <c:if test="${activity.isCheck=='T'}">
               <img id="check_not" onclick="check_isok('check_ok','check_not',0)" src="${ctx}/images/is_check.png" />
              </c:if>
               <c:if test="${activity.isCheck!='T'}">
               <img id="check_not" onclick="check_isok('check_ok','check_not',0)" src="${ctx}/images/is_check_ok.png" />
              </c:if>
              </td>
              <td width="56%"> 否</td>
            </tr>
          </table>
          </td>
        </tr>
      </table>
    </div>

</div>
</div>

<div style="position:relative;padding:10px 25px 0 25px;">
<div style="float:center; width:948px; background-color:#fffef9;padding-bottom:20px;">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="45">
      <span style="font-size:16px;  padding:0 0 0 20px;font-weight:bold;">选择标签</span></td>
    </tr>
    <tr>
      <td valign="top" align="center">
      
      <table width="90%" border="0" cellpadding="0" cellspacing="0">
      <tr>
      <td valign="top"  style="text-align:left;color:#9a9a9c;border-bottom:1px solid #ccc;padding-right:10px;">
      		一级
      </td>
      </tr>
      <tr>
       <td valign="top">
       	<div >
          
          <ul class="ul-tag" id="tag0">
          
          </ul>
        </div>
       </td> 
       </tr>
      <tr>
       <td width="90%" valign="top"  style="text-align:left;color:#9a9a9c;border-bottom:1px solid #ccc;padding-top:20px;padding-right:10px;">
      		二级
      </td>
      </tr>
      <tr>
       <td valign="top">
   		<div>
          <ul class="ul-tag" id="tag1">
          
          </ul>
        </div>
       </td> 
       </tr>
       <tr>
       <td  valign="top"  style="text-align:left;color:#9a9a9c;border-bottom:1px solid #ccc;padding-top:20px;padding-right:10px;">
      		三级
      </td>
      </tr>
      <tr>
       <td valign="top">
        <div>
          <ul class="ul-tag" id="tag2">
           
          </ul>
        </div>
        </td>
        </tr>
       <tr><td height="20">&nbsp;</td></tr>
        <tr>
        <td style="height:60px;border:1px solid #ccc;">
        <ul  class="ul_tag_select" id="ul_tag_select">
          <c:forEach var="item" items="${activity.tagList}">
          <li value="${item.tagId}" onclick="removeSelectTag(this)">
		   <div  style="padding:2px 0 0 4px;">
		 	<div style="float:left;margin:0px;margin-right:4px;">${item.tagName}</div>
		 	<div style="float:left;margin-right:-4px;margin-top:-2px;">
		 		<img style="width:30px;height:30px;"  src="${ctx}/images/create_8.png"/>
		 	</div>
		    </div>
		 </li>
          </c:forEach>
		</ul>
        </td>
        
        </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td align="right">
      <table width="40%" border="0" align="right" cellpadding="0" cellspacing="0">
      <tr>
           <td width="150" align="right">
              <img id="create_ok"  src="${ctx}/images/is_check.png"  /></td>
           <td width="150" align="left" style="color:red;cursor:pointer;" onclick="turnpage()">创建活动须知</td>
        </tr>
        <tr>
          <td colspan="2" width="300" align="right" style="padding-left:110px;">
            <ul class="ul-button">
             <li onclick="sure_circle()"><div>提交审核</div></li>
             <li onclick="history.go(-1)"><div>取消</div></li>
            </ul>
          </td>
        </tr>
      </table></td>
    </tr>
  </table>
</div>
</div>

</form>  

<div style="position:relative;padding:10px 25px 0 25px;">
<div style="display:none;color:red;background:#fff;padding:10px;" id="divkeyword"></div>
</div>

 <p> <br/><br/><br/></p>
	  
  <jsp:include page="/common/bottom.jsp" />

</div>
</div>


</body>
</html>

<script type="text/javascript">
var tagList=${tagList};
var circleImage="${activity.activityImage}";
var colorStr=['#F5BCA9','#8181F7','#4E9AFE'];
	$(function(){
		if("${activity.isMoney}"=="T"){
			$('.tr-money').show();
		}
		$(pageInit);
		function pageInit()
		{
			var str = "Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,SelectAll,Removeformat";
			str +=",Align,List,Outdent,Indent,Link,Unlink,Anchor,Img,Flash,Media,Hr,Emot,Table,Source,Preview";
			$('#txtContent').xheditor({tools:str,upLinkUrl:"${ctx}/common!uploadHtmlFile.action",upLinkExt:"word,pdf,zip,rar,txt",upImgUrl:"${ctx}/common!uploadHtmlFile.action",upImgExt:"jpg,jpeg,gif,png,JPG,JPEG,GIF,PNG",upFlashUrl:"${ctx}/common!uploadHtmlFile.action",upFlashExt:"swf",upMediaUrl:"${ctx}/common!uploadHtmlFile.action",upMediaExt:"MP4,mp4,MP3,mp3,avi,AVI"});
			
		}
		
		initInput('txtTitle','spanTitle','标题40字以内',40);
		initInput('txtSummary','spanSummary','摘要40字以内',40);
		initInput('txtAddress','spanAddress','地址100字以内',100);
		initInput('txtTraffic','spanTraffic','200字以内',200);
		initInput('txtMoneyDetail','spanMoneyDetail','100字以内',100);
		
		initPayType();
		initTagList();
		 $.ajax({
	   	     type: "POST",
	   	     url : '${ctx}/user!loadAreaList.action',
	   	     dataType:'json',
	   	     data:{},
	   	     success: function(msg,status){
	   	    	if(msg.status == 200){
	   	    		areaList = msg.rows;
	   	    		var array=[];
	   	    		array.push('<option value="">请选择</option>');
	   	    		for(var i=0;i<areaList.length;i++){
	   	    			array.push('<option value="'+i+'">'+areaList[i]["areaName"]+'</option>');
	   	    		}
	   	    		$('#select_areafirst').html(array.join(''));
	   	    	}
	   	    	else{
	   	    		alert(msg.msg);
	   	    	}
	   		 } 
	   	});
		 // 创建AJAX方式上传文件
        var $uploadBtn = $("#upload");
        new AjaxUpload($uploadBtn, {
            action: '${ctx}/common!uploadFile.action',
            name: 'uploadFile',
            data:{type:"activity"},
            responseType:'json',
            onChange: function (file, extension) {
            	  if($('#circleImage').length>0){
                	  alert('请删除图片!');
                	  return false;
                  }
            },
            onSubmit: function(file, ext){
                  //ext 文件后缀
                
		    },
            onComplete: function(file, response){
            	if(response.status == 200){
            		circleImage=response.msg;
            		  $('#div_image').append('<div style="position:absolute;margin-left:70px;margin-top:4px;">'+
            	                '<img src="${ctx}/images/lable_del.png" style="cursor:pointer;" onclick="removeCircleImage()"/>'+
            	                '</div>'+
            	                '<span>'+
            	                '<img id="circleImage" style="border:1px solid #ccc;" src="${imageStorePath}'+response.msg+'&time='+(new Date()).getTime()+'" width="94" height="95" />'+
            	                '</span>');
            	}else{
            		  alert(response.msg);
            	  }
           
            }
        });
	});
    
	function initPayType(){
		$('.paytype').toggle(function(){
			$(this).attr('src','${ctx}/images/is_check_ok.png');
		},function(){
			$(this).attr('src','${ctx}/images/is_check.png');
			
		});
		
		$('#create_ok').toggle(function(){
			$(this).attr('src','${ctx}/images/is_check_ok.png');
		},function(){
			$(this).attr('src','${ctx}/images/is_check.png');
			
		});
	}
	
	var preTagLi=null;
	var preTagLiColor=null;
	var preFirstTagLi=null;
	var preFirstTagLiColor=null;
	var selectColor='#00b36b';
	
	function initTagList(){
		var array0=[];
		for(var i=0;i<tagList.length;i++){
			var str='<li value="'+i+'" style="background-color:'+colorStr[0]+'">'+tagList[i]["tagName"]+'</li>';
			array0.push(str);
		
		}
		$('#tag0').html(array0.join(''));
		
		initTag0Click();	
		
	}
	function initTag0Click(){
		 /**$('#tag0 li').hover(function(){
				$(this).css({background:'#00b36b'});
			},function(){
				if(this != preTagLi){
					$(this).css({background:'#fff'});
				}
		});*/
			$('#tag0 li').click(function(){
				if(preFirstTagLi !=null){
					$(preFirstTagLi).css({background:preFirstTagLiColor});
				}
				
				
				preFirstTagLi = this;
				preFirstTagLiColor = $(this).getHexBackgroundColor();
				$(this).css({background:selectColor});
				
				var index= this.getAttribute("value");
				var array2=[];
				 for(var h=0;h<tagList[index]["child"].length;h++){
					  array2.push('<li value="tag1'+index+'_'+h+'" style="background-color:'+colorStr[1]+'">'+tagList[index]["child"][h]["tagName"]+'</li>');
				  }
				 $('#tag1').html(array2.join(''));
				 iniTag1Click();
			});
	}
	function iniTag1Click(){
	
	/**$('#tag1 li').hover(function(){
		$(this).css({background:'#00b36b'});
	},function(){
		if(this != preTagLi){
			$(this).css({background:'#fff'});
		}
	});*/
	
	$('#tag1 li').click(function(){
		if(preTagLi !=null){
			$(preTagLi).css({background:preTagLiColor});
		}
	
		
		preTagLi = this;
		preTagLiColor = $(this).getHexBackgroundColor();
		$(this).css({background:selectColor});
		
		var index = this.getAttribute("value");
		index = index.replace('tag1','').split('_');
		var array2=[];
		var data=tagList[index[0]]["child"][index[1]]["child"];
		 for(var h=0;h<data.length;h++){
			  
			 array2.push('<li id="tag2'+index[0]+'_'+index[1]+'_'+h+'" value="tag2'+index[0]+'_'+index[1]+'_'+h+'" style="background-color:'+colorStr[2]+'">'+
			 '<div  style="padding:2px 0 0 4px;">'+
			 '	<div style="float:left;margin:0px;">'+data[h]["tagName"]+'</div>'+
			 '	<div style="display:none;float:left;margin-right:-4px;margin-top:-2px;">'+
			 '		<img style="width:30px;height:30px;"  src="${ctx}/images/tag_select.png"/>'+
			 '	</div>'+
			 ' </div>'+
			 '</li>');
			 
		  }
		 $('#tag2').html(array2.join(''));
		 iniTag2Click();
	});
}
function iniTag2Click(){
	$('#tag2 li').click(function(){
		var index = this.getAttribute("value");
		
		index = index.replace('tag2','').split('_');
		var data=tagList[index[0]]["child"][index[1]]["child"][index[2]];
		var tagId =data["tagId"];
		if($('#ul_tag_select li').length>=6){
			alert('最多选择6个标签!');
			return;
		}
		var count=0;
		$.each($('#ul_tag_select li'),function(){
			var tagId1 = this.getAttribute("value");
			if(tagId1 == tagId){
				count++;
			}
		});
		if(count>0){
			alert('已选择!');
			return;
		}
	
		var tagName = data["tagName"];
		$(this).find('div:first div:eq(1)').show();
		changedFlag["tag"]=true;
		$('#ul_tag_select').append(
		 '<li value="'+tagId+'" onclick="removeSelectTag(this,\''+$(this).attr("id")+'\')">'+
		 '<div  style="padding:2px 0 0 4px;">'+
		 '	<div style="float:left;margin:0px;margin-right:4px;">'+tagName+'</div>'+
		 '	<div style="float:left;margin-right:-4px;margin-top:-2px;">'+
		 '		<img style="width:30px;height:30px;"  src="${ctx}/images/create_8.png"/>'+
		 '	</div>'+
		 ' </div>'+
		 '</li>');
	});
}
var changedFlag={tag:false};
function removeSelectTag(obj,objId){
	if(objId){
		$('#'+objId).find('div:first div:eq(1)').hide();
	}
	changedFlag["tag"]=true;
	$(obj).remove();
}
function removeCircleImage(){
	if("${activity.activityId}"!=""){
		 $('#div_image').html('');
		 circleImage='';
		return;
	}
	
	$.ajax({
	     type: "POST",
	     url : context+'/common!deleteUploadFile.action',
	     dataType:'json',
	     data:{upliadFilePath:circleImage},
	     success: function(msg,status){
	    	 if(msg.status == 200){
	    		 circleImage='';
	    		 $('#div_image').html('');
	    	 }	    		
	    	 else
	    		 alert(msg.msg);
	     }
	});

}

function check_isok(ok,not,type){
	//if(ok =='qrcode_ok' && $('#line_ok').attr('src').indexOf('is_check_ok')!=-1 && type==1){
	//	return;
	//}
	
	if(not == 'money_not' && $('#money_not').attr('src').indexOf('is_check.png')!=-1 && type==0){
		$('.tr-money').hide();
	}
	else{
		$('.tr-money').show();	
	}
	if(type==1){
		$('#'+ok).attr('src','${ctx}/images/is_check_ok.png');
		$('#'+not).attr('src','${ctx}/images/is_check.png');
	}
	else{
		$('#'+ok).attr('src','${ctx}/images/is_check.png');
		$('#'+not).attr('src','${ctx}/images/is_check_ok.png');
	}
	if(ok =='line_ok'){
		$('#qrcode_ok').attr('src','${ctx}/images/is_check.png');
		$('#qrcode_not').attr('src','${ctx}/images/is_check_ok.png');
	}
	
}
function sure_circle(){
	
	var param={activityImage:"",activityId:"${activity.activityId}",lat:$('#hiddenAddressLat').val(),lng:$('#hiddenAddressLng').val()};
	
	
	if($.trim($('#txtTitle').val()).length==0 || $.trim($('#txtTitle').val())=='标题40字以内'){
		alert('需要填写标题!');
		return;
	}
	param["title"]=$.trim($('#txtTitle').val());
	if($.trim($('#txtSummary').val()).length==0 || $.trim($('#txtSummary').val())=='摘要40字以内'){
		alert('需要填写摘要!');
		return;
	}
	param["summary"]=$.trim($('#txtSummary').val());
	if($('#money_ok').attr('src').indexOf('is_check_ok.png')!=-1){
		var count=0;
		var paytype=[];
		$('.paytype').each(function(){
			if($(this).attr('src').indexOf('is_check_ok.png')!=-1){
				paytype.push($(this).attr('alt'));
				count++;
			}
		});
		if(count==0){
			alert('请选择付费方式!');
			return;
		}
		else{
			param["payType"]=paytype.join(',');
		}
		if($.trim($('#txtMoney').val()).length==0){
			alert('请输入费用!');
			return;
		}
		param["moneynum"]=$.trim($('#txtMoney').val());
		param["isMoney"]="T";
	}
	else{
		param["isMoney"]="F";
	}
	if(circleImage==''){
		alert('请上传图片!');
		return;
	}
	else{
		param["activityImage"]=circleImage;
		
	}
	
	if($.trim($('#txtContent').val()).length==0){
		alert('需要填写内容!');
		return;
	}
	param["content"]=$.trim($('#txtContent').val());
	if($.trim($('#txtBeginTime').val()).length==0){
		alert('需要填写活动开始日期!');
		return;
	}
	param["beginTime"]=$.trim($('#txtBeginTime').val());
	if($.trim($('#txtEndTime').val()).length==0){
		alert('需要填写活动结束日期!');
		return;
	}
	param["endTime"]=$.trim($('#txtEndTime').val());
	if($.trim($('#txtEnrollBeginTime').val()).length==0){
		alert('需要填写报名开始日期!');
		return;
	}
	param["enrollBeginTime"]=$.trim($('#txtEnrollBeginTime').val());
	if($.trim($('#txtEnrollEndTime').val()).length==0){
		alert('需要填写报名结束日期!');
		return;
	}
	param["enrollEndTime"]=$.trim($('#txtEnrollEndTime').val());
	if($.trim($('#txtAddress').val()).length==0 || $.trim($('#txtAddress').val())=='地址100字以内'){
		alert('需要填写地址!');
		return;
	}
	param["address"]=$.trim($('#txtAddress').val());
	if($.trim($('#txtUserMax').val()).length==0){
		alert('需要填写上限人数!');
		return;
	}
	param["userMax"]=$.trim($('#txtUserMax').val());
	if($.trim($('#txtTraffic').val())=='100字以内'){
		$('#txtTraffic').val('');
	}
	param["traffic"]=$.trim($('#txtTraffic').val());
	if($.trim($('#txtMoneyDetail').val())=='100字以内'){
		$('#txtMoneyDetail').val('');
	}
	param["moneyDetail"]=$.trim($('#txtMoneyDetail').val());
	if($('#check_ok').attr('src').indexOf('is_check_ok')!=-1){
		param["isCheck"]="T";
	}
	if($('#check_not').attr('src').indexOf('is_check_ok')!=-1){
		param["isCheck"]="F";
	}
	if($('#line_ok').attr('src').indexOf('is_check_ok')!=-1){
		param["joinType"]="2";
	}
	if($('#line_not').attr('src').indexOf('is_check_ok')!=-1){
		param["joinType"]="1";
	}
	if($('#qrcode_ok').attr('src').indexOf('is_check_ok')!=-1){
		param["isQrcode"]="T";
	}
	if($('#qrcode_not').attr('src').indexOf('is_check_ok')!=-1){
		param["isQrcode"]="F";
	}
	
	var array=[];
	$.each($('#ul_tag_select li'),function(){
		array.push(this.getAttribute("value"));
	});
	if(array.length==0){
		alert('请选择标签!');
		return;
	}
	if(changedFlag["tag"]){
		param["tagList"]=array.join(',');
	}
	else{
		param["tagList"]="";
	}
	
	if($('#create_ok').attr('src').indexOf('is_check_ok.png')==-1){
		alert('请选择活动须知!');
		return;
	}
	$.ajax({
	    type: "POST",
	    url : '${ctx}/user!KeywordFliter.action',
	    dataType:'json',
	    data:{word:param["moneyDetail"]+param["title"]+param["summary"]+param["content"]+param["address"]+param["traffic"]},
	    beforeSend: function(){
	    	show_loading();
	    },
	    success: function(msg,status){
	    	
	    	if(msg.status==200){
	    		if(msg.rows.length>0){
	    			$('#divkeyword').show();
	    			$('#divkeyword').html(msg.rows.join(','));
	    			if(loadding_dialog!=null){
	    	    		loadding_dialog.close();
	    	    	}
	    			alert('您提交的内容含有敏感词!');
	    		}
	    		else{
	    			$('#divkeyword').hide();
	    			$('#divkeyword').html('');
	        		
	    			$.ajax({
	    			    type: "POST",
	    			    url : '${ctx}/community!createActivityData.action',
	    			    dataType:'json',
	    			    data:param,
	    			    success: function(msg,status){
	    			   		if(msg.status == 200){
	    			   			alert(msg.msg,function(){
	    			   				if("${activity.activityId}".length>0){
	 	    			   			   window.history.go(-1);
	 	    			   			}
	 	    			   			else{
	 	    			   				window.location.href="${ctx}/pages/community_activitylist.jsp";
	 	    			   			}
	    			   			});
	    			   			
	    			   		}
	    			   		else{
	    			   			alert(msg.msg);
	    			   		}
	    			    },
	    			    complete:function (XMLHttpRequest, textStatus) {
	    			    	if(loadding_dialog!=null){
	    			    		loadding_dialog.close();
	    			    	}
	    			    }
	    			});
	    		}
	    	}
	    	}
	    });
	
	
}

var loadding_dialog=null;
function show_loading(){
	if(loadding_dialog==null){
		loadding_dialog = new Dialog();
		loadding_dialog.Width = 300;
		loadding_dialog.Height = 100;
		loadding_dialog.Title = "";
		loadding_dialog.InnerHtml='<div style="text-align:center;font-size:14px;padding-top:20px;">loading......</div>';
		loadding_dialog.show();
	}
	else{
		loadding_dialog.show();
	}
	
}
function openwindow(url,name,iWidth,iHeight)
{
var url; //转向网页的地址;
var name; //网页名称，可为空;
var iWidth; //弹出窗口的宽度;
var iHeight; //弹出窗口的高度;
var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
window.open(url,name,'height='+iHeight+',modal=yes,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
}
var areaList=[];
function select_area(obj){
	
	if($(obj).val().length>0){
		var array=[];
		var data = areaList[$(obj).val()];
		for(var i=0;i<data["childList"].length;i++){
			if(i==0)
				$('#txtAddress').val(data["areaName"]+data["childList"][i]["area_name"]+data["childList"][i]["detailed_address"]);
			array.push('<option value="'+$(obj).val()+'_'+i+'">'+data["childList"][i]["area_name"]+'</option>');
		}
		
		$('#select_areathree').html(array.join(''));
	}
	else{
		 $('#txtAddress').val('');
		$('#select_areathree').html('');
	}	
}
function select_area_three(obj){
	if($(obj).val().length>0){
		var index11=$(obj).val().split("_");
		$('#txtAddress').val(areaList[index11[0]]["areaName"]+areaList[index11[0]]["childList"][index11[1]]["area_name"]+areaList[index11[0]]["childList"][index11[1]]["detailed_address"]);
	}
}
function turnpage(){
	$('#formturn').attr('target',"_blank");
	$('#formturn').attr('action',"${ctx}/pages/community_activitycheck.jsp");
	$('#formturn').submit();
}
</script>

