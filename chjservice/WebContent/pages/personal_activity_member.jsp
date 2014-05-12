<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />

<title>漕河泾e服务</title>

<style type="text/css">
.topMenu{
background-color:#EEBF00;border-bottom:#FFF 1px solid;color:#FFF; 
font-size:18px; padding-left:15px; font-family:'黑体';cursor: pointer;
}
.topMenu:hover{
background-color: #FFBF00;cursor: pointer;
}
.topMenuOn{
background-color:#FFBF00;border-bottom:#FFF 1px solid;color:#FFF;
 font-size:18px; padding-left:15px; font-family:'黑体';cursor: pointer;
}

.nextMenu{
background-color:#e2e2e2;border-bottom:#FFF 1px solid;color:#FFF; font-size:18px;
 padding-left:28px; font-family:'黑体';cursor: pointer;
}
.nextMenu:hover{
background-color:#afe5ec;cursor: pointer;
}
.nextMenuOn{
background-color:#afe5ec;border-bottom:#FFF 1px solid;color:#FFF; font-size:18px;
 padding-left:28px; font-family:'黑体';cursor: pointer;
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
 

 <div style="position:relative;padding:10px 25px 0 25px;width: 950px;font-family:'微软雅黑';">
 
 <div style="float:left;width: 590px;"> 
<table style="width: 590px;border-bottom:#F90 3px solid;background-color: #ffffff;" border="0" cellspacing="0" cellpadding="0">
 
 <tr style="background-color:#ffc61a; color:#FFF;font-size:16px;">
 <td  style=" padding:5px 0 0 15px;font-weight:bold;height: 50px;" colspan="2">活动成员</td>
 </tr>
 <tr>
 <td style="padding:20px 0 10px 20px; color:#7eccce;">发起人（1人）
 
 </td>
 </tr>
 <tr>
     <td width="50%" valign="top">
       <table width="295" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td width="36%" align="center" style="padding-top: 10px;">
           
               <img src="" id="headPicture" width="73" height="78" />
              
           </td>           
           <td width="58%" valign="top" align="left">
           
           <table width="97%" border="0" cellspacing="0" cellpadding="0" >
             <tr style="color:#ffc61a;height: 35px;">
               <td  colspan="4" style="padding-left: 5px;" id="nickName">小猫爱吃鱼</td>
             </tr>
             <tr  style="font-size:12px;color:#a5a0a0;height: 28px;" >
               <td colspan="4">个人简介：<span id="info"></span></td>
             </tr>
             <tr style="font-size:14px;height: 20px;">
               <td width="14%">
               <img src="${ctx}/dynamic/activity_but1.png" width="20" height="18" /></td>
                   <td width="22%" id="sincerityValue">5.1</td>
                   <td width="14%"><img src="${ctx}/dynamic/activity_but2.png" width="20" height="18" /></td>
                   <td width="45%" id="activeValue">5.1</td>
             </tr>
             </table>
             </td>
         </tr>
         <tr style="height: 20px;">
         </tr>
         </table>
         </td>
        <td width="50%" valign="top">
         </td>
      </tr>
      <tr>
         <td colspan="2" style="border-bottom:#efefef 1px solid;font-size: 1px;">&nbsp;</td>
      </tr>
     
      <tr>
      <td colspan="2" valign="top" style="padding:10px 0 10px 20px; font-size:14px;color:#7eccce;">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" >
            <tr>
              <td width="150px" style="font-size:16px;" id="thetypeTitle">
                                       成员
              </td>
              <td width="30px" id="methodO">
              <img src="${ctx}/dynamic/photo_delt.png" class="imagetow" onclick="selectAllPerson(this)" value="0"  id="selectAllPerson"/>
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
    <td style="padding:5px 15px 0 40px;height: 50px;">内容:</td>    
    <td rowspan="2" valign="top">
      <textarea id="titContent" cols="50" rows="4" style="overflow: hidden;font-size: 16px;height: 80px;"></textarea>
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
var activityId=255;
var actUserId=8;
var actRoleId=0;

var statusId=0;
$(function(){
	addActivityManager();
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
	    		$('#headPicture').attr("src","${ctx}"+n["headPicture"]);
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
	for(var i=0;i<list.length;i++){		
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
		str+='<img src="${ctx}'+Tuser["headPicture"]+'" width="73" height="78" />';              
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
			if(stl==1){
				str+='<tr style="height: 40px;"><td style="padding-left: 30px;">';
				str+='<a class="tabtd" onclick="exetqualiMember(3,'+Tdata["user_id"]+')">审核通过</a></td>';
				str+='<td><a class="tabtd" onclick="exetqualiMember(2,'+Tdata["user_id"]+')">审核拒绝</a></td></tr>';
			}else{
				str+='<tr style="height: 40px;"><td style="padding-left: 30px;">';
				str+='<a class="tabtd" onclick="exetqualiMember(5,'+Tdata["user_id"]+')">移除活动</a></td>';
				str+='<td>&nbsp;</td></tr>';
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
	$('#tabMenu td[className^="nextMenu"]').each(function(){
		$(this).attr("class","nextMenu");
	});
	$('#nexrt'+obj).attr("class","nextMenuOn");	
}

function exetqualiMember(status,usId){
	if(usId==0){
		usId=selectedTheUser();
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

function selectAllPerson(obj){	
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





