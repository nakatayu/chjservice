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
.input-color{color:#ccc;overflow: hidden;}
.input-color-focus{color:#000;}

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
	color: #ffbf00;font-family:微软雅黑;
}
.ul_a li:hover{
	cursor:pointer;
	background:#00b36b;
	color:#ccc;font-family:微软雅黑;
}
ul.ul-tag li{
padding-left:4px;
padding-right:4px;
float:left;
color:#fff;font-family:微软雅黑;
font-size:14px;
background:#dcdcdc;
margin-left:4px;
margin-top:2px;
text-align:center;
list-style: none;
max-width: 200px;/*具体数值自行修改，下一行相同*/
word-break:keep-all;
}
.btntop{
border: 0px;background-color: #dcdcdc;font-family: '微软雅黑';
margin: 0 3px;color: #fff;font-size: 10px;
padding-left:0px;font-family:微软雅黑;
padding-right:0px;
}
.spancomm{
 background-image:url(${ctx}/images/button12.png);position:relative;
 background-color: #FFF;background-repeat: repeat;text-align:center;
 margin-top: 5px;font-family:微软雅黑;
}
.divImag{
width: 114px; float: left; height: 135px; margin-bottom: 5px; 
margin-left: 4px;background-color: #F2A000;font-family:微软雅黑;
}
.divDivTil{
 width:330px;border-bottom:#ffc61a 3px solid;padding: 5px 10px 5px 10px;font-family:微软雅黑;
}

.pTopic{
 height:62px; width:62px; margin: 10px 0 5px 5px;padding:5px 0 0 5px;float: left;font-family:微软雅黑;
}
.divNum{
 color:#9a9a9c;background-color: #FFF;height: 110px;font-family:微软雅黑;
 border-bottom:#ffc61a 3px solid;cursor: pointer;
}
.ul-create-activity li{cursor:pointer;float:left;font-size:18px;
color:#fff;list-style: none;height:50px;line-height:50px;text-align: center;}
.topicContent img{max-width: 550px;}
</style>

</head>
 
<body onscroll="b()">

<jsp:include page="/common/header.jsp" />

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

<c:if test="${circleId==null || circleId==''}">
<div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	     <div style="float:left;"><img src="${ctx}/images/menu_68.jpg" onclick="gotoPage('${ctx}/community!communityHome.action')" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_69.jpg" onclick="gotoPage('${ctx}/pages/community_topiclist.jsp')"style="width:190px;" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_65.jpg" onclick="gotoPage('${ctx}/pages/community_activitylist.jsp')" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_63.jpg" onclick="gotoPage('${ctx}/community!findLableListCircle.action')"/></div>
           <div><img src="${ctx}/images/menu_66.png" style="width:473px;height: 100px;" /></div>
	    </div>
  
</div>
</c:if>
<c:if test="${circleId>0}">
<div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	     <div style="float:left;"><img src="${ctx}/images/menu_68.jpg" onclick="gotoPage('${ctx}/community!communityHome.action')" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_62.jpg" onclick="gotoPage('${ctx}/pages/community_topiclist.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_65.jpg" onclick="gotoPage('${ctx}/pages/community_activitylist.jsp')"/></div>           
           <div class="menu1"><img src="${ctx}/images/menu_59.jpg" onclick="gotoPage('${ctx}/pages/community_circlelist.jsp')" style="width:190px;"/></div>
           <div><img src="${ctx}/images/menu_66.png" style="width:473px;height: 100px;" /></div>
	    </div>
  
</div>
</c:if>
 
 
<div style="position:relative;font-family:微软雅黑; padding:10px 25px 0 25px;">
   
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td valign="top" width="590px">
    
      <c:if test="${fn:length(topicImageList)>0}">
    
    <div style="float:left; width:590px;  background:#fff;padding-bottom: 10px;margin-bottom: 10px;">
   
	<table width="590" align="center" border="0" cellspacing="0" cellpadding="0">
	<c:if test="${circleId>0}">
		<tr><td colspan="3" style="padding-left:20px;padding-top:4px;"><a style="color:#ffbf00;" href="javascript:void(0)" onclick="history.go(-1)">返回圈子</a></td></tr>
    </c:if>
              <tr> 
                <td width="4%" height="207">
                <img src="${ctx}/images/activ_10.png" onclick="go_right(-1)"  width="21" height="35" />
                </td>
                <td width="90%" align="center" style="height:207px;" >
                	<div id="activityImageDiv" style="overflow:hidden;width:500px;height:160px;">
                	<table cellpadding="0" cellspacing="0"><tr>
                	
                	<c:forEach var="item" items="${topicImageList}" varStatus="index1">
                		<c:if test="${index1.index==0}">
                			<td width="160"><img src="${imageStorePath}${item.filePath}" width="160" height="160" /></td>
                		</c:if>
                		<c:if test="${index1.index>0}">
                			<td width="160" style="padding-left:10px;"><img src="${imageStorePath}${item.filePath}" width="160" height="160" /></td>
                		</c:if>
                	</c:forEach>
                	
                	</tr>
                	</table>
                	</div>
                </td>
                <td width="6%" align="center">
                <img src="${ctx}/images/activ_11.png" onclick="go_right(1)" width="21" height="35" />
                </td>
                </tr>
           </table>
    </div>
     </c:if> 
    
  <table style="float:left;font-family:微软雅黑;" width="590" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
  <tr>
    <td width="590" valign="top">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <c:if test="${circleId>0 && fn:length(topicImageList)==0}">
        <tr>
        <td style="padding-left:20px;padding-top:4px;">
         <a style="color:#ffbf00;" href="javascript:void(0)" onclick="history.go(-1)">返回圈子</a>
        </td>
        </tr>
      </c:if>
      <tr>
        <td style="padding:20px 0 0 20px; font-size:20px;">${topic.topicName}
        
        
       </td>
      </tr>
      <tr>
        <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <c:choose>
        <c:when test="${companyInfo!=null}">
        <tr>
        <td width="14%" rowspan="2" valign="middle" style="padding:10px 0 0 20px;cursor: pointer;"
        onclick="window.location.href='/chjservice/pages/convenient_brandpinfo.jsp?companyId=${topic.companyId}'">
        <img src="${imageStorePath}${companyInfo.logo}" width="48" /></td>
            <td height="42" style="color:#ffbf00; font-size:12px;cursor: pointer;" 
            onclick="window.location.href='/chjservice/pages/convenient_brandpinfo.jsp?companyId=${topic.companyId}'">
                     发布者：${companyInfo.name}<span style="color: #000; font-size:12px;margin-left: 20px;">${topic.createTime}</span></td>
        </tr>
        </c:when>
        <c:otherwise>
         <tr>
            <td width="14%" rowspan="2" style="padding:10px 0 0 20px;cursor: pointer;" onclick="gotoUserDetail('${user.userId}',${topic.userId})">
            <img src="${imageStorePath}${userInfo.headPicture}" width="48" height="48"/></td>
            <td height="42" style="color:#ffbf00; font-size:12px;cursor: pointer;" onclick="gotoUserDetail('${user.userId}',${topic.userId})">
                      发布者：${userInfo.nickName}<span style="color: #9a9a9c; font-size:12px;margin-left: 20px;">${topic.createTime}</span></td>
            </tr> 
        </c:otherwise>
            
        </c:choose>
         
            
          <tr>
           <td  height="25">
                      <table border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="28px"><img src="${ctx}/dynamic/circle_but1.png" width="28" height="28" /></td>
                        <td align="left" style="color: #9a9a9c; font-size:14px;font-family:微软雅黑;width: 50px;">${topic.topicViews}</td>
                        
                       <c:if test="${topic.isCollection>0}">
                        <td width="28px" style="font-size:14px;font-family:微软雅黑;"><img src="${ctx}/dynamic/circle_but2.png" width="28" height="28" /></td>
                        <td  style="color: #9a9a9c; font-size:14px;font-family:微软雅黑;width: 50px;">已收藏</td>
                        </c:if>
                         <c:if test="${topic.isCollection==0}">
                        <td  style="font-size:14px;font-family:微软雅黑;width: 30px;"><img src="${ctx}/dynamic/circle_but2.png" width="28" height="28" /></td>
                        <td  onclick="user_collection(${topic.topicId},3)" style="cursor:pointer;color: #9a9a9c;font-size:14px;width: 40px;">收藏</td>
                        </c:if>
                       <td width="30px" ><img src="${ctx}/dynamic/circle_but3.png" width="28" height="28" /></td>
                        <td   id="share_img" style="font-size:14px;font-family:微软雅黑;width: 40px;cursor:pointer;color: #9a9a9c;">分享</td>
                       <c:if test="${user.userId!=null && user.userId == topic.userId}">
                        <td width="30px"><img src="${ctx}/dynamic/circle_but4.png" width="28" height="28" /></td>                    
                        <td>
                        <span style="color: #9a9a9c;font-size:14px;width: 40px;cursor:pointer;" onclick="window.location.href='${ctx}/community!createTopic.action?type=0&topicId=${topic.topicId}'">
                        	编辑</span></td>
                        </c:if>
                         <c:if test="${user.userId==null && user.userId != topic.userId}">
                          <td width="30px">&nbsp;</td>                    
                         <td class="comm_ysdis">&nbsp;</td>
                         </c:if>
                        <td height="30" align="left" valign="middle">
                         
                         </td>
                         </tr>
                      </table> 
                      </td>
                  </tr>
                  <tr>
      <td valign="top" colspan="8" style="padding-left:70px;">
      <ul class="ul-tag">
                         <c:forEach var="item" items="${topic.tagList}">
                         <li>${item.tagName}</li>
                         </c:forEach>
                         </ul>  
      </td>
      </tr>
                  
        </table>
        </td>
      </tr>
      
      <tr>
        <td class="topicContent" valign="top" style="word-break:break-all; word-wrap:break-word;line-height:22px; padding:10px 10px 0 20px;">
        ${topic.topicContent}
       </td>
      </tr>
      <tr>
        <td style="border-bottom:#ffbf00 solid 1px;">&nbsp;</td>
      </tr>
      
     </table>
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
            <td width="14%" rowspan="4" style="font-family:微软雅黑;padding:10px 0 0 20px;">
            <img src="${imageStorePath}${item.headImage}" onclick="gotoUserDetail('${user.userId}',${item.userId})" style="cursor:pointer;" width="48" height="48" />
            </td>
          
            <td width="26%" height="32" onclick="gotoUserDetail('${user.userId}',${item.userId})" style="cursor:pointer;color:#ffbf00; font-size:12px;">
         	   <ul class="ul_a">
         	    <li onclick="gotoUserDetail('${user.userId}',${item.toUserId})">发布者：${item.nickName}</li>
         	   </ul>
            </td>
            <td width="60%" style="color:#ffbf00; font-family:微软雅黑;font-size:12px;">
             ${item.commentTime}
           </td>
          </tr>
           
          <tr>
            <td colspan="3"  style="color:#999;font-family:微软雅黑; font-size:12px;">
         	   <c:if test="${item.toNickName!=null}">
         	     <ul class="ul_a">
         	    	<li onclick="gotoUserDetail('${user.userId}',${item.toUserId})">@ ${item.toNickName}
         	    	</li>
         	   	 </ul>
         	   	</c:if>
         	 </td>
          </tr>
        
          <tr>
            <td colspan="3"  style="color:#999; font-size:12px; word-break:break-all; word-wrap:break-word;">
               ${item.content}
            </td>
          </tr>
          <tr>
            <td colspan="3" style="text-align:right;font-size:12px;padding-right:20px;">
            <a href="#txtContent" style="color:#999;" onclick="gotoReplay('${item.userId}','${item.nickName}','${item.content}')">回复</a>
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
    <td height="60" valign="top" style="padding:20px 0 0 10px; font-size:20px; color:#666; background-color:#f9f9f7;">说点什么吧</td>
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
    <td height="114" valign="top" style="padding:20px 0 0 20px;  background-color:#f9f9f7;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="68%">&nbsp;</td>
        <td width="32%">
        <a href="#table_comment" onclick="createTopicComment()">
        <img  style="cursor:pointer" src="${ctx}/images/topic_title_4.jpg" width="149" height="50" />
        </a>
        </td>
      </tr>
    </table></td>
  </tr>
  
  </table>
  </td>
  
  
   <td valign="top" width="350px">
   
 
 
     
<div style="float:right; width:350px;margin-left: 10px;">

<div style="background-color: #ffbe00;height: 45px;background:url(${ctx}/images/zxfxx_1.png)"> </div>
  
  <div id="netextTopinc">
  
  <div style="color:#9a9a9c;background-color: #FFF;height: 110px;border-bottom:#ffc61a 3px solid;">
  <img src="${ctx}/images/topic_title_4.jpg"  height="70px" width="70px" style="margin: 10px 0 0 5px;float: left;"/>
  <div style="width: 270px;float: right;height: 100px;">
  <div style="padding: 5px 5px 0 5px;font-family:微软雅黑;font-size: 16px;color: #000;">电影史上有哪些令人印象深刻反角？</div>
  <div style="padding: 5px 5px 0 10px;font-family:微软雅黑;font-size: 14px;height: 30px;">电影史上有哪些令人 令人印象深刻的反</div>
 <div style="font-size: 12px;width: 100%;font-family:微软雅黑;">发起人：心虚v刹v&nbsp;&nbsp;&nbsp;2012-12-12 12:12:12</div>
 <div><table style="font-size: 12px;">
 <tr>
 <td width="30px">评论</td>
 <td width="40px" valign="bottom">
 <img src="${ctx}/images/button12.png" width="30px" height="25px" style="font-family:微软雅黑;float: left;margin-top: 3px;"/>
 <div style="font-family:微软雅黑;float: left;margin: -22px 0 0 0px;text-align: center;width: 30px;">34</div>
 
 </td>
 <td width="190px"><button class="btntop">获取</button>
 <button class="btntop">获爱的取</button></td> 
 </tr>
 </table>
 </div>
   </div>
    </div>
    
    
    <div style="color:#9a9a9c;background-color: #FFF;height: 110px;border-bottom:#ffc61a 3px solid;">
  <img src="${ctx}/images/topic_title_4.jpg"  height="70px" width="70px" style="margin: 10px 0 0 5px;float: left;"/>
  <div style="width: 270px;float: right;height: 100px;">
  <div style="padding: 5px 5px 0 5px;font-family:微软雅黑;font-size: 16px;color: #000;">电影史上有哪些令人印象深刻反角？</div>
  <div style="padding: 5px 5px 0 10px;font-family:微软雅黑;font-size: 14px;height: 30px;">电影史上有哪些令人 令人印象深刻的反</div>
 <div style="font-size: 12px;font-family:微软雅黑;width: 100%;">发起人：心虚v刹v&nbsp;&nbsp;&nbsp;2012-12-12 12:12:12</div>
 <div>
 <table style="font-size: 12px;">
 <tr>
 <td width="30px">评论</td>
 <td width="40px" valign="bottom">
 <img src="${ctx}/images/button12.png" width="30px" height="25px" style="float: left;margin-top: 3px;"/>
 <div style="float: left;margin: -22px 0 0 0px;text-align: center;width: 30px;">34</div>
 
 </td>
 <td width="190px"><button class="btntop">获取</button>
 <button class="btntop">获爱的取</button></td> 
 </tr>
 </table>
 </div>
   </div>
    </div>
 
      
  </div>
  
  <div style="background-color: #ffbe00;margin-top:10px;height: 45px;background:url(${ctx}/images/rmqz_1.png)"></div>
 
 <div id="quanziRe">
  
   <c:forEach items="${hotCircle}" var="circle">
   
   <div style="color:#9a9a9c;height: 220px;background-color: #FFF;width: 350px;">
  
  <div  style="padding: 10px 0 0 5px;float: left;width: 130px;height: 160px;">
  <img src="${imageStorePath}${circle.circleImage}" onclick="circle_detail('${user.userId}',${circle.circleId},'${circle.userId}','${circle.status}','${circle.examineResult}')" style="cursor:pointer;" height="130px" width="120px" />
 <c:if test="${circle.userId != user.userId}">
        <c:if test="${circle.circleUserStatus == null || circle.circleUserStatus=='4'||circle.circleUserStatus=='5'}">
         <div style="cursor:pointer;color:#fff;width:120px;height:30px;line-height:30px;margin-top:-2px;text-align: center;background:#ffbe00;"
          onclick="addCircle(${circle.circleId},'${circle.isCheck}')" >申请加入</div>
        </c:if>
         <c:if test="${circle.circleUserStatus=='1'}">
        <div style="color:#fff;width:120px;height:30px;line-height:30px;margin-top:-2px;text-align: center;background:#ffbe00;">
         	等待审核</div>
        </c:if>
         <c:if test="${circle.circleUserStatus=='2'}">
        <div style="color:#fff;width:120px;height:30px;line-height:30px;margin-top:-2px;text-align: center;background:#ffbe00;">
         	审核未通过</div>
        </c:if>
         <c:if test="${circle.circleUserStatus=='3'}">
        <div onclick="exitCircleUser(${circle.circleId})" style="cursor:pointer;color:#fff;width:120px;height:30px;line-height:30px;margin-top:-2px;text-align: center;background:#ffbe00;">
         	退&nbsp;出</div>
        </c:if>
     </c:if>
  </div>
  
  <div style="width: 210px;float: right;height: 160px; padding: 10px 5px 0 0;">
  <div style="height: 30px;">
  <span style="float: left;font-size:18px; color:#333;cursor:pointer;"  onclick="circle_detail('${user.userId}',${circle.circleId},'${circle.userId}','${circle.status}','${circle.examineResult}')">
  <c:if test="${fn:length(circle.name)>7}">
   ${fn:substring(circle.name, 0, 7)}...
  </c:if>
  <c:if test="${fn:length(circle.name)<8}">
   ${circle.name}
  </c:if></span>
  <span style="float: right;font-size: 14px;">等级${circle.level}级</span>
  </div>
  <div style="padding: 2px 5px 2px 5px;font-size: 14px;height:95px;">
  <c:if test="${fn:length(circle.summary)>63}">
   ${fn:substring(circle.summary, 0, 62)}...
  </c:if>
  <c:if test="${fn:length(circle.summary)<64}">
   ${circle.summary}
  </c:if>
   
  </div>
  
  <div style="height: 30px;width: 100%;">
  <table style="font-size: 12px;" cellpadding="0" cellspacing="0">
 <tr>
 <td width="50px">浏览次数</td>
 <td width="40px" valign="bottom">
 <img src="${ctx}/images/button12.png" width="30px" height="25px" style="float: left;margin-top: 3px;"/>
 <div style="float: left;margin: -22px 0 0 0px;text-align: center;width: 30px;color:#fff;">${circle.circleViews}</div>
 
 </td>
 <td width="100px">
 <c:forEach items="${circle.tagList}" var="tag" varStatus="index2">
               	 	<c:if test="${index2.index<2}">
               	 	<button class="btntop">
               	 	<c:if test="${fn:length(tag.tagName)>3}">
               	 	  ${fn:substring(tag.tagName,0,3)}
               	 	 </c:if>
               	 	 <c:if test="${fn:length(tag.tagName)<=3}">
               	 	  ${tag.tagName}
               	 	 </c:if>
               	 	</button>
               	 	</c:if>
 </c:forEach>
 
 </td> 
 </tr>
 </table>  
  </div>
  </div>
   
   <div style="border-bottom:#ffc61a 3px solid;float: left;padding: 10px 10px 10px 20px; width: 320px;">
   现有人数<span style="font-size: 20px;">${circle.userCount}人</span></div>
   </div>
   
   </c:forEach>
   
    </div>
  
 
 </div>
  
    
 </td>
 </tr>
 </table>
 

 </div>
 
 
  <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>

</body>
</html>
<script type="text/javascript">
$(function(){
	initInput();	
	queryTheTopicNew();	
});

function queryTheTopicNew(){
	$.ajax({
		type:"POST",
		url:'${ctx}/community!qelectTopicArean.action',
		dataType:'json',
		data :{size:4,topicId:'${topic.topicId}'},
		success:function(msg, status){
			if(msg.status == 200){
				var str='';
				for(var i=0;i<msg.rows.length;i++){
					var data=msg.rows[i];
					var summary=data["summary"];
					if(summary.length>17){
						summary=summary.substring(0,16)+'...';
					}
					var name=data["topicName"];
					if(name.length>15){
						name=name.substring(0,15)+'...';
					}
					str+='<div class="divNum" onclick="circleTopicDetail(\''+"${user.userId}"+'\','+data["topicId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')"><img src="${imageStorePath}'+data["userNamePict"]["headPicture"]+'" class="pTopic"/>';
					str+='<div style="width: 270px;float: right;height: 100px;">';
					str+='<div style="padding: 5px 5px 0 5px;font-family:微软雅黑;font-size: 16px;color: #000;">'+name+'</div>';
					str+='<div style="padding: 5px 5px 0 10px;font-family:微软雅黑;font-size: 14px;height: 30px;">'+summary+'</div>';
					str+='<div style="font-size: 12px;width: 100%;font-family:微软雅黑;">发起人：'+data["userNamePict"]["nickName"]+'&nbsp;&nbsp;&nbsp;'+data["createTime"]+'</div>';
					str+='<div><table style="font-size: 12px;"><tr>';
					str+='<td width="30px">评论</td><td width="40px" valign="bottom">';
					str+='<img src="${ctx}/images/button12.png" width="30px" height="25px" style="float: left;margin-top: 3px;"/>';
					str+='<div style="float: left;margin: -22px 0 0 0px;text-align: center;width: 30px;color:#fff;">'+data["commentCount"]+'</div></td>';
					str+='<td width="190px">';
					for(var j=0;j<data["tagList"].length;j++){
						if(j<2){
							str+='<button class="btntop">'+data["tagList"][j]["tagName"]+'</button>';
						}
					}
					str+='</td></tr></table></div></div></div>';				
				}
				$('#netextTopinc').html(str);
				
				
			}else{
				alert(msg.msg);
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
function createTopicComment(){
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
	    			createTopicCommentSubmit();
	    		}
	        }
	    }
	   });
	
}
function createTopicCommentSubmit(){
	
	$.ajax({
		type : "POST",
		url : '${ctx}/community!addTopicComment.action',
		dataType : 'json',
		data :{toContent:toContent,toUserId:toUserId,topicId:"${topic.topicId}",content:$('#txtContent').val()},
		success : function(msg, status) {
			if(msg.status == 200){
				alert('评论成功!');
				var toUserInfo='';
				if(toNickName.length >0){
					toUserInfo= '<tr>'+
			          '  <td colspan="3"  style="word-break:break-all; word-wrap:break-word;color:#999;color:#999; font-size:12px;">'+
			         	'     <ul class="ul_a">'+
			         	'    	<li>@ '+toNickName+"："+
			         	'    	</li>'+
			         	'   	 </ul>'+
			         	toContent+
			         	' </td>'+
			         ' </tr>';
				}
				$('#table_comment').prepend('<tr>'+
				        '<td height="40">'+
				        '<table  width="100%" border="0" cellspacing="0" cellpadding="0">'+
				          '<tr>'+
				            '<td width="14%" rowspan="3" style="padding:10px 0 0 20px;"><img onclick="gotoUserDetail(\'${user.userId}\',\'${user.userId}\')" style="cursor:pointer;" src="${ctx}${user.headPicture}" width="48" height="48" /></td>'+
				            '<td width="21%" height="42" style="color:#ffbf00; font-size:12px;">'+
				            '<ul class="ul_a">'+
			         	   ' <li onclick="gotoUserDetail(\'${user.userId}\',\'${user.userId}\')" style="cursor:pointer;">发布者：${user.nickName}</li>'+
			         	   '</ul>'+
			         	   '</td>'+
				            '<td width="65%" style="color:#00c0c8; font-size:12px;"><span style="color:#999; font-size:12px;">'+curDateTime()+'</span></td>'+
				          '</tr>'+
				          toUserInfo+
				          '<tr>'+
				           ' <td colspan="3"  style="color:#999; font-size:12px; word-break:break-all; word-wrap:break-word;">'+
				           $('#txtContent').val()+
				           ' </td>'+
				          ' </tr>'+
				       ' </table>'+
				       ' </td>'+
				     '</tr>'+
				     '<tr>'+
			          '  <td colspan="3" style="text-align:right;font-family:微软雅黑;color:#999; font-size:12px;padding-right:20px;">'+
			           ' 		<a href="#txtContent" style="color:#999;font-family:微软雅黑;" onclick="gotoReplay(${user.userId},\'${user.nickName}\',\''+$('#txtContent').val()+'\')">回复</a>'+
			            '</td>'+
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
			}else{
				alert(msg.msg);
			}
		}
	});
}
function initInput(){
	var title=document.getElementById('txtContent');
	title.onfocus=function(){
	if(this.value =='200字内'){
		this.value='';
	}
	else
		this.className='input-color-focus';
	};
	title.onblur=function(){
	if(this.value==''){
	  this.value='200字内';
	  this.className='input-color';
	}
	else
		this.className='input-color-focus';
	};
	title.onkeyup=function(){
		if(this.value !=''){
			this.className='input-color-focus';
		}
		if(this.value.length <= 200)
			$('#spanTitle').html(this.value.length+'/200');
		else{
			this.value=this.value.substr(0,200);
			$('#spanTitle').html(this.value.length+'/200');
		}
		   
	};
	
}

function go_right(type){
	
	if(type==1){
		$('#activityImageDiv').animate({ scrollLeft: $('#activityImageDiv').scrollLeft()+170 },500);
	}
	else{
		$('#activityImageDiv').animate({ scrollLeft: $('#activityImageDiv').scrollLeft()-170 },500);
	}
}

var toUserId='';
var toNickName='';
var toContent='';
function gotoReplay(toid,nickName,content){
	toNickName =nickName;
	toUserId = toid+"";
	toContent=content;
	$('#toUser').html('@  '+nickName);
	$('#toContent').html(content);
}
var topicCollectionFlag={};
function user_collection(id){
	if(topicCollectionFlag[""+id]){
		alert('已收藏!');
		return;
	}
	$.ajax({
	     type: "POST",
	     url : context+'/user!collectionUserRestarant.action',
	     dataType:'json',
	     data:{objectId:id,type:4},
	     success: function(msg,status){
	    	if(msg.status == 200){	
	    		alert('收藏成功!');
	    	}
	    	else
	    	  alert(msg.msg);
	     }
	});
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
	    			alert('加入成功,请等待审核!');
	    		}
	    		else{
	    			alert('恭喜您成为圈子成员!');
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
	    	  alert('已退出该圈子!');
	    	}
	    	else
	    	  alert(msg.msg);
	     }
	});
}
</script>

