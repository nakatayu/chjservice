<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="${ctx}/css/input.css" />
<title>漕河泾e服务</title>
<style type="text/css">

.personal_fr1{
float:left;margin-left:10px;
}

.conv1{
float:left;margin-left:10px;
}
.conv1 img{
width:110px;height:110px;cursor:pointer;
}

.comm2{
	
float:left;margin-left:10px;
	
}

.main_content textarea{
width:170px;
border-radius:6px;
-webkit-border-radius:6px;
-moz-border-radius:6px;
border:1px solid #ccc;
-webkit-transition: box-shadow 0.30s ease-in-out;
-moz-transition:  box-shadow 0.30s ease-in-out;
resize:none;height:100px;width:180px;maxwidth:180px;maxheight:100px;overflow:auto;
overflow-y:hidden;
}
.main_content select {
width:180px;
height:24px;
}
.span_open{
cursor: pointer;
font-size:14px;
color:#9a9a9a;
}

img{
cursor:pointer;
}
.lable_ok{
cursor:pointer;
width:100px;height:40px;padding-top:6px;
background:url(${ctx}/images/lable_ok_b.png) no-repeat;
}
.lable{
width:100px;height:40px;padding-top:6px;
}

.myLableMenue{
text-align: center;
margin:0px;
}
.myLableMenue li{    /*标签样式*/
	border:1px solid #ccc;
	color:#fff;
	text-align:center;
	float:left;
	font-size:16px;
	height:40px;
	width: 100px;/*具体数值自行修改，下一行相同*/
	background:#1E899C;
	margin-left:10px;
	margin-top:10px;
	list-style:none;
}
.myLableMenue  li:hover{
	font-size:16px;
}
.myLableMenue  li  div{
cursor:pointer;
}
#table_address td{
padding-left:20px;
border:0px solid #ccc;
font-size:14px;
color:#9a9a9a; 
}
.input {width:180px;}
</style>
</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />
<script type="text/javascript" src="${ctx }/js/ajaxupload.js"></script>
<script type="text/javascript" src="${ctx }/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/js/JQueryHexBackgroundColor.js"></script>
<div class="main">
<div id="main_content" class="main_content">
   
   
 
<div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	     <div style="float:left;"><img src="${ctx}/images/menu_40.jpg" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_41.jpg" onclick="gotoMyCart()"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_42.jpg" onclick="gotoPage('${ctx}/product!findUserOrder.action')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_43.jpg" onclick="gotoPage('${ctx}/pages/personal_friend.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_49.jpg" onclick="gotoPage('${ctx}/pages/personal_topic.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_44.jpg" onclick="gotoPage('${ctx}/pages/personal_circle.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_45.jpg" onclick="gotoPage('${ctx}/pages/personal_activity.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_47.jpg" onclick="gotoPage('${ctx}/pages/personal_collection.jsp')"/></div>
            <div class="menu1"><img src="${ctx}/images/personnel_home.png" onclick="gotoPage('${ctx}/pages/myhome.jsp')"/></div>
	    </div>
  
</div>
  




 <div style="position:relative;height:340px; padding:10px 25px 0 25px;">
   <div>
    <div style="float:left; width:350px; height:340px;border-bottom:#57ae97 solid 2px;background:#fff;">

        <table width="98%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="37%" height="50" style="font-weight:bold;font-size:16px;padding-left:15px;">个人基本资料</td>
            <td width="63%" align="right" style="padding-right:10px;">
            <span type="button" class="button-caohejing" onclick="save_userinfo()">保存</span>
            </td>
          </tr>
          <tr>
          <td colspan="2">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
          <td width="102" height="44" align="right" class="lable_title">昵称：</td>
            <td >
            <div class="input_div">
            <input  type="text" id="txtNickName" maxlength="20" value="${user.nickName}"  />
            </div>
            </td>
          </tr>
           <tr>
            <td height="44" align="right" class="lable_title">我的故乡：</td>
            <td ><input  type="text" id="txtCity" maxlength="20"  value="${user.city}"  /></td>
          </tr>
          <tr>
            <td height="44" align="right" class="lable_title" >个人主页：</td>
            <td><input  type="text" id="txtMyWeburl" value="${user.myWeburl}"  /></td>
          </tr>
          
           <tr>
            <td height="44" align="right" class="lable_title" >个人简介：</td>
            <td>
            <textarea id="txtInfo" style="color:#000;">${user.info }</textarea></td>
          </tr>
          
          </table>
          </td>
            </tr>
        </table>
    
    </div>
    <div class="personal_fr1" style="width:230px; height:340px;border-bottom:#57ae97 solid 2px;background:#fff;">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="50" style="font-weight:bold; font-size:16px;padding-left:15px;" >头像</td>
        </tr>
        <tr>
          <td align="center">
    <c:choose>
<c:when test="${user.headPicture !=null && user.headPicture!=''}">
  <img src="${imageStorePath}${user.headPicture}" id="userHeadImgSet" style="width:110px; height:107px;" />
</c:when>
<c:otherwise>
 <img src="${ctx}/images/personal_set03.png" id="userHeadImgSet" style="width:110px; height:107px;" />
