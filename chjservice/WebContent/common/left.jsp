<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>left</title>

<link rel="stylesheet" type="text/css" href="${ctx }/themes/default/easyui.css" />
<script type="text/javascript" src="${ctx }/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${ctx }/js/jquery.easyui.min.js"></script>
<script>
     	var path="<%= request.getContextPath() %>";
		var usertype = "${user.type}";
		$(function(){
	 	var str="梦洁家纺:后台用户_userserver.jsp,版本信息_version.jsp,终端用户_phoneuser.jsp,"+
	 	"首页图片_homeimage.jsp,展示图片_showdiv.jsp,产品系列_series.jsp,邮箱设置_sendemail.jsp,"+
	 	 "新闻图片_newsimage.jsp,新闻信息_news.jsp;"+
	 	 "行为观察:观察-年龄_age.jsp,观察-价格_price.jsp,观察-促销_sales.jsp,观察-陪伴_accompany.jsp"+
	 	 ",观察-动作_action.jsp,观察-位置_position.jsp,观察-品类_variety.jsp,观察-原因_because.jsp"+
	 	";行为分析:购物时间和成交率_actionbuytime.jsp,购物动作_actiondo.jsp,天气和成交率_actionwether.jsp,有效购物时间_actiontimestep.jsp"+
	 	",营销活动和成交率_actionsaletype.jsp,年龄段_actionage.jsp";
	 	var str1=str.split(";");
		var cont1="";
	      
		 for(var i=0;i<str1.length;i++){
		 
		 title=str1[i].split(":")[0];
		 content=str1[i].split(":")[1].split(",");
		 cont1+="<div title="+title+">";
		  for(var j=0;j<content.length;j++){
			  var page="pages/"+content[j].split("_")[1];
	          cont1+='<p id="outer"><a href="${ctx}/'+page+'" target="mainFrame" style="font-size:10pt;line-height:25px;color:#797975" >'+content[j].split("_")[0]+'</a></p>';
	         
		  }
		  cont1+="</div>";
		  
		 } 
		
         $("#menu").html(cont1);
         $("#menu").accordion();
         
});	
function addTab(obj){
	
		  var url=obj.split("_")[1];
		  var title=obj.split("_")[0];
		
		  var e =$('#tab').tabs('exists',title);
          if(e==true){
            $('#tab').tabs('select',title);
            return ;
          }
        var page="${ctx }/pages/"+url;
         $('#tab').tabs('add',{
             title:title,
             href:page,
             closable:true
             
       });
   }  
	</script>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow: hidden;
	background: #F8F7E9;
		height: 820px;
}

p#outer {
	margin: 0;
	text-align: center;
	vertical-align: middle;
	border-bottom: 1px dotted;
}

#outer a {
	height: 26px;
	vertical-align: middle;
	display: block;
	text-decoration: none;
}

#outer a:link,a:visited {
	color: #000;
	background: #FAF9E7;
}

#outer a:hover,a:active {
	font-weight: bold;
}
</style>
</head>

<body>
	<div id="menu" fit="true" border="false"></div>
</body>
</html>