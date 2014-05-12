<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />
 <link rel="stylesheet" type="text/css" href="${ctx}/css/css.css" />
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
.tabtd{ padding-left:5px;color:#7eccce;font-size:12px;cursor: pointer;}
.vafunn{ 
color:#FFF;background-color:#FC0;padding:3px 5px 3px 5px;
cursor: pointer;font-size: 16px;width: 90px;border: 1px;
 }
</style>
</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />


<div class="main">
<div id="main_content" class="main_content">




 <div style="position:relative;padding:10px 25px 0 25px;">
 
 <div>
 <div style="float:left;">
 <table width="590px" border="0" cellspacing="0" cellpadding="0" style="background-color:#ffc61a; height:54px; color:#FFF;">
  <tr>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="76%" style=" padding:5px 0 0 15px; font-family:'微软雅黑'; font-size:16px; font-weight:bold;">圈子成员（50人）</td>
        <td width="12%"  style="padding-top:5px; padding-right:5px;" align="center">&nbsp;</td>
        </tr>
    </table>
    </td>
  </tr>
</table>

<table  width="590"  border="0" cellspacing="0" cellpadding="0" style="background-color: #FFFFFF;border-bottom:#F90 3px solid;">
   
    <tr>
    <td>
    
    <table  width="100%" border="0" cellspacing="0" cellpadding="0"> 
   
      <tr>
        <td style="padding:20px 0 10px 20px; color:#7eccce; font-family:'微软雅黑'">圈主（1人）
        </td>
      </tr>
      <tr>
        <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="50%" valign="top">
            <table width="295" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="36%" height="110" align="center">
                <table width="80%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="49" align="center">
                    <table width="90%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="90" align="center">
                        <img src="" width="73" height="78" id="headPicture"/></td>
                      </tr>
                    </table>
                    </td>
                  </tr>
                </table>
                </td>
                <td width="58%" valign="top"><table width="97%" border="0" cellspacing="0" cellpadding="0" style=" margin-top:5px;">
                  <tr>
                    <td height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="84%" style="color:#ffc61a;" id="nickName">小猫爱吃鱼</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="28" style="font-size:12px;color:#a5a0a0;">个人简介：
                    <span id="info"></span></td>
                  </tr>
                  <tr>
                    <td height="20" style="font-size:14px;" align="left">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="14%"><img src="${ctx}/dynamic/activity_but1.png" width="20" height="18" /></td>
                        <td width="22%" id="sincerityValue"></td>
                        <td width="14%"><img src="${ctx}/dynamic/activity_but2.png" width="20" height="18" /></td>
                        <td width="45%" id="activeValue"></td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
             
            </table></td>
            <td width="49%" >&nbsp;</td>
          </tr>
        </table>
        </td>
      </tr>
      <tr>
        <td style="border-bottom:#CCC 1px solid;">&nbsp;</td>
      </tr>
    
   </table>
   </td>
  </tr> 
  
  
   <tr>
   
   <td  valign="top">
   
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        
        <tr>
          <td style="padding:10px 0 0 20px; font-size:14px; font-family:'微软雅黑';color:#7eccce;" colspan="2">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" >
            <tr>
              <td width="150px" height="40px" style="font-size:16px;" id="thetypeTitle"></td>
              <td width="220px" id="methodO">
              <img src="${ctx}/dynamic/photo_delt.png" width="22" height="20" onclick="selectAllPerson(this)" id="selectAllPerson" value="1" style="cursor: pointer;"/>
             
              <span style="color:#7b7b7b;padding-left: 20px;">全选</span>
              </td>
              <td width="100px" align="center" id="methodA">
              
              </td>
              <td width="10px" ></td>
              <td width="100px" align="center" id="methodB">
              </td>
              <td width="20px" ></td>
              </tr>
          </table>
          </td>
        </tr>       
         <tbody id="tbodyPerple">
           
         </tbody>
      </table>
    </td>
   </tr>    
</table>

<div style="float:left;width:590px;" >

<div id="pager" style="float:right; height:40px;" ></div>

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
  <button onclick="sendCircleMessage()"  class="vafunn">发站内信</button>
  </td></tr>
</table>

 </div>
 
 <div style="width: 350px;float: right;height: 500px;background-color: #ffffff;">
   <table id="tabMenu" width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#ffffff;"> 
     <tr>
       <td height="54" class="topMenuOn">圈子成员</td>
     </tr>
     <tr>
       <td height="54" id="setmenu1" class="nextMenuOn" onclick="chooseTheInputPeople(1,1)">待审核成员</td>
     </tr>
     <tr>
       <td height="54" id="setmenu3" class="nextMenu" onclick="chooseTheInputPeople(1,3)">审核通过成员</td>
     </tr>
     <tr>
       <td height="54" id="setmenu4" class="nextMenu" onclick="chooseCircleManager(4)">圈子管理员</td>
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
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript">

var circleId=203;//传参
var crole=1;//传参 ，0成员，1管理员，2圈主
var userId=8;//圈主id

var statusId=0;
$(function(){		
	addCircleHeader();
	
	$("#pager").pager({
		pagenumber : pageinfo["page"],
		pagecount : pageinfo["tp"],
		buttonClickCallback : PageClick
	});
	chooseTheInputPeople(1,1);
});

function sendCircleMessage(){
	var title=$.trim($('#titleName').val());
	var content=$.trim($('#titContent').val());
	if(title==""){
		alert('标题不能为空！');
		return;
	}	
	
	$.ajax({
	     type: "POST",
	     url : '${ctx}/user!sendTheCircleMessage.action',
	     dataType:'json',
	     data:{title:title,content:content,circleId:circleId},
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

function addCircleHeader(){
	$.ajax({
	     type: "POST",
	     url : '${ctx}/user!findTheCircleHeader.action',
	     dataType:'json',
	     data:{userId:userId},
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
	$('#selectAllPerson').attr("src","${ctx}/dynamic/photo_delt.png");
$("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });

chooseTheInputPeople(pageclickednumber,statusId);
};

function chooseTheTiaoJIan(type,num){
	if(type==1){
		$('#thetypeTitle').html('待审核成员('+num+'人)');
		$('#methodA').html('<button class="vafunn" onclick="updateToCircle(3,0)">同意加入</button>');
		$('#methodB').html('<button class="vafunn" onclick="updateToCircle(2,0)">拒绝加入</button>');
	}else if(type==3){
		$('#thetypeTitle').html('成员('+num+'人)');
		$('#methodA').html('<button class="vafunn" onclick="setCircleManager(1,0)">设为管理员</button>');
		$('#methodB').html('<button class="vafunn" onclick="updateToCircle(5,0)">移除成员</button>');
	}else if(type==4){
		$('#thetypeTitle').html('管理员('+num+'人)');
		$('#methodA').html('<button class="vafunn" onclick="setCircleManager(0,0)">取消管理员</button>');
		$('#methodB').html('<button class="vafunn" onclick="updateToCircle(5,0)">移除成员</button>');
	}	
}
function chooseTheInputPeople(pageNum,stat){
	
	if(crole==0){
		$('#methodO').hide();
		$('#methodA').hide();
		$('#methodB').hide();
		$('#tabMessage').hide();
	}else{
		$('#methodO').show();
		$('#methodA').show();
		$('#methodB').show();
		$('#tabMessage').show();
	}
	
	cssTheMenuAndMenu(stat);
	
	$("#pager").show();
	statusId=stat;
	pageinfo["size"]=10;
	pageinfo["page"]=pageNum;
	pageinfo["status"]=stat;
	pageinfo["circleId"]=circleId;
	$.ajax({
	     type: "POST",
	     url : '${ctx}/user!findTheCirclePerple.action',
	     dataType:'json',
	     data:pageinfo,
	     success: function(msg,status){
	    	if(msg.status == 200){
	    		
	    		var str='';
	    		for(var i=0;i<msg.rows.length;i++){
	    			
	    			if(msg.total%pageinfo["size"]==0)
		    	    	pageinfo["tp"]=msg.total/pageinfo["size"];
		    	    else
		    	    	pageinfo["tp"]=Math.ceil(msg.total/pageinfo["size"]);
	    			
		    		$("#pager").pager({ pagenumber: pageinfo["page"], pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
		    		
	    			var Tdata=msg.rows[i];
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
	    			str+='<td width="50%" valign="top">'+
	                '<table width="290" border="0" cellspacing="0" cellpadding="0">'+
	                '<tr><td width="36%" height="105" align="center">'+
	                '<img src="${ctx}'+Tuser["headPicture"]+'" width="73" height="78" /></td>'+
	                '<td width="58%" valign="top">'+
	                '<table width="97%" border="0" cellspacing="0" cellpadding="0" style=" margin-top:5px;">'+
	                '<tr><td height="35" style="color:#ffc61a;">'+
	                '<table width="100%" border="0" cellspacing="0" cellpadding="0">'+
	                '<tr><td width="17%"><img src="${ctx}/dynamic/photo_delt.png" style="cursor: pointer;" '+
	                'width="22" height="20" id="circlePerson'+Tdata["user_id"]+'" value="0" userId="'+
	                Tdata["user_id"]+'" onclick="chooseUserOne(this)"/></td>'+
	                '<td width="83%">'+nickName+'</td></tr></table></td></tr>'+
	                '<tr><td height="28" style="font-size:12px;color:#a5a0a0;">';
	                	                
	                str+='个人简介：'+info+'</td></tr>'+
	                '<tr><td height="20" style="font-size:14px;" align="left">'+
	                '<table width="100%" border="0" cellspacing="0" cellpadding="0">'+
	                '<tr><td width="14%"><img src="${ctx}/dynamic/activity_but1.png" width="20" height="18" /></td>'+
	                '<td width="22%">'+Tuser["sincerityValue"]+'</td><td width="14%"><img src="${ctx}/dynamic/activity_but2.png" width="20" height="18" /></td>'+
	                '<td width="45%">'+Tuser["activeValue"]+'</td></tr></table></td></tr></table></td></tr>';
	                
	                if(crole!=0){
	                	str+='<tr><td height="30" colspan="2">';
	                	if(stat==1){
	            		str+='<table width="100%" border="0" cellspacing="0" cellpadding="0">'+
	            		'<tr><td  width="8%"></td><td width="30%">'+
	                    '<a class="tabtd" onclick="updateToCircle(3,'+Tdata["user_id"]+')">同意加入</a></td>'+
	                    '<td width="30%"><a class="tabtd" onclick="updateToCircle(2,'+Tdata["user_id"]+')">拒绝加入</a>'+
	                    '</td><td width="48%"></td></tr></table>';	
	                    }else if(stat==3){
	            		str+='<table width="100%" border="0" cellspacing="0" cellpadding="0">'+
	            		'<tr><td  width="8%"></td><td width="30%">'+
	                    '<a class="tabtd" onclick="setCircleManager(1,'+Tdata["user_id"]+')">设为管理员</a></td>'+
	                    '<td width="30%"><a class="tabtd" onclick="updateToCircle(5,'+Tdata["user_id"]+')">移除成员</a>'+
	                    '</td><td width="48%"></td></tr></table>';
	                    }
	                	str+='</td></tr>';
	                }
	                str+='</table></td>';
	                if(i%2==0&&i==msg.rows.length-1){
                		str+='<td width="50%">&nbsp;</td>';
                	}
	                if(i%2==1){
	                	str+='</tr><tr><td colspan="2" style="border-bottom: #cccccc solid 1px;">&nbsp;&nbsp;</td></tr>';	                        
	                }	    			
	    		}
	    		str+='<tr><td>&nbsp;</td></tr>';
	    		chooseTheTiaoJIan(stat,msg.total);
	    		$('#tbodyPerple').html(str);
	    	}
	    	else{	    		
	    		chooseTheTiaoJIan(stat,0);
	    		$('#tbodyPerple').html('<tr><td style="padding-left:25px;color:#7eccce;" heigth="80px">'+msg.msg+'</td></tr><tr>'+
	    				'<td colspan="2" style="border-bottom: #cccccc solid 1px;">&nbsp;'+
	    				'</td></tr><tr><td>&nbsp;</td></tr>');
	    	}
	     }
	});
}
function chooseCircleManager(stat){
	if(crole==0||crole==1){
		$('#methodO').hide();
		$('#methodA').hide();
		$('#methodB').hide();		
	}else{
		$('#methodO').show();
		$('#methodA').show();
		$('#methodB').show();		
	}
	
	cssTheMenuAndMenu(stat);	
	$("#pager").hide();
	$.ajax({
	     type: "POST",
	     url : '${ctx}/user!selectCircleManager.action',
	     dataType:'json',
	     data:{circleId:circleId,circleRole:1},
	     success: function(msg,status){
	    	if(msg.status == 200){

	    		var str='';
	    		for(var i=0;i<msg.rows.length;i++){
	    			
	    			var Tdata=msg.rows[i];
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
	    			str+='<td width="50%" valign="top">'+
	                '<table width="290" border="0" cellspacing="0" cellpadding="0">'+
	                '<tr><td width="36%" height="105" align="center">'+
	                '<img src="${ctx}'+Tuser["headPicture"]+'" width="73" height="78" /></td>'+
	                '<td width="58%" valign="top">'+
	                '<table width="97%" border="0" cellspacing="0" cellpadding="0" style=" margin-top:5px;">'+
	                '<tr><td height="35" style="color:#ffc61a;">'+
	                '<table width="100%" border="0" cellspacing="0" cellpadding="0">'+
	                '<tr><td width="17%"><img src="${ctx}/dynamic/photo_delt.png" style="cursor: pointer;" '+
	                'width="22" height="20" id="circlePerson'+Tdata["user_id"]+'" value="0" userId="'+
	                Tdata["user_id"]+'" onclick="chooseUserOne(this)"/></td>'+
	                '<td width="83%">'+nickName+'</td></tr></table></td></tr>'+
	                '<tr><td height="28" style="font-size:12px;color:#a5a0a0;">';
	                	                
	                str+='个人简介：'+info+'</td></tr>'+
	                '<tr><td height="20" style="font-size:14px;" align="left">'+
	                '<table width="100%" border="0" cellspacing="0" cellpadding="0">'+
	                '<tr><td width="14%"><img src="${ctx}/dynamic/activity_but1.png" width="20" height="18" /></td>'+
	                '<td width="22%">'+Tuser["sincerityValue"]+'</td><td width="14%"><img src="${ctx}/dynamic/activity_but2.png" width="20" height="18" /></td>'+
	                '<td width="45%">'+Tuser["activeValue"]+'</td></tr></table></td></tr></table></td></tr>';
	                
	                if(crole==2){
	                	str+='<tr id="tabtrInfo"><td height="30" colspan="2">'+
	                    '<table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td  width="8%"></td><td width="30%">'+
	                    '<a class="tabtd" onclick="setCircleManager(0,'+Tdata["user_id"]+')">取消管理员</a></td>'+
	                    '<td width="30%"><a class="tabtd" onclick="updateToCircle(5,'+Tdata["user_id"]+')">移除成员</a>'+
	                    '</td><td width="48%"></td></tr></table></td></tr>';
	                }	                
	                str+='</table></td>';
	                
	                if(i%2==0&&i==msg.rows.length-1){
                		str+='<td width="50%">&nbsp;</td>';
                	}
	                if(i%2==1){
	                	str+='</tr><tr><td colspan="2" style="border-bottom: #cccccc solid 1px;">&nbsp;&nbsp;</td></tr>';	                        
	                }	    			
	    		}
	    		str+='<tr><td>&nbsp;</td></tr>';
	    		chooseTheTiaoJIan(stat,msg.total);
	    		$('#tbodyPerple').html(str);
	    		
	    	}else{
	    		chooseTheTiaoJIan(stat,0);
	    		$('#tbodyPerple').html('<tr><td style="padding-left:25px;color:#7eccce;" heigth="80px">'+msg.msg+'</td></tr><tr>'+
	    				'<td colspan="2" style="border-bottom: #cccccc solid 1px;">&nbsp;'+
	    				'</td></tr><tr><td>&nbsp;</td></tr>');
	    	}
	     }
	});
	
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

function updateToCircle(stat,userId){
	if(userId==0){
		userId=selectedTheUser();
	}
	$.ajax({
	     type: "POST",
	     url : '${ctx}/user!updateCirclePerple.action',
	     dataType:'json',
	     data:{userId:userId,status:stat,circleId:circleId},
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

function setCircleManager(nun,userId){
	if(userId==0){
		 userId=selectedTheUser();
		 var s=userId.split(",");
		 if(s.length>4&&nun==1){
			 alert('最多可设置4个管理员！');
			 return;
		 }
	}
	$.ajax({
	     type: "POST",
	     url : '${ctx}/user!nsetCircleManager.action',
	     dataType:'json',
	     data:{userId:userId,circleRole:nun,circleId:circleId},
	     success: function(msg,status){
	    	if(msg.status == 200){
	    		alert("设置成功!");
	    		chooseCircleManager(4);
	    	}else{
	    		alert(msg.msg);
	    		chooseCircleManager(4);
	    	}
	     }
	});	
}
function cssTheMenuAndMenu(stat){
		
	$('#tabMenu td[className^="nextMenu"]').each(function(){
		$(this).attr("class","nextMenu");
	});
	$('#setmenu'+stat).attr("class","nextMenuOn");	
}
</script>




