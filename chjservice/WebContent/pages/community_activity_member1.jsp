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
 
 <div style="width:100%;"> 
<table style="border-bottom:#F90 3px solid;background-color: #ffffff;width: 100%;" border="0" cellspacing="0" cellpadding="0">
 
 <tr><td style="background-color:#ffc61a;font-family:微软雅黑; color:#FFF;font-size:16px;padding:15px 0 15px 15px;font-weight:bold;" >活动成员</td>
 </tr>
 
 <c:if test="${companyInfo!=null}">
 <tr>
 <td style="padding:20px 0 10px 20px; color:#7eccce;font-family:微软雅黑;" >
     企业信息
 </td>
 </tr>
 <tr>
     <td width="100%" valign="top">
       <table border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td width="100" align="center" style="padding-top: 10px;">
           
               <img onclick="window.location.href='${ctx}/pages/convenient_brandpinfo.jsp?companyId=${companyId}'" style="cursor:pointer;" src="${imageStorePath}${companyInfo.logo}" id="headPicture" width="73" height="78" />
              
           </td>           
           <td valign="top" align="left">
           
           <table border="0" cellspacing="0" cellpadding="0" >
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
             <tr>
               <td style="font-size:12px;color:#a5a0a0;font-family:微软雅黑;height: 28px;"  colspan="6">简介: <span id="info">${companyInfo.companyInfo}</span></td>
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
 <td style="padding:20px 0 10px 20px; color:#7eccce;">
     发起人
 </td>
 </tr>
 <tr>
     <td width="100%" valign="top">
       <table border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td width="100" align="center" style="padding-top: 10px;">
           
               <img onclick="gotoUserDetail(${user.userId},${activityCreateUser.userId})" style="cursor:pointer;" src="${imageStorePath}${activityCreateUser.headPicture}" id="headPicture" width="73" height="78" />
              
           </td>           
           <td valign="top" align="left">
           
           <table width="100%" border="0" cellspacing="0" cellpadding="0" >
             <tr style="color:#ffc61a;height: 35px;">
               <td  colspan="5" onclick="gotoUserDetail(${user.userId},${activityCreateUser.userId})" style="cursor:pointer;padding-left: 5px;" id="nickName">${activityCreateUser.nickName}</td>
             </tr>
             <tr  style="font-family:微软雅黑;font-size:12px;color:#a5a0a0;height: 28px;" >
               <td colspan="5">个人简介：<span id="info">${activityCreateUser.info}</span></td>
             </tr>
             <tr style="font-size:14px;height: 20px;">
               <td>
               <img src="${ctx}/dynamic/activity_but1.png" width="20" height="18" /></td>
               <td id="sincerityValue">${activityCreateUser.sincerityValue}</td>
               <td><img src="${ctx}/dynamic/activity_but2.png" width="20" height="18" /></td>
               <td  id="activeValue">${activityCreateUser.activeValue}</td>
                
               <td width="700">&nbsp;</td>
             </tr>
             </table>
             </td>
         </tr>
         
         </table>
         </td>
      </tr>
       </c:if>
      
      <tr>
         <td style="font-family:微软雅黑;border-bottom:#efefef 1px solid;">&nbsp;</td>
      </tr> 
      <tr>
     <td style="padding:10px 0 10px 20px;color:#7eccce;font-size:16px;">已参与成员</td>
      </tr>
      
      <tr>
      <td>       
      <table id="perpleList" width="100%" border="0" cellspacing="0" cellpadding="0">
      </table>
      </td>
      </tr>           
    </table>
    
    
    <div style="float:left;width: 100%;">
    <div id="pager" style="float:right;" ></div>
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
	if(info.length>150){
		info=info.substr(0,150)+'...';
	}
	$('#info').html(info);
	
	loadData(1);
});

function loadData(pagenum){
	  
	pageinfo["size"]=15;
	pageinfo["page"]=pagenum;
	pageinfo["status"]=3;
	pageinfo["activityId"]=activityId;
	
	$.ajax({
	     type: "POST",
	     url : '${ctx}/user!examineTheMemberMeth.action',
	     dataType:'json',
	     data:pageinfo,
	     success: function(msg,status){
	    	if(msg.status == 200){
	    		var str='';
	    		var num=msg.total;
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
	    			
	    			
	    			if(i%3==0){
	    				str+='<tr>';	
	    			}	    			
	    			str+='<td valign="top" width="316" align="left" style="font-family:微软雅黑;border-bottom:#efefef 1px solid;">';
	    			str+='<table border="0" cellspacing="0" cellpadding="0" width="100%">';
	    			str+='<tr><td width="36%" align="center" style="padding-top: 10px;">';         
	    			str+='<img src="${imageStorePath}'+Tuser["headPicture"]+'" width="73" height="78" /></td>';
	    			str+='<td width="64%" valign="top">';           
	    			str+='<table border="0" cellspacing="0" cellpadding="0" width="100%">';
	    			str+='<tr style="color:#ffc61a;height: 35px;">';
	    			str+='<td colspan="4" style="padding-left: 5px;">'+nickName+'</td></tr>';
	    			str+='<tr  style="font-size:12px;color:#a5a0a0;height: 28px;" >';
	    			str+='<td colspan="4" style="word-break:break-all;word-wrap:break-word;">个人简介：'+info+'</td></tr>';
	    			str+='<tr style="font-size:14px;height: 20px;">';
	    			str+='<td width="14%"><img src="${ctx}/dynamic/activity_but1.png" width="20" height="18" /></td>';
	    			str+='<td width="22%">'+Tuser["sincerityValue"]+'</td><td width="14%">';
	    			str+='<img src="${ctx}/dynamic/activity_but2.png" width="20" height="18" /></td>';
	    			str+='<td width="45%">'+Tuser["activeValue"]+'</td></tr></table></td></tr>';
	    			str+='<tr><td>&nbsp;</td></tr></table></td>';
	    			if(i%3==2){
	    				str+='</tr>';
	    			}	    			
	    			if(i==msg.rows.length-1){
	    				if(i%3==0){
	    					str+='<td width="34%">&nbsp;</td><td width="33%">&nbsp;</td></tr>';
	    				}else if(i%3==1){
	    					str+='<td width="33%">&nbsp;</td></tr>';
	    				}
	    			}	    			
	    		}
	    		$('#perpleList').html(str);
		    }else{
		    	$("#pager").hide();
	    		$('#perpleList').html('<tr><td style="padding-left:25px;color:#7eccce;" heigth="80px">'+msg.msg+'</td></tr>');
		    }	    		
	     }	     
	});
}

PageClick = function(pageclickednumber) {
	$("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
	examineTheMember(pageclickednumber,statusId);
};
</script>





