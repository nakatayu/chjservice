<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/js/dialog/dialog_subModal.css" />
<title>漕河泾e服务</title>

<style type="text/css">
.topMenu{
background-color:#EEBF00;border-bottom:#FFF 1px solid;color:#FFF; 
font-size:18px; padding-left:15px; font-family:微软雅黑;cursor: pointer;
}
.topMenu:hover{
background-color: #FFBF00;cursor: pointer;
}
.topMenuOn{
background-color:#FFBF00;border-bottom:#FFF 1px solid;color:#FFF;
 font-size:18px; padding-left:15px; font-family:微软雅黑;cursor: pointer;
}

.nextMenu{
background-color:#e2e2e2;border-bottom:#FFF 1px solid;color:#FFF; font-size:18px;
 padding-left:28px; font-family:微软雅黑;cursor: pointer;
}
.nextMenu:hover{
background-color:#afe5ec;cursor: pointer;
}
.nextMenuOn{
background-color:#afe5ec;border-bottom:#FFF 1px solid;color:#FFF; font-size:18px;
 padding-left:28px; font-family:微软雅黑;cursor: pointer;
}
.vafunn{ 
color:#FFF;background-color:#FC0;padding:3px 5px 3px 5px;
cursor: pointer;font-size: 16px;width: 90px;border: 1px;
 }
 .tabtd{ padding-left:5px;color:#7eccce;font-size:12px;cursor: pointer;}
.imagetow{cursor: pointer; width:22;height:20;margin-top: 3px;margin-bottom: 0px;}
</style>
</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />
<script type="text/javascript" src="${ctx}/js/dialog/dialog_common.js"></script>
<script type="text/javascript" src="${ctx}/js/dialog/dialog_subModal.js"></script>

<div class="main">
<div id="main_content" class="main_content">
   
  <div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	     <div style="float:left;"><img src="${ctx}/images/menu_68.jpg" onclick="gotoPage('${ctx}/community!communityHome.action')" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_62.jpg" onclick="gotoPage('${ctx}/pages/community_topiclist.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_70.jpg"  onclick="gotoPage('${ctx}/pages/community_activitylist.jsp ')" style="width:190px;" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_63.jpg" onclick="gotoPage('${ctx}/community!findLableListCircle.action')"/></div>
           <div><img src="${ctx}/images/menu_66.png" style="width:473px;height: 100px;" /></div>
	    </div>
</div>
 

 <div style="position:relative;padding:10px 25px 0 25px;width: 950px;font-family:微软雅黑;">
 
<div style="float:left;width: 590px;"> 
<table style="width: 590px;border-bottom:#F90 3px solid;background-color: #ffffff;" border="0" cellspacing="0" cellpadding="0">
 
 <tr style="background-color:#ffc61a;font-family:微软雅黑; color:#FFF;font-size:16px;">
 <td  style=" padding:5px 0 0 15px;font-weight:bold;font-family:微软雅黑;height: 50px;" colspan="2">活动成员</td>
 </tr>
 
 <c:if test="${companyInfo!=null}">
 <tr>
 <td style="padding:20px 0 10px 20px; color:#7eccce;font-family:微软雅黑;" colspan="2">
     企业信息
 </td>
 </tr>
 <tr>
     <td width="100%" valign="top" colspan="2">
       <table width="500" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td width="100" align="center" style="padding-top: 10px;">
           
               <img onclick="window.location.href='${ctx}/pages/convenient_brandpinfo.jsp?companyId=${companyId}'" style="cursor:pointer;" src="${imageStorePath}${companyInfo.logo}" id="headPicture" width="73" height="78" />
              
           </td>           
           <td width="400" valign="top" align="left">
           
           <table width="97%" border="0" cellspacing="0" cellpadding="0" >
             <tr style="color:#ffc61a;height: 35px;">
               <td onclick="window.location.href='${ctx}/pages/convenient_brandpinfo.jsp?companyId=${companyId}'" style="cursor:pointer;" id="nickName">${companyInfo.name}</td>
             </tr>
             <tr style="font-size:14px;height: 20px;">
               <td>
               <c:forEach begin="1" end="${companyInfo.starScore}" step="1">
                  <img src="${ctx}/images/brand_xx.png" style="width:12px;height:12px;"/>
                </c:forEach>
               </td>
             </tr>
             <tr  style="font-size:12px;color:#a5a0a0;font-family:微软雅黑;height: 28px;" >
               <td colspan="6">简介: <span id="info">${companyInfo.companyInfo}</span></td>
             </tr>
             
           </table>
          </td>
       </tr>
      </table>
    </td>
  </tr>
 </c:if>
 
 <c:if test="${activityCreateUser!=null}">
 <tr>
 <td style="padding:20px 0 10px 20px; color:#7eccce;" colspan="2">
     发起人
 </td>
 </tr>
 <tr>
     <td width="100%" valign="top" colspan="2">
       <table width="500" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td width="100" align="center" style="padding-top: 10px;">
           
               <img onclick="gotoUserDetail(${user.userId},${activityCreateUser.userId})" style="cursor:pointer;" src="${imageStorePath}${activityCreateUser.headPicture}" id="headPicture" width="73" height="78" />
              
           </td>           
           <td width="400" valign="top" align="left">
           
           <table width="97%" border="0" cellspacing="0" cellpadding="0" >
             <tr style="color:#ffc61a;height: 35px;">
               <td  colspan="6" onclick="gotoUserDetail(${user.userId},${activityCreateUser.userId})" style="cursor:pointer;padding-left: 5px;" id="nickName">${activityCreateUser.nickName}</td>
             </tr>
             <tr  style="font-family:微软雅黑;font-size:12px;color:#a5a0a0;height: 28px;" >
               <td colspan="6">个人简介：<span id="info">${activityCreateUser.info}</span></td>
             </tr>
             <tr style="font-size:14px;height: 20px;">
               <td>
               <img src="${ctx}/dynamic/activity_but1.png" width="20" height="18" /></td>
               <td id="sincerityValue">
                <c:if test="${activityCreateUser.sincerityValue !=null}">
                 ${activityCreateUser.sincerityValue}
               </c:if>
               <c:if test="${activityCreateUser.sincerityValue ==null}">
                 0
               </c:if>
               </td>
               <td><img src="${ctx}/dynamic/activity_but2.png" width="20" height="18" /></td>
               <td  id="activeValue">
               <c:if test="${activityCreateUser.activeValue !=null}">
               ${activityCreateUser.activeValue}
               </c:if>
                <c:if test="${activityCreateUser.activeValue ==null}">
               0
               </c:if>
               </td>
               <td width="140"></td>
               <td width="140"></td>
             </tr>
             </table>
             </td>
         </tr>
         <tr style="height: 20px;">
         </tr>
         </table>
         </td>
       
      </tr>
       </c:if>
      <tr>
         <td colspan="2" style="font-family:微软雅黑;border-bottom:#efefef 1px solid;font-size: 1px;">&nbsp;</td>
      </tr>
     
      <tr>
      <td colspan="2" valign="top" style="padding:10px 0 10px 20px; font-size:14px;color:#7eccce;">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" >
            <tr>
              <td width="150px" style="font-size:16px;" id="thetypeTitle">
                                       成员
              </td>
              <td width="30px" id="methodO">
              <img src="${ctx}/dynamic/photo_delt.png" class="imagetow" onclick="selectAllPerson_fun(this)" value="0"  id="selectAllPerson"/>
             </td>
             <td width="100px">
              <span style="color:#7b7b7b;padding-left: 20px;" id="methodQ">全选</span>
              </td>
              <td width="100px" align="center" id="methodA"><button class="vafunn">设为管理员</button>
              </td>
              <td width="10px" ></td>
              <td width="100px" align="center" id="methodB"><button class="vafunn">设为管理员</button>
              </td>
              <td width="10px" ></td>
              </tr>
          </table>
      </td>  
      
      </tr>
      <tbody id="perpleList">
    </tbody>
   
    </table>


<div style="width:590px;">
<div id="pager" style="float:right; height:40px;" >wedrfghgfd</div>
</div>

<table id="tabMessage" width="590" border="0" cellspacing="0" cellpadding="0" style="background-color:#ffffff;margin-top: 10px;">
  <tr>
       <td colspan="2" style="height:44px;padding:5px 0 0 15px; font-size:16px;background-color:#ffc61a; color:#FFF; font-weight:bold;">发信息</td>
        </tr>
<tr>
    <td width="20%" height="50px;" valign="middle" style="padding:5px 5px 0 40px;">标题:
    </td>
    <td width="80%">
      <input type="text" maxlength="25" id="titleName" size="50" style="width:385px;height:20px;margin-top: 15px;font-size: 16px;padding: 3px 10px 0px 10px;" />
    </td>
  </tr>
  <tr>
    <td style="padding:5px 15px 0 40px;font-family:微软雅黑;height: 50px;">内容:</td>    
    <td rowspan="2" valign="top">
      <textarea id="titContent" cols="50" rows="4" style="font-family:微软雅黑;overflow: hidden;font-size: 16px;height: 80px;"></textarea>
    </td>
  </tr>
  <tr><td style="height: 60px;" align="center" valign="top">
  <button onclick="sendActivityMessage()"  class="vafunn">发站内信</button>
  </td></tr>
</table>

</div>
 
 <div style="float: right;">
   <table width="350px" border="0" cellspacing="0" cellpadding="0" id="tabMenu"> 
     <tr>
       <td height="54" class="topMenuOn">报名成员管理</td>
     </tr>
     <tr>
       <td height="54" class="nextMenuOn" id="nexrt1" onclick="examineTheMember(1,1)">未审核成员</td>
     </tr>
     <tr>
       <td height="54" class="nextMenu" id="nexrt3" onclick="examineTheMember(1,3)">审核通过成员</td>
     </tr>     
     <tr>
       <td height="54" class="nextMenu" id="nexrtpf" onclick="evaluateTheMember(1,'pf')">未评价成员</td>
     </tr>
     <tr>
       <td height="54" class="nextMenu" id="nexrtpt" onclick="evaluateTheMember(1,'pt')">已评价成员</td>
     </tr>
     <tr>
       <td height="54" class="nextMenu" id="nexrtqf" onclick="signInTheMember(1,'qf')">未签到成员</td>
     </tr> 
     <tr>
       <td height="54" class="nextMenu" id="nexrtqt" onclick="signInTheMember(1,'qt')">已签到成员</td>
     </tr>
     <tr>
       <td height="54" class="nextMenu" id="nexrtma" onclick="">二维码扫描软件下载</td>
     </tr>     
   </table>
 </div>
 
 </div>
 
  <jsp:include page="/common/bottom.jsp" />
  
</div>
</div>
</body>
</html>
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript">
var activityId="${activityId}";
var actUserId="${actUserId}";
var actRoleId="${actRoleId}";
var isCheck="${isCheck}";

var statusId=0;
$(function(){
	//addActivityManager();
	var info = '${activityCreateUser.info}';
	if("${companyId}"!='0'&&"${companyId}"!=''&&"${companyId}"!='null'){
		info='${companyInfo.companyInfo}';
	}
	if(info.length>73){
		info=info.substr(0,73)+'...';
	}
	$('#info').html(info);
	ckeckTheRole();
	$("#pager").pager({
		pagenumber : pageinfo["page"],
		pagecount : pageinfo["tp"],
		buttonClickCallback : PageClick
	});
	examineTheMember(1,1);
});

function ckeckTheRole(){
	if(actRoleId==0){
		$('#methodO').hide();
		$('#methodQ').hide();
		$('#methodA').hide();
		$('#methodB').hide();		
	}else{
		$('#methodO').show();
		$('#methodQ').show();
		$('#methodA').show();
		$('#methodB').show();		
	}
}

function sendActivityMessage(){
	var title=$.trim($('#titleName').val());
	var content=$.trim($('#titContent').val());
	if(title==""){
		alert('标题不能为空！');
		return;
	}	
	
	$.ajax({
	     type: "POST",
	     url : '${ctx}/user!sendTheActivityMessage.action',
	     dataType:'json',
	     data:{title:title,content:content,activityId:activityId},
	     success: function(msg,status){
	    	if(msg.status == 200){
	    		alert("发送成功！");
	    		$('#titleName').val("");
	    		$('#titContent').val("");
	    	}else{
	    		alert(msg.msg);
	    	}	    		
	     }	     
	});
}

function addActivityManager(){
	$.ajax({
	     type: "POST",
	     url : '${ctx}/user!findTheCircleHeader.action',
	     dataType:'json',
	     data:{userId:actUserId},
	     success: function(msg,status){
	    	if(msg.status == 200){
	    		var n=msg.rows;
	    		var nickName=n["nickName"];
	    		if(nickName==null){
	    			nickName=n["email"];
	    			if(nickName==null){
	    				nickName="weimingming";
	    			}
	    		}
	    		if(nickName.length>9){
	    			nickName=nickName.substring(0,8)+"...";
	    		}
	    		var info=n["info"];	    		
	    	    if(info.length>22){
	    	    	info=info.substring(0,21)+'...';
	    	    }
	    		$('#headPicture').attr("src","${imageStorePath}"+n["headPicture"]);
	    		$('#nickName').html(nickName);
	    		$('#info').html(info);
	    		$('#sincerityValue').html(n["sincerityValue"]);
	    		$('#activeValue').html(n["activeValue"]);
	    	}	    	
	     }	     
	});
}

PageClick = function(pageclickednumber) {
$("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
examineTheMember(pageclickednumber,statusId);
};

function evaluateTheMember(pagenum,stated){
	alert('未有此项！');return;
	cssTheMenuAndMenu(stated);
	statusId=stated;
	pageinfo["size"]=10;
	pageinfo["page"]=pagenum;
	//pageinfo["status"]=stated;
	pageinfo["activityId"]=activityId;
	
	$.ajax({
	     type: "POST",
	     url : '${ctx}/user!',
	     dataType:'json',
	     data:pageinfo,
	     success: function(msg,status){
	    	 if(msg.status == 200){
		    	//addTheDataTowebshow(pageinfo,msg.rows,msg.total,stated);
		    }else{
		    	$("#pager").hide();
		    	chooseTheTiaoJIan(stated,0);
	    		$('#perpleList').html('<tr><td style="padding-left:25px;color:#7eccce;" heigth="80px">'+msg.msg+'</td></tr><tr>'+
	    				'<td colspan="2" style="border-bottom: #cccccc solid 1px;">&nbsp;'+
	    				'</td></tr><tr><td>&nbsp;</td></tr>');
		    }	    		
	     }	     
	});
}

function examineTheMember(pagenum,stated){
	cssTheMenuAndMenu(stated);
	statusId=stated;
	pageinfo["size"]=10;
	pageinfo["page"]=pagenum;
	pageinfo["status"]=stated;
	pageinfo["activityId"]=activityId;
	
	$.ajax({
	     type: "POST",
	     url : '${ctx}/user!examineTheMemberMeth.action',
	     dataType:'json',
	     data:pageinfo,
	     success: function(msg,status){
	    	 if(msg.status == 200){
		    	addTheDataTowebshow(pageinfo,msg.rows,msg.total,stated);
		    }else{
		    	$("#pager").hide();
		    	chooseTheTiaoJIan(stated,0);
	    		$('#perpleList').html('<tr><td style="padding-left:25px;color:#7eccce;" heigth="80px">'+msg.msg+'</td></tr><tr>'+
	    				'<td colspan="2" style="border-bottom: #cccccc solid 1px;">&nbsp;'+
	    				'</td></tr><tr><td>&nbsp;</td></tr>');
		    }	    		
	     }	     
	});
}

function signInTheMember(pagenum,stated){
	cssTheMenuAndMenu(stated);
	statusId=stated;
	pageinfo["size"]=10;
	pageinfo["page"]=pagenum;
	pageinfo["activityId"]=activityId;
	if(stated=='qf'){
		pageinfo["signIn"]='F';
	}else if(stated=='qt'){
		pageinfo["signIn"]='T';
	}	
	$.ajax({
	     type: "POST",
	     url : '${ctx}/user!signInTheMemberMeth.action',
	     dataType:'json',
	     data:pageinfo,
	     success: function(msg,status){
	    	 if(msg.status == 200){
		    	addTheDataTowebshow(pageinfo,msg.rows,msg.total,stated);
		    }else{
		    	$("#pager").hide();
		    	chooseTheTiaoJIan(stated,0);
	    		$('#perpleList').html('<tr><td style="padding-left:25px;color:#7eccce;" heigth="80px">'+msg.msg+'</td></tr><tr>'+
	    				'<td colspan="2" style="border-bottom: #cccccc solid 1px;">&nbsp;'+
	    				'</td></tr><tr><td>&nbsp;</td></tr>');
		    }	    		
	     }	     
	});
}

function addTheDataTowebshow(pageinfo,list,num,stl){
	var str='';	
	
	if(num>10){
		$("#pager").show();
		if(num%pageinfo["size"]==0){
			pageinfo["tp"]=num/pageinfo["size"];
    	}else{
    		pageinfo["tp"]=Math.ceil(num/pageinfo["size"]);
    	}
		$("#pager").pager({ pagenumber: pageinfo["page"], pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
	}else{
		$("#pager").hide();
	}
	
	for(var i=0;i<list.length;i++){		
		
		var Tdata=list[i];
		var Tuser=Tdata["user"];	    			
		var nickName=Tuser["nickName"];
		if(nickName==null){
			nickName=Tuser["email"];
			if(nickName==null){
				nickName="weimingming";
			}
		}
		if(nickName.length>9){
			nickName=nickName.substring(0,8)+"...";
		}
		var info=Tuser["info"];
        if(info.length>22){
        	info=info.substring(0,21)+'...';
        }
        if(i%2==0){
			str+='<tr>';
		}		
		str+='<td width="50%" valign="top" align="left">';
		str+='<table width="295px" border="0" cellspacing="0" cellpadding="0">';
		str+='<tr><td width="36%" align="center" style="padding-top: 10px;">';         
		str+='<img src="${imageStorePath}'+Tuser["headPicture"]+'" width="73" height="78" />';              
		str+='</td><td width="58%" valign="top">';           
		str+='<table width="97%" border="0" cellspacing="0" cellpadding="0" >';
		str+='<tr style="color:#ffc61a;height: 35px;">';
		str+='<td><img src="${ctx}/dynamic/photo_delt.png" class="imagetow" id="circlePerson'+Tdata["user_id"]+'"';
		str+=' value="0" userId="'+Tdata["user_id"]+'" onclick="chooseUserOne(this)"/></td>';
		str+='<td colspan="3" style="padding-left: 5px;">'+nickName+'</td></tr>';
		str+='<tr  style="font-size:12px;color:#a5a0a0;height: 28px;" >';
		str+='<td colspan="4">个人简介：'+info+'</td></tr>';
		str+='<tr style="font-size:14px;height: 20px;">';
		str+='<td width="14%"><img src="${ctx}/dynamic/activity_but1.png" width="20" height="18" /></td>';
		str+='<td width="22%">'+Tuser["sincerityValue"]+'</td><td width="14%">';
		str+='<img src="${ctx}/dynamic/activity_but2.png" width="20" height="18" /></td>';
		str+='<td width="45%">'+Tuser["activeValue"]+'</td></tr></table></td></tr>';
		if(actRoleId==1){
			if(isCheck=='T'){
				if(stl==1){
					str+='<tr style="height: 40px;"><td style="color: #9a9a9c;padding-left: 30px;">';
					str+='<a class="tabtd" onclick="linkMemberCard('+Tdata["user_id"]+')">查看证件</a></td>';
					str+='<td><a class="tabtd" onclick="exetqualiMember(3,'+Tdata["user_id"]+')">审核通过</a>&nbsp;';
					str+='<a class="tabtd" onclick="exetqualiMember(2,'+Tdata["user_id"]+')">审核拒绝</a></td></tr>';
				}else{
					str+='<tr style="height: 40px;"><td style="color: #9a9a9c;padding-left: 30px;">';
					str+='<a class="tabtd" onclick="linkMemberCard('+Tdata["user_id"]+')">查看证件</a></td>';
					str+='<td><a class="tabtd" onclick="exetqualiMember(5,'+Tdata["user_id"]+')">移除活动</a></td></tr>';
				}	
			}else{
				if(stl==1){
					str+='<tr style="height: 40px;"><td style="color: #9a9a9c;padding-left: 30px;">';
					str+='<a class="tabtd" onclick="exetqualiMember(3,'+Tdata["user_id"]+')">审核通过</a></td>';
					str+='<td><a class="tabtd" onclick="exetqualiMember(2,'+Tdata["user_id"]+')">审核拒绝</a></td></tr>';
				}else{
					str+='<tr style="height: 40px;"><td style="padding-left: 30px;">';
					str+='<a class="tabtd" onclick="exetqualiMember(5,'+Tdata["user_id"]+')">移除活动</a></td>';
					str+='<td>&nbsp;&nbsp;</td></tr>';
				}
			}		
		}
		str+='</table></td>';
		if(i%2==0&&i==list.length-1){
    		str+='<td width="50%">&nbsp;</td>';
    	}
		if(i%2==1){
        	str+='</tr><tr><td colspan="2" style="border-bottom: #cccccc solid 1px;">&nbsp;&nbsp;</td></tr>';	                        
        }
	}
	str+='<tr><td colspan="2">&nbsp;</td></tr>';
	chooseTheTiaoJIan(stl,num);
	$('#perpleList').html(str);	
}
var diag=null;
function linkMemberCard(userId){
	
	//showPopWin('查看活动人员证件','${ctx}/user!checkMemberCredentials.action?activityId='+activityId+'&userId='+userId, 600, 600,  null);
	diag = new Dialog();
	diag.Width = 600;
	diag.Height = 460;
	diag.Title = '查看活动人员证件';
	diag.URL = '${ctx}/user!checkMemberCredentials.action?activityId='+activityId+'&userId='+userId;
	diag.show();
}
function asddffv(){}
function chooseTheTiaoJIan(type,num){
		
	if(type==1){
		$('#thetypeTitle').html('待审核成员('+num+'人)');
		$('#methodA').html('<button class="vafunn" onclick="exetqualiMember(3,0)">审核通过</button>');
		$('#methodB').html('<button class="vafunn" onclick="exetqualiMember(2,0)">审核拒绝</button>');
	}else if(type==3){
		$('#thetypeTitle').html('审核通过成员('+num+'人)');
		$('#methodA').html('<button class="vafunn" onclick="exetqualiMember(5,0)">移除活动</button>');
		$('#methodB').html('');
	}else if(type=='qf'){
		$('#thetypeTitle').html('未签到成员('+num+'人)');
		$('#methodA').html('<button class="vafunn" onclick="exetqualiMember(5,0)">移除活动</button>');
		$('#methodB').html('');
	}else if(type=='qt'){
		$('#thetypeTitle').html('已签到成员('+num+'人)');
		$('#methodA').html('<button class="vafunn" onclick="exetqualiMember(5,0)">移除活动</button>');
	}else if(type=='pf'){
		$('#thetypeTitle').html('未评价成员('+num+'人)');
		$('#methodA').html('<button class="vafunn" onclick="exetqualiMember(5,0)">移除活动</button>');
		$('#methodB').html('');
	}else if(type=='pt'){
		$('#thetypeTitle').html('已评价成员('+num+'人)');
		$('#methodA').html('<button class="vafunn" onclick="exetqualiMember(5,0)">移除活动</button>');
		$('#methodB').html('');
	}	
}


function cssTheMenuAndMenu(obj){	
	$('#tabMenu td[class^="nextMe"]').each(function(){
		$(this).attr("class","nextMenu");
	});
	$('#nexrt'+obj).attr("class","nextMenuOn");	
}

function exetqualiMember(status,usId){
	if(usId==0){
		usId=selectedTheUser();
		if(usId==""){
			return;
		}
	}
	$.ajax({
	     type: "POST",
	     url : '${ctx}/user!updateActivityPerple.action',
	     dataType:'json',
	     data:{userId:usId,status:status,activityId:activityId},
	     success: function(msg,status){
	    	if(msg.status == 200){
	    		window.location.reload();	
	    	}else{
	    		alert(msg.msg);
	    	}
	     }
	});
} 

function selectedTheUser(){
	var userId='';
	$('img[id^="circlePerson"]').each(function(){
		if($(this).val()==1){
			userId=userId+$(this).attr("userId")+",";
		}
	});
	if(userId==""){
		alert('请选择人员');
	}
	return userId;
}

function selectAllPerson_fun(obj){	
	var i=$(obj).val();
	if(i==0){
		$(obj).attr("src","${ctx}/dynamic/photo_del.png");
		$('img[id^="circlePerson"]').each(function(){
			$(this).attr("src","${ctx}/dynamic/photo_del.png");
			$(this).val("1");
		});
		$(obj).val("1");
	}else if(i==1){
		$(obj).attr("src","${ctx}/dynamic/photo_delt.png");
		$('img[id^="circlePerson"]').each(function(){
			$(this).attr("src","${ctx}/dynamic/photo_delt.png");
			$(this).val("0");
		});
		$(obj).val("0");
	}
}
function chooseUserOne(obj){
	var i=$(obj).val();	
	if(i==0){
		$(obj).attr("src","${ctx}/dynamic/photo_del.png");
		$(obj).val("1");
	}else if(i==1){
		$(obj).attr("src","${ctx}/dynamic/photo_delt.png");
		$(obj).val("0");
	}	
 
	var t=1;
	$('img[id^="circlePerson"]').each(function(){
		if($(this).val()==0){
			t=0;
		}
	});
	if(t==1){
		$('#selectAllPerson').attr("src","${ctx}/dynamic/photo_del.png");
		$('#selectAllPerson').val("1");
	}else{
		$('#selectAllPerson').attr("src","${ctx}/dynamic/photo_delt.png");
		$('#selectAllPerson').val("0");
	}	
}


</script>





