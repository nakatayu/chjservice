<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="${ctx}/js/dialog/dialog_subModal.css" />
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

.personal_fr1{
float:left;margin-left:10px;
}
.input-color{color:#ccc;}
.input-color-focus{color:#000;}
ul.ul-tag li{
padding-left:4px;
padding-right:4px;
float:left;
color:#fff;
font-size:14px;
background:#dcdcdc;
margin-left:4px;
margin-top:2px;
text-align:center;
list-style: none;
max-width: 200px;/*具体数值自行修改，下一行相同*/
word-break:keep-all;
}

.ul_a{float:left;}
.ul_a li{
	color:#ccc;
	font-size:14px;
	text-align:center;
	float:left;
	height:20px;
	max-width: 200px;/*具体数值自行修改，下一行相同*/
	word-break:keep-all;
	list-style:none;
	color: #ffbf00;
}
.ul_a li:hover{
	cursor:pointer;
	background:#00b36b;
	color:#ccc;
}
.activity_content img{max-width: 550px;}
</style>

</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />
<script type="text/javascript" src="${ctx}/js/dialog/dialog_common.js"></script>
<script type="text/javascript" src="${ctx}/js/dialog/dialog_subModal.js"></script>
<script type="text/javascript" src="${ctx}/js/activity.js"></script>

<div class="main">
<div id="main_content" class="main_content">
   <input id="hiddenAddressLat" type="hidden" value="${activity.lat}"/>
   <input id="hiddenAddressLng" type="hidden" value="${activity.lng}"/>
     
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
           <div class="menu1"><img src="${ctx}/images/menu_70.jpg" onclick="gotoPage('${ctx}/pages/community_activitylist.jsp ')" style="width:190px;" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_63.jpg" onclick="gotoPage('${ctx}/community!findLableListCircle.action')"/></div>
           <div><img src="${ctx}/images/menu_66.png" style="width:473px;height: 100px;" /></div>
	    </div>
</div>
 

<div style="position:relative; padding:10px 25px 0 25px;">
   <div>
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td valign="top" width="590px">
    <div style="float:left; width:590px;">
    <table width="590" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" style="font-family:微软雅黑;float:left;">
      <tr>
        <td width="230" height="230" valign="top" style="padding-top:10px;">
        <img src="${imageStorePath}${activity.activityImage}" width="230" height="230" style="margin-top:-10px;"/>
        <br/>
        <c:if test="${activity.createUserId != user.userId}">        
        <c:if test="${activity.activityUserStatus == null || activity.activityUserStatus=='4'||activity.activityUserStatus=='5'}">
       
       <div id="enrolldiv${activity.activityId}" onclick="addActivityUser('加入活动',2,${activity.activityId},'${activity.isCheck}','${activity.isQrcode}','fresh')" style="cursor:pointer;position:absolute;color:#fff;width:230px;height:40px;line-height:40px;top:210px;text-align: center;background:#ffbe00;">
         	我要报名</div>         	
        </c:if>
        <c:if test="${activity.activityUserStatus=='1'}">
        <div style="cursor:pointer;position:absolute;color:#fff;width:230px;height:40px;line-height:40px;top:210px;text-align: center;background:#ffbe00;">
         	等待审核</div>
        </c:if>
         <c:if test="${activity.activityUserStatus=='2'}">
        <div style="position:absolute;color:#fff;width:230px;height:40px;line-height:40px;top:210px;text-align: center;background:#ffbe00;">
         	审核未通过</div>
        </c:if>
         <c:if test="${activity.activityUserStatus=='3'}">
        <div onclick="exitActivityUser(this,${activity.activityId})" style="cursor:pointer;position:absolute;color:#fff;width:230px;height:40px;line-height:40px;top:210px;text-align: center;background:#ffbe00;">
         	退&nbsp;出</div>
        </c:if>
        
        </c:if>
        </td>
        <td width="360" height="230" valign="top" >
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="45"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="88%" class="comm_ys" style="padding-top:10px;">
                 ${activity.title}
                </td>
               
              </tr>
            </table></td>
          </tr>
           <tr>
                <td width="360">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td  height="25" class="comm_ysdis">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td ><img src="${ctx}/dynamic/circle_but1.png" width="28" height="28" /></td>
                        <td  style="font-size:14px;font-family:微软雅黑;">${activity.browseCount}&nbsp;</td>
                        <td  style="font-size:14px;font-family:微软雅黑;"></td>
                       <c:if test="${activity.isCollection>0}">
                        <td style="font-size:14px;"><img src="${ctx}/dynamic/circle_but2.png" width="28" height="28" /></td>
                        <td  style="font-size:14px;font-family:微软雅黑;">已收藏&nbsp;</td>
                        </c:if>
                         <c:if test="${activity.isCollection==0}">
                        <td  style="font-size:14px;"><img src="${ctx}/dynamic/circle_but2.png" width="28" height="28" /></td>
                        <td  onclick="user_collection(${activity.activityId},3)" style="cursor:pointer;font-size:14px;">收藏&nbsp;</td>
                        </c:if>
                        <td ><img src="${ctx}/dynamic/circle_but3.png" width="28" height="28" /></td>
                        <td  style="font-size:14px;font-family:微软雅黑;cursor:pointer;"  id="share_img">分享&nbsp;</td>
                       <c:if test="${user.userId!=null && user.userId== activity.createUserId}">
                        <td><img src="${ctx}/dynamic/circle_but4.png" width="28" height="28" /></td>                    
                        <td ><span style="font-size:14px;cursor:pointer;" onclick="window.location.href='${ctx}/community!createActivity.action?type=0&activityId=${activity.activityId}'">编辑</span></td>
                        </c:if>
                        </tr>
                      </table></td>
                    </tr>
                  </table></td>
              </tr>
          
          <tr>
            <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td  height="25" class="comm_ysdis">地点:  ${activity.address}
                <img src="${ctx}/dynamic/activ_2.png" style="cursor:pointer;" onclick="openmap('${activity.lat}','${activity.lng}')" width="16" height="21" /></td>
              </tr>
            </table></td>
          </tr>
          <c:if test="${activity.isMoney != 'T'}">
         	 <tr><td height="21" class="comm_ysdis">费用说明: 免费</td></tr>
          </c:if>
           <c:if test="${activity.isMoney == 'T'}">
           	 <tr><td height="21" class="comm_ysdis">付款方式:  ${activity.payType}</td></tr>
             <tr><td height="21" class="comm_ysdis">活动费用:  ${activity.moneynum}元</td></tr>
             <tr><td height="21" class="comm_ysdis">费用说明:  ${activity.moneyDetail}</td></tr>
           </c:if>
           
          <tr><td height="62" class="comm_ysdis" valign="top">摘要:  ${activity.summary}</td></tr>
          <tr>
            <td height="30" style="padding-left:10px;">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="75%" height="30" align="center" valign="bottom">
                   <ul class="ul-tag">
             <c:forEach var="item" items="${activity.tagList}">
             	<li>${item.tagName}</li>
             </c:forEach>
            
             </ul>
                </td>
                <td width="30%" valign="bottom" style="font-size:14px;font-family:微软雅黑;" class="comm_ysdis">
                <c:if test="${user.userId!=null && user.userId== activity.createUserId && activity.status !='3'}">
				    <span id="span_close" style="cursor:pointer;" onclick="apply_close(${activity.activityId})">申请关闭</span>
				 </c:if>
				 <c:if test="${user.userId!=null && user.userId== activity.createUserId && activity.status =='3'}">
				    已申请关闭
				 </c:if>
				 </td>
              </tr>
            </table></td>
          </tr>
         
        </table></td>
      </tr>
      <tr>
       <td colspan="2" style="border-top:#FC0 solid 1px">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" ><table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-bottom:#FC0 solid 3px;" >
          <tr>
            <td width="28%" height="23" align="center" class="comm_ysdis">活动时间:</td>
            <td width="27%" align="center" class="comm_ysdis">报名时间:</td>
            <td width="15%" align="center" class="comm_ysdis">可参与人数</td>
            <td width="15%" align="center" class="comm_ysdis">已参与人数</td>
            <td width="15%" align="center" class="comm_ysdis">活动名额</td>
          </tr>
          <tr >
            <td align="center" class="comm_ysdis"  style="font-size:12px;">${activity.beginTime} 起</td>
            <td align="center" class="comm_ysdis"  style="font-size:12px;">${activity.enrollBeginTime} 起</td>
            <td rowspan="2" align="center"><strong>
            <c:if test="${(activity.userMax-activity.userCount)>0}">
            	${activity.userMax-activity.userCount}
            </c:if>
            <c:if test="${(activity.userMax-activity.userCount)<=0}">
            	0
            </c:if>
            </strong></td>
            <td rowspan="2" align="center"><strong>${activity.userCount}</strong></td>
            <td rowspan="2" align="center"><strong>${activity.userMax}</strong></td>
          </tr>
          
          <tr >
            <td align="center" class="comm_ysdis" style="font-size:12px;">
            <c:if test="${activity.endTime !=null && activity.endTime!=''}">
            ${activity.endTime} 止
            </c:if>
             <c:if test="${activity.endTime ==null||activity.endTime==''}">
            	&nbsp;
            </c:if>
            </td>
             <td align="center" class="comm_ysdis" style="font-size:12px;">
            <c:if test="${activity.enrollEndTime !=null && activity.enrollEndTime!=''}">
            ${activity.enrollEndTime} 止
            </c:if>
             <c:if test="${activity.enrollEndTime ==null||activity.enrollEndTime==''}">
            	&nbsp;
            </c:if>
            </td>
            </tr>
        </table></td>
      </tr>
    </table>
    
   <table width="590" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" style="float:left;  padding-top:10px; margin-top:10px;">
     
      <tr>
         <td class="activity_content" style="padding-left:15px;width:590px;">
        <span style="font-size:16px; font-weight:bold;font-family:微软雅黑;">活动详情</span><br/>
        <div style="width:575px;overflow-x:auto;overflow-y:hidden;">
          ${activity.content}
         </div> 
         </td>
         </tr>
       <tr>
         <td class="activity_content" style="padding-top:50px;padding-left:15px;width:590px;">
        <span style="font-size:16px; font-weight:bold;font-family:微软雅黑;">交通推荐</span><br/>
        <div style="width:575px;overflow-x:auto;overflow-y:hidden;">
          ${activity.traffic}
         </div> 
         </td>
      </tr>
       <tr>
        <td style="border-bottom:#ffbf00 solid 3px;">&nbsp;</td>
      </tr>
       <tr>
    <td width="590" valign="top" style="padding-top:14px;padding-left:15px;">
    <span style="font-size:16px;font-weight:bold;font-family:微软雅黑;">评论</span><br/>
    </td>
    </tr>
      <tr>
    <td width="590" valign="top">
    <table id="table_comment" width="100%" border="0" cellspacing="0" cellpadding="0">
       <c:forEach var="item" items="${commentList}">
      <tr>
        <td height="40">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="14%" rowspan="4" style="padding:10px 0 0 20px;">
            <img onclick="gotoUserDetail('${user.userId}',${item.userId})" style="cursor:pointer;" src="${imageStorePath}${item.headImage}" width="48" height="48" />
            </td>
          
            <td width="26%" height="32" style="color:#ffbf00; font-size:12px;">
         	   <ul class="ul_a">
         	    <li onclick="gotoUserDetail('${user.userId}',${item.userId})">发布者：${item.nickName}</li>
         	   </ul>
            </td>
            <td width="60%" style="color:#999; font-size:12px;">
             ${item.commentTime}
           </td>
          </tr>
           
          <tr>
            <td colspan="3"  style="word-break:break-all; word-wrap:break-word;color:#999; font-size:12px;padding-right:40px;padding-bottom:10px;">
         	   <c:if test="${item.toNickName!=null}">
         	     <ul class="ul_a">
         	    	<li onclick="gotoUserDetail('${user.userId}',${item.toUserId})">@ ${item.toNickName}：
         	    	</li>
         	   	 </ul>
         	   	 ${item.toContent}
         	   	</c:if>
         	 </td>
          </tr>
        
          <tr>
            <td colspan="3"  style="word-break:break-all; word-wrap:break-word;color:#999; font-size:12px;padding-right:40px;">
               ${item.content}
          		<a href="#td-comment" style="margin-right:10px;float:right;color:#ffbf00;" onclick="gotoReplay(${item.userId},'${item.nickName}','${item.content}')">回复</a>
            </td>
          </tr>
        </table>
        </td>
      </tr>
     <tr>
       <td style="border-bottom:#ffbf00 solid 1px;">&nbsp;</td>
     </tr>
      </c:forEach>
      
     </table>
    </td>
    </tr>
    <tr>
    <td id="td-comment" height="60" valign="top" style="border-top:#ffbf00 solid 1px;padding:20px 0 0 10px; font-size:20px; color:#666; background-color:#f9f9f7;">说点什么吧</td>
  </tr>
   <tr>
   <td style="word-break:break-all; word-wrap:break-word;background-color:#f9f9f7;padding-left:28px;padding-right:30px;">
    <span style="color:#ffbf00;font-size:12px;" id="toUser"></span>
    <span style="margin-left:10px;color:#999;font-size:12px;" id="toContent"></span>
   </td>
   </tr>
  <tr align="center">
    <td height="67" valign="top" style="font-family:微软雅黑;background-color:#f9f9f7;">
     
      <textarea id="txtContent" class="input-color" cols="76" rows="7">200字内</textarea>
      <br/>
      <span id="spanTitle" style="float:right;color:#ccc;margin-right:46px;">0/200</span>
     </td>
  </tr>
  <tr>
    <td height="24" valign="top" style="padding:20px 0 0 20px;  background-color:#f9f9f7;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="68%">&nbsp;</td>
        <td width="32%">
        <a href="#table_comment" onclick="createActivityComment()">
        <img  style="cursor:pointer" src="${ctx}/images/topic_title_4.jpg" width="129" height="40" />
        </a>
        </td>
      </tr>
      <tr>
        <td width="68%">&nbsp;</td>
        </tr>
    </table></td>
  </tr>
  
  
    </table>

    </div>
   
   </td>
  <td valign="top" width="350px">
   <div style="width:350px;margin-left:10px;">
  
   <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
  		<c:if test="${activity.companyId!=null||activity.companyId>0}">
  		<tr>
            <td width="94"  height="95" valign="middle" style="border-bottom:1px solid #fc0;">
            <img onclick="window.location.href='${ctx}/pages/convenient_brandpinfo.jsp?companyId=${activity.companyId}'"
              style="cursor:pointer;" src="${imageStorePath}${companyInfo.logo}" width="94"/>
          
            <c:if test="${companyInfo.isCollection == null || companyInfo.isCollection==0}">
         <br/>
         <div style="clear:both;cursor:pointer;font-family:微软雅黑;font-size:12px;position:absolute;color:#fff;width:94px;height:20px;line-height:20px;top:85px;text-align: center;background:#ffbe00;" 
         onclick="user_collection(${companyInfo.companyId},7,this)" >收藏</div>
         </c:if>
          
        
            </td>
            <td width="256" valign="top" style="border-bottom:1px solid #fc0;">
            <table width="97%" border="0" cellspacing="0" cellpadding="0" style="padding-left:5px;">
              <tr>
                <td height="25"><span onclick="window.location.href='${ctx}/pages/convenient_brandpinfo.jsp?companyId=${activity.companyId}'" style="cursor:pointer;color:#919191;">${companyInfo.name}</span></td>
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
  	<c:if test="${activity.companyId==null||activity.companyId==0}">
  		<tr>
            <td width="94"  height="95" valign="top" style="border-bottom:1px solid #fc0;">
            <img onclick="gotoUserDetail('${user.userId}',${activityCreateUser.userId})" style="cursor:pointer;padding:6px 0 0 8px;" src="${imageStorePath}${activityCreateUser.headPicture}" width="62" height="62" />
            <br/>
            
            <c:if test="${activityCreateUser.hasAdd == null || activityCreateUser.hasAdd==0}">
         <div style="clear:both;cursor:pointer;font-size:12px;position:absolute;color:#fff;width:94px;height:20px;line-height:20px;top:85px;text-align: center;background:#ffbe00;" 
         onclick="addFriend(${activityCreateUser.userId})" >加好友</div>
         </c:if>
          
        
            </td>
            <td width="256" valign="top" style="border-bottom:1px solid #fc0;">
            <table width="97%" border="0" cellspacing="0" cellpadding="0" style="padding-left:5px;">
              <tr>
                <td height="25" ><span onclick="gotoUserDetail('${user.userId}',${activityCreateUser.userId})" style="cursor:pointer;color:#919191;">发起人：${activityCreateUser.nickName}</span></td>
              </tr>
              <tr>
                <td height="20" style="font-size:14px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="14%"><img src="${ctx}/dynamic/activity_but1.png" width="20" height="18" /></td>
                    <td width="15%">
                    <c:if test="${activityCreateUser.activeValue !=null}">
                      ${activityCreateUser.activeValue}
                    </c:if>
                     <c:if test="${activityCreateUser.activeValue == null}">
                     0
                     </c:if>
                    </td>
                    <td width="11%"><img src="${ctx}/dynamic/activity_but2.png" width="20" height="18" /></td>
                    <td width="60%" height="30">
                    <c:if test="${activityCreateUser.sincerityValue !=null}">
                    ${activityCreateUser.sincerityValue}
                    </c:if>
                    <c:if test="${activityCreateUser.sincerityValue ==null}">
                    0
                    </c:if>
                    </td>
                  </tr>
                </table></td>
              </tr>
               <tr>
                <td height="28" style="font-size:12px;font-family:微软雅黑;color:#a5a0a0;">个人简介：<span id="spanUserInfo"></span></td>
              </tr>
            </table></td>
         </tr>
        </c:if>
        
      <tr>
        <td colspan="2" height="28" style="font-size:16px; font-weight:bold;padding-right:40px; padding-left:10px;padding-top:10px;">
         	活动成员   　
      	 <span onclick="activity_member(${activity.activityId},${activity.createUserId},'${activity.companyId}','${activity.isCheck}')"   style="cursor:pointer;float:right;font-size:14px; color:#f0cc44;">
      	  <c:if test="${user.userId!=null && user.userId==activity.createUserId}">
      	         管理成员
      	  </c:if>
      	   <c:if test="${user.userId!=null && user.userId!=activity.createUserId}">
      	       更多成员
      	   </c:if>
      	   <c:if test="${user.userId==null}">
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
    
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; border-bottom:2px solid #F90;">
  
  <tr style="background-color:#ffbf00;height:45px; cursor:pointer;background:url(${ctx}/images/act_t2.png)" onclick="window.location.href='${ctx}/pages/community_activity_images.jsp?activityId=${activity.activityId}'">
          <td colspan="2">&nbsp;</td>

  </tr>
   <c:if test="${fn:length(activityImage) == 0}">
   <tr style="height:50px;">
      <td colspan="2" style="font-size:16px; color:#333; padding-left:25px;">
      暂无照片
      </td>
   </tr>
   </c:if>
   
  <c:forEach var="item" items="${activityImage}" varStatus="index1">
  
   <c:if test="${index1.index%2==0}">
     <tr>
     <td style="padding-top:10px;padding-left:10px;" align="left">
     <img src="${imageStorePath}${item.filePath}" style="cursor:pointer;" onclick="window.location.href='${ctx}/pages/community_activity_image.jsp?activityId=${activity.activityId}&actImgId=${index1.index}'"  width="160" height="160" />
     </td>
   </c:if>
   
    <c:if test="${index1.index%2==1}">
    <td style="padding-top:10px;padding-left:6px;" align="left">
    <img src="${imageStorePath}${item.filePath}" style="cursor:pointer;"  onclick="window.location.href='${ctx}/pages/community_activity_image.jsp?activityId=${activity.activityId}&actImgId=${index1.index}'"  width="160" height="160"  />
    </td>
    </c:if>
    
    <c:if test="${index1.index%2==0 && index1.index==(fn:length(activityImage)-1)}">
    <td></td>
    </c:if>
    
    <c:if test="${index1.index%2==1 || index1.index==(fn:length(activityImage)-1)}">
    </tr>
   </c:if>
  </c:forEach>
 
  <tr>
    <td style="padding-top:10px;">
    </td>
  </tr>
</table>
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr style="background-color:#ffbf00; height:45px; background:url(${ctx}/images/act_t1.png)"><td colspan="2"></td></tr>
           <c:if test="${activityRecommend==null||fn:length(activityRecommend) == 0}">
             
            <tr>
            <td width="100%" height="240" style="background:#fff;font-family:微软雅黑;padding:10px;" valign="top">
            	暂无推荐活动
            </td>
            </tr>
           </c:if>
          
           <c:if test="${fn:length(activityRecommend)>0}">
           
           <c:forEach var="item" items="${activityRecommend}" varStatus="index1">
           <c:if test="${index1.index>0}">
             <tr>
              <td colspan="2" height="10" valign="top">
            
             </td>
            </tr>
            </c:if>
            
            <tr>
    <td width="140" valign="top" style="background:#fff;height:130px;padding:10px 15px 20px 10px;">
    <img onclick="activity_detail('${user.userId}',${item.activityId},'${item.createUserId}','${item.status}','${item.examineResult}')" style="cursor:pointer;" src="${imageStorePath}${item.activityImage}" width="130" height="130"  />
    
    <c:if test="${item.createUserId != user.userId}">
        <c:if test="${item.activityUserStatus == null || item.activityUserStatus=='4'||item.activityUserStatus=='5'}">
         <div id="enrolldiv${item.activityId}" style="cursor:pointer;color:#fff;width:130px;height:30px;line-height:30px;margin-top:-2px;text-align: center;background:#ffbe00;" 
         onclick="addActivityUser('加入活动',2,${item.activityId},'${item.isCheck}','${item.isQrcode}','fresh')" >
         	我要报名</div>
        </c:if>
         <c:if test="${item.activityUserStatus=='1'}">
        <div style="color:#fff;width:130px;height:30px;line-height:30px;margin-top:-2px;text-align: center;background:#ffbe00;">
         	等待审核</div>
        </c:if>
         <c:if test="${item.activityUserStatus=='2'}">
        <div style="color:#fff;width:130px;height:30px;line-height:30px;margin-top:-2px;text-align: center;background:#ffbe00;">
         	审核未通过</div>
        </c:if>
         <c:if test="${item.activityUserStatus=='3'}">
        <div onclick="exitActivityUser(this,${item.activityId})" style="cursor:pointer;color:#fff;width:130px;height:30px;line-height:30px;margin-top:-2px;text-align: center;background:#ffbe00;">
         	退&nbsp;出</div>
        </c:if>
     </c:if>
    </td>
    <td width="210" valign="top" style="background:#fff;"> 
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td onclick="activity_detail('${user.userId}',${item.activityId},'${item.createUserId}','${item.status}','${item.examineResult}')" style="cursor:pointer;padding-top:10px; font-size:16px; color:#333; font-weight:bold; font-family:'微软雅黑';">
   <c:if test="${fn:length(item.title)>8}">
         ${fn:substring(item.title,0,8)}...
      		  </c:if>
     		 	<c:if test="${fn:length(item.title)<=8}">
        ${item.title}
     			 </c:if>
    </td>
  </tr>
  <tr>
    <td valign="top" style="padding:5px 6px 0 0; width:173px;height:92px;font-size:14px; color:#666;">
   <c:if test="${fn:length(item.summary)>45}">
         ${fn:substring(item.summary,0,8)}...
      		  </c:if>
     		 	<c:if test="${fn:length(item.summary)<=45}">
        ${item.summary}
     			 </c:if>
    </td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="40" align="center"  valign="top" style="padding-top:4px;color:#ccc; font-size:14px;">评论</td>
                <td width="48" align="center" valign="top" style="padding-top:4px;background:url(${ctx}/images/button12.png) no-repeat;height:34px; color:#fff; font-size:12px;">
             
               	 ${item.commentCount}
                
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
</table>
</td>
  </tr>
  
         </c:forEach>
         </c:if>
         <tr>
         <td>&nbsp;</td>
         </tr>
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


 
 
 

</body>
</html>
<script type="text/javascript">

$(document).ready(function(){
	var info = '${activityCreateUser.info}';
	if("${activity.companyId}"!='0'&&"${activity.companyId}"!=''&&"${activity.companyId}"!='null'){
		info='${companyInfo.companyInfo}';
	}
	if(info.length>32){
		info=info.substr(0,32)+'...';
	}
	$('#spanUserInfo').html(info);
	initInput('txtContent','spanTitle','200字内',200);
	
});

function circleTopicDetail(id){
	$('#formturn').attr('action',"${ctx}/community!circleTopicDetail.action");
	$('#topicIdHidden').val(id);
	$('#formturn').submit();
}

function go_right(type){
	
	if(type==1){
		$('#activityImageDiv').animate({ scrollLeft: $('#activityImageDiv').scrollLeft()+170 },500);
	}
	else{
		$('#activityImageDiv').animate({ scrollLeft: $('#activityImageDiv').scrollLeft()-170 },500);
	}
}
var addFriendFlag=false;
function addFriend(userId){
	if(addFriendFlag){
		alert('已成为好友!');
		return;
	}
	$.ajax({
	    type: "POST",
	    url : '${ctx}/user!addUserFriend.action',
	    dataType:'json',
	    data:{friendId:userId},
	    success: function(msg,status){
	    	if(msg.status==200){
	    		addFriendFlag=true;
	    		alert('加入成功!');
	    	}	    		
	    	else
	    		alert(msg.msg);
	    }
	});
}

var collectionFlag={};
function user_collection(id,type,obj){
	if("${user.userId}"==""){
		alert('请登录!');
		return;
	}
	if(collectionFlag["type"]){
		alert('已收藏!');
		return;
	}
	$.ajax({
	     type: "POST",
	     url : context+'/user!collectionUserRestarant.action',
	     dataType:'json',
	     data:{objectId:id,type:type},
	     success: function(msg,status){
	    	
	    	if(msg.status == 200){	
	    		collectionFlag["type"]=true;
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
var closeFlag=false;
function apply_close(id){
	if(closeFlag){
		alert('已申请关闭!');
		return;
	}
	$.ajax({
	     type: "POST",
	     url : '${ctx}/community!applyCloseActivity.action',
	     dataType:'json',
	     data:{activityId:id},
	     success: function(msg,status){
	    	if(msg.status == 200){	
		      closeFlag=true;
	    	  $('#span_close').html('已申请关闭',function(){
	  				window.location.href="${ctx}/community!findActivityDetail.action?activityId=${activity.activityId}";
 			   });
	    	}
	    	else
	    	  alert(msg.msg);
	     }
	});
}
var exitActivityUserFlag={};
function exitActivityUser(obj,id){
	if(exitActivityUserFlag[id+""]){
		alert('已退出该活动!');
		return;
	}
	$.ajax({
	     type: "POST",
	     url : '${ctx}/community!exitActivityUser.action',
	     dataType:'json',
	     data:{activityId:id},
	     success: function(msg,status){
	    	if(msg.status == 200){	
	    	  exitActivityUserFlag[id+""]=true;
	    	  $(obj).html('已退出');
	    	  alert('退出成功!',function(){
	  				window.location.href="${ctx}/community!findActivityDetail.action?activityId=${activity.activityId}";
			   });
	    	}
	    	else
	    	  alert(msg.msg);
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
function createActivityComment(){
	if($.trim($('#txtContent').val()) == '200字内'){
		alert('请输入评论内容!');
		return;
	}
	if($.trim($('#txtContent').val()).length >200){
		alert('文字过长!');
		return;
	}
	
	$.ajax({
	    type: "POST",
	    url : '${ctx}/user!KeywordFliter.action',
	    dataType:'json',
	    data:{word:$.trim($('#txtContent').val())},
	    success: function(msg,status){
	    	
	    	if(msg.status==200){
	    		if(msg.rows.length>0){
	    			
	    			if(loadding_dialog!=null){
	    	    		loadding_dialog.close();
	    	    	}
	    			alert('您提交的内容含有敏感词:'+msg.rows.join(','));
	    		}
	    		else{
	    			createActivityCommentSubmit();
	    		}
	        }
	    }
	   });
}
function createActivityCommentSubmit(){
	
	$.ajax({
		type : "POST",
		url : '${ctx}/community!addActivityComment.action',
		dataType : 'json',
		data :{toContent:toContent,toUserId:toUserId,activityId:"${activity.activityId}",content:$('#txtContent').val()},
		success : function(msg, status) {
			if(msg.status == 200){
				alert('评论成功!');
				var toUserInfo='';
				if(toContent.length >0){
					toUserInfo= '<tr>'+
			          '  <td colspan="3"  style="word-break:break-all; word-wrap:break-word;color:#999; font-size:12px;padding-right:40px;padding-bottom:10px;">'+
			         	'     <ul class="ul_a">'+
			         	'    	<li>@ '+toNickName+'：'+
			         	'    	</li>'+
			         	'   	 </ul>'+
			         	toContent+
			         	' </td>'+
			         ' </tr>';
				}
				$('#table_comment').prepend('<tr>'+
				        '<td height="40">'+
				        '<table width="100%" border="0" cellspacing="0" cellpadding="0">'+
				          '<tr>'+
				            '<td width="14%" rowspan="3" style="font-family:微软雅黑;padding:10px 0 0 20px;"><img  onclick="gotoUserDetail(\'${user.userId}\',${user.userId})" style="cursor:pointer;" src="${ctx}${user.headPicture}" width="48" height="48" /></td>'+
				            '<td width="21%" height="42" style="font-family:微软雅黑;color:#ffbf00; font-size:12px;">'+
				            '<ul class="ul_a">'+
			         	   ' <li onclick="gotoUserDetail(\'${user.userId}\',${user.userId})">发布者：${user.nickName}</li>'+
			         	   '</ul>'+
			         	   '</td>'+
				            '<td width="65%" style="font-family:微软雅黑;color:#00c0c8; font-size:12px;"><span style="color:#999; font-size:12px;">'+curDateTime()+'</span></td>'+
				          '</tr>'+
				          toUserInfo+
				          '<tr>'+
				           ' <td colspan="3"  style="font-family:微软雅黑;word-break:break-all; word-wrap:break-word;color:#999; font-size:12px;padding-right:40px;">'+
				           $('#txtContent').val()+
				           '<a href="#td-comment" style="color:#ffbf00;margin-right:10px;float:right;" onclick="gotoReplay(${user.userId},\'${user.nickName}\',\''+$('#txtContent').val()+'\')">回复</a>'+
				           ' </td>'+
				          ' </tr>'+
				       ' </table>'+
				       ' </td>'+
				     '</tr>'+
				    
				     '<tr>'+
				       '<td style="border-bottom:#ffbf00 solid 1px;">&nbsp;</td>'+
				     '</tr>');
				$('#txtContent').val('');
				
				$('#spanCommentCount').html(parseInt($('#spanCommentCount').html(),10)+1);
				toUserId='';
				toNickName='';
				toContent='';
				$('#toUser').html('');
				$('#toContent').html('');
			}
			else{
				alert(msg.msg);
			}
		}
	});
}

var toUserId='';
var toNickName='',toContent='';
function gotoReplay(toid,nickName,content){
	toNickName =nickName;
	toUserId = toid+"";
	toContent=content;
	$('#toUser').html('@  '+nickName);
	$('#toContent').html(content);
}

function signin_fun(id){
	$.ajax({
		type : "POST",
		url : '${ctx}/community!userSignInActivity.action',
		dataType : 'json',
		data :{activityId:id},
		success : function(msg, status) {
			if(msg.status == 200){
				$('#btnSignIn').html('已签到');
				$('#btnSignIn').unbind("click"); //移除click
			}
			else{
				alert(msg.msg);
			}
		}
	});
	
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
function activity_member(actId,createUserId,companyId,isCheck){
	$('#companyIdHidden').val(companyId);
	$('#userIdHidden').val(createUserId);
	$('#activityIdHidden').val(actId);
	$('#isCheckHidden').val(isCheck);
	if('${user.userId}'.length==0){
		$('#pageHidden').val("community_activity_member1.jsp");
	}else{
		$('#pageHidden').val("community_activity_member.jsp");
	}	
	$('#formturn').attr("action","${ctx}/community!turnpage.action");	
	$('#formturn').submit();
}

function openmap(lat,lng){ 
		if(lat=='' || lng =='' || lat==0 || lng==0){
			alert('经纬度获取错误!');
			return;
		}
		$('#latHidden').val(lat);
		$('#lngHidden').val(lng);
		$('#addressHidden').val("${activity.address}");
		$('#hiddenProName').val("${activity.title}");
		$('#companyShopId').val("${activity.activityId}");
		
		$('#formturn').attr('target',"_self");
		$('#formturn').attr('action',"${ctx}/pages/convenient_resta_map.jsp");
		$('#formturn').submit();
	
}
</script>

