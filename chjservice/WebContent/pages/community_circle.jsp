<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>漕河泾e服务</title>
<link rel="stylesheet" type="text/css" href="${ctx}/js/dialog/dialog_subModal.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />
<style type="text/css">
.test a{
border:0px solid #000;
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

.bottom_nav{
margin:0px;font-family:微软雅黑;
}
.bottom_nav  li{    /*顶端--菜单样式*/
	border-right:1px solid #ccc;
	text-align:center;
	float:left;
	width:115px;
	height:60px;
	list-style:none;
	color:#fff;font-family:微软雅黑;
}
.bottom_nav  li:hover{
	cursor:pointer;
	color:blue;font-family:微软雅黑;
}
.bottom_nav  li div{
margin:20px 0 0 6px;font-family:微软雅黑;
}


.personal_fr1{
float:left;margin-left:10px;
}
.main_content{font-family: 黑体;color:9a9a9c;}
ul.ul-tag li{
padding-left:4px;
padding-right:4px;
float:left;
font-size:14px;
color:#fff;font-family:微软雅黑;
background:#dcdcdc;
margin-left:4px;
margin-top:2px;
text-align:center;
list-style: none;
max-width: 200px;/*具体数值自行修改，下一行相同*/
word-break:keep-all;
}

.spancomm{
 background:url(${ctx}/images/button12.png) no-repeat;
 color: #FFF;background-repeat: repeat;text-align:center;
 margin-top: 5px;font-family:微软雅黑;
}
.ul-create-activity li{cursor:pointer;float:left;font-size:18px;
color:#fff;list-style: none;height:50px;line-height:50px;text-align: center;}
.circleContent img{max-width: 550px;}
</style>

</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />
<script type="text/javascript" src="${ctx}/js/dialog/dialog_common.js"></script>
<script type="text/javascript" src="${ctx}/js/dialog/dialog_subModal.js"></script>


<div class="main">
<div id="main_content" class="main_content">

<div class="shareweb"">
<div class="jiathis_style_24x24">
	<a class="jiathis_button_qzone" ><span style="font-size:14px; font-family: 微软雅黑;">qq空间</span></a>
	<a class="jiathis_button_tsina"><span style="font-size:14px; font-family: 微软雅黑;">新浪</span></a>
	<a class="jiathis_button_tqq"><span style="font-size:14px; font-family: 微软雅黑;">腾讯微博</span></a>
	<a class="jiathis_button_renren"><span style="font-size:14px; font-family: 微软雅黑;">人人网</span></a>
<img src="${ctx}/images/close.gif" onclick="$('.shareweb').hide()"/>
</div>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
</div>

  
   <div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	     <div style="float:left;"><img src="${ctx}/images/menu_68.jpg" onclick="gotoPage('${ctx}/community!communityHome.action')" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_62.jpg" onclick="gotoPage('${ctx}/pages/community_topiclist.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_65.jpg" onclick="gotoPage('${ctx}/pages/community_activitylist.jsp')"/></div>           
           <div class="menu1"><img src="${ctx}/images/menu_59.jpg" onclick="gotoPage('${ctx}/pages/community_circlelist.jsp')" style="width:190px;"/></div>
           <div><img src="${ctx}/images/menu_66.png" style="width:473px;height: 100px;" /></div>
	    </div>
  
</div>
 
 
 <div style="position:relative; font-family:微软雅黑;padding:10px 25px 0 25px;">
   <div>
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td valign="top" width="590px">
    
    <div style="float:left; width:590px;">
    <table width="590" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" style="float:left;">
      <tr>
        <td width="230" height="230" valign="top" style="border-bottom:#FC0 solid 1px">
        <img src="${imageStorePath}${circle.circleImage}" width="230" height="230" />
        <br/>
        <c:if test="${circle.userId != user.userId}">
        <c:if test="${circle.circleUserStatus == null || circle.circleUserStatus=='4'||circle.circleUserStatus=='5'}">
       	  <div onclick="addCircle(${circle.circleId},'${circle.isCheck}')"  style="cursor:pointer;position:absolute;color:#fff;width:230px;height:40px;line-height:40px;top:200px;text-align: center;background:#ffbe00;">
         	申请加入</div>
        </c:if> 
        <c:if test="${circle.circleUserStatus=='1'}">
        <div style="position:absolute;color:#fff;width:230px;height:40px;line-height:40px;top:200px;text-align: center;background:#ffbe00;">
         	等待审核</div>
        </c:if>
         <c:if test="${circle.circleUserStatus=='2'}">
        <div style="position:absolute;color:#fff;width:230px;height:40px;line-height:40px;top:200px;text-align: center;background:#ffbe00;">
         	审核未通过</div>
        </c:if>
         <c:if test="${circle.circleUserStatus=='3'}">
        <div onclick="exitCircleUser(${circle.circleId})"  style="cursor:pointer;position:absolute;color:#fff;width:230px;height:40px;line-height:40px;top:200px;text-align: center;background:#ffbe00;">
         	退&nbsp;出</div>
        
         	
        </c:if>
        </c:if>
        </td>
        <td width="360" valign="top" style="border-bottom:#FC0 solid 1px">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="45" width="360">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="88%" class="comm_ys" style="padding-top:8px;">
                ${circle.name}
                </td>
              </tr>
            </table></td>
          </tr>
        
          <tr>
            <td><p class="comm_ysdis">圈子等级：
            <span>${circle.level}</span>
            <c:if test="${user.userId== circle.userId}">
            <c:if test="${circle.status !='3'}">
             &nbsp;&nbsp;<span id="spanAddLevel" style="cursor:pointer;"
              onclick="apply_add_level('申请升级',${circle.circleId},1)">申请升级</span>
            </c:if>
            <c:if test="${circle.status =='3'}">
              <c:if test="${circle.examineResult=='1'}">
              &nbsp;&nbsp;<span id="spanAddLevel" style="cursor:pointer;"
              onclick="apply_add_level('申请升级',${circle.circleId},1)">申请升级</span>
            
             </c:if>
              <c:if test="${circle.examineResult=='2'}">
               &nbsp;&nbsp;<span>申请升级未通过</span>
              </c:if>
              <c:if test="${circle.examineResult=='3'}">
               &nbsp;&nbsp;<span>申请升级待审核</span>
              </c:if>
            </c:if>
             <c:if test="${circle.status !='4'}">
             &nbsp;&nbsp;<span id="span_close" style="cursor:pointer;" onclick="apply_close('申请关闭',${circle.circleId},2)">申请关闭</span>
            </c:if>
             <c:if test="${circle.status =='4'}">
              <c:if test="${circle.examineResult=='2'}">
                &nbsp;&nbsp;<span>申请关闭未通过</span>
              </c:if>
              <c:if test="${circle.examineResult=='3'}">
                &nbsp;&nbsp;<span>申请关闭待审核</span>
              </c:if>
            
            </c:if>
            </c:if>
             
            
            
            
           
            
            </p></td>
          </tr>
         <tr>
                <td width="360">
                <table  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td  height="25" class="comm_ysdis">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td ><img src="${ctx}/dynamic/circle_but1.png" width="28" height="28" /></td>
                        <td  style="font-size:14px;font-family:微软雅黑;">${circle.circleViews}&nbsp;</td>
                        <td  style="font-size:14px;font-family:微软雅黑;"></td>
                       <c:if test="${circle.isCollection>0}">
                        <td style="font-size:14px;font-family:微软雅黑;"><img src="${ctx}/dynamic/circle_but2.png" width="28" height="28" /></td>
                        <td  style="font-size:14px;font-family:微软雅黑;">已收藏&nbsp;</td>
                        </c:if>
                         <c:if test="${circle.isCollection==0}">
                        <td  style="font-size:14px;font-family:微软雅黑;"><img src="${ctx}/dynamic/circle_but2.png" width="28" height="28" /></td>
                        <td  onclick="user_collection(${circle.circleId},2)" style="cursor:pointer;font-size:14px;">收藏&nbsp;</td>
                        </c:if>
                        <td ><img src="${ctx}/dynamic/circle_but3.png" width="28" height="28" /></td>
                        <td  style="font-size:14px;font-family:微软雅黑;cursor:pointer;" id="share_img">分享&nbsp;</td>
                       <c:if test="${user.userId!=null && user.userId== circle.userId}">
                        <td><img src="${ctx}/dynamic/circle_but4.png" width="28" height="28" /></td>                    
                        <td ><span style="font-size:14px;font-family:微软雅黑;cursor:pointer;" onclick="window.location.href='${ctx}/community!createCircle.action?circleId=${circle.circleId}'">编辑</span></td>
                        </c:if>
                        </tr>
                      </table></td>
                    </tr>
                  </table></td>
              </tr>
           <tr>
                <td width="360" height="80" class="comm_ysdis">
                ${circle.summary}
                </td>
           </tr>
          <tr>
            <td height="30" style="padding-left:15px;">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="100%" height="30" align="center" valign="bottom">
               
                 <ul class="ul-tag">
             <c:forEach var="item" items="${circle.tagList}">
             	<li>${item.tagName}</li>
             </c:forEach>
             </ul>
             
                </td>
             </tr>
            </table></td>
          </tr>
          
        </table></td>
      </tr>
      
      <tr>
        <td colspan="2" style="padding-top:10px;font-family:微软雅黑;" >
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-bottom:#FC0 solid 3px;" >
          <tr>
            <td width="50%" height="23" align="center" class="comm_ysdis">圈子生日：</td>
            <td width="25%" align="center" class="comm_ysdis">圈子成员</td>
            <td width="25%" align="center" class="comm_ysdis">话题数</td>
          </tr>
          <tr >
            <td align="center"><strong>${circle.createTime}</strong></td>
            <td rowspan="3" valign="top"  align="center">&nbsp;&nbsp;<strong>${circle.userCount}</strong></td>
            <td rowspan="3" valign="top" align="center">&nbsp;&nbsp;<strong>${circle.topicCount}</strong></td>
          </tr>
          <tr >
            <td align="center" colspan="2">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table>
    
   <table  width="590" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" style="float:left; border-bottom:#ebb900 solid 3px; padding-top:10px; margin-top:10px;">
     
      <tr>
        <td class="circleContent" style="width:590px;padding-left:15px; font-family:微软雅黑;">
        <span style="font-size:16px; font-weight:bold;">圈子详情</span><br/>
         ${circle.circleContent}
         </td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0"	cellpadding="0">
	<tr style="background-color:#ffbf00;height:40px;">
        <td  style="width:300px;font-size:18px; color:#FFF; padding-left:25px;">话题(<span id="spanTopicTotal">0</span>)</td>
      
        <td style="font-size:18px; color:#FFF;">
        
       
       </td>
     </tr>
     </table>
     
	<table id="table_topic" width="100%" border="0" cellspacing="0"
	cellpadding="0">
	 
	
	</table>
	
	<div style="clear:both;position:relative;height:35px;padding-bottom:10px;margin-top:10px;background:#fff;">
     <div id="pager" style="float:right;" ></div>
 </div>								
										
 </div>
      </td>
      
      <td valign="top" width="350px">
    <div class="personal_fr1" style="width:350px;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
      <c:if test="${circle.companyId!=null||circle.companyId>0}">
  		<tr>
            <td width="94"  height="95" valign="middle" style="border-bottom:1px solid #fc0;">
   
             <img onclick="window.location.href='${ctx}/pages/convenient_brandpinfo.jsp?companyId=${circle.companyId}'"  
            style="cursor:pointer;" src="${imageStorePath}${companyInfo.logo}" width="94" style="border:1px solid #444;"/>
           
              <c:if test="${companyInfo.isCollection == null || companyInfo.isCollection==0}">
           <br/>
         <div style="font-family:微软雅黑;clear:both;cursor:pointer;font-size:12px;position:absolute;color:#fff;width:94px;height:20px;line-height:20px;top:85px;text-align: center;background:#ffbe00;" 
         onclick="user_collection(${companyInfo.companyId},7,this)" >收藏</div>
         </c:if>
          
  
            </td>
            <td width="256" valign="top" style="border-bottom:1px solid #fc0;">
            <table width="97%" border="0" cellspacing="0" cellpadding="0" style="padding-left:5px;">
              <tr>
                <td height="25">
                <span onclick="window.location.href='${ctx}/pages/convenient_brandpinfo.jsp?companyId=${circle.companyId}'" 
                style="cursor:pointer;color:#919191;">${companyInfo.name}</span></td>
              </tr>
              <tr>
                <td height="20" style="font-size:14px;">
                <c:forEach begin="1" end="${companyInfo.starScore}" step="1">
                  <img src="${ctx}/images/brand_xx.png" style="width:12px;height:12px;"/>
                </c:forEach>
                </td>
              </tr>
               <tr>
                <td height="28" style="font-size:12px;color:#a5a0a0;">
                	企业简介：<span id="spanUserInfo"></span></td>
              </tr>
            </table></td>
         </tr>
  		</c:if>
  	<c:if test="${circle.companyId==null||circle.companyId==0}">
  		<tr>
            <td width="94"  height="95" valign="top" style="border-bottom:1px solid #fc0;">
            <img onclick="gotoUserDetail(${user.userId},${activityCreateUser.userId})" style="padding:6px 0 0 8px;cursor:pointer;" src="${imageStorePath}${activityCreateUser.headPicture}" width="62" height="62" />
            <br/>
            
            <c:if test="${activityCreateUser.hasAdd == null || activityCreateUser.hasAdd==0}">
         <div style="clear:both;cursor:pointer;font-size:12px;position:absolute;color:#fff;width:94px;height:20px;line-height:20px;top:85px;text-align: center;background:#ffbe00;" 
         onclick="addFriend(${activityCreateUser.userId})" >加好友</div>
         </c:if>
          
        
            </td>
            <td width="256" valign="top" style="border-bottom:1px solid #fc0;">
            <table width="97%" border="0" cellspacing="0" cellpadding="0" style="padding-left:5px;">
              <tr>
                <td height="25" ><span onclick="gotoUserDetail(${user.userId},${activityCreateUser.userId})" style="cursor:pointer;color:#919191;">发起人：${activityCreateUser.nickName}</span></td>
              </tr>
              <tr>
                <td height="20" style="font-size:14px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="14%"><img src="${ctx}/dynamic/activity_but1.png" width="20" height="18" /></td>
                    <td width="15%">${activityCreateUser.activeValue}</td>
                    <td width="11%"><img src="${ctx}/dynamic/activity_but2.png" width="20" height="18" /></td>
                    <td width="60%" height="30">${activityCreateUser.sincerityValue}</td>
                  </tr>
                </table></td>
              </tr>
               <tr>
                <td height="28" style="font-family:微软雅黑;font-size:12px;color:#a5a0a0;">个人简介：<span id="spanUserInfo"></span></td>
              </tr>
            </table></td>
         </tr>
        </c:if>
        
      <tr>
        <td colspan="2" height="28" style="padding-top:10px;padding-right:40px; font-size:16px; font-weight:bold; padding-left:10px;"> 
                    圈子成员   　
        <span onclick="circle_member(${circle.circleId},'${circle.userId}','${circle.companyId}')" style="cursor:pointer;float:right;font-size:14px; color:#f0cc44;">
         <c:if test="${actRoleId!=null && (actRoleId=='2' || actRoleId=='1')}">
      	         管理成员
      	  </c:if>
      	   <c:if test="${actRoleId!=null && actRoleId=='0'}">
      	    更多成员
      	   </c:if>
      	    <c:if test="${actRoleId==null}">
      	    查看成员
      	   </c:if>
        </span>
        </td>
      </tr>
       <tr>
        <td colspan="2" height="28"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        
           <c:if test="${fn:length(circleUserList)>0}">
            <c:forEach var="item" items="${circleUserList}" varStatus="index1">
        	<c:if test="${index1.index%5==0}">
        	  <tr>
        	</c:if>
        	
        	<td height="61" align="center" style="padding:2px 0 4px 0;">
            <img onclick="gotoUserDetail('${user.userId}',${item.userId})" style="cursor:pointer;" src="${imageStorePath}${item.headPicture}" width="48" height="48" />
            <br/><span onclick="gotoUserDetail('${user.userId}',${item.userId})" style="font-size:12px;cursor:pointer;color:#f0cc44;">
             <c:if test="${fn:length(item.nickName)>3}">
            ${fn:substring(item.nickName,0,3)}...
            </c:if>
            <c:if test="${fn:length(item.nickName)<=3}">
             ${item.nickName}
            </c:if>
            </span>
            </td>
            <c:if test="${index1.index%5==4 || index1.index==9}">
            	</tr>
            </c:if>
        </c:forEach>
          
           </c:if>
          
        </table></td>
      </tr>
      
    </table>
  
   
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <c:if test="${circle.userId==user.userId || (circle.circleUserStatus != null && circle.circleUserStatus=='3')}">
       <tr>
        <td colspan="2" style="padding-top:10px;padding-bottom:10px;">
        <ul class="ul-create-activity">
      	<li style="width:350px;cursor:pointer;background:url(${ctx}/images/cjht_1.png)" onclick="createCircleTopic()"></li>
       </ul>
        </td>
       </tr>
    </c:if>
          
        <tr style="background-color:#ffbf00; height:40px;">
        <td colspan="2" style="font-size:18px; color:#FFF; font-family:微软雅黑;padding-left:25px;">推广圈子</td>
        </tr>
         <tr>
           <c:if test="${fn:length(circleRecommend)==0}">
            <td width="100%" height="240" style="padding:10px;background:#fff;" valign="top">
            	暂无推荐圈子
            </td>
           </c:if>
          
          
           <c:if test="${fn:length(circleRecommend)>0}">
            <c:forEach var="item" items="${circleRecommend}" varStatus="index1">
           <c:if test="${index1.index>0}">
             <tr>
              <td colspan="2" height="10" valign="top">
            
             </td>
            </tr>
            </c:if>
            <tr>
            <td width="140" valign="top" style="background:#fff;padding:10px 15px 20px 10px;" >
           <table width="100%" border="0" cellspacing="0" cellpadding="0">
             <tr>
               <td colspan="3" height="160" align="left">
               <img onclick="circle_detail('${user.userId}',${item.circleId},'${item.userId}','${item.status}','${item.examineResult}')" style="cursor:pointer;" src="${imageStorePath}${item.circleImage}" width="130" height="130" />
                <br/>
    <c:if test="${item.userId != user.userId}">
        <c:if test="${item.circleUserStatus == null || item.circleUserStatus=='4'||item.circleUserStatus=='5'}">
         <div style="cursor:pointer;color:#fff;width:130px;height:30px;line-height:30px;margin-top:-2px;text-align: center;background:#ffbe00;" onclick="addCircle(${item.circleId},'${item.isCheck}')" >申请加入</div>
        </c:if>
         <c:if test="${item.circleUserStatus=='1'}">
        <div style="color:#fff;width:130px;height:30px;line-height:30px;margin-top:-2px;text-align: center;background:#ffbe00;">
         	等待审核</div>
        </c:if>
         <c:if test="${item.circleUserStatus=='2'}">
        <div style="color:#fff;width:130px;height:30px;line-height:30px;margin-top:-2px;text-align: center;background:#ffbe00;">
         	审核未通过</div>
        </c:if>
         <c:if test="${item.circleUserStatus=='3'}">
        <div onclick="exitCircleUser(${item.circleId})" style="color:#fff;width:130px;height:30px;line-height:30px;margin-top:-2px;text-align: center;background:#ffbe00;">
         	退&nbsp;出</div>
        </c:if>
     </c:if>
       </td>
             
             </tr>
            
           </table>
           </td>
           <td width="210" valign="top" style="background:#fff;">
           <table width="100%" border="0" cellspacing="0" cellpadding="0">
             <tr> 
               <td colspan="2" height="35" onclick="circle_detail('${user.userId}',${item.circleId},'${item.userId}','${item.status}','${item.examineResult}')" style="cursor:pointer;padding-top:15px; font-size:18px; color:#333; font-weight:bold; font-family:'微软雅黑';">
              <c:if test="${fn:length(item.name)>8}">
         ${fn:substring(item.name,0,8)}...
      		  </c:if>
     		 	<c:if test="${fn:length(item.name)<=8}">
        ${item.name}
     			 </c:if>
               </td>
             </tr>
            
             <tr>
               <td colspan="2" height="128" width="170" valign="top" style="padding:5px 6px 0 0; width:173px;height:92px;font-size:14px; color:#666;">
              
              <c:if test="${fn:length(item.summary)>45}">
         ${fn:substring(item.summary,0,45)}...
      		  </c:if>
     		 	<c:if test="${fn:length(item.summary)<=45}">
        ${item.summary}
     			 </c:if>
               </td>
             </tr>
            
	<tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                
                <td width="40" align="center"  valign="top" style="font-family:微软雅黑;padding-top:4px;color:#ccc; font-size:14px;">话题</td>
                <td width="48" align="center" valign="top" style="padding-top:4px;background:url(${ctx}/images/button12.png) no-repeat;height:34px; color:#fff; font-size:12px;">
             
               	 ${item.topicCount}
                
                </td>
                
                <td width="142"  valign="top" style="padding-top:4px;">
                <ul class="ul-tag">
                <c:forEach items="${item.tagList}" var="tag" varStatus="index2">
              	 <c:if test="${index2.index<2}">
               	 	<li>
               	 	<c:if test="${fn:length(tag.tagName)>3}">
               	 	  ${fn:substring(tag.tagName,0,3)}
               	 	 </c:if>
               	 	 <c:if test="${fn:length(tag.tagName)<=3}">
               	 	  ${tag.tagName}
               	 	 </c:if>
               	 	</li>
               	 	</c:if>
                </c:forEach>
                </ul>
                </td>
               
              </tr>
            </table></td>
  </tr>
           </table></td>
          
         </tr>
         </c:forEach>
         </c:if>
         
       </table>

    </div>
 
    </td>
    </tr>
    </table>
    
 </div>
 
</div>

 

  <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>


 
 
 <input  />

</body>
</html>
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	
	var info = '${activityCreateUser.info}';
	if("${circle.companyId}"!='0'&&"${circle.companyId}"!=''&&"${circle.companyId}"!='null'){
		info='${companyInfo.companyInfo}';
	}
	
	if(info.length>32){
		info=info.substr(0,32)+'...';
	}
	$('#spanUserInfo').html(info);
	
	findTopicList(1);
});
PageClick = function(pageclickednumber) {
    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
    findTopicList(pageclickednumber);
}

function findTopicList(page) {
	pageinfo["size"]=15;
	pageinfo["page"]=page;
	pageinfo["circleId"]="${circle.circleId}";
	
	$.ajax({
				type : "POST",
				url : '${ctx}/community!findTopicList.action',
				dataType : 'json',
				data : pageinfo,
				success : function(msg, status) {
					if (msg.status == 200) {
						if(msg.total%pageinfo["size"]==0)
			    	    	pageinfo["tp"]=msg.total/pageinfo["size"];
			    	    else
			    	    	pageinfo["tp"]=Math.ceil(msg.total/pageinfo["size"]);
			    		$("#pager").pager({ pagenumber: pageinfo["page"], pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
			    		
			    		
						var str='';
						$('#spanTopicTotal').html(msg.total);
						for(var i=0;i<msg.rows.length;i++){
							var data=msg.rows[i];
							var summary=data["summary"];
							if(summary.length>65){
								summary=summary.substring(0,65)+'...';
							}
							
							str+='<tr id="topic_tr'+data["topicId"]+'"><td valign="top" style="font-family:微软雅黑;border-bottom: 6px;color:#9a9a9c;">';		
							str+='<table style="font-family:微软雅黑;border-bottom:#eee 3px solid;background-color: #FFF;">';
							str+='<tr><td rowspan="3" width="70px" align="left" valign="top" style="padding: 8px 0 0 5px;">';
							str+='<img src="${imageStorePath}'+data["userNamePict"]["headPicture"]+'" width="60px" height="60px"/></td>';
							str+='<td colspan="6" height="20px" style="color: #000;padding-top:5px;"><span style="cursor:pointer;" onclick="circleTopicDetail(\''+"${user.userId}"+'\','+data["topicId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\',${circle.circleId})">'+data["topicName"]+"</span>";
							if(data["listTop"]==1){
								str+='<a style="margin-left:10px;color: #FC0;">置顶</a>';
							}	
							if("${actRoleId}"=="2" || "${actRoleId}"=="1"){
								if(data["listTop"]>0){
									str+='<a onclick="updateTopicTop('+data["topicId"]+',0)" style="float:right;margin-right:10px;cursor:pointer;margin-left: 10px;color: #FC0;font-size:12px;">[取消置顶]</a>'
								}else{
									str+='<a onclick="updateTopicTop('+data["topicId"]+',1)" style="float:right;margin-right:10px;cursor:pointer;margin-left: 10px;color: #FC0;font-size:12px;">[置顶]</a>'
								}
							}
							if("${actRoleId}"=="2" || "${actRoleId}"=="1" || "${user.userId}"==data["userId"]){
								str+='<a onclick="updateTopicDelete('+data["topicId"]+','+data["userId"]+')" style="float:right;margin-right:10px;cursor:pointer;margin-left: 10px;color: #FC0;font-size:12px;">[删除]</a>';
							}
							
							str+='</td></tr>';
							
							str+='<tr><td colspan="6" style="font-size: 14px;font-family:微软雅黑;padding:0 15px 0 5px;height: 40px;">'+summary+' </td></tr>';
							str+='<tr style="font-size: 12px;"><td width="60px" height="30px">发起人：</td>';
							if(data["userNamePict"]["nickName"].length>5){
								data["userNamePict"]["nickName"]=data["userNamePict"]["nickName"].substr(0,4)+'...';
							}
							str+='<td width="80px">'+data["userNamePict"]["nickName"]+'</td><td width="130px">'+data["createTime"]+'</td>';
							str+='<td width="30px">评论</td><td width="40px" class="spancomm">'+data["topicViews"]+'</td>';
							str+='<td width="190px">';
							str+='<ul class="ul-tag">';
							for(var j=0;j<data["tagList"].length;j++){
								if(j<2){
									if(data["tagList"][j]["tagName"].length>3)
										data["tagList"][j]["tagName"]=data["tagList"][j]["tagName"].substr(0,3)+'...';
									
									str+='<li>'+data["tagList"][j]["tagName"]+'</li>';
								}
							}
							str+='</ul></td></tr></table></td></tr>';
						}
						$('#table_topic').html(str);
						
						array=[];
				    	array=null;
					}
				}
			});
	
}
function go_right(type){
	
	if(type==1){
		$('#activityImageDiv').animate({ scrollLeft: $('#activityImageDiv').scrollLeft()+170 },500);
	}
	else{
		$('#activityImageDiv').animate({ scrollLeft: $('#activityImageDiv').scrollLeft()-170 },500);
	}
}
var addCircleFlag={};
function addCircle(id,isCheck){
	if(addCircleFlag[id+""]){
		alert('已加入圈子!');
		return;
	}
	$.ajax({
	    type: "POST",
	    url : '${ctx}/community!addUserCircle.action',
	    dataType:'json',
	    data:{circleId:id,isCheck:isCheck},
	    success: function(msg,status){
	    	if(msg.status==200){
	    		addCircleFlag[id+""]=true;
	    		if(isCheck=='T'){
	    			alert('加入成功,请等待审核!',function(){
	    				window.location.href="${ctx}/community!findCircleDetail.action?circleId=${circle.circleId}";
	    			});
	    		}
	    		else{
	    			alert('恭喜您成为圈子成员!',function(){
	    				window.location.href="${ctx}/community!findCircleDetail.action?circleId=${circle.circleId}";
	    			});
	    		}
	    		
	    	}
	    	else
	    		alert(msg.msg);
	    }
	});   
}
function createCircleTopic(){
	$('#formturn').attr('action',"${ctx}/community!createTopic.action");
	$('#circleIdHidden').val("${circle.circleId}");
	$('#typeHidden').val("1");
	$('#formturn').submit();
}

function addFriend(userId){
	$.ajax({
	    type: "POST",
	    url : '${ctx}/user!addUserFriend.action',
	    dataType:'json',
	    data:{friendId:userId},
	    success: function(msg,status){
	    	if(msg.status==200)
	    		alert('加入成功!');
	    	else
	    		alert(msg.msg);
	    }
	});
}
var collectionFlag={};
function user_collection(id,type){
	if(collectionFlag[id+""+type]){
		alert('已收藏!');
		return;
	}
	$.ajax({
	     type: "POST",
	     url : '${ctx}/user!collectionUserRestarant.action',
	     dataType:'json',
	     data:{objectId:id,type:type},
	     success: function(msg,status){
	    	if(msg.status == 200){	
	    		collectionFlag[id+""+type]=true;
	    		alert('收藏成功!');
	    		if(type == 7){
	    	    	$(obj).hide();
	    	    }
	    	}
	    	else
	    	  alert(msg.msg);
	     }
	});
}


var exitActivityUserFlag=false;
function exitCircleUser(id){
	if(exitActivityUserFlag){
		alert('已退出该圈子!');
		return;
	}
	$.ajax({
	     type: "POST",
	     url : '${ctx}/community!exitCircleUser.action',
	     dataType:'json',
	     data:{circleId:id},
	     success: function(msg,status){
	    	if(msg.status == 200){	
	    	  exitActivityUserFlag=true;
	    	  alert('已退出该圈子!',function(){
  				window.location.href="${ctx}/community!findCircleDetail.action?circleId=${circle.circleId}";
  			   });
	    	}
	    	else
	    	  alert(msg.msg);
	     }
	});
}
function circle_member(circleId,createUserId,companyId){
	$('#companyIdHidden').val(companyId);
	$('#userIdHidden').val(createUserId);
	$('#circleIdHidden').val(circleId);
	if('${user.userId}'.length==0){
		$('#pageHidden').val("community_circle_member1.jsp");
	}else{
		$('#pageHidden').val("community_circle_member.jsp");
	}	
	$('#formturn').attr("action","${ctx}/community!turnpageCircleMember.action");	
	$('#formturn').submit();
}
function updateTopicDelete(id,topicUserId){
	$.ajax({
	     type: "POST",
	     url : '${ctx}/community!updateTopicDelete.action',
	     dataType:'json',
	     data:{topicId:id,circleId:"${circle.circleId}",userId:"${circle.userId}",topicUserId:topicUserId},
	     success: function(msg,status){
	    	if(msg.status == 200){	
	    		$('#topic_tr'+id).remove();
	    	  alert('删除成功!');
	    	}
	    	else
	    	  alert(msg.msg);
	     }
	});
}

function updateTopicTop(id,type){
	$.ajax({
	     type: "POST",
	     url : '${ctx}/community!updateTopicTop.action',
	     dataType:'json',
	     data:{type:type,topicId:id,circleId:"${circle.circleId}",userId:"${circle.userId}"},
	     success: function(msg,status){
	    	if(msg.status == 200){	
	    	  if(type==0)
	    		  alert('取消成功!');
	    	  else
	    		  alert('置顶成功!');
	    	}
	    	else 
	    	  alert(msg.msg);
	     }
	});
}

var closeFlag={};
function apply_close(title,id,type){
	if(closeFlag[""+id]){
		alert('已申请关闭!');
		return;
	}
	$.ajax({
	     type: "POST",
	     url : '${ctx}/community!applyCloseCircle.action',
	     dataType:'json',
	     data:{circleId:id},
	     success: function(msg,status){
	    	if(msg.status == 200){	
		      closeFlag[""+id]=true;
	    	  $('#span_close').html('已申请关闭');
	    	}
	    	else
	    	  alert(msg.msg);
	     }
	});
}
var addLevel={};
var diag= null;
function apply_add_level(title,id,doType){
	if("${circle.level}"=="5"){
		alert('已达到最大等级！');
		return;
	}
	if("${user.userId}"==""){
		alert('请登录!');
		return;
	}
	if(addLevel[id+""+doType]){
		alert('操作已完成!');
		return;
	}
	//showPopWin(title,'${ctx}/pages/community_uplaod_card.jsp?doType='+doType+'&type=1&objectId='+id, 407, 200, apply_add_level_suss);
	diag = new Dialog();
	diag.Width = 500;
	diag.Height = 180;
	diag.Title = title;
	diag.URL = '${ctx}/pages/community_uplaod_card.jsp?doType='+doType+'&type=1&objectId='+id;
	diag.show();

}
function apply_add_level_suss(data){
	if(data!=undefined){
		if(data.status ==200){
			$('#spanAddLevel').html('已申请升级');
			addLevel[data["objectId"]]=true;
		}
		else{
			alert(data.msg);
		}
	}
}

</script>