</c:otherwise>
</c:choose>

       </td>
       
        </tr>
        <tr>
          <td height="80" align="center">
          <span class="button-caohejing">
          <span id="upload" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上传头像&nbsp;&nbsp;&nbsp;&nbsp;</span>
           </span>
           <br/><br/>
          (230*230,150K内)
          </td>
        </tr>
        <tr style="display:none;">
          <td align="center">
          <span  class="button-caohejing"  onclick="">从微博同步头像</span>
         </td>
        </tr>
      </table>
    </div>
    <div class="personal_fr1" style="width:350px; height:340px;border-bottom:#57ae97 solid 2px;background:#fff;">
      <form id="form2" name="form2" method="post" action="">
        <table width="98%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="42%" height="54" style="font-weight:bold; font-size:16px;padding-left:15px;">修改密码</td>
            <td width="58%" align="right" style="padding-right:10px;">
               <span  class="button-caohejing"  onclick="saveUserPassword()">保存</span>
               </td>
          </tr>
            <tr>
          <td colspan="2">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="115" height="39" align="right" class="lable_title">邮箱：</td>
            <td height="39" class="lable_title1">${user.email}</td>
          </tr>
          <tr>
            <td height="39" align="right" class="lable_title">手机：</td>
            <td height="39" class="lable_title1">${user.phone}</td>
          </tr>
           <tr>
            <td height="44" align="right" class="lable_title">旧密码：</td>
            <td height="44"><input  type="password" id="txtPasswordOld" style="padding-right:10px;" size="25" maxlength="16" /></td>
          </tr>
          <tr>
            <td height="44" align="right" class="lable_title">新密码：</td>
            <td height="44"><input  type="password" id="txtPasswordNew" style="padding-right:10px;" size="25" maxlength="16" /></td>
          </tr>
          <tr>
            <td height="44" align="right" class="lable_title">确认新密码：</td>
            <td height="44"><input  type="password" id="txtPasswordNewSure" style="padding-right:10px;" size="25" maxlength="16" /></td>
          </tr>
          <tr>
           <td align="center" colspan="2" class="lable_title"><br/>
              8-16个字符,英文字母(大小写)数字组合
           </td>
          </tr>
          </table>
          </td>
          </tr>
          </table>
      </form>
    </div>
    </div>
 </div>
 
   <div style="position:relative;height:360px; padding:14px 25px 0 25px;">
   <div>
    <div style="float:left; width:950px; height:360px;border-bottom:#57ae97 solid 2px;background:#fff;">
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
              <td width="30%" height="54" style="font-weight:bold; font-size:16px;padding-left:15px;">个人详细资料</td>
              <td width="70%" align="right" style="padding-right:20px;">
              <span  class="button-caohejing"  onclick="save_userDetailInfo()">保存</span>
              </td>
               </tr>
               
           </table>
           <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="50%" align="left">
             <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left:10px;">
            
             <tr>
            <td height="42" align="right" class="lable_title">真实姓名：</td>
            
            <td height="42" style="font-size: 14px;">
             <span class="lable_title">姓&nbsp;</span><input type="text" style="width:54px;" maxlength="30" id="txtFirstName" value="${user.firstName}"/>
             <span class="lable_title"> 名&nbsp;</span><input type="text" style="width:80px;" maxlength="30" id="txtLastName" value="${user.lastName}"/>
           	   &nbsp;&nbsp;<img id="rlname_open_img" src="${ctx}/images/open.png" />
           	   <span class="span_open" id="rlname_open" onclick="isopen(this,1)">公开</span>&nbsp;
           	   <img id="rlname_open_not_img" src="${ctx}/images/open_not.png" />
           	   <span class="span_open" id="rlname_open_not" onclick="isopen(this,0)">不公开</span>
            </td>
          	</tr>
          <tr>
            <td height="42" align="right" class="lable_title">性别：</td>
            <td height="42">
            <select id="sel_sex" style="margin-right:5px;">
             <option value="M">男</option>
             <option value="W">女</option>
            </select>

            <img id="sex_open_img" src="${ctx}/images/open.png" />
           	   <span class="span_open" id="sex_open" onclick="isopen(this,1)">公开</span>&nbsp;
           	   <img id="sex_open_not_img" src="${ctx}/images/open_not.png" />
           	   <span class="span_open" id="sex_open_not" onclick="isopen(this,0)">不公开</span>
            </td>
          </tr>
             <tr>
            <td height="42" align="right" class="lable_title">出生日期：</td>
            <td height="30">
            <input  type="text" id="txtBirthDay" size="25"   class="Wdate" onFocus="WdatePicker({})"/>
            <img id="birthdate_open_img" src="${ctx}/images/open.png" />
           	   <span class="span_open" id="birthdate_open" onclick="isopen(this,1)" >公开</span>&nbsp;
           	   <img id="birthdate_open_not_img" src="${ctx}/images/open_not.png" />
           	   <span class="span_open" id="birthdate_open_not" onclick="isopen(this,0)">不公开</span>
            </td>
          </tr>
           <tr>
            <td height="42" align="right" class="lable_title">QQ号码：</td>
            <td height="42">
            <input type="text" id="txtQqnumber" value="${user.qqNumber}"/>
            <img id="qq_open_img" src="${ctx}/images/open.png" />
           	   <span class="span_open" id="qq_open" onclick="isopen(this,1)">公开</span>&nbsp;
           	   <img id="qq_open_not_img" src="${ctx}/images/open_not.png" />
           	   <span class="span_open" id="qq_open_not" onclick="isopen(this,0)">不公开</span>
            </td>
          	</tr>
          
        
           <tr>
            <td height="42" align="right" class="lable_title">星座：</td>
            <td height="30">
             <select id="sel_constellation">
                <option value="1">白羊座</option>
                <option value="2">金牛座</option>
                <option value="3">双子座</option>
                <option value="4">巨蟹座</option>
                <option value="5">狮子座</option>
                <option value="6">处女座</option>
                <option value="7">天秤座</option>  
                <option value="8">天蝎座</option>
                <option value="9">射手座</option>
                <option value="10">摩羯座</option>
                <option value="11">水瓶座</option>
                <option value="12">双鱼座</option>
            </select>
            </td>
          </tr>
           <tr>
            <td height="42" align="right" class="lable_title">血型：</td>
            <td height="42">
              <select id="sel_bloodType">
               <option value="A">A</option>
               <option value="B">B</option>
               <option value="AB">AB</option>
               <option value="O">O</option>
            </select>
            </td>
          </tr>
        </table>
            </td>
            <td width="50%">
            <table width="90%"  align="right" border="0" cellspacing="0" cellpadding="0" style="padding-top:15px;">
            <tr>
           
            </tr>
            <tr>
            <td height="42" align="right" class="lable_title">工作地址：</td>
            <td height="30"><input type="text" id="txtWorkAddress" value="${user.workAddress}"/></td>
          	</tr>
          <tr>
            <td height="42" align="right" class="lable_title">公司名称：</td>
            <td height="30"><input type="text" id="txtCompanyName" value="${user.companyName}"/></td>
          	</tr>
          	 <tr>
            <td height="42" align="right" class="lable_title">新浪微博：</td>
            <td height="42">
            <input type="text" id="txtSinaurl" value="${user.sinaUrl}"/>
            <img id="sina_open_img" src="${ctx}/images/open.png" />
           	   <span class="span_open" id="sina_open" onclick="isopen(this,1)">公开</span>&nbsp;
           	   <img id="sina_open_not_img" src="${ctx}/images/open_not.png" />
           	   <span class="span_open" id="sina_open_not" onclick="isopen(this,0)">不公开</span>
            </td>
          	</tr>
          	 <tr>
            <td height="42" align="right" class="lable_title">证件类型：</td>
            <td height="42">
		      <select id="sel_idCardType">
             <option value="I1">身份证</option>
             <option value="I2">军官证</option>
            </select>
            </td>
          </tr>
          	<tr>
            <td height="42" align="right" class="lable_title">证件编号：</td>
            <td height="42"><input type="text" id="txtIdCardNo" size="25" /></td>
          </tr>
         
          <tr>
            <td height="50" align="left" style="padding-left:10px;" colspan="2" class="lable_title">说明：身份证号可用于预定飞机票</td>
          </tr>
          	</table>
           
            </td>
          </tr>
         </table>
  
  </div>
  </div>
  </div> 
 
 
