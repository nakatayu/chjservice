<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
ul.ul-tag li{
padding:2px;
float:left;
background:#57ae97;
color:#fff;
font-size:14px;
margin-left:4px;
margin-top:2px;
text-align:center;
list-style: none;
max-width: 200px;/*具体数值自行修改，下一行相同*/
word-break:keep-all;
height:18px;
}
</style>
</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />


<div class="main">
<div id="main_content" class="main_content">

<div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	  <div style="float:left;"><img src="${ctx}/images/menu_48.jpg" onclick="gotoPage('${ctx}/pages/personal_set.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_41.jpg" onclick="gotoMyCart()"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_42.jpg" onclick="gotoPage('${ctx}/product!findUserOrder.action')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_43.jpg" onclick="gotoPage('${ctx}/pages/personal_friend.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_49.jpg" onclick="gotoPage('${ctx}/pages/personal_topic.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_44.jpg" onclick="gotoPage('${ctx}/pages/personal_circle.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_45.jpg" onclick="gotoPage('${ctx}/pages/personal_activity.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_47.jpg" onclick="gotoPage('${ctx}/pages/personal_collection.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/personnel_home_it.jpg" style="width:190px;"/></div>
	    </div>
  
</div>

<!-- 
  <div style="position:relative;height:250px; padding:10px 25px 0 25px;">
    <div>
    <div style="float:left; width:950px; height:250px; background-image:url(${ctx}/dynamic/myhome_top.jpg);"></div>
    </div>
 </div>
  -->
  
<div style="position:relative;padding:10px 25px 0 25px;">
   <div>
   
  
   <div style="float:left; width:950px;  background-color:#FFF; ">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="32%" align="center" valign="top" style="padding-bottom:10px;">
             <div style="float:center;width:180px;height:166px;">
              <img style="margin-top:17px;" src="${imageStorePath}${userFriend.headPicture}" width="144" height="144"/>
             
              </div>
              
              
             <div style="font-size:20px;color:#57ae97;">
              ${userFriend.nickName}
              </div> 
              <c:if test="${userFriend.isFriend==null || userFriend.isFriend==0}">
              <div  style="width:144px;height:30px;line-height:30px;font-size:14px;color:#fff;text-align: center;background:#ffbe00;" 
              onclick="addFriend(${userFriend.userId},0)" >
              	加好友
              </div>
              </c:if>
               <c:if test="${userFriend.isFriend>0}">
               <div  style="width:144px;height:30px;line-height:30px;font-size:14px;color:#fff;text-align: center;background:#ffbe00;" 
              onclick="addFriend(${userFriend.userId},1)" >
              	删除好友
              </div>
               </c:if>
              
          </td>
          <td width="68%" valign="top"><table width="90%" border="0" cellspacing="0" cellpadding="0">
            <tr></tr>
           
            <tr>
              <td style="font-size:14px;padding-top:20px;">
              <table width="100%" border="0" cellspacing="4" cellpadding="0">
                <tr>
                  <td width="100%" style="font-size:14px;">简介：${userFriend.info}</td>
                </tr>
                
                  <c:if test="${userFriend.realnameOpen =='T'}">
                  <tr>
                  <td width="100%" style="font-size:14px; color:#57ae97;">
                  	TA的姓名：${userFriend.realname}
                  	 </td>
                    </tr>
                  </c:if>
                 
              
                  <c:if test="${userFriend.sexOpen =='T'}">
                    <tr>
                    <td width="100%" style="font-size:14px; color:#57ae97;">
                     <c:if test="${userFriend.sex =='W'}">
                  	    TA的 性别：女
                  	 </c:if>
                  	  <c:if test="${userFriend.sex =='M'}">
                  	     TA的性别：男
                  	 </c:if>
                  	  <c:if test="${userFriend.sex ==''}">
                  	     TA的性别：
                  	 </c:if>
                  	</td>
                	</tr>
                  </c:if>
                  
                   <c:if test="${userFriend.birthdateOpen =='T'}">
                  <tr>
                  <td width="100%" style="font-size:14px; color:#57ae97;">
                  	出生日期：${userFriend.birthDate}
                  	 </td>
                    </tr>
                  </c:if>
                   <tr>
                 	<td width="100%" style="font-size:14px; color:#57ae97;">
                  	工作地址：${user.workAddress}
                  	 </td>
                   </tr>
                   <tr>
                 	<td width="100%" style="font-size:14px; color:#57ae97;">
                  	公司名称：${user.companyName}
                  	 </td>
                   </tr>
                   <tr>
                 	<td width="100%" style="font-size:14px; color:#57ae97;">
                  	TA的星座： <c:if test="${user.constellation=='1'}">白羊座</c:if>
                <c:if test="${user.constellation=='2'}">金牛座</c:if>
                <c:if test="${user.constellation=='3'}">双子座</c:if>
                <c:if test="${user.constellation=='4'}">巨蟹座</c:if>
                <c:if test="${user.constellation=='5'}">狮子座</c:if>
                <c:if test="${user.constellation=='6'}">处女座</c:if>
                <c:if test="${user.constellation=='7'}">天秤座</c:if>
                <c:if test="${user.constellation=='8'}">天蝎座</c:if>
                <c:if test="${user.constellation=='9'}">射手座</c:if>
                <c:if test="${user.constellation=='10'}">摩羯座</c:if>
                <c:if test="${user.constellation=='11'}">水瓶座</c:if>
                <c:if test="${user.constellation=='12'}">双鱼座</c:if>
                  	 </td>
                   </tr>
                  <c:if test="${userFriend.qqnumberOpen =='T'}">
                  <tr>
                  <td width="100%" style="font-size:14px; color:#57ae97;">
                  	TA的QQ：${userFriend.qqNumber}
                  	 </td>
                    </tr>
                  </c:if>
                  
                  <c:if test="${userFriend.sinaurlOpen =='T'}">
                  <tr>
                  <td width="100%" style="font-size:14px; color:#57ae97;">
                  	新浪微博：${userFriend.sinaUrl}
                  	 </td>
                    </tr>
                  </c:if>
                  
                  
              </table></td>
          
            </tr>
            <tr>
              <td colspan="2" style="padding-bottom:10px;"><p>&nbsp;</p>
                <ul class="ul-tag" id="ul-tag">
                 <c:forEach var ="item" items="${tagList}">
                 	<li>${item.tagName}</li>
                 </c:forEach>
                </ul>
              </td>
            </tr>
          </table>
          </td>
          
        </tr>
      </table>
    </div>
    
    </div>
  </div>
      
      
  <div style="clear:both;position:relative;padding:0px 25px 0 25px;">
    <div>
   <table border="0" cellpadding="0" cellspacing="0" width="950">
   <tr>
   <td  width="950" valign="top" >
     <div id="td-userfriend-info">
     
     </div>
     <div style="clear:both;float:left; width:950px;padding-top:10px;">
     <div id="loadmore" onclick="loadMore()" style="cursor:pointer;height:55px; width:950px; background-color:#FFF;"> <p id="loadMoreText" style="text-align:center; padding-top:18px;font-size:14px;color:4c4c4c;">加载更多</p> </div>
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
	pageinfo["circlePage"]=1;
	pageinfo["actPage"]=1;
	pageinfo["topicPage"]=1;
	
	findUserFriendInfo();
});
function loadMore(){
	if(pageinfo["more"]){
		findUserFriendInfo();
	}
	
}
function findUserFriendInfo(){
		pageinfo["userId"]="${userId}";
		$.ajax({
			type : "POST",
			url : '${ctx}/user!findUserFriendHomeInfoList.action',
			dataType : 'json',
			data :pageinfo,
			success : function(msg, status) {
				if(msg.status == 200){
		    		var array = [];
		    		for(var i=0; i<msg.rows["activityList"].length;i++){
		    			 var data = msg.rows["activityList"][i];
		    			 var str=' <div style="float:left;margin-top:10px; width:950px; height:245px; background-color:#fffef9; border-bottom:solid 2px #57ae97;">'+
		    			      '<table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding-top:15px;" >'+
		    		        '<tr>'+
		    		         ' <td width="17%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		         '   <tr>'+
		    		          '    <td valign="top"  align="center" style="padding-top:20px;float:right; padding-right:20px;"><img  src="${imageStorePath}'+data["userInfo"]["headPicture"]+'" width="48" height="48" /></td>'+
		    		           ' </tr>'+
		    		            '<tr>'+
		    		             ' <td align="center" valign="top" style="font-size:16px; color:#57ae97;">&nbsp;</td>'+
		    		            '</tr>'+
		    		            '</table></td>'+
		    		          '<td width="83%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		          '  <tr>'+
		    		           '   <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		            '    <tr>'+
		    		             '     <td width="460" style="font-size:16px; font-weight:bold;"><span style="color:#57ae97;">'+data["userInfo"]["nickName"]+'</span> 创建了活动</td>'+
		    		             '<td width="120"><span style="font-size:10px;">'+data["createTime"]+'</span></td>'+ 
				                  '    <td width="25"><img src="${ctx}/images/personal_02.png" width="25" height="19" /></td>'+
		    		               '   <td width="90"><span style="font-size:12px;">'+data["browseCount"]+'次</span></td>'+
		    		                '  <td width="25" style="font-size:12px;"><img src="${ctx}/images/personal_03.png" width="25" height="19" /></td>'+
		    		                 ' <td width="90"><span style="font-size:12px;">'+data["commentCount"]+'次</span></td>'+
		    		              '  </tr>'+
		    		             ' </table></td>'+
		    		           ' </tr>'+
		    		           ' <tr>'+
		    		          '    <td height="162"  style="font-size:12px;">'+
		    		          '    <table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		           '     <tr>'+
		    		            '      <td width="156"><img style="cursor:pointer;" onclick="activity_detail(\''+"${user.userId}"+'\','+data["activityId"]+',\''+data["createUserId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')" src="${imageStorePath}'+data["activityImage"]+'" width="156" height="156" /></td>'+
		    		            '      <td width="560" height="180" style="padding-left:10px;" valign="top" border="1"><div><span style="font-size:18px; color:#198ea6;cursor:pointer;" onclick="activity_detail(\''+"${user.userId}"+'\','+data["activityId"]+',\''+data["createUserId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')">'+data["title"]+'</span></div>'+
		    		           	'<div><span style="margin-top:10px;float:left;font-size:14px;">'+data["summary"]+'</span></div>'+
		    		            '</td>'+
		    		            '    </tr>'+
		    		            '  </table></td>'+
		    		            '</tr>'+
		    		          
		    		          '</table></td>'+
		    		        '</tr>'+
		    		      '</table>'+
		    		    '</div>';
		    		    array.push(str);
		    		}
		    		for(var i=0; i<msg.rows["topicList"].length;i++){
		    			 var data = msg.rows["topicList"][i];
		    		var str='<div style="float:left; width:950px; height:155px;margin-top:10px; background-color:#fffef9; border-bottom:solid 2px #57ae97;">'+ 
		    		      '<table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding-top:15px;" >'+ 
		            '<tr>'+ 
		             ' <td width="17%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+ 
		              '  <tr>'+ 
		               '   <td valign="top" align="center" style="padding-top:20px;float:right; padding-right:20px;"><img src="${imageStorePath}'+data["userInfo"]["headPicture"]+'" width="42" height="42" /></td>'+ 
		                '</tr>'+ 
		                '<tr>'+ 
		                 ' <td align="center" valign="top" style="font-size:16px; color:#57ae97;">&nbsp;</td>'+ 
		                '</tr>'+ 
		                '</table></td>'+ 
		              '<td width="83%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+ 
		               ' <tr>'+ 
		                '  <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+ 
		                 '   <tr>'+ 
		                  '  <td width="460" style="font-size:16px; font-weight:bold;"><span style="color:#57ae97;">'+data["userInfo"]["nickName"]+'</span> 发表了话题</td>'+
		                  '<td width="120"><span style="font-size:10px;">'+data["createTime"]+'</span></td>'+ 
		                  '   <td width="30"><img src="${ctx}/images/personal_02.png" width="25" height="19" /></td>'+
		                    '  <td width="90"><span style="font-size:12px;">'+data["topicViews"]+'次</span></td>'+
		                     ' <td width="25" style="font-size:12px;"><img src="${ctx}/images/personal_03.png" width="25" height="19" /></td>'+ 
		                      '<td width="90"><span style="font-size:12px;">'+data["commentCount"]+'次</span></td>'+                     
		                    '  </tr>'+
		                  '</table></td>'+
		                '</tr>'+
		                '<tr>'+
		                 ' <td height="24"  style="font-size:12px;"><span style="font-size:18px; color:#198ea6;cursor:pointer;" onclick="circleTopicDetail(\''+"${user.userId}"+'\','+data["topicId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')">'+data["topicName"]+'</span></td>'+
		                '</tr>'+
		                '<tr>'+
		                 ' <td style="font-size:14px; "><p>&nbsp;</p>'+
		                 data["summary"]+'</td>'+
		               ' </tr>'+
		              '</table></td>'+
		           ' </tr>'+
		         ' </table>'+
		       ' </div>';
		    	array.push(str);	
		    	}
		    		for(var i=0; i<msg.rows["circleList"].length;i++){
		    			 var data = msg.rows["circleList"][i];
		    			 var str=' <div style="float:left;margin-top:10px; width:950px; height:245px; background-color:#fffef9; border-bottom:solid 2px #57ae97;">'+
		    			      '<table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding-top:15px;" >'+
		    		        '<tr>'+
		    		         ' <td width="17%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		         '   <tr>'+
		    		          '    <td valign="top" align="center" style="padding-top:20px;float:right; padding-right:20px;"><img src="${imageStorePath}'+data["headPicture"]+'" width="48" height="48" /></td>'+
		    		           ' </tr>'+
		    		            '<tr>'+
		    		             ' <td align="center" valign="top" style="font-size:16px; color:#57ae97;">&nbsp;</td>'+
		    		            '</tr>'+
		    		            '</table></td>'+
		    		          '<td width="83%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		          '  <tr>'+
		    		           '   <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		            '    <tr>'+
		    		             '     <td width="360" style="font-size:16px; font-weight:bold;"><span style="color:#57ae97;">'+data["nickName"]+'</span>创建了圈子</td>'+
		    		             '<td width="120"><span style="font-size:10px;">'+data["createTime"]+'</span></td>'+ 
				                   '    <td width="25"><img src="${ctx}/images/personal_02.png" width="25" height="19" /></td>'+
		    		               '   <td width="90"><span style="font-size:12px;">'+data["circleViews"]+'次</span></td>'+
		    		                '  <td width="25" style="font-size:12px;"><img src="${ctx}/images/personal_03.png" width="25" height="19" /></td>'+
		    		                 ' <td width="90"><span style="font-size:12px;">'+data["topicCount"]+'次</span></td>'+
		    		              '  </tr>'+
		    		             ' </table></td>'+
		    		           ' </tr>'+
		    		           ' <tr>'+
		    		          '    <td height="162"  style="font-size:12px;">'+
		    		          '    <table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		           '     <tr>'+
		    		            '      <td width="156"><img style="cursor:pointer;" onclick="circle_detail(\'${user.userId}\','+data["circleId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')" src="${imageStorePath}'+data["circleImage"]+'" width="156" height="156" /></td>'+
		    		            '      <td width="560"  height="180" style="padding-left:10px;" valign="top" border="1"><div><span style="font-size:18px; color:#198ea6;cursor:pointer;" onclick="circle_detail(\'${user.userId}\','+data["circleId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')">'+data["name"]+'</span></div>'+
		    		           	'<div><span style="margin-top:10px;float:left;font-size:14px;">'+data["summary"]+'</span></div>'+
		    		            '</td>'+
		    		            '    </tr>'+
		    		            '  </table></td>'+
		    		            '</tr>'+
		    		          
		    		          '</table></td>'+
		    		        '</tr>'+
		    		      '</table>'+
		    		    '</div>';
		    		    array.push(str);
		    		}
		    		$('#td-userfriend-info').append(array.join(''));
		    		
		    		if(msg.rows["circleList"].length==0&&
			    			   msg.rows["activityList"].length==0&&
			    			   msg.rows["topicList"].length==0){
				    	    $('#loadMoreText').html('没有更多!');
				    	pageinfo["more"]=false;
				    }
			    	 else{
			    		pageinfo["circlePage"]++;
			    		pageinfo["actPage"]++;
			    		pageinfo["topicPage"]++;
			    	 }
				    	array=[];
			    		array=null;
				}
			}
		});
		
}
var addFriendFlag={};
function addFriend(userId,type){
	if(addFriendFlag[userId+""+type]){
		
		if(type==0)
			alert('已成为好友!');
		else if(type==1)
			alert('已删除成功!');
		return;
	}
	$.ajax({
	    type: "POST",
	    url : '${ctx}/user!addUserFriend.action',
	    dataType:'json',
	    data:{friendId:userId,type:type},
	    success: function(msg,status){
	    	if(msg.status==200){
	    		addFriendFlag[userId+""+type]=true;
	    		if(type==0)
	    			alert('加入成功!');
	    		else if(type==1)
	    			alert('删除成功!');
	    	}	    		
	    	else
	    		alert(msg.msg);
	    }
	});
}

</script>

