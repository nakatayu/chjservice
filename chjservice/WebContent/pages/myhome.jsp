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
           <div class="menu1"><img src="${ctx}/images/menu_144.jpg" style="width:190px;"/></div>
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
          <td width="32%" align="center" valign="top">
             <div style="width:180px;height:180px;">
              <img style="margin-top:17px;" src="${imageStorePath}${user.headPicture}" width="144" height="144"/>
            
              </div>
             <div style="font-size:20px;color:#57ae97;">
              ${user.nickName}
              </div> 
          </td>
          <td width="68%" valign="top"><table width="90%" border="0" cellspacing="0" cellpadding="0">
            <tr></tr>
           
            <tr>
              <td style="font-size:14px;padding-top:20px;">
              <table width="100%" border="0" cellspacing="4" cellpadding="0">
                <tr>
                  <td width="100%" style="font-size:14px;">简介：${user.info}</td>
                </tr>
                  <tr>
                  <td width="100%" style="font-size:14px; color:#57ae97;">
                  	个人姓名：${user.realname}
                  	 </td>
                    </tr>
                  
                    <tr>
                    <td width="100%" style="font-size:14px; color:#57ae97;">
                     <c:if test="${user.sex =='W'}">
                  	     个人性别：女
                  	 </c:if>
                  	  <c:if test="${user.sex =='M'}">
                  	     个人性别：男
                  	 </c:if>
                  	  <c:if test="${user.sex ==''}">
                  	     个人性别：
                  	 </c:if>
                  	</td>
                	</tr>
                 
                  <tr>
                  <td width="100%" style="font-size:14px; color:#57ae97;">
                  	出生日期：${user.birthDate}
                  	 </td>
                    </tr>
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
                  	个人星座：
                <c:if test="${user.constellation=='1'}">白羊座</c:if>
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
                  <tr>
                  <td width="100%" style="font-size:14px; color:#57ae97;">
                  	个人QQ：${user.qqNumber}
                  	 </td>
                    </tr>
                
                  <tr>
                  <td width="100%" style="font-size:14px; color:#57ae97;">
                  	新浪微博：${user.sinaUrl}
                  	 </td>
                    </tr>
                 
              </table></td>
          
            </tr>
            <tr>
              <td colspan="2" style="padding-bottom:10px;"><p>&nbsp;</p>
                <ul class="ul-tag" id="ul-tag"></ul></td>
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
   <td  width="600" valign="top" >
     <div id="td-userfriend-info">
     
     </div>
     <div style="clear:both;float:left; width:600px;padding-top:10px;">
     <div id="loadmore" onclick="loadMore()" style="cursor:pointer;height:55px; width:600px; background-color:#FFF;"> <p id="loadMoreText" style="text-align:center; padding-top:18px;font-size:14px;color:4c4c4c;font-family:黑体;">加载更多</p> </div>
 	</div> 
