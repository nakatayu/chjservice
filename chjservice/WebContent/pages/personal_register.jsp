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
          <td height="30" style="padding:20px 0 0 20px; font-size:16px; font-family:'微软雅黑'; font-weight:bold;">用户手机验证</td>
        </tr>
        <tr>
          <td align="center"><form id="form1" name="form1" method="post" action="">
            <table width="40%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="41%" height="46" align="right" style="font-family:'微软雅黑';">手机号码：</td>
                <td width="59%"><input  onkeyup="value=value.replace(/[^\d]/g,'') " type="text" id="txtPhonenum" size="24" maxlength="24" /></td>
              </tr>
              <tr>
                <td height="58" colspan="2" align="right"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="77%" align="right" style="font-size:14px; font-family:'微软雅黑';"><span id="spanSecond" style="color:red;"></span><span id="spanTimeInfo" style="display:none;">&nbsp;秒后点击重新发送&nbsp;</span></td>
                    <td width="33%"><img src="${ctx}/images/registration_02.png" onclick="send_code()" width="93" height="30" /></td>
                  </tr>
                </table></td>
                </tr>
              <tr>
                <td height="50" align="right" style="font-family:'微软雅黑';">验证码：</td>
                <td><input type="text" id="txtCode" size="24" maxlength="24" /></td>
              </tr>
              
              <tr>
                <td>&nbsp;</td>
                <td align="right"><img src="${ctx}/images/registration_04.png" onclick="checkCode()"  width="93" height="30" /></td>
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
          <td height="30" style="padding:20px 0 0 20px; font-size:16px; font-weight:bold;">注册信息</td>
        </tr>
        <tr>
          <td align="center"><form id="form1" name="form1" method="post" action="">
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="41%" height="46" align="right">邮箱：</td>
                <td width="59%" align="left"><input onblur="checkUser('email',this)" type="text" id="txtEmail"  maxlength="120" /></td>
              </tr>
              <tr>
                <td height="46" align="right">昵称：</td>
                <td align="left"><input  type="text" id="txtNickName" maxlength="120"/></td>
              </tr>
              <tr>
                <td height="46" align="right">输入密码：</td>
                <td align="left"><input  type="password" id="txtPasswordNew" maxlength="120" />
                <span style="font-size:12px;">8-16个字符,英文字母(大小写)数字组合</span></td>
              </tr>
              <tr>
                <td height="46" align="right">确认密码：</td>
                <td align="left"><input type="password" id="txtPasswordSure" maxlength="120"/></td>
              </tr>
               <tr> <td height="46" align="right">&nbsp;</td>
               <td height="40"  align="left" style="font-size:12px;padding: 10px 20px 0 0;" valign="top">
              <input type="checkbox" style="width: 16px;height: 16px;vertical-align: middle;" id="cBox"/>
              <a href="${ctx}/pages/user_service.jsp?type=0" style="color: red;cursor:pointer;text-decoration: underline;">&nbsp;已阅读并同意《漕河泾e服务平台协议》</a>
              </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td align="left" style="padding-left:1px;padding: 10px 0 0 100px;">
                
                <img src="${ctx}/images/registration_03.png" onclick="registerfun()" width="93" height="30" /></td>
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
          <td height="30" style="padding:20px 0 0 20px; font-size:16px; font-weight:bold;">注册成功!</td>
        </tr>
        <tr>
          <td height="180" align="center">
          <table width="45%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="22%" height="46" align="center">
                <img src="${ctx}/images/registration_01.png" width="102" height="101" onclick="gotoPage('${ctx}/pages/personal_set.jsp')"/></td>
              <td width="78%" style="cursor:pointer;font-size:30px; font-family:'微软雅黑'; color:#57ae97; font-weight:bold;" onclick="gotoPage('${ctx}/pages/personal_set.jsp')">立即完善个人资料吧！</td>
            </tr>
          </table></td>
        </tr>
      </table>
    </div>
   </div>
 </div>
 
 
 <div id="step4"  style="display:none;position:relative;padding:10px 25px 0 25px;">
  <div>
    <div style="float:left; width:950px; background-color:#FFF;border-bottom:#57ae97 solid 2px;">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30" width="45%" style="padding:20px 0 0 20px; font-size:16px; font-weight:bold;">兴趣标签</td>
      		<td height="30" width="45%" style="padding:20px 0 0 20px; font-size:16px; font-weight:bold;">
      		 <img  align="right" src="${ctx}/images/btn_sure.png" onclick="addUserTags()" style="margin-right:16px;cursor: pointer;"/>
      		 </td>
        </tr>
      </table>
      
      <table id="table_lable" align="center" style="width:910px;margin-left:20px;"  border="0" cellspacing="0" cellpadding="0">
          
          </table>
          
          <br/>
         <div id="loadMoreLable" align="center" style="cursor: pointer;" onclick="loadMoreLable()">加载更多...</div>
         <br/>
         
    </div>
   </div>
 </div>
        
 
 
 <!-- <div style="position:relative; padding:10px 25px 0 25px;">
       
    </div> -->
     
    
  
  <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>

