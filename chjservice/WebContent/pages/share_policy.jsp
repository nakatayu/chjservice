<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css"/>
	<title>漕河泾e服务</title>
	<style type="text/css">
			/* 我的订单 */

		.myorder_font {
			color: #00b38a;
			font-size: 14px;
			font-weight: bold;
			text-align: center;
			padding-top: 15px;
		}

		.myorder_font1 {
			color: #00b38a;
			font-size: 14px;
			font-weight: bold;
			text-align: center;
			padding-top: 45px;
		}

		.myorder_font2 {
			font-size: 14px;
			font-weight: bold;
			text-align: center;
			padding-top: 45px;
		}

		.myorder_font02 {
			color: #00b38a;
			font-size: 14px;
			font-weight: bold;
		}

		.myorder1 {
			float: left;
			margin-left: 10px;
		}

		.myorder1 img {
			width: 110px;
			height: 115px;
			cursor: pointer;
		}

		.personal_fr1 {
			float: left;
			margin-left: 10px;
		}

		.conv1 {
			float: left;
			margin-left: 10px;
		}

		.conv1 img {
			width: 110px;
			height: 110px;
			cursor: pointer;
		}

		.comm2 {

			float: left;
			margin-left: 10px;

		}

	

		.content {
			line-height: 25px;
			padding-top: 5px;
			padding-bottom:10px;
			font-size:14px;
		}

		.content a {
			color: gray;
			padding-top: 10px;;
		}

		.tag {
			float: left;
			padding: 5px 5px 5px 5px;
			text-align: center;
			background-color: #09b3a4;
			color: #ffffff;
			line-height: 14px;
			overflow: hidden;
			height: 14px;
			margin: 5px 5px 0 0;
		}

		.time {
			float: right;
			height: 15px;
			font-size: 12px;
			padding-top: 15px;
		}

		.show {
			float: right;
			vertical-align: text-top;
		}

		.show img {
			float: left;
			height: 19px;
		}

		.show span {
			float: left;
			height: 19px;
			font-size: 14px;
			padding: 2px 10px 0 5px;
		}

		.policy {
			width: 95px;
			height: 120px;
			background-color: #FFF;
			border-bottom: #09b3a4 solid 2px;
			padding-top: 20px;
			padding-bottom: 0px;
			margin-top: 10px;
			color: #666666;
			font-size: 14px;
			line-height: 14px;
		}

		a:hover {
			color: #94bc72;
		}

		#more {
			position: relative;
			line-height: 55px;
			background-color: #FFF;
			margin: 10px 25px 0 25px;
			width: 950px;
			height: 55px;;
			text-align: center;
		}

		#more:hover {
			background: #94bc72;
			cursor:pointer;
		}

	</style>
</head>

<body onscroll="b()">


<jsp:include page="/common/header.jsp"/>

<div class="main">
	<div id="main_content" class="main_content">

		<div style="position:relative;height:100px; padding:10px 25px 0 25px;">
			<div>
				<div style="float:left;"><img src="${ctx}/images/menu_29.jpg"
				                              onclick="gotoPage('${ctx}/pages/share_index.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_22.jpg"
				                        onclick="gotoPage('${ctx}/pages/share_service.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_23.jpg"
				                        onclick="gotoPage('${ctx}/pages/share_corperate.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_24.jpg"
				                        onclick="gotoPage('${ctx}/pages/share_lifetips.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_19.jpg" style="width:190px;"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_27.jpg" onclick="gotoPage('${ctx}/pages/share_publicgoods.jsp')"/></div>
				<div><img src="${ctx}/images/menu_30.jpg" style="width:285px;height: 100px;"/></div>
			</div>

		</div>

<div style="position:relative; padding:10px 25px 0 25px;">
   <div>
     <table id="policyList" width="100%" border="0" cellspacing="0" cellpadding="0">
    
    </table>
	

</div>
</div>

<div id="more"  style="float:left; margin:10px 25px 0 25px; width:950px; height:60px;line-height:60px;" >

      加载更多

