<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="${ctx}/js/dialog/dialog_subModal.css" />
<title>漕河泾e服务</title>
<style type="text/css">
.conv1{
float:left;margin-left:10px;
}
.conv1 img{
width:110px;height:110px;cursor:pointer;
}

.conv2{
float:left;margin-left:10px;
}
.conv2 img{
width:230px;height:110px;cursor:pointer;
}
.conv3{
float:left;margin-left:10px;
}
.conv3 img{
width:230px;height:250px;cursor:pointer;
}
.conv4{
float:left;margin-left:10px;
}
.conv4 img{
width:230px;height:210px;cursor:pointer;
}
.fun4{
float:left;margin-left:10px;
}
.fun4 img{
width:230px;height:230px;cursor:pointer;
}

/* 我的订单 */

.myorder_font{ color:#00b38a; font-size:14px;font-family:微软雅黑;  font-weight:bold; text-align:center; padding-top:15px;}
.myorder_font1{ color:#00b38a; font-size:14px; font-family:微软雅黑; font-weight:bold; text-align:center; padding-top:45px;}
.myorder_font2{  font-size:14px;  font-weight:bold; font-family:微软雅黑;text-align:center; padding-top:45px;}
.myorder_font02{ color:#00b38a; font-size:14px; font-family:微软雅黑;font-weight:bold; }
.myorder1{
float:left;margin-left:10px;
}
.myorder1 img{
width:110px;height:115px;cursor:pointer;
}

.personal_fr1{
float:left;margin-left:10px;
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
.ul-button{margin-left:100px;font-family:微软雅黑;}
.ul-button li{cursor:pointer;float:left;font-family:微软雅黑;font-size:18px;font-weight:bold;
color:#fff;padding-top:4px;padding-bottom:6px;list-style: none;width:150px;
background:#ffbe00;text-align: center;}
</style>
</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />
<script type="text/javascript" src="${ctx}/js/dialog/dialog_common.js"></script>
<script type="text/javascript" src="${ctx}/js/dialog/dialog_subModal.js"></script>
<script type="text/javascript" src="${ctx}/js/activity.js"></script>

<div class="main" style="font-family:微软雅黑;">
<div id="main_content" class="main_content" style="font-family:微软雅黑;">
   

<div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	     <div style="float:left;"><img src="${ctx}/images/menu_71.jpg"  /></div>
           <div class="menu1"><img src="${ctx}/images/menu_62.jpg" onclick="gotoPage('${ctx}/pages/community_topiclist.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_65.jpg" onclick="gotoPage('${ctx}/pages/community_activitylist.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_63.jpg" onclick="gotoPage('${ctx}/community!findLableListCircle.action')"/></div>
           <div><img src="${ctx}/images/menu_66.png" style="width:473px;height: 100px;" /></div>
	    </div>
  
</div>

<c:forEach var="item" items="${hotActivity}" varStatus="index1">

<div style="position:relative;height:230px; padding:10px 25px 0 25px;">
	  <div>
       <table style="float:left;" width="590" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" >
  <tr>
    <td width="230"><img style="cursor:pointer;font-family:微软雅黑;" onclick="activity_detail('${user.userId}',${item.activityId},'${item.createUserId}','${item.status}','${item.examineResult}')"  src="${imageStorePath}${item.activityImage}" width="230" height="230" /></td>
    <td width="360" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="52"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="88%" class="comm_ys" style="cursor:pointer;font-family:微软雅黑;" onclick="activity_detail('${user.userId}',${item.activityId},'${item.createUserId}','${item.status}','${item.examineResult}')" >${item.title}</td>
            <td width="12%"></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="108" valign="top" style="font-family:微软雅黑;" class="comm_ysdis">
        ${item.summary}
		</td>
      </tr>
       <tr>
		    		        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
		    		          <tr>
		    		          <td width="38" valign="top" style="color: #9a9a9c; font-family:微软雅黑;padding-left:14px;">评论</td>
		    		            <td width="34" height="30" align="center" valign="top"><div style="height:40px;color:#fff;background:url(${ctx}/images/search_number_yellow.png) no-repeat;">
		    		            ${item.commentCount}</div></td>
		    		           <td width="247" valign="top"><div style="margin-left:20px;width:247px;height:54px;overflow:hidden;">
		    		<ul class="ul-tag">
		    		        <c:forEach items="${item.tagList}" var="tag" varStatus="index2">
               	 	<c:if test="${index2.index<2}">
               	 	<li>
               	 	<c:if test="${fn:length(tag.tagName)>3}">
               	 	  ${fn:substring(tag.tagName,0,3)}..
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
</table>

 <div style="float:right; font-family:微软雅黑;width:350px; height:230px;">
   <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f9f9f7">
     <tr>
       <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td width="32%" align="center" background="${ctx}/images/map8.png" style="height:70px"><p>可参与人数</p><p><strong>${item.userMax-item.userCount}</strong></p></td>
           <td width="1" align="center"></td>
           <td width="32%" align="center" background="${ctx}/images/map8.png" style="height:70px"><p>已参加人数</p><p><strong>${item.userCount}</strong></p></td>
           <td width="1" align="center"></td>
           <td width="34%" align="center" background="${ctx}/images/map8.png" style="height:70px"><p>人数限制</p><p><strong>${item.userMax}</strong></p></td>
         </tr>
       </table></td>
     </tr>
     <tr>
       <td height="72" align="center" style="font-family:微软雅黑;"><p>活动时间:</p><p><strong>${item.chinaBeginTime} </strong></p></td>
     </tr>
     <tr>
       <td height="88" align="center">
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td align="center">
          <c:if test="${item.hasAdd==null || item.hasAdd==0}">
          	<c:if test="${item.joinType=='2'}">
           	 <ul class="ul-button">
           	 <li id="enrolldivindex1" 
           	 onclick="addActivityUser('加入活动',2,${item.activityId},'${item.isCheck}','${item.isQrcode}')">我要参加</li>
           	 </ul>
          	 </c:if>
           	<c:if test="${item.joinType!='2'}">
           	 <ul class="ul-button">
           	 <li id="enrolldivindex1" 
           	 onclick="addActivityUser('加入活动',2,${item.activityId},'${item.isCheck}','${item.isQrcode}')">我要订票</li>
           	 </ul>
           	</c:if>
          </c:if>
           
           	
           </td>
         </tr>
       </table>
       </td>
     </tr>
   </table>
 </div>
</div>
 </div>

</c:forEach>


<div style="position:relative;padding:10px 25px 0 25px; font-family:微软雅黑;">
	   <div><table  style="float:left;"font-family:微软雅黑; width="590" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" >
  <tr>
    <td width="230"><img src="${ctx}/images/map11.png" width="590" height="45" style="cursor:pointer" onclick="gotoPage('${ctx}/pages/community_topiclist.jsp')" /></td>
    </tr>
  
  <c:forEach var="item" items="${hotTopic}" varStatus="index2">
  
<c:if test="${index2.index==0}">


  <tr>
    <td style="border-bottom:#ccc solid 2px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="46%" align="center"><table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="167" align="center"><img style="cursor:pointer;" onclick="circleTopicDetail('${user.userId}',${item.topicId},'${item.userId}','${item.status}','${item.examineResult}')" src="${imageStorePath}${item.topicImage}" width="210" height="130" /></td>
          </tr>
          <tr>
            <td height="35" align="center" style="font-family:微软雅黑;color: #9a9a9c;font-size:14px;">查看次数${item.topicViews}次</td>
          </tr>
        </table></td>
        <td width="54%" valign="top">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="42" style="cursor:pointer;" onclick="circleTopicDetail('${user.userId}',${item.topicId},'${item.userId}','${item.status}','${item.examineResult}')">
            <strong>
            <c:if test="${fn:length(item.topicName)>16}">
               	 	  ${fn:substring(item.topicName,0,16)}..
               	 	 </c:if>
               	 	 <c:if test="${fn:length(item.topicName)<=16}">
               	 	  ${item.topicName}
               	 	 </c:if>
            
            </strong>
            </td>
          </tr>
          <tr>
            <td valign="top" height="110" style="font-size:16px;color:#9a9a9c;">
            ${item.summary}
			</td>
          </tr>
          <tr>
            <td height="52"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="23%" align="center"></td>
                <td>
                <ul class="ul-tag">
					<c:forEach items="${item.tagList}" var="tag" varStatus="index2">
               	 	<c:if test="${index2.index<2}">
               	 	<li>
               	 	<c:if test="${fn:length(tag.tagName)>3}">
               	 	  ${fn:substring(tag.tagName,0,3)}..
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
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="260" align="right" style="font-family:微软雅黑;color: #9a9a9c;">评论</td>
                <td width="47" align="center" background="${ctx}/images/button10.png" class="comm_pinglunf" style="width:39px; height:35px;" >${item.commentCount}</td>
                <td width="12">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table>
    </td>
  </tr>
 </c:if>
  <c:if test="${index2.index>0}">
  <tr>
    <td style="border-bottom:#ccc solid 2px;font-family:微软雅黑;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      
      <tr>
        <td style="padding-left:20px;font-size:16px;cursor:pointer;" onclick="circleTopicDetail('${user.userId}',${item.topicId},'${item.userId}','${item.status}','${item.examineResult}')">${item.topicName}</td>
      </tr>
      <tr>
        <td height="25" style="padding-left:20px;color:#9a9a9c;font-family:微软雅黑;">${item.createTime}</td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="529" align="right" style="font-family:微软雅黑;color: #9a9a9c;">评论</td>
           <td width="47" align="center" background="${ctx}/images/button10.png" class="comm_pinglunf" style="width:39px; height:35px;" >${item.commentCount}</td>
           <td width="14">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
     
    </table></td>
  </tr>
  </c:if> 
 </c:forEach>
 
 </table>
 
 <div style="float:right;  width:350px; ">
   <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
     <tr>
       <td><img src="${ctx}/images/map10.png" width="350" height="45" style="cursor:pointer" onclick="gotoPage('${ctx}/community!findLableListCircle.action')" /></td>
     </tr>
     <c:forEach var="item" items="${hotCircle}" varStatus="index3">
  
<c:if test="${index3.index==0}">
     <tr>
       <td style="border-bottom:#ccc solid 2px;">
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td width="40%" height="240" valign="top">
           <table width="90%" border="0" cellspacing="0" cellpadding="0">
             <tr>
               <td height="143"  align="center">
               <img style="cursor:pointer;" onclick="circle_detail('${user.userId}',${item.circleId},'${item.userId}','${item.status}','${item.examineResult}')"
                src="${imageStorePath}${item.circleImage}" width="130" height="130" />
               </td>
             </tr>
             <tr>
               <td height="49" valign="top" align="center" style="font-family:微软雅黑;color: #9a9a9c;font-size:14px;">查看次数：${item.circleViews}次</td>
             </tr>
             <tr>
               <td align="center">
               <c:if test="${item.hasAdd==null || item.hasAdd==0}">
               <img style="cursor:pointer;" onclick="addCircle(${item.circleId},'${item.isCheck}')" src="${ctx}/images/button3.jpg" width="110" height="30" />
               </c:if>
               </td>
             </tr>
           </table></td>
           <td width="52%" valign="top"><table width="97%" border="0" cellspacing="0" cellpadding="0">
             <tr>
               <td height="35" style="cursor:pointer;font-size:16px;" onclick="circle_detail('${user.userId}',${item.circleId},'${item.userId}','${item.status}','${item.examineResult}')" ><strong>${item.name}</strong></td>
             </tr>
             <tr>
               <td height="28">
               <ul class="ul-tag">
			<c:forEach items="${item.tagList}" var="tag" varStatus="index2">
               	 	<c:if test="${index2.index<2}">
               	 	<li>
               	 	<c:if test="${fn:length(tag.tagName)>3}">
               	 	  ${fn:substring(tag.tagName,0,3)}..
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
             <tr>
               <td height="68" valign="top"  style="padding-top:4px;font-size:16px;padding-left:2px;color:#9a9a9c">
               <c:if test="${fn:length(item.summary)>25}">
                 ${fn:substring(item.summary,0,25)}...
               	</c:if>
               	 <c:if test="${fn:length(item.summary)<=25}">
                 ${item.summary}
               	</c:if>
                </td>
             </tr>
             <tr>
               <td height="36" align="center" style="font-family:微软雅黑;font-size:16px;">现有人数</td>
             </tr>
             <tr>
               <td align="center" style="padding-top:10px;" ><strong>${item.userCount}人</strong></td>
             </tr>
             <tr>
               <td><table width="105%" border="0" cellspacing="0" cellpadding="0">
                 <tr>
                   <td width="156" align="right" style="font-family:微软雅黑;color: #9a9a9c;">话题</td>
                   <td width="47" align="center" background="${ctx}/images/button11.png" class="comm_pinglunf" style="width:39px; height:35px;" >${item.topicCount}</td>
                   <td width="10">&nbsp;</td>
                   </tr>
                 </table></td>
             </tr>
             </table></td>
         </tr>
         </table>
         </td>
     </tr>
</c:if>
 <c:if test="${index3.index>0}">    
     <tr>
       <td style="border-bottom:#ccc solid 2px;">
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td height="25" onclick="circle_detail('${user.userId}',${item.circleId},'${item.userId}','${item.status}','${item.examineResult}')" style="cursor:pointer;padding-left:20px;">
           
            <c:if test="${fn:length(item.name)>10}">
                 ${fn:substring(item.name,0,10)}...
               	</c:if>
               	 <c:if test="${fn:length(item.name)<=10}">
                 ${item.name}
               	</c:if>
           <span style="float:right;color:#9a9a9c;font-size:12px;margin-right:5px;"> ${item.createTime}</span>
           </td>
         </tr>
         <tr>
           <td style="color:#9a9a9c;padding-left:20px;">
              <c:if test="${fn:length(item.summary)>15}">
                 ${fn:substring(item.summary,0,15)}...
               	</c:if>
               	 <c:if test="${fn:length(item.summary)<=15}">
                 ${item.summary}
               	</c:if>
           </td>
         </tr>
         <tr>
           <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
             <tr>
               <td width="340" align="right" style="font-family:微软雅黑;color: #9a9a9c;">话题</td>
               <td width="44" align="center" background="${ctx}/images/button11.png" class="comm_pinglunf" style="width:39px; height:35px;" >${item.topicCount}</td>
               <td width="10">&nbsp;</td>
             </tr>
           </table></td>
         </tr>
        
       </table></td>
     </tr>
 </c:if>
 </c:forEach>    
   
    
   </table>
 </div>
</div>
 </div>

<br/>

   <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>

 

</body>
</html>
<script type="text/javascript">
$(document).ready(function(){
	
	 
});

function addCircle(id){

	$.ajax({
	    type: "POST",
	    url : '${ctx}/community!addUserCircle.action',
	    dataType:'json',
	    data:{circleId:id},
	    success: function(msg,status){
	    	if(msg.status==200)
	    		alert('加入成功!');
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

</script>