<div id="step4"  style="position:relative;padding:10px 25px 0 25px;">
  <div>
    <div style="float:left; width:950px; background-color:#FFF;border-bottom:#57ae97 solid 2px;">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
              <td width="20%" height="54" style="font-weight:bold; padding-left:20px;font-size:16px;">我的标签</td>
               <td  width="80%" align="right" style="padding-right:20px;">
               <span  class="button-caohejing"  onclick="add_userTag()">&nbsp;&nbsp;添加标签 &nbsp;&nbsp;</span>
               <span  class="button-caohejing"  onclick="del_userTag()">&nbsp;&nbsp;删除标签&nbsp;&nbsp;</span>
               </td>
               </tr>
           </table>
       <table id="table_user_tag"  align="center" style="width:910px;margin-left:20px;"  border="0" cellspacing="0" cellpadding="0">
          
      </table>
     
    </div>
   </div>
     
 </div>
 
 
 <div style="clear:both;position:relative;height:240px; padding:10px 25px 0 25px;">
   <div>
    <div style="float:left; width:425px; height:230px;border-bottom:#57ae97 solid 2px;background:#fff;">
     <table   border="0" cellspacing="0" cellpadding="0"  width="100%">
       <tr>
          <td height="51" style="padding-left:14px; font-weight:bold;font-size:16px;">
			标签分类选择
		 </td>
		 <td width="30%" align="right" style="padding-right:20px;">
		  <span  class="button-caohejing"  onclick="saveUserLableType()">保存</span>         
		  </td>
        </tr>
         <tr>
          <td colspan="2">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
          <td height="51" style="padding-left:30px; font-size:16px;">
          <label>
			<input type="radio"   style="vertical-align:middle;height:24px;width:24px;background:url(${ctx}/images/ddd.png)" name="radioLable"  value="0" id="radioLable0"/>
			<span class="lable_title">全部</span>
		  </label>
		  </td>
        </tr>
         <tr>
          <td height="51" style="padding-left:30px; font-size:16px;">
			  <label><input type="radio"  style="vertical-align:middle;height:24px;width:24px;background:url(${ctx}/images/ddd.png)" name="radioLable" value="1" id="radioLable1"/>
			<span class="lable_title">企业</span></label>
		  </td>
        </tr>
        <tr>
          <td height="51" style="padding-left:30px; font-size:16px;">
			  <label><input type="radio"  style="vertical-align:middle;height:24px;width:24px;background:url(${ctx}/images/ddd.png)" name="radioLable" value="2" id="radioLable2"/>
			<span class="lable_title">白领</span></label>
		  </td>
        </tr>
        </table>
        </td>
        </tr>
     </table>
     </div>
     <div style="float:left; width:517px;margin-left:8px; height:230px;border-bottom:#57ae97 solid 2px;background:#fff;">
      <table align="left" border="0" cellspacing="0" cellpadding="0">
         <tr>
          <td height="51" style="padding-left:14px; font-weight:bold;font-size:16px;">
			绑定漕河泾一卡通
		  </td>
        </tr>
         <tr>
         <td id="chjCard">
         <c:choose>
         <c:when test="${empty user.shandCardno||user.shandCardno==''}">         
          <table  border="0" cellspacing="10px" cellpadding="0" style="margin-left:32px;">
        
          <tr>
          <td width="135px" align="right">
			<span class="lable_title">漕河泾一卡通卡号：</span>
		  </td>        
          <td width="225px">
			<input type="text" onblur="check_Cardno()" name="txtCardno" value="${user.shandCardno}" id="txtCardno" style="width:220px;"/>
		</td>
        </tr>
         <tr><td colspan="2" align="right" style="padding: 5px 10px;">
         <span id="spanSecond" style="color:red;"></span>
         <span id="spanTimeInfo" style="display:none;">&nbsp;秒后点击重新发送&nbsp;</span>
       
        <span class="button-caohejing" style="padding: 5px 20px;" onclick="send_phone_code()">发送验证码</span>
        
         </td>
          </tr>
          <tr>
          <td height="30" align="right"><span class="lable_title">输入验证码：</span></td>
          <td><input type="text" id="txtCode" style="width:220px;"/></td>
        </tr>
        <tr>
          <td colspan="2"  style="padding: 15px 40px;">
            <span  class="button-caohejing"  onclick="save_txtCardno()" style="padding: 8px 60px;">确认</span>   
		  </td>
        </tr>
        </table>        
         </c:when>
         <c:otherwise>
         <div style="margin: 20px 0 0 35px;">
         <p><span class="lable_title">已绑定漕河泾一卡通卡号：</span></p>  
         <br />       
         <p><span class="lable_title" style="font-size: 20px;">${user.shandCardno}</span></p>
         <br />
         <p><span  class="button-caohejing" onclick="delete_txtCardno()" style="padding: 8px 20px;">取消绑定</span></p>
         </div>
         </c:otherwise>
         </c:choose>
        </td>
        </tr>
      </table>
    </div>
   </div>
 </div>
 
 <div style="display:none; position:relative;height:260px; padding:0px 25px 0 25px;">
   <div>
    <div style="float:left; width:950px; height:260px;border-bottom:#57ae97 solid 2px;background:#fff;">
      <table align="right" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="51" style="padding-left:20px; font-weight:bold;font-size:16px; ">第三方帐号绑定</td>
        </tr>
        <tr>
          <td height="40" valign="top" style="padding-left:32px; color:#be8f01;font-size:16px;">绑定第三方帐号，可以直接登录，还可以将内容同步到以下平台，与更多好友分享。<br />
          </td>
        </tr>
        <tr>
          <td style="padding-left:20px;"><table width="95%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="17%" align="center"><img src="${ctx}/images/personal_set10.png" width="64" height="59" /></td>
                  <td width="34%" align="center">
                  <span  class="button-caohejing"  onclick="">&nbsp;&nbsp;绑定新浪微薄&nbsp;&nbsp;</span>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="18%" align="center"><img src="${ctx}/images/personal_set11.png" width="57" height="51" /></td>
                  <td width="29%">
					<span  class="button-caohejing"  onclick="">&nbsp;&nbsp;&nbsp;绑定qq空间&nbsp;&nbsp;&nbsp;</span>
					</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td height="27"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="51%" style="border-bottom:#CCC solid 1px;"></td>
                  <td width="2%">&nbsp;</td>
                  <td width="47%" style="border-bottom:#CCC solid 1px;"></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="17%" align="center"><img src="${ctx}/images/personal_set14.png" width="60" height="35" /></td>
                  <td width="34%" align="center">
                  <span  class="button-caohejing"  onclick="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;绑定人人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                  </td>
                  <td width="2%">&nbsp;</td>
                  <td width="18%" align="center"><img src="${ctx}/images/personal_set12.png" width="58" height="56" /></td>
                  <td width="29%"><span  class="button-caohejing"  onclick="">&nbsp;&nbsp;绑定腾讯微博&nbsp;&nbsp;</span></td>
                </tr>
              </table></td>
            </tr>            
          </table>
          </td>
        </tr>
      </table>
    </div>
   </div>
 </div>
 
    

  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-bottom:#57ae97 solid 2px;background:#fff;width:950px;margin:0px 25px 0 25px;">
              <tr>
              <td  width="50%" height="34" style="font-weight:bold; padding-left:20px;font-size:16px;">
              	配送地址管理
              	
              </td>
              <td  align="right" style="padding-right:20px;padding-top:20px;">
              <span  class="button-caohejing"  onclick="addUserAddress()">&nbsp;&nbsp;添加地址&nbsp;&nbsp;</span>
               <span  class="button-caohejing"  onclick="select_address()">&nbsp;&nbsp;设置默认地址&nbsp;&nbsp;</span>
              </td>
              
               </tr>
                <tr>
               <td colspan="2" >
               <br/>
               </td>
               </tr>
               <tr>
               <td colspan="2" >
               <form id="form_address">
               <input type="hidden" name="userAddress.addressDetail" id="hiddenAddressDetail"/>
               <table id="table_addaddress" width=600" border="0" cellspacing="4" cellpadding="0" style="margin-left:40px;display:none;padding-top:15px;">
 <tr>
 <td  class="lable_title" style="text-align: right;>">所属区域&nbsp;&nbsp;</td> <td><select name="userAddress.parentArea" onchange="select_area(this)" id="select_areafirst"></select></td>
 </tr>
 <tr>
 <td  class="lable_title" style="text-align: right;>">下属区域&nbsp;&nbsp;</td>
  <td width="400">
 <select name="userAddress.childArea" id="select_areathree"></select>
  <span id="spanAddressDetail" class="lable_title" ></span>
  </td>
 </tr> 
 <tr>
 <td  class="lable_title" style="text-align: right;>">具体地址&nbsp;&nbsp;</td> 
 <td><input name="userAddress.address" id="insert_address"/>
 <span style="color:red;">*</span><span id="spanAddress" class="lable_title" >0/50</span></td>
 </tr>
  <tr>
 <td  class="lable_title" style="text-align: right;>">公司名称&nbsp;&nbsp;</td>
  <td><input name="userAddress.companyName" id="insert_companyName"/>
  <span id="spanCompanyName" class="lable_title" >0/50</span></td>
 </tr>
  <tr>
 <td  class="lable_title"  style="text-align: right;">联系人&nbsp;&nbsp;</td> 
 <td><input name="userAddress.name" id="insert_linkman"/>
 <span style="color:red;">*</span><span id="spanLinkman" class="lable_title" >0/50</span></td>
 </tr>
  <tr>
 <td  class="lable_title"  style="text-align: right;">移动电话&nbsp;&nbsp;</td> 
 <td><input name="userAddress.phone" id="insert_phone"/>
 <span style="color:red;">*</span><span id="spanPhone" class="lable_title" >0/50</span></td>
 </tr>
  <tr>
 <td  class="lable_title"  style="text-align: right;">邮编&nbsp;&nbsp;</td> 
 <td><input name="userAddress.postCode" id="insert_zipcode"/>
 <span id="spanZipcode" class="lable_title" >0/15</span>
 </td>
 </tr>
  <tr>
 <td  align="left" colspan="2" style="padding-left:140px;padding-top:10px;" >
  <span  class="button-caohejing"  onclick="sure_address()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;确认&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <span  class="button-caohejing"  onclick="$('#table_addaddress').hide();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;取消&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
  </td>
 </tr>
 <tr>
 <td><br/></td>
 </tr>
 </table>
 </form>
               </td>
               </tr>
               <tr>
               <td colspan="2">
                <table width="100%" id="table_address" cellspacing="4" cellpadding="0">
            
            </table>
               </td>
               </tr>
              
            <tr>
            <td><br/></td>
            </tr>
   </table>



             
  <div style="position:relative; padding:10px 25px 0 25px;">
       &nbsp; <br/>
    </div>
     
     
  
  <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>


 
 
 

