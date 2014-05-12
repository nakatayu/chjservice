<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />

<style type="text/css">

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
ul.ul-tag{
width:300px;
}
ul.ul-tag li{
width:50px;
padding:2px;
float:left;
background:#ccc;
margin-left:4px;
margin-top:2px;
text-align:center;
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
           <div class="menu1"><img src="${ctx}/images/menu_37.jpg" style="width:190px;"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_49.jpg" onclick="gotoPage('${ctx}/pages/personal_topic.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_44.jpg" onclick="gotoPage('${ctx}/pages/personal_circle.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_45.jpg" onclick="gotoPage('${ctx}/pages/personal_activity.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_47.jpg" onclick="gotoPage('${ctx}/pages/personal_collection.jsp')"/></div>
            <div class="menu1"><img src="${ctx}/images/personnel_home.png" onclick="gotoPage('${ctx}/pages/myhome.jsp')"/></div>
	    </div>
  
</div>
  
 
 <div id="frienddata"></div>
						
<div style="float:left; margin:10px 25px 0 25px; width:950px; height:40px;background:#fff;" >
<div id="pager" style="float:right;" ></div>
</div>
 
 
 
<jsp:include page="/common/bottom.jsp" />
	
</div>
</div>
</body>
</html>
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

   $("#pager").pager({ pagenumber: pageinfo["page"], pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
   
   findUserfriend(1);			
	});
	
	function findUserfriend(page){
		pageinfo["page"]=page;
		pageinfo["size"]=12;
		$.ajax({
			type : "POST",
			url : '${ctx}/user!findUserfriend.action',
			dataType : 'json',
			data :pageinfo,
			success : function(msg, status) {
				if(msg.status == 200){
					if(msg.total%pageinfo["size"]==0)
		    	    	pageinfo["tp"]=msg.total/pageinfo["size"];
		    	    else
		    	    	pageinfo["tp"]=Math.ceil(msg.total/pageinfo["size"]);
		    		$("#pager").pager({ pagenumber: pageinfo["page"], pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
		    		
		    		var array = [];
		    		for(var i=0; i < msg.rows.length; i++){
		    		   var data = msg.rows[i];
		    		   if(data["city"]==null){
		    			   data["city"]='未知';
						}
		    		   if(data["info"].length>40){
		    			   data["info"] = data["info"].substr(0,40)+'...';
		    		   }
		    		   if(i%3==0){
		    			  array.push('<div style="position:relative;height:150px; padding:10px 25px 0 25px;"><div>');
		    			  array.push('<div style="float:left; width:310px; height:150px;background-image:url(${ctx}/images/personal_fr03.png);">');
		    		   }
		    		   else{
		    			   array.push('<div class="personal_fr1" style="width:310px; height:150px;background-image:url(${ctx}/images/personal_fr03.png);">');
		    		   }		
		    		  array.push('<table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding-top:10px;">');
		    		  array.push('<tr><td width="45%" height="106" align="center"><img style="cursor:pointer;" onclick="gotoUserDetail(${user.userId},'+data["user_id"]+')" src="${imageStorePath}/'+data["head_picture"]+'" width="105" height="100" /></td>');
		    		  array.push('<td width="55%" valign="top" align="left"><table width="100%" border="0" cellspacing="0" cellpadding="0">');
		    		  array.push('<tr><td width="50" align="left" style="font-size:14px; color:#7c7c7c;">简介：</td> <td>');
		    		  array.push('<div style="font-size:12px;padding:8px;width:100px;height:80px;overflow:hidden;align:top;">'+data["info"]+'</div></td></tr>');
		    		  array.push('</table></td></tr>');
		    		  array.push('<tr><td align="center" style="font-size:14px; color:#7c7c7c;cursor:pointer;" onclick="gotoUserDetail(${user.userId},'+data["user_id"]+')">'+data["called"]+'</td><td>地址：'+data["city"]+'</td></tr></table></div>');
		    		  
		    		  if(i%3==2 || i==msg.rows.length-1){
		    			   array.push('</div></div>');
		    		   }
		    	   }
		    	   $('#frienddata').html(array.join(''));
				}
		    	else{
		    		alert(msg.msg);
		    	}
			}
		});
	}
	PageClick = function(pageclickednumber) {
	    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
	    findUserfriend(pageclickednumber);
	};
	
	

</script>