</div>
	

<jsp:include page="/common/bottom.jsp"/>

		
	</div>
</div>


</body>
</html>
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript">
	var index = 1,total=0;
	var pagesize=0;
	$(function () {

		findServiceList();
		$('#more').click(function () {
			findServiceList();
		});
	});
	function searchByTagImpl(tag,time){
		pageinfo["tag"]=tag;
		pageinfo["time"]=time;
		pagesize=0;
		index=1;
		$('#policyList').html('');
		$('#more').html("加载更多");
		findServiceList(tag,time);
	}
	
	function findServiceList() {
		pagesize=index+14;
		var param = {serviceType:3,endindex:pagesize,beginindex:index};
		if(pageinfo["tag"]!=null && pageinfo["tag"]!=undefined){
			param["tagList"]=pageinfo["tag"];
		}
		if(pageinfo["time"]!=null && pageinfo["time"]!=undefined){
			param["timeSpace"]=pageinfo["time"];
		}
		$.ajax({
			type: "POST",
			url: '${ctx}/share!findServiceMoreList.action',
			dataType: 'json',
			data:param,
			success: function (msg) {
				//load servcieList
				if (msg.status == 200) {
					if(index==1){
						total=msg.total;
					}
					var array = [];
					for (var i = 0; i < msg.rows.length; i++) {
						var data = msg.rows[i];

						var title=data["title"];
						if(title.length>40){
							title=title.substr(0,40)+"...";
						}
						var tags = [];
						for (var j = 0; j < data["tagList"].length; j++) {
							if(j<2){
								var tagname = data["tagList"][j]["tag_name"];
								tags.push('<td><span class="tag button-flat-primary">' + (tagname.length>4?(tagname.substr(0,4)+'...'):tagname) + '</span></td>');
							}
						}
						
						array.push(
						   '<tr style="background:#fff;"><td style="padding-left:20px;padding-top:5px;">'+
						        '<a href="${ctx}/pages/share_serviceinfo.jsp?serviceType=3&total='+total+'&serviceId=' + data["service_id"] + '&page='+index+'" style="color:#09b3a4;font-size:18px">'+title+'</a>'+
						     '</td>'+
						      '<td style="width:200px;" valign="top" align="right">'+
						      '<table border="0" cellspacing="0" cellpadding="0"><tr>'+tags.join('&nbsp;')+'</tr></table>'+
						     '</td>'+
						    '</tr>'+
						    '<tr style="background:#fff;">'+
						    '<td  class="content" style="padding-left:20px;border-bottom:#09b3a4 solid 2px;">'+
						    '<a href="${ctx}/pages/share_serviceinfo.jsp?serviceType=3&total='+total+'&serviceId=' + data["service_id"] + '&page='+index+'" >'+ (data["summary"]==null?"":data["summary"])+'</a>'+
						   ' </td>'+
						     ' <td style="width:200px;border-bottom:#09b3a4 solid 2px;font-size:12px;" valign="top" align="right"><table  border="0" cellspacing="0" cellpadding="0" style="margin-right:10px;"><tr>'+
						    '<td><span style="color:#9a9a9c;ont-size:14px;">'+ data["release_time"]+'</span></td><td valign="middle" height="20"><img src="${ctx}/images/personal_02.png"/></td><td><span style="color:#9a9a9c;">' + (data["see_count"]==null?0:data["see_count"]) + '&nbsp;</span></td></tr></table>'+
						     ' '+
						    '   </td>'+
						    '</tr><tr><td colspan="2"><div style="height:10px;">&nbsp;</div></td></tr>');
						    
						index = index + 1;
					}
					if (msg.rows.length<=0) {
						$('#policyList').append(array.join(''));
						$('#more').html("没有更多内容了");
					} else {
						$('#policyList').append(array.join(''));
					}
				} else {
					altert(msg.msg);
				}
			}
		});
	}

	//function search_keyword() {
	//	findServiceList();
	//}

	function moreList() {
		index = index + 2;
		findServiceList();
	}

</script>

