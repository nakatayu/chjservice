<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
img{
cursor:pointer;
}
.main_content input{
border:0px;
height:30px;
width:227px;
padding-left:12px;
padding-top:2px;
background: url(${ctx}/images/input.png) no-repeat;
}
.main_content input:focus
 {
 background: url(${ctx}/images/input_focus.png) no-repeat;
}



.lable_ok{
cursor:pointer;
width:100px;height:60px;padding-top:30px;
background:url(${ctx}/images/lable_ok_b.png) no-repeat;
}
.lable{
width:100px;height:60px;padding-top:30px;
}
.myLableMenue{
text-align: center;
margin:0px;
background:red;
}
.myLableMenue li{    /*标签样式*/
	border:1px solid #ccc;
	color:#fff;
	text-align:center;
	float:left;
	font-size:16px;
	height:90px;
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
</style>
</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />

<div class="main">
<div id="main_content" class="main_content">
   
 
<div id="step1" style="position:relative; padding:10px 25px 0 25px;">
  <div>
    <div style="float:left; width:950px; height:430px; background-color:#FFF; border-bottom:#57ae97 solid 2px;">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30" style="padding:20px 0 0 20px; font-size:16px; font-family:'微软雅黑'; font-weight:bold;">用户密码找回</td>
        </tr>
        <tr>
          <td align="center"><form id="form1" name="form1" method="post" action="">
            <table width="40%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="41%" height="46" align="right" style="font-family:'微软雅黑';">账号：</td>
                <td width="59%">
                <input class="input-color" onblur="checkUser('phone',this)" 
                onkeyup="value=value.replace(/[^\d]/g,'') " type="text" value="已注册手机号" id="txtPhonenum" size="24" maxlength="24" /></td>
              </tr>
              <tr>
                <td height="40" colspan="2" align="right">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="74%" align="right" style="font-size:14px; font-family:'微软雅黑';"><span id="spanSecond" style="color:red;"></span><span id="spanTimeInfo" style="display:none;">&nbsp;秒后点击重新发送&nbsp;</span></td>
                    <td width="36%" align="right">
                    <span  class="button-caohejing"  onclick="send_code()">发送验证码</span>
                    </td>
                  </tr>
                </table></td>
                </tr>
              <tr>
                <td height="50" align="right" style="font-family:'微软雅黑';">验证码：</td>
                <td><input type="text" id="txtCode" size="24" maxlength="24" /></td>
              </tr>
              
              <tr>
                <td  height="40" colspan="2" align="right">
               
                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="74%" align="right" style="font-size:14px; font-family:'微软雅黑';">
                    </td>
                    <td width="36%" align="right">
                      <span class="button-caohejing"  onclick="checkCode()">&nbsp;&nbsp;下一步&nbsp;&nbsp;</span>
                    </td>
                  </tr>
                </table>
               </td>
              </tr>
            </table>
          </form></td>
        </tr>
      </table>
    </div>
   </div>
 </div> 
 
 
 
 
 <div id="step2" style="display:none;position:relative;padding:10px 25px 0 25px;">
  <div>
  <div style="float:left; width:950px; height:430px; background-color:#FFF; border-bottom:#57ae97 solid 2px;">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30" style="padding:20px 0 0 20px; font-size:16px; font-family:'微软雅黑'; font-weight:bold;">重置密码</td>
        </tr>
        <tr>
          <td align="center"><form id="form1" name="form1" method="post" action="">
            <table width="40%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="41%" height="46" align="right" style="font-family:'微软雅黑';">新密码：</td>
                <td width="59%">
               <input  type="password" id="txtPasswordNew" maxlength="120" />
               </td>
              </tr>
              <tr>
                <td width="30%"></td>
                <td width="70%" style="font-size:12px;">
               8-16个字符,英文字母(大小写)数字组合
               </td>
              </tr>
             
              <tr>
                <td height="50" align="right" style="font-family:'微软雅黑';">确认密码：</td>
                <td><input type="password" id="txtPasswordSure" maxlength="120"/></td>
              </tr>
              
              <tr>
                <td>&nbsp;</td>
                <td align="right">
                  <span  class="button-caohejing"  onclick="resetUserPassword()">&nbsp;&nbsp;确认&nbsp;&nbsp;</span>
                &nbsp;&nbsp;&nbsp;
                 </td>
              </tr>
            </table>
          </form></td>
        </tr>
      </table>
    </div>
    
    
     </div>
 </div>
 
 
 <div id="step3" style="display:none;position:relative;padding:10px 25px 0 25px;">
  <div>
    <div style="float:left; width:950px; height:150px; background-color:#FFF; border-bottom:#57ae97 solid 2px;">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30" style="text-align:center;padding:20px 0 0 20px; font-size:16px; font-weight:bold;">重置成功!请重新登录!</td>
        </tr>
        <tr>
          <td height="180" align="center">
         </td>
        </tr>
      </table>
    </div>
   </div>
 </div>
 
     
    
  
  <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>

</body>
</html>




<script type="text/javascript">

$(document).ready(function(){
	  
	initInputPhone('txtPhonenum','已注册手机号');
});

function initInputPhone(txtId,text){
	var title=document.getElementById(txtId);
	if(title!=null && title!= undefined){
		title.onfocus=function(){
			if(this.value ==text){
				this.value='';
				this.className='input-color-focus';
			}
			else
				this.className='input-color-focus';
			};
			title.onblur=function(){
			if(this.value==''){
			  this.value=text;
			  this.className='input-color';
			}
			else
				this.className='input-color-focus';
			};
	}
}
var timeCount=60;
function send_code(){
	if(isPhone($('#txtPhonenum').val())){
		
		if(timeCount==60 || timeCount==0){
			if(timeCount==0)
				timeCount=60;
			$.ajax({
			     type: "POST",
			     url : context+'/user!findPhoneCode.action',
			     dataType:'json',
			     data:{phonenum:$('#txtPhonenum').val(),register:0},
			     success: function(msg,status){
			    	if(msg.status != 200){
			    		alert(msg.msg);
			    	}
			    	else{
			    		alert('验证码已发送到您手机上!');
			    		$('#spanTimeInfo').show();
			    		timeCountFun();
			    	}			    		
				 } 
			});
			
		}else{
			alert('时间未到!');
		}
	}
	else{
		alert('手机格式不正确!');
	}
}

function checkUser(field,obj){
	if($.trim($(obj).val()).length==0){
		return;
	}
	 $.ajax({
	     type: "POST",
	     url : context+'/user!findUserByUniqueField.action',
	     dataType:'json',
	     data:{uniqueField:field,fieldValue:$(obj).val()},
	     success: function(msg,status){
	    	if(msg.status == 400){
	    		
	    	}
	    	else{
	    		alert('该手机号码尚未注册!');
	    		$(obj).val('');
	    	}
		 } 
	});
}
function checkCode(){
	
		 $.ajax({
		     type: "POST",
		     url : context+'/user!checkPhoneCode.action',
		     dataType:'json',
		     data:{phonenum:$.trim($('#txtPhonenum').val()),code:$.trim($('#txtCode').val())},
		     success: function(msg,status){
		    	if(msg.status == 200){
		    		alert('验证码通过!请进行下一步操作!');
		    		$('#step2').fadeIn(500);
		    		$('#step1').hide();
		    	}
		    	else
		    		alert('验证码不正确!');
			 } 
		});
	 
}
function resetUserPassword(){
	if(!isPassword($('#txtPasswordNew').val())){
		alert('密码格式不正确!');
		return;
	}
	var param={phonenum:$.trim($('#txtPhonenum').val())};
	param["password"] = $.trim($('#txtPasswordNew').val());
	param["code"]=$.trim($('#txtCode').val());
	$.ajax({
	     type: "POST",
	     url : context+'/user!resetUserPassword.action',
	     dataType:'json',
	     data:param,
	     success: function(msg,status){
	    	if(msg.status == 200){
	    	    $('#step2').hide();
	    		$('#step3').fadeIn(500);
	    		alert('重置成功!请重新登录!',function(){
	    			window.location.href="${ctx}";
	    		});
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
		 } 
	});
	
	
}
function timeCountFun(){
	$('#spanSecond').html(timeCount);
	if(timeCount >0){
		
		timeCount--;
		setTimeout('timeCountFun()',1000);
	}
}

</script>

