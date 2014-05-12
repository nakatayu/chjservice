<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />
<title>漕河泾e服务</title>
<!-- 公共css,js -->

<style type="text/css">
.test a{
border:0px solid #000;font-family:微软雅黑;
}
.conv1{
float:left;margin-left:10px;
}
.conv1 img{
width:110px;height:110px;cursor:pointer;
}

.comm2{
	
float:left;margin:0 0 5px 10px;
	
	}

.bottom_nav{
margin:0px;
}
.bottom_nav  li{  /*顶端--菜单样式*/
	border-right:1px solid #ccc;
	text-align:center;
	float:left;
	width:115px;
	height:60px;font-family:微软雅黑;
	list-style:none;
	color:#fff;
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
.public_gg{
cursor:pointer;
font-family:微软雅黑;
}
#table_circle img{cursor:pointer;}

.ul-search li{width:236px;cursor:pointer;float:left;font-size:18px;
color:#fff;list-style: none;height:50px;line-height:50px;
background:#ffc61a;text-align: center;}
ul.ul-tag li{
padding-left:4px;
padding-right:4px;
float:left;
color:#fff;
font-size:14px;
background:#dcdcdc;
margin-left:4px;
margin-top:2px;font-family:微软雅黑;
text-align:center;
list-style: none;
max-width: 200px;/*具体数值自行修改，下一行相同*/
word-break:keep-all;
}
.ul-create-activity li{cursor:pointer;float:left;font-size:18px;
color:#fff;list-style: none;height:50px;line-height:50px;text-align: center;}
</style>

</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />
<script type="text/javascript" src="${ctx}/js/JQueryHexBackgroundColor.js"></script>
<script type="text/javascript" src="${ctx}/js/activity.js"></script>
<script type="text/javascript" src="${ctx}/common/pager.js"></script>
<div class="main">
<div id="main_content" class="main_content">

   <div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	     <div style="float:left;"><img src="${ctx}/images/menu_68.jpg" onclick="gotoPage('${ctx}/community!communityHome.action')" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_62.jpg" onclick="gotoPage('${ctx}/pages/community_topiclist.jsp')"/></div>
            <div class="menu1"><img src="${ctx}/images/menu_65.jpg" onclick="gotoPage('${ctx}/pages/community_activitylist.jsp')"/></div>
            <div class="menu2"><img src="${ctx}/images/menu_59.jpg" onclick="gotoPage('${ctx}/pages/community_circlelist.jsp')"  style="width:190px;"/></div>

          
           <div><img src="${ctx}/images/menu_66.png" style="width:473px;height: 100px;" /></div>
	    </div>
  
</div>
 
 <div style="position:relative;height:45px; padding:10px 25px 0 15px;">
	   <div>
	   <table width="710" border="0" height="45" cellspacing="0" cellpadding="0" bgcolor="ffc61a" class="comm2">
  <tr>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="5%"  >
		<ul class="ul-search">
   		<li style="background:#f0b543;" onclick="order_fun(0,'time')">按时间排序<img id="img_time" src="${ctx}/images/search_desc_time.png"/></li>
   		<li onclick="order_fun(1,'browse')">按人气排序<img id="img_browse" src="${ctx}/images/search_desc_browse.png"/></li>
   		<li onclick="order_fun(2,'userCount')">按圈子等级排序<img id="img_userCount" src="${ctx}/images/search_desc_browse.png" /></li>
  	</ul>
		</td>
      </tr>
    </table></td>
    </tr>
</table>

  <div style="width:230px;float:right;cursor: pointer; padding:0 0 5px 0;">
   <ul class="ul-create-activity">
   	<li style="width:230px;cursor:pointer;background:url(${ctx}/images/cjqz_1.png)" onclick="create_circle()"></li>
   </ul>
 </div>
 
</div>
 </div>
 
<div style="position:relative;padding:10px 25px 0 25px;">
	  <div>
   <div style="float:left; width:710px; "> 
    <table id="table_circle" width="710" border="0" cellspacing="0" cellpadding="0">
 
  
    </table>
<div style="float:left;width:710px; height:40px;background:#fff;margin-top:10px;" >

<div id="pager" style="float:right;" ></div>

</div>
</div>
       
   <div style="float:right; width:230px; "> 
     <table style="width:100%;" border="0" cellspacing="0" cellpadding="0"  >
  	
  	<tr style="background-color:#ffbf00; height:40px;">
  		<td colspan="2" style="width:230px;background:url(${ctx}/images/tjhd_11.png)"></td>
  	</tr>
           
   <c:forEach var="item" items="${activityRecommend}" varStatus="index1">
           <c:if test="${index1.index>0}">
             <tr><td height="10"></td></tr>
            </c:if>
  
  
  <tr>
    <td width="90" valign="top" style="background:#fff;padding:10px 5px 5px 5px;">
    <img onclick="activity_detail('${user.userId}',${item.activityId},'${item.createUserId}','${item.status}','${item.examineResult}')" style="cursor:pointer;" src="${imageStorePath}${item.activityImage}" width="80" height="80"  />
   		<c:if test="${item.createUserId != user.userId}">
   		<c:if test="${item.activityUserStatus == null || item.activityUserStatus=='4'||item.activityUserStatus=='5'}">
         <div style="cursor:pointer;color:#fff;width:80px;height:30px;line-height:30px;text-align: center;background:#ffbe00;" onclick="addActivityUser('加入活动',2,${item.activityId},'${item.isCheck}','${item.isQrcode}')" >我要报名</div>
        </c:if>
         <c:if test="${item.activityUserStatus=='1'}">
        <div style="color:#fff;width:80px;height:30px;line-height:30px;text-align: center;background:#ffbe00;">
         	等待审核</div>
        </c:if>
         <c:if test="${item.activityUserStatus=='2'}">
        <div style="color:#fff;width:80px;height:30px;line-height:30px;text-align: center;background:#ffbe00;">
         	审核未通过</div>
        </c:if>
         <c:if test="${item.activityUserStatus=='3'}">
        <div onclick="exitActivityUser(${item.activityId})" style="cursor:pointer;color:#fff;width:80px;height:30px;line-height:30px;text-align: center;background:#ffbe00;">
         	退&nbsp;出</div>
        </c:if>
        
        </c:if>
    </td>
    <td width="140" valign="top" style="background:#fff;font-family:微软雅黑;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td onclick="activity_detail('${user.userId}',${item.activityId},'${item.createUserId}','${item.status}','${item.examineResult}')" style="cursor:pointer;padding-top:15px; font-size:16px; color:#333; font-weight:bold; font-family:'微软雅黑';">
    
      <c:if test="${fn:length(item.title)>6}">
         ${fn:substring(item.title,0,6)}...
      </c:if>
      <c:if test="${fn:length(item.title)<=6}">
        ${item.title}
      </c:if>
    </td>
  </tr>
  <tr>
    <td valign="top" style="padding:5px 6px 0 0;font-family:微软雅黑;height:95px;font-size:14px; color:#666;">
  
     <c:if test="${fn:length(item.summary)>42}">
         ${fn:substring(item.summary,0,42)}...
      </c:if>
      <c:if test="${fn:length(item.summary)<=42}">
        ${item.summary}
      </c:if>
    </td>
  </tr>
  
</table>
</td>
  </tr>
  <tr>
    <td colspan="2" style="background:#fff;padding-top:10px;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="2"></td>
                <td width="33" align="center" style="color:#666; font-family:微软雅黑;font-size:14px;" valign="top">评论</td>
                <td width="34" align="center" style="height:25px;font-family:微软雅黑; width:34px; color:#fff; font-size:12px;" valign="top">
                <div style="width:34px;font-family:微软雅黑;height:30px;background:url(${ctx}/images/search_number_yellow.png) no-repeat;">
               	 ${item.commentCount}
                </div>
                </td>
                <td width="142" style="padding-bottom:4px;">
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
            </table>
    </td>
  </tr>
  </c:forEach>
  
    </table>
  </div>
       
</div>
</div>
 
 

 
 <div id="pagertest"></div>

  <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>


 
 
 

</body>
</html>
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript">
var hot="${circleHot}";
$(document).ready(function(){
	
	pageinfo["orderType"]='time';
	pageinfo["order"]='desc';
	
	findCircleList(1);
	
});
PageClick = function(pageclickednumber) {
    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
    findCircleList(pageclickednumber);
}
var orderInfo={time:'desc',browse:'desc',userCount:'desc'};
function order_fun(index,type){
	$('.ul-search li').each(function(indexeach,data){
		if(indexeach==index)
			$(this).css("background","#f0b543");
		else
			$(this).css("background","#ffc61a");
	});
	if(orderInfo[type]=="desc")
		orderInfo[type]="asc";
	else
		orderInfo[type]="desc";
	$('#img_'+type).attr('src',"${ctx}/images/search_"+orderInfo[type]+"_"+type+".png");
	pageinfo["orderType"]=type;
	pageinfo["order"]=orderInfo[type];
	findCircleList(1);
}
function searchByTagImpl(tag,time){
	pageinfo["tagList"]=tag;
	pageinfo["timeSpace"]=time;
	$('#table_circle').html('');
	findCircleList(1);
}
function findCircleList(page){
	pageinfo["size"]=10;
	pageinfo["page"]=page;
	
	$.ajax({
	    type: "POST",
	    url : '${ctx}/community!findCircleList.action',
	    dataType:'json',
	    data:pageinfo,
	    success: function(msg,status){
	    	if(msg.status==200){
	    		 if(msg.total%pageinfo["size"]==0)
		    	    	pageinfo["tp"]=msg.total/pageinfo["size"];
		    	 else
		    	    	pageinfo["tp"]=Math.ceil(msg.total/pageinfo["size"]);
		    	 $("#pager").pager({ pagenumber: pageinfo["page"], pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
		    	
	    		var array=[];
	    		for(var i=0; i<msg.rows.length;i++){
	    			var data = msg.rows[i];
	    			var str='',td='<td style="height:166px;width:350px;padding-left:10px;">',top=10;
	    			if(i==1 || i==0){
	    				top=0;
	    			}
	    			if(i%2==0){
	    				str='<tr>';
	    				td='<td height="166px" width="350px;">';
	    			}
	    			var tagList='<ul class="ul-tag">';
	    			for(var k=0;k<data["tagList"].length;k++){
	    				if(k<2){
	    					var name = data["tagList"][k]["tagName"];
	    					if(name.length>4){
	    						name=name.substr(0,4)+'...';
	    					}
	    					tagList +='<li>'+name+'</li>';
	    				}
	    					
	    			}
	    			tagList +='</ul>';
	    			
	    			var adduser='';
	    			if(data["hasAdd"]==0 && "${user.userId}"!=data["userId"]){
	    				adduser = '<div  onclick="addCircle('+data["circleId"]+',\''+data["isCheck"]+'\')" style="cursor:pointer;color:#fff;width:120px;height:30px;line-height:30px;top:100px;text-align: center;background:#ffbe00;">申请加入</div>';
	    			}
	    			if(data["name"].length>6){
	    				data["name"]=data["name"].substr(0,6)+'...';
	    			}
	    			if(data["summary"].length>26){
	    				data["summary"]=data["summary"].substr(0,26)+'...';
	    			}
	    			if(data["commentCount"]>9999){
	    				data["commentCount"]=9999;
	    			}
	    			var hotStr='<span style="float:right;background:#e97d70;margin-right:4px;color:#fff;padding:4px;font-size:14px;">热帖('+data["topicCount"]+')</span>';
	    			if(data["topicCount"]<hot){
	    				hotStr='';
	    			}
	    			
	    			str +=td+'<table width="350" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; margin-top:'+top+'px;">'+
	    	           '<tr>'+
	    	           '  <td valign="top" width="36%" style="padding:12px 0 13px 15px;color: #9a9a9c;font-family:微软雅黑;"><img alt="查看详情" onclick="circle_detail(\'${user.userId}\','+data["circleId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')" src="${imageStorePath}'+data["circleImage"]+'" width="120" height="120" />'+
	    	           adduser+
	    	           '</td>'+
	    	            ' <td width="64%" valign="top">'+
	    	             '<table width="100%" border="0" cellspacing="0" cellpadding="0">'+
	    	              ' <tr>'+
	    	               '  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
	    	                '   <tr>'+
	    	                 '    <td width="58%" onclick="circle_detail(\'${user.userId}\','+data["circleId"]+',\''+data["userId"]+'\',\''+data["status"]+'\',\''+data["examineResult"]+'\')"  style="cursor:pointer;padding:12px 0 0 10px; font-size:16px; color:#333; font-weight:bold;">'+data["name"]+'</td>'+
	    	                  '   <td width="42%" align="center"style="padding-top:12px;" >'+hotStr+'</td>'+
	    	                   '</tr>'+
	    	                 '</table></td>'+
	    	               '</tr>'+
	    	               '<tr>'+
	    	                ' <td style="padding:5px 0 0 10px; font-family:微软雅黑;font-size:14px; color:#666; ">等级：'+data["level"]+'级</td>'+
	    	               '</tr>'+
	    	               '<tr>'+
	    	              '   <td valign="top" style="height:40px;font-family:微软雅黑;padding:5px 0 0 10px; font-size:14px; color:#666; ">'+data["summary"]+' </td>'+
	    	               '</tr>'+
	    	               '<tr>'+
	    	               '  <td style="padding:3px 0 8px 10px; font-family:微软雅黑;font-size:14px; color:#666; ">现有人数：<span style="color:#333; font-size:16px; font-weight:bold;">'+data["userCount"]+'</span></td>'+
	    	               '</tr>'+
	    	               '<tr>'+
	    	               '  <td  style="height:30px;padding:2px 0 4px 8px;">'+
	    	               tagList+
	    	               '</td>'+
	    	              ' </tr>'+
	    	             '</table></td>'+
	    	           '</tr>'+
	    	         '</table>'+
	    	        ' </td>';
	    	          if(i%2==1 || i==msg.rows.length-1){
	    			   if(i%2 !=1){
	    			   	str += '<td width="10">&nbsp;</td><td width="350" valign="top">&nbsp;</td>';
	    			   }
	    			    str +='</tr>';
	    			  }
	    			  array.push(str);
	    		}
	    		$('#table_circle').html(array.join(''));
	    		array=[];
	    		array=null;
	    		if(msg.rows.length==0 && pageinfo["page"]==1){
	    			window.alert(pageinfo["emtMsg"]);
					$('#table_circle').html('<tr><td style="text-align:center; width:708px; height:40px;line-height:40px; background:#fff;" >'+pageinfo["emtMsg"]+'</td></tr>');
				}	
	    		
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
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
function create_circle(){
		window.location.href="${ctx}/community!createCircle.action";
}
var exitActivityUserFlag=false;
function exitActivityUser(id){
	if(exitActivityUserFlag){
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
	    	  exitActivityUserFlag=true;
	    	}
	    	else
	    	  alert(msg.msg);
	     }
	});
}

</script>

