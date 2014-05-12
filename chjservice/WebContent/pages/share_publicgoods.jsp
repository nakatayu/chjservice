<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>漕河泾e服务</title>
	<style type="text/css">
			/* 我的订单 */

		.myorder1 img {
			width: 110px;
			height: 115px;
			cursor: pointer;
		}

		.conv1 img {
			width: 110px;
			height: 110px;
			cursor: pointer;
		}

		#lifetips {
			width: 950px;;
		}

		.tip.logo.tiptitle.tag.show.breakline {
			width: 310px;
			float: left;
		}

		.tipmiddle{
			margin-left:10px;
			margin-right:10px;
		}

		.breakline {
			height: 10px;
		}

		.tipTitle {
			padding: 8px 10px 0 10px;
			font-size: 16px;
			font-weight: bold;
		}

		.tip {
			float: left;
			width: 310px;
			height: 310px;
			background-image: url(${ctx}/images/chj_16.png);
			margin-top:10px;

		}

		#lifetips {
			position: relative;
			padding: 0 25px 0 25px;
		}

		.logo {
			padding: 10px 10px 0 10px;
		}
		.tag{
			padding: 5px 10px 5px 10px;
			font-size: 12px;
			line-height: 12px;
			margin: 0 3px 3px 0px;
		}

		.show {
			padding: 0px 10px 0px 10px;
			height: 19px;
			margin: 5px 0 5px 0;
			color: #999;
		}
		.show span{
			line-height: 19px;
			height: 19px;
			text-align: left;
			font-size: 14px;
			padding: 0px 10px 0 5px;
		}
		.show img{
			height: 19px;
		}
		.tags{
		margin-left: 30px;
		padding: 10px 0 0 0;
		}

		#more {
			line-height: 55px;
			background-color: #FFF;
			margin: 10px 25px 0 25px;
			width: 950px;
			height: 55px;;
			text-align: center;
			float:left;
		}

		#more:hover {
			background: #94bc72;
		}
		.logo img{
			width: 290px;
			height: 170px;
		}

		.tipTitle a{
			color: #000000;
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
				<div class="menu1"><img src="${ctx}/images/menu_25.jpg"
				                        onclick="gotoPage('${ctx}/pages/share_policy.jsp')"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_21.jpg"  style="width: 190px;"/></div>
				<div><img src="${ctx}/images/menu_30.jpg" style="width:285px;height: 100px;"/></div>
			</div>

		</div>

		<div id="lifetips">

		</div>

		<div id="more">
			加载更多
		</div>

		<jsp:include page="/common/bottom.jsp"/>


	</div>
</div>

</body>
</html>
<script type="text/javascript">
	var index = 1;
	var count=1;
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
		$('#lifetips').html('');
		$('#more').html("加载更多");
		findServiceList(tag,time);
	}
	function findServiceList(tag,time) {
		pagesize=index+5;
		var param = {serviceType:4,endindex:pagesize,beginindex:index};
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
						if(count<2){
						array.push('<div class="tip"> ');
						}else if(((count+1)%3)==0){
							array.push('<div class="tip tipmiddle"> ');
						}else{
							array.push('<div class="tip"> ');
						}

						var title=data["title"];
						if(title.length>17){
							title=title.substr(0,16)+"...";
						}

						array.push('<div class="logo"><a href="${ctx}/pages/share_serviceinfo.jsp?serviceType=4&total='+total+'&serviceId=' + data["service_id"] + '&page='+index+'">');
						array.push('<img alt="'+data["title"]+'"  src="${imageStorePath}'+data["image"]+'" /></a></div>');
						array.push('<div class="tipTitle"><a href="${ctx}/pages/share_serviceinfo.jsp?serviceType=4&total='+total+'&serviceId=' + data["service_id"] + '&page='+index+'">'+title+'</a></div>');
						array.push('<div class="breakline"></div><div class="show"><img style="float: left" src="${ctx}/images/chj_15.png"/>');
						array.push('<span style="width:  168px;float: left">'+data["release_time"] +'</span>');
						array.push('<span style="float: right">' + data["see_count"] + '</span><img style="float: right" src="${ctx}/images/personal_02.png" />');
						array.push('</div><div class="tags">');


						var tags = data["tagList"]
						for (var j = 0; j < tags.length; j++) {
							if(j<2){
								var tag = tags[j];
								array.push('<input type="button" class="tag button-flat-primary" onclick=""  value="' + tag["tag_name"] + '" />');
							}
						}
							

						array.push('</div></div>');

						index = index + 1;
						count=count+1;
					}


					if (msg.rows.length < 6) {
						$('#lifetips').append(array.join(''));
						$('#more').html("没有更多内容了");
					} else {
						$('#lifetips').append(array.join(''));
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
		index = index + 5;
		findServiceList();
	}
</script>