</body>
</html>
 <script type="text/javascript">
var areaList=[];
$(document).ready(function(){
	initInput('insert_address','spanAddress','',50);
	initInput('insert_linkman','spanLinkman','',50);
	initInput('insert_phone','spanPhone','',50);
	initInput('insert_zipcode','spanZipcode','',15);
	initInput('insert_companyName','spanCompanyName','',50);
	
	
		$('#txtFirstName').val('${user.firstName}');
		$('#txtLastName').val('${user.lastName}');
		$('#sel_sex').val('${user.sex}');
		$('#sel_idCardType').val('${user.idCardType}');
		$('#txtIdCardNo').val('${user.idCardNo}');
		$('#sel_bloodType').val('${user.blood}');
		$('#sel_constellation').val('${user.constellation}');
		$('#txtBirthDay').val('${user.birthDate}');
		if('${user.headPicture}' != "")
		   $('#userHeadImgSet').attr('src', '${imageStorePath}${user.headPicture}');
	
		$("#radioLable${user.lableType}").attr("checked", true);
	     if('${user.realnameOpen}' !='T'){
	    	 $('#rlname_open_img').attr('src','${ctx}/images/open_not.png');
	    	 $('#rlname_open_not_img').attr('src','${ctx}/images/open.png');
	     }
	     if('${user.sexOpen}' !='T'){
	    	 $('#sex_open_img').attr('src','${ctx}/images/open_not.png');
	    	 $('#sex_open_not_img').attr('src','${ctx}/images/open.png');
	     }
	     if('${user.birthdateOpen}' !='T'){
	    	 $('#birthdate_open_img').attr('src','${ctx}/images/open_not.png');
	    	 $('#birthdate_open_not_img').attr('src','${ctx}/images/open.png');
	     }
	     if('${user.qqnumberOpen}' !='T'){
	    	 $('#qq_open_img').attr('src','${ctx}/images/open_not.png');
	    	 $('#qq_open_not_img').attr('src','${ctx}/images/open.png');
	     }
	     if('${user.sinaurlOpen}' !='T'){
	    	 $('#sina_open_img').attr('src','${ctx}/images/open_not.png');
	    	 $('#sina_open_not_img').attr('src','${ctx}/images/open.png');
	     }
	   
		
		 // 创建AJAX方式上传文件
        var $uploadBtn = $("#upload");
        new AjaxUpload($uploadBtn, {
            action: '${ctx}/user!userHeadImgUpload.action',
            name: 'headImg',
            responseType:'json',
            onSubmit: function(file, ext){
                  //ext 文件后缀
                  if(ext !='png'  && ext !='jpg' && ext !='jpeg' && ext !='PNG'&& ext !='JPG'
                	  && ext !='JPEG'){
                	  alert('请选择.png,jpg,jpeg的图片文件!');
                	  return false;
                  }
		    },
            onComplete: function(file, response){
            	if(response.status == 200){
            		  $('#userHeadImgSet').attr('src', '${imageStorePath}'+response.msg);
            		  $('#userHeadImg').attr('src', '${imageStorePath}'+response.msg);  
            	  }
            	  else{
            		  alert(response.msg);
            	  }
           
            }
        });
        
        
        findAllLable();
        loadUserAddress();
        
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
});
var diag=null;
function add_userTag(){
	diag = new Dialog();
	diag.Width = 1000;
	diag.Height = 500;
	diag.Title = "添加标签";
	diag.URL = "${ctx}/user!adduserTagPage.action";
	diag.show();
	
	
}
var dataSecond=[];
function select_area(obj){
		
		if($(obj).val().length>0){
			var array=[];
			dataSecond= areaList[$(obj).val()];
			var detailed_address='';
			for(var i=0;i<dataSecond["childList"].length;i++){
				if(i==0)
					detailed_address=dataSecond["childList"][i]["detailed_address"];
				array.push('<option value="'+dataSecond["childList"][i]["area_id"]+'">'+dataSecond["childList"][i]["area_name"]+'</option>');
			}
			$('#select_areathree').html(array.join(''));
			$('#spanAddressDetail').html(detailed_address);
			$('#select_areathree').change(function(){ 
				var detailed_address='';
				
				var selectData = $(this).children('option:selected').val();
				for(var i=0;i<dataSecond["childList"].length;i++){
					if(dataSecond["childList"][i]["area_id"]==selectData){
						detailed_address=dataSecond["childList"][i]["detailed_address"];
						break;
					}
				}
				$('#spanAddressDetail').html(detailed_address);
			});
		}
		else{
			$('#select_areathree').html('');
		}	
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
function save_userinfo(){
	if($.trim($('#txtNickName').val()).length == 0){
		alert('请输入昵称!');
		return;
	}
	var param={"userParam.info":$.trim($('#txtInfo').val())};
	param["userParam.nickName"] = $.trim($('#txtNickName').val());
	param["userParam.city"] = $.trim($('#txtCity').val());
	param["userParam.myWeburl"] = $.trim($('#txtMyWeburl').val());
	
	$.ajax({
	    type: "POST",
	    url : '${ctx}/user!KeywordFliter.action',
	    dataType:'json',
	    data:{word:param["userParam.info"]+param["userParam.nickName"]+param["userParam.city"]+param["userParam.myWeburl"]},
	    beforeSend: function(){
	    	show_loading();
	    },
	    success: function(msg,status){
	    	
	    	if(msg.status==200){
	    		if(msg.rows.length>0){
	    			if(loadding_dialog!=null){
	    	    		loadding_dialog.close();
	    	    	}
	    			alert('您提交的内容含有敏感词:'+msg.rows.join(','));
	    		}
	    		else{
	    			$.ajax({
	    			     type: "POST",
	    			     url : context+'/user!updateUserBasicInfo.action',
	    			     dataType:'json',
	    			     data:param,
	    			     success: function(msg,status){
	    			    	if(msg.status == 200){
	    			    		alert('修改成功!');
	    			    		
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

function save_userDetailInfo(){

	var param={"userParam.firstName":$.trim($('#txtFirstName').val())};
	param["userParam.lastName"] = $.trim($('#txtLastName').val());
	param["userParam.workAddress"] = $.trim($('#txtWorkAddress').val());
	param["userParam.companyName"] = $.trim($('#txtCompanyName').val());
	param["userParam.qqNumber"] = $.trim($('#txtQqnumber').val());
	param["userParam.sinaUrl"] = $.trim($('#txtSinaurl').val());
	param["userParam.sex"] = $('#sel_sex').val();
	param["userParam.idCardType"] =$('#sel_idCardType').val();
	param["userParam.idCardNo"] = $.trim($('#txtIdCardNo').val());
	param["userParam.blood"] = $('#sel_bloodType').val();
	param["userParam.constellation"] = $('#sel_constellation').val();
	param["userParam.birthDate"] = $('#txtBirthDay').val();
	
	if($('#rlname_open_img').attr('src').indexOf('open_not')!=-1){
		param["userParam.realnameOpen"] ="F";
	}
	else{
		param["userParam.realnameOpen"] ="T";
	}
	
	if($('#sex_open_img').attr('src').indexOf('open_not') != -1){
		param["userParam.sexOpen"] ="F";
	}
	else{
		param["userParam.sexOpen"] ="T";
	}
	
	if($('#birthdate_open_img').attr('src').indexOf('open_not') != -1){
		param["userParam.birthdateOpen"] ="F";
	}
	else{
		param["userParam.birthdateOpen"] ="T";
	}
	
	if($('#qq_open_img').attr('src').indexOf('open_not') != -1){
		param["userParam.qqnumberOpen"] ="F";
	}
	else{
		param["userParam.qqnumberOpen"] ="T";
	}
	
	if($('#sina_open_img').attr('src').indexOf('open_not') != -1){
		param["userParam.sinaurlOpen"] ="F";
	}
	else{
		param["userParam.sinaurlOpen"] ="T";
	}
	
	$.ajax({
	    type: "POST",
	    url : '${ctx}/user!KeywordFliter.action',
	    dataType:'json',
	    data:{word:param["userParam.idCardNo"]+param["userParam.lastName"]+param["userParam.firstName"]+param["userParam.workAddress"]+param["userParam.companyName"]+param["userParam.qqNumber"]+param["userParam.sinaUrl"]},
	    beforeSend: function(){
	    	show_loading();
	    },
	    success: function(msg,status){
	    	
	    	if(msg.status==200){
	    		if(msg.rows.length>0){
	    			if(loadding_dialog!=null){
	    	    		loadding_dialog.close();
	    	    	}
	    			alert('您提交的内容含有敏感词:'+msg.rows.join(','));
	    		}
	    		else{
	    			 $.ajax({
	    			     type: "POST",
	    			     url : context+'/user!updateUserDetailInfo.action',
	    			     dataType:'json',
	    			     data:param,
	    			     success: function(msg,status){
	    			    	
	    			    	if(msg.status == 200){
	    			    		alert('修改成功!');
	    			    		$('#userHeadImgSet').attr('src','${ctx}'+msg.msg);
	    			    		$('#userHeadImg').attr('src', '${ctx}'+msg.msg);  
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

function saveUserPassword(){
	if(!isPassword($.trim($('#txtPasswordOld').val()))){
		alert('密码格式不正确!');
		return;
	}
	if(!isPassword($.trim($('#txtPasswordNew').val()))){
		alert('密码格式不正确!');
		return;
	}
	var passnew = $.trim($('#txtPasswordNew').val());
	var passnewsure =  $.trim($('#txtPasswordNewSure').val());
	if(passnew != passnewsure){
		alert('两次输入密码不一致!');
	}
	else{
		 $.ajax({
		     type: "POST",
		     url : '${ctx}/user!updateUserPassword.action',
		     dataType:'json',
		     data:{passwordOld:$('#txtPasswordOld').val(),password:passnew},
		     success: function(msg,status){
		    	if(msg.status == 200){
		    		alert('修改成功!');
		    	}
		    	else{
		    		alert(msg.msg);
		    	}
			 } 
		});
		 
		
	}
}
function saveUserLableType (){
	var lableType='';
	$("input[name=radioLable]:radio").each(function() { 
		if($(this).attr("checked"))
			lableType=$(this).attr("value");               
	});
	if(lableType==''){
		alert('选择分类');
		return;
	}
	
	$.ajax({
	     type: "POST",
	     url : context+'/user!updateUserLableType.action',
	     dataType:'json',
	     data:{labelType:lableType},
	     success: function(msg,status){
	    	if(msg.status == 200){
	    		alert('修改成功!');
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
		 } 
	});
}
function isopen(obj,type){
	if(type == 1){
		$('#'+$(obj).attr('id')+'_img').attr('src','${ctx}/images/open.png');
		$('#'+$(obj).attr('id')+'_not_img').attr('src','${ctx}/images/open_not.png');
	}
	else{
		$('#'+$(obj).attr('id')+'_img').attr('src','${ctx}/images/open.png');
		$('#'+$(obj).attr('id').replace('_not','_img')).attr('src','${ctx}/images/open_not.png');
	}
}

var allLable=[];
var pageinfo={size:3,page:0,tp:0,t:0};
function findAllLable(){
	 $.ajax({
	     type: "POST",
	     url : context+'/user!findUserLableList.action',
	     dataType:'json',
	     data:{},
	     success: function(msg,status){
	    	if(msg.status == 200){
	    		allLable = msg.rows;
	    		var tagFirst =[];
	    		for(var i=0;i<allLable.length;i++){
		             tagFirst.push('<td id="tagFirst'+i+'" onclick="initTagSecond('+i+')" class="lable_title" align="center" style="cursor:pointer;width:40px;padding:2px 4px;border-bottom:1px solid #ccc;">'+allLable[i]["tagName"]+'</td>');
	    		}
	    		 var str ='<tr>'+
	             '<td width="40" style="border-bottom:1px solid #ccc;">&nbsp;</td>'+
	             tagFirst.join('')+
	             '<td style="width:'+(910-(tagFirst.length+1)*40)+'px;border-bottom:1px solid #ccc;">&nbsp;</td>'+
	             '</tr>'+
	              '<tr>'+
	              '<td  width="40" align="center"  valign="middle" class="lable_title" style="padding:4px 0;">二级</td>'+
	              '<td id="td_tag_second" colspan="'+(tagFirst.length+1)+'" ></td>'+
	              '</tr>'+
	              '<tr><td style="border-bottom:1px solid #ccc;"></td><td  style="border-bottom:1px solid #ccc;"  height="10" colspan="'+(tagFirst.length+1)+'">&nbsp;</td></tr>'+
	               '<tr>'+
	               '<td  width="40" align="center"  valign="middle" class="lable_title" style="padding:4px 0px;">三级</td>'+
	               '<td id="td_tag_three" colspan="'+(tagFirst.length+1)+'" style="border-bottom:0px solid #ccc;"></td>'+
	               '</tr>'+
	               '<tr><td></td><td   height="10" colspan="'+(tagFirst.length+1)+'">&nbsp;</td></tr>';
	    		  $('#table_user_tag').html(str);
	    		  initTagSecond(0);
	    	}
	    	else
	    		alert('没有标签!');
		 } 
	});
}
var color=[['#f5bca9','#fb855e'],['#8182f8','#4949fe']];
function initTagSecond(index){
	for(var i=0;i<allLable.length;i++){
		if(index == i){
			$('#tagFirst'+index).css({
				"border":"1px solid #ccc",
				 "border-bottom":"0px solid #ccc"
			});
		}
		else{
			$('#tagFirst'+i).css({
				"border":"0px solid #ccc",
				 "border-bottom":"1px solid #ccc"
			});
		}
	}
	
	var array=[];
	array.push('<ul class="myLableMenue" id="myLableMenue'+index+'">');
	for(var j=0;j<allLable[index]["childTags"].length;j++){
		array.push('<li onclick="initTagThree('+index+','+j+')" id="lable'+index+'_'+j+'"  style="background-color:'+color[0][0]+';"><div id="'+allLable[index]["childTags"][j]["tagId"]+'" class="lable" >'+allLable[index]["childTags"][j]["tagName"]+'</div></li>');
	}
	$('#td_tag_second').html(array.join('')+'</ul>');
	$('#td_tag_three').html('');
}
var selected_tag_second='';
function initTagThree(index,j){
	selected_tag_second ='myLableMenue'+index+''+j;
	
	 var id='lable'+index+'_'+j;
	$('#myLableMenue'+index).find('li').each(function(indexLi,obj){
		 if(id==$(this).attr("id")){
			 $(this).css({"background":color[0][1]});
		 }
		 else{
			 $(this).css({"background":color[0][0]});
		 }
	});
	
	var array=[];
	array.push('<ul class="myLableMenue" id="myLableMenue'+index+''+j+'">');
	for(var h=0;h<allLable[index]["childTags"][j]["childTags"].length;h++){
		array.push('<li onclick="click_threetag('+index+','+j+','+h+')" id="lable'+index+'_'+j+'_'+h+'"  style="background-color:'+color[1][0]+';"><div id="'+allLable[index]["childTags"][j]["childTags"][h]["tagId"]+'" class="lable" >'+allLable[index]["childTags"][j]["childTags"][h]["tagName"]+'</div></li>');
	}
	$('#td_tag_three').html(array.join('')+'</ul>');
}
function click_threetag(index,j,h){
	 var id='lable'+index+'_'+j+'_'+h;
	 if($('#'+id).getHexBackgroundColor() == color[1][1]){
		 $('#'+id).css({"background":color[1][0]});
	 }
	 else{
		 $('#'+id).css({"background":color[1][1]});
	 }
	
}
function del_userTag(){
	var array=[];
		var liarray = $('#'+selected_tag_second).find('li');
		for(var j=0; j<liarray.length; j++){
			var div = $(liarray[j]).find('div')[0];
			if($($(liarray[j])).getHexBackgroundColor()==color[1][1]){
				array.push($(div).attr("id"));
			}
	}
	
	if(array.length == 0){
		alert('请选择标签!');
	}
	else{
		$.ajax({
		     type: "POST",
		     url : context+'/user!delUserTags.action',
		     dataType:'json',
		     data:{tagIds:array.join(',')},
		     success: function(msg,status){
		    	if(msg.status == 400){
		    		alert(msg.msg);
		    	}
		    	else{
		    		alert('删除成功!');
		    		 allLable=[];
		    		 pageinfo={size:7,page:0,tp:0,t:0};
		    		 $('#table_lable').html('');
		    		 findAllLable();
		    	}
		    		
			 } 
		});
	}
}
function initLableSelFunction(){
	$('.myLableMenue').find("li").toggle( function () {
		
		   var array= $(this).attr("id").replace('lable','').split('_');
			if(array[1]==1){//全选
				$('#myLableMenue'+array[0]).find("li").find("div").addClass('lable_ok');
				$('#myLableMenue'+array[0]).find("li").find("div").removeClass('lable');
				$(this).find("div").removeClass("lable_ok"); 
				$(this).find("div").addClass('lable'); 
			}
			else{
				$(this).find("div").removeClass("lable"); 
				$(this).find("div").addClass('lable_ok'); 
			}
				
			
		}, function () {
			var array=$(this).attr("id").replace('lable','').split('_');
			if(array[1]==1){//全选
				$('#myLableMenue'+array[0]).find("li").find("div").removeClass('lable_ok');
				$('#myLableMenue'+array[0]).find("li").find("div").addClass('lable');
			}
			else{
				$(this).find("div").addClass("lable"); 
				$(this).find("div").removeClass("lable_ok"); 
			}
				
	});
}

function loadMoreLable(){
	pageinfo["page"]++;
	 if(pageinfo["page"]==pageinfo["tp"]){
		   $('#loadMoreLable').hide();
		  // $('#step4').height(pageinfo["t"]*60+80+pageinfo["t"]*40);
	 }
	// else
	 	//$('#step4').height(pageinfo["page"]*pageinfo["size"]*60+80+pageinfo["page"]*pageinfo["size"]*40);
	 
	 var array=[];
	for(var i=(pageinfo["page"]-1)*pageinfo["size"];i<pageinfo["t"]&&i<pageinfo["page"]*pageinfo["size"];i++){
		pageinfo["rowpginfo"+i]={size:7,page:0,tp:0,t:0};
		pageinfo["rowpginfo"+i]["t"]=allLable[i]["childTags"].length;
		if(pageinfo["rowpginfo"+i]["t"]%pageinfo["rowpginfo"+i]["size"]==0)
			pageinfo["rowpginfo"+i]["tp"]=pageinfo["rowpginfo"+i]["t"]/pageinfo["size"];
		else
			pageinfo["rowpginfo"+i]["tp"]=Math.ceil(pageinfo["rowpginfo"+i]["t"]/pageinfo["rowpginfo"+i]["size"]);
		
		pageinfo["rowpginfo"+i]["page"]++;
		array.push('<tr><td  class="lable_title" style="border-bottom:1px solid #ccc;">'+allLable[i]["tagName"]+'</td>');
		array.push('<tr><td><ul class="myLableMenue" id="myLableMenue'+i+'">');
		for(var j=0;j<allLable[i]["childTags"].length&j<pageinfo["rowpginfo"+i]["size"];j++){
			array.push('<li id="lable'+i+'_'+(j+2)+'"  style="background:'+color[i%4][1]+'"><div id="'+allLable[i]["childTags"][j]["tagId"]+'" class="lable" >'+allLable[i]["childTags"][j]["tagName"]+'</div></li>');
		}
		if(allLable[i]["childTags"].length>pageinfo["rowpginfo"+i]["size"]){
			array.push('<li style="padding-top:10px;height:30px;background:'+color[i%4][1]+'" >');
			array.push('<img src="${ctx}/images/lable_l.png" height=20 onclick="preLable('+i+')"/>');
			array.push('<img src="${ctx}/images/lable_r.png" height=20 onclick="nextLable('+i+')"/>');
			array.push('</li>');
		}
		array.push('</ul></td></tr>');
		array.push('<tr><td><br/></td></tr>');
	}
	$('#table_lable').append(array.join(''));
	initLableSelFunction();
}
function preLable(row){
	if(pageinfo["rowpginfo"+row]["page"] > 1){
		pageinfo["rowpginfo"+row]["page"]--;
		showhorizontalLabe(row);
	}
		
}
function nextLable(row){
	if(pageinfo["rowpginfo"+row]["page"] < pageinfo["rowpginfo"+row]["tp"]){
		pageinfo["rowpginfo"+row]["page"]++;
		showhorizontalLabe(row);
	}
	
}

function showhorizontalLabe(row){

	var page = pageinfo["rowpginfo"+row]["page"];
	var  size = pageinfo["rowpginfo"+row]["size"];
	var t = pageinfo["rowpginfo"+row]["t"];
	
	var liarray = $('#myLableMenue'+row).find('li');

	var start = (page-1)*size;
	for(var j=start; j<page*size; j++){
		var div = $(liarray[j-start]).find('div')[0];
		if(j<t){
			$(liarray[j-start]).show();
			$(div).removeClass('lable_ok');
			$(div).addClass('lable');
			$(div).attr("id",allLable[row]["childTags"][j]["tagId"]);
			$(div).html(allLable[row]["childTags"][j]["tagName"]);
		}
		else{
			$(div).removeClass('lable_ok');
			$(div).addClass('lable');
			$(div).attr("id",'');
			$(div).html('');
			$(liarray[j-start]).hide();
		}
	}
}


function addUserAddress(){
	$('#table_addaddress').show();
}
function sure_address(){
	$('#hiddenAddressDetail').val($('#spanAddressDetail').html());
	var param = $('#form_address').form2json();
	
	
	if(param.userAddress["address"].length == 0){
		alert('输入地址!');
		return;
	}
	if(param.userAddress["name"].length == 0){
		alert('输入联系人!');
		return;
	}
	
	if(param.userAddress["phone"].length == 0){
		alert('输入移动电话!');
		return;
	}else if(!isPhone(param.userAddress["phone"])){
		alert('电话格式不正确!');
		return;
	}
	
	/**if(param.userAddress["postCode"].length == 0){
		alert('输入邮编!');
		return;
	}else if(!isPostCode(param.userAddress["postCode"])){
		alert('邮编格式不正确!');
		return;
	}*/
	
	param["userAddress"]["parentArea"]=$('#select_areafirst').find("option:selected").text();
	if(param["userAddress"]["parentArea"]=="请选择"){
		param["userAddress"]["parentArea"]="";
	}
	param["userAddress"]["childArea"]=$('#select_areathree').find("option:selected").text();
	param["userAddress"]["areaId"]=$('#select_areathree').find("option:selected").val();
	var userAddress={};
	$.each(param["userAddress"],function(key ,value){
		userAddress["userAddress."+key]=value;
	});
	$.ajax({
	    type: "POST",
	    url : '${ctx}/user!KeywordFliter.action',
	    dataType:'json',
	    data:{word:param.userAddress["companyName"]+param.userAddress["email"]+param.userAddress["address"]+param.userAddress["name"]+param.userAddress["phone"]},
	    beforeSend: function(){
	    	show_loading();
	    },
	    success: function(msg,status){
	    	
	    	if(msg.status==200){
	    		
	    		if(msg.rows.length>0){
	    			if(loadding_dialog!=null){
	    	    		loadding_dialog.close();
	    	    	}
	    			alert('您提交的内容含有敏感词:'+msg.rows.join(','));
	    		}
	    		else{	    		
	    			$.ajax({
	    			     type: "POST",
	    			     url : context+'/user!insertUserAddress.action',
	    			     dataType:'json',
	    			     data:userAddress,
	    			     success: function(msg,status){
	    			    	if(msg.status == 400){
	    			    		alert(msg.msg);
	    			    	}
	    			    	else{
	    			    		alert('添加成功!');
	    			    		$('#form_address').form('clear');
	    			    		$('#table_addaddress').hide();
	    			    		loadUserAddress();
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
function loadUserAddress(){
	
	$.ajax({
	     type: "POST",
	     url : context+'/user!loadUserAddress.action',
	     dataType:'json',
	     data:{},
	     success: function(msg,status){
	    	if(msg.status == 200){
	    		var array=[];
	    		for(var i=0; i <msg.rows.length;i++){
	    			if(msg.rows[i]["parentArea"].length>0){
	    				msg.rows[i]["parentArea"] = "&nbsp;"+msg.rows[i]["parentArea"];
	    			}
	    			if(msg.rows[i]["childArea"].length>0){
	    				msg.rows[i]["childArea"] = "&nbsp;"+msg.rows[i]["childArea"];
	    			}
	    			if(msg.rows[i]["address"].length>0){
	    				msg.rows[i]["address"] = "&nbsp;"+msg.rows[i]["address"];
	    			}
	    			var str1='<label>'+
	    			'<input type="radio" '+(msg.rows[i]["isSelected"]==2?'checked':'')+' style="vertical-align:middle;height:24px;width:24px;background:url(${ctx}/images/ddd.png)" name="radioAddress" value="'+msg.rows[i]["addressId"]+'"/>'+
	    			'</label>';
	    			var str ='<tr><td width="60%">'+str1+'&nbsp;地址'+(i+1)+':'+msg.rows[i]["parentArea"]+msg.rows[i]["childArea"]+msg.rows[i]["address"]+'</td><td>'+msg.rows[i]["name"];
	    			str +='</td><td>'+msg.rows[i]["phone"];
	    			str +='</td><td>'+msg.rows[i]["postCode"];
	    			str +='</td><td><a href="javascript:void(0)" onclick="del_address('+msg.rows[i]["addressId"]+')">删除</a></td></tr>';
	    			array.push(str);
	    		}
	    		$('#table_address').html('');
	    		$('#table_address').append(array.join(''));
	    		
	    	}
	    	
	    		
		 } 
	});
}
function del_address(id){
	
	window.confirm('您确定删除吗?',function(){
		$.ajax({
		     type: "POST",
		     url : context+'/user!deleteUserAddress.action',
		     dataType:'json',
		     data:{addressId:id},
		     success: function(msg,status){
		    	if(msg.status == 400){
		    		alert(msg.msg);
		    	}
		    	else{
		    		loadUserAddress();
		    	}
			 } 
		});
	});
	
}
function select_address(){
	var selVal = $('input[name="radioAddress"]:checked').val();
	if(selVal ==null || selVal.length==0){
		alert('请选择地址!');
		return;
	}
	
	$.ajax({
	     type: "POST",
	     url : '${ctx}/user!settingAddressSelected.action',
	     dataType:'json',
	     data:{addressId:selVal},
	     success: function(msg,status){
	    	if(msg.status == 200){
	    		alert('设置成功!');
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
		 } 
	});
}
function save_txtCardno(){
	var codeTxt=$.trim($('#txtCode').val());
	if(codeTxt==''){
		alert('');
		return;
	}	
	var shandCardno= $.trim($('#txtCardno').val());
	var pattern=/^\d{16,20}$/;
	if (!pattern.test(shandCardno)){
		alert("请输入正确卡号！");
		return;
	}	
	$.ajax({
		type: "POST",
	    url : '${ctx}/user!bindSandCardInfo.action',
	    dataType:'json',
	    data:{cardNo:shandCardno,code:codeTxt},
	    success: function(msg,status){
	    	 if(msg.status == 200){
		    	alert('绑定成功!');
		    	$('#chjCard').html('<div style="margin: 20px 0 0 35px;">'
		    	+'<p><span class="lable_title">已绑定漕河泾一卡通卡号：</span></p><br />'
		    	+'<p><span class="lable_title" style="font-size: 20px;">'
		    	+shandCardno+'</span></p><br /><p><span class="button-caohejing" '
		    	+'onclick="delete_txtCardno()" style="padding: 8px 20px;">取消绑定</span></p></div>');
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
	     }	
	});	
}

function delete_txtCardno(){
	window.confirm("您确定解除漕河泾一卡通卡号？",function(){
		$.ajax({
			type: "POST",
		    url : '${ctx}/user!unbindSandCard.action',
		    dataType:'json',
		    data:{},
		    success: function(msg,status){
		    	 if(msg.status == 200){
			    	alert('解除成功!');	
			    	location.reload();
		    	}
		    	else{
		    		alert(msg.msg);
		    	}
		     }	
		});			
	});
}

function send_phone_code(){		
	$('#spanTimeInfo').show();
	if(timeCount==60 || timeCount==0){
		timeCount=60;				
		$.ajax({
		     type: "POST",
		     url : context+'/user!findPhoneCode.action',
		     dataType:'json',
		     data:{},
		     success: function(msg,status){
		    	if(msg.status == 400){
		    		alert(msg.msg);
		    	}
		    	else{
		    		alert('验证码已发送到您手机上!');
		    	}			    		
			 } 
		});
		timeCountFun();
	}else{
		alert('时间未到!');
	}	
}

var timeCount=60;
function timeCountFun(){
	$('#spanSecond').html(timeCount);
	if(timeCount >0){		
		timeCount--;
		setTimeout('timeCountFun()',1000);
	}
}

function check_Cardno(){
	var shandCardno= $.trim($('#txtCardno').val());
	var pattern=/^\d{16,20}$/;
	if (!pattern.test(shandCardno)){
		alert("请输入正确卡号！");
		return false;
	}	
	$.ajax({
		type: "POST",
		async:false,
	    url : '${ctx}/common!querySandCardInfo.action',
	    dataType:'json',
	    data:{cardNo:shandCardno},
	    success: function(msg,status){
	    	if(msg.status == 200){
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
	     }	
	});
}

</script>