</body>
</html>




<script type="text/javascript">

$(document).ready(function(){
	  if('${user}'.length!=0){
		 window.location.href="${ctx}/pages/personal_set.jsp"; 
	  }
		findAllLable();
});

/* function checkUserGetCode(){
	if($.trim($('#txtCode').val()).length==0){
		alert('邀请码是空的！');
		return;
	}
	
	if($('#cBox').attr("checked")){
	   if(isPhone($('#txtPhonenum').val())){
		 $.ajax({
			     type: "POST",
			     url : context+'/user!checkUserGetCode.action',
			     dataType:'json',
			     data:{code:$.trim($('#txtCode').val())},
			     success: function(msg,status){
			    	if(msg.status == 200){
			    		alert('邀请码通过!');
			    		$('#step2').fadeIn(500);
			    		$('#step0').hide();
			    	}
			    	else
			    		alert('邀请码错误！');
				 } 
			});
	  }else{
		  alert('手机号码有误！');
	  }	   
	}else{
		alert('你还没有阅读注册协议！');
	}
} */

var timeCount=60;
function send_code(){
	if(isPhone($('#txtPhonenum').val())){
		
		if(timeCount==60 || timeCount==0){
			if(timeCount==0){
				timeCount=60;
			}
			
			    		$.ajax({
						     type: "POST",
						     url : context+'/user!findPhoneCode.action',
						     dataType:'json',
						     data:{phonenum:$('#txtPhonenum').val(),register:1},
						     success: function(msg,status){
						    	if(msg.status != 200){
						    		alert(msg.msg);
						    		$('#txtPhonenum').val('');
						    	}
						    	else{
						    		$('#spanTimeInfo').show();
						    		alert('验证码已发送到您手机上!');
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
	    		alert(msg.msg);
	    		$(obj).val('');
	    	}	    	
		 } 
	});
}
function checkCode(){
	if(isPhone($('#txtPhonenum').val())){
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
	else{
		alert('手机格式不正确!');
	}
		
	
}
function registerfun(){
	
	if($.trim($('#txtPhonenum').val()).length==0){
		return;
	}
	if($.trim($('#txtEmail').val()).length==0){
		return;
	}
	if(!isEmail($('#txtEmail').val())){
		alert('邮箱格式不正确!');
		return;
	}
	if(!isPassword($('#txtPasswordNew').val())){
		alert('密码格式不正确!');
		return;
	}
	
	if($.trim($('#txtPasswordNew').val()) != $.trim($('#txtPasswordSure').val())){
		alert('两次密码不一致!');
		return;
	}
	if($.trim($('#txtNickName').val()).length==0){
		return;
	}
	if(!$('#cBox').attr("checked")){
		alert('你还没有阅读注册协议！');
		return;
	}
	var param={phonenum:$.trim($('#txtPhonenum').val())};
	param["email"] = $.trim($('#txtEmail').val());
	param["password"] = $.trim($('#txtPasswordNew').val());
	param["nickname"] = $.trim($('#txtNickName').val());
	param["code"] = $.trim($('#txtCode').val());
	
	$.ajax({
	     type: "POST",
	     url : context+'/user!registerUser.action',
	     dataType:'json',
	     data:param,
	     success: function(msg,status){
	    	if(msg.status == 200){
	    		alert('注册成功!');
	    		window.location.href="${ctx}/pages/personal_set.jsp";
	    		/* $('#step2').hide();
	    		$('#step3').fadeIn(500);
	    		$('#step4').fadeIn(500); */
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
var allLable=[];
var pageinfo={size:4,page:0,tp:0,t:0};
function findAllLable(){
	 $.ajax({
	     type: "POST",
	     url : context+'/user!findAllAndHotLableList.action',
	     dataType:'json',
	     data:{},
	     success: function(msg,status){
	    	if(msg.status == 200){
	    		allLable = msg.rows;
	    		pageinfo["t"]=msg.rows.length;
	    		if(pageinfo["t"]%pageinfo["size"]==0)
	    			pageinfo["tp"]=pageinfo["t"]/pageinfo["size"];
	    		else
	    			pageinfo["tp"]=Math.ceil(pageinfo["t"]/pageinfo["size"]);
	    		loadMoreLable();
	    	}
	    	else
	    		alert('没有标签!');
		 } 
	});
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
		   $('#step4').height(pageinfo["t"]*110+80);
	 }
	 else
	 	$('#step4').height(pageinfo["page"]*pageinfo["size"]*110+80);
	 
	 var array=[];
	for(var i=(pageinfo["page"]-1)*pageinfo["size"];i<pageinfo["t"]&&i<pageinfo["page"]*pageinfo["size"];i++){
		pageinfo["rowpginfo"+i]={size:6,page:0,tp:0,t:0};
		pageinfo["rowpginfo"+i]["t"]=allLable[i]["childTags"].length;
		if(pageinfo["rowpginfo"+i]["t"]%pageinfo["rowpginfo"+i]["size"]==0)
			pageinfo["rowpginfo"+i]["tp"]=pageinfo["rowpginfo"+i]["t"]/pageinfo["size"];
		else
			pageinfo["rowpginfo"+i]["tp"]=Math.ceil(pageinfo["rowpginfo"+i]["t"]/pageinfo["rowpginfo"+i]["size"]);
		
		pageinfo["rowpginfo"+i]["page"]++;

		array.push('<tr><td><ul class="myLableMenue" id="myLableMenue'+i+'">');
		array.push('<li id="lable'+i+'_1" style="background:'+color[i%4][0]+'"><div class="lable" >'+allLable[i]["tagName"]+'</div></li>');
		for(var j=0;j<allLable[i]["childTags"].length&j<6;j++){
			array.push('<li id="lable'+i+'_'+(j+2)+'"  style="background:'+color[i%4][1]+'"><div id="'+allLable[i]["childTags"][j]["tagId"]+'" class="lable" >'+allLable[i]["childTags"][j]["tagName"]+'</div></li>');
		}
		if(allLable[i]["childTags"].length>6){
			array.push('<li style="padding-top:20px;height:30px;background:'+color[i%4][1]+'" >');
			array.push('<img src="${ctx}/images/lable_l.png" onclick="preLable('+i+')"/>');
			array.push('<img src="${ctx}/images/lable_r.png" onclick="nextLable('+i+')"/>');
			array.push('</li>');
		}
		array.push('</ul></td></tr>');
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
var color=[['#F78181','#F5BCA9'],['#8258FA','#8181F7'],['#0080FF','#4E9AFE'],['#8000FF','#9A2EFE']];
function showhorizontalLabe(row){

	var page = pageinfo["rowpginfo"+row]["page"];
	var  size = pageinfo["rowpginfo"+row]["size"];
	var t = pageinfo["rowpginfo"+row]["t"];
	
	var liarray = $('#myLableMenue'+row).find('li');

	var start = (page-1)*size;
	for(var j=start; j<page*size; j++){
		var div = $(liarray[j-start+1]).find('div')[0];
		if(j<t){
			$(liarray[j-start+1]).show();
			//$(div).removeClass('lable_ok');
			//$(div).addClass('lable');
			$(div).attr("id",allLable[row]["childTags"][j]["tagId"]);
			$(div).html(allLable[row]["childTags"][j]["tagName"]);
		}
		else{
			$(div).attr("id",'');
			$(div).html('');
			$(liarray[j-start+1]).hide();
		}
	}
}
function addUserTags(){
	var array=[];
	for(var i=0; i < pageinfo["page"]*pageinfo["size"]&&i<pageinfo["t"];i++){
		var liarray = $('#myLableMenue'+i).find('li');
		for(var j=1; j<6 && j<liarray.length; j++){
			var div = $(liarray[j]).find('div')[0];
	
			if($(div).attr("className")=='lable_ok' && $(div).attr("id").length>0){
				array.push($(div).attr("id"));
			}
		}
	}
	if(array.join(',').length == 0){
		alert('请选择兴趣标签!');
	}
	else{
		$.ajax({
		     type: "POST",
		     url : context+'/user!addUserTag.action',
		     dataType:'json',
		     data:{tagIds:array.join(',')},
		     success: function(msg,status){
		    	if(msg.status == 400){
		    		alert(msg.msg);
		    	}
		    	else{
		    		alert('添加成功!');
		    	}
		    		
			 } 
		});
	}
}
</script>