</td>
<td valign="top">
   
    <div style="float:left; width:340px;margin-left:10px;margin-top:10px;">
     <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
      <tr>
        <td height="28" style="font-size:18px; font-weight:bold; padding-top:10px;padding-left:10px;"> 我参与的圈子</td>
      </tr>
       <tr>
        <td height="28">
        <table id="table_mycircle" width="100%" border="0" cellspacing="0" cellpadding="0">
    
        </table>
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr><td onclick="gotoPage('${ctx}/pages/personal_circle.jsp')" style="cursor:pointer;border-top:2px solid #ccc;text-align:right;height:40px;">更多圈子</td></tr>
        </table>
        </td>
      </tr>
      
    </table>
     </div>   
     
     <div style="float:left; width:340px;margin-left:10px;margin-top:10px;">
     <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
      <tr>
        <td height="28" style="font-size:18px; font-weight:bold; padding-top:10px;padding-left:10px;"> 我的好友</td>
      </tr>
       <tr>
        <td height="28">
        <table id="table_myfriend" width="100%" border="0" cellspacing="0" cellpadding="0">
        
          
        </table>
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr><td onclick="gotoPage('${ctx}/pages/personal_friend.jsp')" style="cursor:pointer;border-top:2px solid #ccc;text-align:right;height:40px;">更多好友</td></tr>
        </table>
        </td>
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
	
		$.ajax({
			type : "POST",
			url : '${ctx}/user!findUserFriendInfo.action',
			dataType : 'json',
			data :pageinfo,
			success : function(msg, status) {
				if(msg.status == 200){
		    		var array = [];
		    		for(var i=0; i<msg.rows["activityList"].length;i++){
		    			 var data = msg.rows["activityList"][i];
		    			 var str=' <div style="float:left;margin-top:10px; width:600px; height:245px; background-color:#fffef9; border-bottom:solid 2px #57ae97;">'+
		    			      '<table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding-top:15px;" >'+
		    		        '<tr>'+
		    		         ' <td width="17%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		         '   <tr>'+
		    		          '    <td valign="top"  align="center" style="padding-top:20px;float:right; padding-right:20px;"><img style="cursor:pointer;" onclick="gotoUserDetail(${user.userId},'+data["userId"]+')" src="${imageStorePath}'+data["userInfo"]["headPicture"]+'" width="48" height="48" /></td>'+
		    		           ' </tr>'+
		    		            '<tr>'+
		    		             ' <td align="center" valign="top" style="font-size:16px; color:#57ae97;">&nbsp;</td>'+
		    		            '</tr>'+
		    		            '</table></td>'+
		    		          '<td width="83%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		          '  <tr>'+
		    		           '   <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		            '    <tr>'+
		    		             '     <td width="340" style="font-size:16px; font-weight:bold;"><span style="color:#57ae97;cursor:pointer;" onclick="gotoUserDetail(${user.userId},'+data["userId"]+')">'+data["userInfo"]["nickName"]+'</span> 创建了活动</td>'+
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
		    		            '      <td width="156"><img  style="cursor:pointer;" onclick="activity_detail(\''+"${user.userId}"+'\','+data["activityId"]+',\''+data["createUserId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')"  src="${imageStorePath}'+data["activityImage"]+'" width="156" height="156" /></td>'+
		    		            '      <td width="300" height="180" style="padding-left:10px;" valign="top" border="1"><div><span style="font-weight:bold;font-size:18px; color:#198ea6;cursor:pointer;" onclick="activity_detail(\''+"${user.userId}"+'\','+data["activityId"]+',\''+data["createUserId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')">'+data["title"]+'</span></div>'+
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
		    		var str='<div style="float:left; width:600px; height:155px;margin-top:10px; background-color:#fffef9; border-bottom:solid 2px #57ae97;">'+ 
		    		      '<table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding-top:15px;" >'+ 
		            '<tr>'+ 
		             ' <td width="17%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+ 
		              '  <tr>'+ 
		               '   <td valign="top" align="center" style="padding-top:20px;float:right; padding-right:20px;"><img style="cursor:pointer;" onclick="gotoUserDetail(${user.userId},'+data["userId"]+')" src="${imageStorePath}'+data["userInfo"]["headPicture"]+'" width="42" height="42" /></td>'+ 
		                '</tr>'+ 
		                '<tr>'+ 
		                 ' <td align="center" valign="top" style="font-size:16px; color:#57ae97;">&nbsp;</td>'+ 
		                '</tr>'+ 
		                '</table></td>'+ 
		              '<td width="83%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+ 
		               ' <tr>'+ 
		                '  <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+ 
		                 '   <tr>'+ 
		                  '  <td width="340" style="font-size:16px; font-weight:bold;"><span style="color:#57ae97;cursor:pointer;" onclick="gotoUserDetail(${user.userId},'+data["userId"]+')">'+data["userInfo"]["nickName"]+'</span> 发表了话题</td>'+
		                  '<td width="120"><span style="font-size:10px;">'+data["createTime"]+'</span></td>'+ 
		                  '   <td width="25"><img src="${ctx}/images/personal_02.png" width="25" height="19" /></td>'+
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
		    			 var str=' <div style="float:left;margin-top:10px; width:600px; height:245px; background-color:#fffef9; border-bottom:solid 2px #57ae97;">'+
		    			      '<table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding-top:15px;" >'+
		    		        '<tr>'+
		    		         ' <td width="17%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		         '   <tr>'+
		    		          '    <td valign="top" align="center" style="padding-top:20px;float:right; padding-right:20px;"><img style="cursor:pointer;" onclick="gotoUserDetail(${user.userId},'+data["userId"]+')" src="${imageStorePath}'+data["headPicture"]+'" width="48" height="48" /></td>'+
		    		           ' </tr>'+
		    		            '<tr>'+
		    		             ' <td align="center" valign="top" style="font-size:16px; color:#57ae97;">&nbsp;</td>'+
		    		            '</tr>'+
		    		            '</table></td>'+
		    		          '<td width="83%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		          '  <tr>'+
		    		           '   <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		    		            '    <tr>'+
		    		             '     <td width="340" style="font-size:16px; font-weight:bold;"><span style="color:#57ae97;cursor:pointer;" onclick="gotoUserDetail(${user.userId},'+data["userId"]+')">'+data["nickName"]+'</span>创建了圈子</td>'+
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
		    		            '      <td width="156"><img style="cursor:pointer;" onclick="circle_detail(\'${user.userId}\','+data["circleId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')" src="${ctx}'+data["circleImage"]+'" width="156" height="156" /></td>'+
		    		            '      <td width="300" height="180" style="padding-left:10px;" valign="top" border="1"><div><span style="font-weight:bold;font-size:18px; color:#198ea6;cursor:pointer;" onclick="circle_detail(\'${user.userId}\','+data["circleId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')">'+data["name"]+'</span></div>'+
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
		    		var arrayCircle=[],arrayFriend=[];
		    		if(pageinfo["circlePage"]==1){
		    			var arrayTag=[];
		    			for(var i=0;i<msg.rows["tagList"].length;i++){
		    				var data=msg.rows["tagList"][i];
		    				arrayTag.push('<li>'+data["tagName"]+'</li>');
		    			}
		    			$('#ul-tag').html(arrayTag.join(''));
		    			
		    			for(var i=0;i<msg.rows["myCircle"].length;i++){
		    				var data=msg.rows["myCircle"][i];
		    				if(i%2==0){
		    					arrayCircle.push('<tr>');
		    				}
		    				if(data["name"].length>12){
		    					data["name"] =data["name"].substr(0,12)+"...";
		    				}
		    				arrayCircle.push('<td height="61" align="center" width="60" style="padding:2px 0 4px 10px;">');
		    				arrayCircle.push('<img style="cursor:pointer;" onclick="circle_detail(\'${user.userId}\','+data["circleId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')" src="${imageStorePath}'+data["circleImage"]+'" width="48" height="48" />');
		    				arrayCircle.push('</td>');
		    				arrayCircle.push('<td  width="100" align="left" style="padding-left:10px;">');
		    				arrayCircle.push('<span style="color:#fc0;font-size:13px;cursor:pointer;" onclick="circle_detail(\'${user.userId}\','+data["circleId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')" >'+data["name"]+'</span>');
		    				arrayCircle.push('<br/><span style="color:#444;font-size:13px;">('+data["userCount"]+')</span>');
		    				arrayCircle.push('</td>');
		    				if(i%2==1 || i==msg.rows["myCircle"].length-1){
		    					if(i%2==0 && i==msg.rows["myCircle"].length-1){
		    						arrayCircle.push('<td height="61" width="60" align="center" style="padding:2px 0 4px 0;">');
				    				arrayCircle.push('</td>');
				    				arrayCircle.push('<td width="100">');
				    				arrayCircle.push('</td>');
		    					}
		    					arrayCircle.push('</tr>');
		    				}
		    				
		    			}
		    		   $('#table_mycircle').html(arrayCircle.join(''));
		    		   
		    		   for(var i=0;i<msg.rows["myFriend"].length;i++){
		    				var data=msg.rows["myFriend"][i];
		    				var sex="";
		    				if(data["sex"]=="M"){
		    					sex="男";
		    				}
		    				else if(data["sex"]=="W"){
		    					sex="女";
		    				}
		    				if(data["nick_name"].length>12){
		    					data["nick_name"] =data["nick_name"].substr(0,12)+"...";
		    				}
		    				if(i%2==0){
		    					arrayFriend.push('<tr>');
		    				}
		    				arrayFriend.push('<td height="61" align="center" width="60" style="padding:2px 0 4px 10px;">');
		    				arrayFriend.push('<img style="cursor:pointer;" onclick="gotoUserDetail(${user.userId},'+data["user_id"]+')" src="${imageStorePath}'+data["head_picture"]+'" width="48" height="48" />');
		    				arrayFriend.push('</td>');
		    				arrayFriend.push('<td width="100" align="left" style="padding-left:10px;">');
		    				arrayFriend.push('<span  onclick="gotoUserDetail(${user.userId},'+data["user_id"]+')" style="cursor:pointer;color:#fc0;font-size:13px;">'+data["nick_name"]+'</span>');
		    				arrayFriend.push('<br/><span style="color:#444;font-size:13px;">'+sex+'</span>');
		    				arrayFriend.push('</td>');
		    				if(i%2==1 || i==msg.rows["myFriend"].length-1){
		    					if(i%2==0 && i==msg.rows["myFriend"].length-1){
		    						arrayFriend.push('<td height="61" width="61" align="center" style="padding:2px 0 4px 0;">');
				    				arrayFriend.push('</td>');
				    				arrayFriend.push('<td width="100">');
				    				arrayFriend.push('</td>');
		    					}
		    					arrayFriend.push('</tr>');
		    				}
		    				
		    			}
		    		   $('#table_myfriend').html(arrayFriend.join(''));
		    		}
		    		
		    		
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

</script>

