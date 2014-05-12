<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>漕河泾e服务</title>
<script type="text/javascript" src="http://tjs.sjs.sinajs.cn/t3/platform/js/api/wb.js" charset="utf-8"></script>
<style type="text/css">

html {
	width: 100%;
	height: 100%;
	margin: 0;
	overflow-y: auto;
	background: url(${ctx}/images/back_body.jpg);
	font-family: '微软雅黑';
}

.nav1  li {
	/*顶端--菜单样式*/
	border-left: 1px solid #ccc;
	text-align: left;
	float: left;
	width: 115px;
	height: 75px;
	margin-top: 4px;
	list-style: none;
}

.nav1  li:hover {
	cursor: pointer;
	color: #fff;
}

.main {
	width: 100%;
	text-align: center;
	margin: 0px;
}

.main_content {
	width: 1000px;
	text-align: left;
	margin: 0 auto;
}

.conv1 img {
	width: 110px;
	height: 110px;
	cursor: pointer;
}

.conv3 img {
	width: 230px;
	height: 250px;
	cursor: pointer;
}

.conv4 img {
	width: 230px;
	height: 210px;
	cursor: pointer;
}

.fun4 img {
	width: 230px;
	height: 230px;
	cursor: pointer;
}

.bottom_nav  li {
	/*顶端--菜单样式*/
	border-right: 1px solid #ccc;
	text-align: center;
	float: left;
	width: 115px;
	height: 60px;
	list-style: none;
	color: #fff;
}

.bottom_nav  li:hover {
	cursor: pointer;
	color: blue;
}

.bottom_nav  li div {
	margin: 20px 0 0 6px;
}

* {
	margin: 0;
}

a, img {
	border: 0;
}

	/* shutter */
.shutter {
	position: relative;
	overflow: hidden;
	height: 230px;
	width: 350px;
}

.shutter li {
	position: absolute;
	left: 0;
	top: 0;
}

.shutter-nav {
	display: inline-block;
	margin-right: 8px;
	margin-top: 0px;
	color: #fff;
	padding: 2px 5px;
	font-family: '微软雅黑';
	font-weight: bold;
	font-size: 12px;
	cursor: pointer;
}

.shutter-cur-nav {
	display: inline-block;
	margin-right: 8px;
	margin-top: 0px;
	color: #f00;
	padding: 2px 5px;
	font-family: '微软雅黑';
	font-weight: bold;
	font-size: 12px;
	cursor: pointer;
}

	/* 我的订单 */

.myorder1 img {
	width: 110px;
	height: 115px;
	cursor: pointer;
}

	/*shareMain*/

#shareMain {
	width: 950px;
	margin: 10px 25px 0 25px;
}

#left {
	width: 630px;
	float: left;
	height: 1467px;
}

#right {
	width: 310px;
	float: right;
}

#bottom {
	float: left;
	width: 950px;
}

.tip.logo.tiptitle.tag.show.breakline {
	width: 310px;
	float: left;
}

.breakline {
	height: 10px;
}

.tipTitle {
	padding: 8px 10px 0 10px;
	font-size: 16px;
}

.tip {
	float: left;
	width: 310px;
	height: 310px;
	background-image: url(${ctx}/images/chj_16.png);
}

.tipmiddle {
	margin: 0 10px;
}

.tipLeft {
	margin-right: 10px;
}

.logo {
	padding: 10px 10px 0 10px;
}

.tag {
	padding: 5px 5px;
	font-size: 12px;
	line-height: 12px;
	margin-left: 5px;
}

.show {
	padding: 0px 10px;
	height: 19px;
	margin: 5px 0 5px 0;
	color: #999;
}

.show span {
	line-height: 19px;
	height: 19px;
	text-align: left;
	font-size: 14px;
	padding: 0px 10px 0 5px;
}

.show img {
	height: 19px;
}

.tags {
	margin-left: 30px;
	padding: 10px 0 0 0;
}

.logo img {
	width: 290px;
	height: 170px;
}

.tipTitle a {
	color: #000000;
}

.Ltitle {
float:left;
	background-image: url(${ctx}/images/sharechj_bg2.png);
	width: 630px;
	height: 45px;
}

.Ltitle a {
	float: right;
	border: 1px;
}

.Ltitle span {
float:left;
	line-height: 45px;
	text-align: left;
	padding-left: 20px;
	color: #ffffff;
	font-size: 16px;
}

.Rtitle {
	background-image: url(${ctx}/images/sharechj_bg2.png);
	width: 310px;
	height: 45px;
	float: left;
}

a {
	color: #999;
}

.Rtitle img {
	float: right;
}

.Rtitle span {
	line-height: 45px;
	text-align: left;
	padding-left: 20px;
	color: #ffffff;
	font-size: 16px;
}

.bottomTitle {
	background-image: url(${ctx}/images/sharechj_bg2.png);
	width: 950px;
	height: 45px;
	float: left;
}

.bottomTitle img {
	float: right;
}

.bottomTitle span {
float:left;
	line-height: 45px;
	text-align: left;
	padding-left: 20px;
	color: #ffffff;
	font-size: 16px;
}

.shashare {	 
clear:both;
position:relative;
	margin-bottom: 10px;
}

#topic {
	margin-bottom: 5px;
}

.policy {
	height: 157px;
	background-color: #ffffff;
	width:570px; 
	margin:0 30px 0 30px;
}

.policy span {
	float: right;
	font-size: 14px;
	color: #999;
	padding: 0 5px;
}

.policy img {
	float: right
}

#policys {
	border-bottom: 2px solid #09b3a4;
}

.content {
  float: left;margin-bottom: 10px;
}

#parkService {
	float: left;
	border-bottom: 2px solid #c0c0c0;
	 
}

.service {
	height: 290px;
	width: 230px;
	background-color: green;
	margin-left: 10px;
	float: left;
}

#more {
	line-height: 55px;
	background-color: #FFF;
	width: 950px;
	height: 55px;;
	text-align: center;
	float: left;
}

#more:hover {
	background-color: #94bc72;
}

.ptitle {
	height: 38px;
	padding: 20px 0 0 20px;
}

.pTitle a {
	color: #000;
}

.pcontent {
	font-size: 14px;
	color: #999;
	height: 120px;
	padding: 10px;
	text-indent: 2em;
}



#nav {
	list-style-type: none;
	text-align:left;
	padding: 10px;;
	/*定义整个ul菜单的行高和背景色*/
}

	/*==================一级目录===================*/
#nav a {
	width: 289px;
	display: block;
	padding-left:20px;
	/*Width(一定要)，否则下面的Li会变形*/
}
#nav li {
	border-bottom:#FFF 1px solid; /*下面的一条白边*/
	float:left;
	margin-bottom:8px;
	line-height: 125px;
	/*float：left,本不应该设置，但由于在Firefox不能正常显示
	 继承Nav的width,限制宽度，li自动向下延伸*/
}
#nav li a:hover{
	/*background:#CC0000;*/ /*一级目录onMouseOver显示的背景色*/
}
#nav a:link  {
	color:#fff; text-decoration:none;
}
#nav a:visited  {
	color:#fff;text-decoration:none;
}
#nav a:hover  {
	color:#999;
	text-decoration:none;
	font-weight:bold;
}

	/*==================二级目录===================*/
#nav li ul {
	list-style:none;
	text-align:left;
}
#nav li ul li{
	line-height: 60px;
	margin-bottom:5px;
}
#nav li ul a{
	padding-left:20px;
	width:267px;
	/* padding-left二级目录中文字向右移动，但Width必须重新设置=(总宽度-padding-left)*/
}
	/*下面是二级目录的链接样式*/
#nav li ul a:link  {
	color:#fff; text-decoration:none;
}
#nav li ul a:visited  {
	color:#fff;text-decoration:none;
}
#nav li ul a:hover {
	color:#999;
	text-decoration:none;
	font-weight:normal;
	background:#00c0c0;
	/* 二级onmouseover的字体颜色、背景色*/
}
	/*==============================*/
#nav li:hover ul {
	left: auto;
}
#nav li.sfhover ul {
	left: auto;
}
#content {
	clear: left;
}
#nav ul.collapsed {
	display: none;
}

	/*一级目录的背景色*/
.back1{
	background-image:url(${ctx}/images/sheare_button0.png);
	background-repeat: no-repeat;
}
.back2{
	background-image:url(${ctx}/images/sheare_button1.png);
	background-repeat: no-repeat;
}

	/*二级目录的背景色*/
.color1{
	border-left:1px solid #00c0c8;
	border-right:1px solid #00c0c8;
	background-color:#00c0c8;
}
.color2{
	border-left:1px solid #4dd3d9;
	border-right:1px solid #4dd3d9;
	background-color:#4dd3d9;
}

#parkService a{
padding: 5px 11px 0px 11px;
}
</style>


</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp"/>

<div class="main">
	<div id="main_content" class="main_content">

		<div style="position:relative;height:100px; padding:10px 25px 0 25px;">
			<div>
				<div style="float:left;"><img src="${ctx}/images/menu_15.jpg"/></div>
				<div class="menu1"><img src="${ctx}/images/menu_22.jpg"
				                        onclick="gotoPage('${ctx}/pages/share_service.jsp')"/>
				</div>
				<div class="menu1"><img src="${ctx}/images/menu_23.jpg"
				                        onclick="gotoPage('${ctx}/pages/share_corperate.jsp')"/>
				</div>
				<div class="menu1"><img src="${ctx}/images/menu_24.jpg"
				                        onclick="gotoPage('${ctx}/pages/share_lifetips.jsp')"/>
				</div>
				<div class="menu1"><img src="${ctx}/images/menu_25.jpg"
				                        onclick="gotoPage('${ctx}/pages/share_policy.jsp')"/>
				</div>
				<div class="menu1"><img src="${ctx}/images/menu_27.jpg" onclick="gotoPage('${ctx}/pages/share_publicgoods.jsp')"/></div>
				<div><img src="${ctx}/images/menu_30.jpg" style="width:285px;height: 100px;"/></div>
			</div>

		</div>

		<div id="shareMain">
			<div id="left">
				<div id="services" class="shashare">
					<div style="height:45px;background:url(${ctx}/images/share_fuwu.png)">
						
						<a href="${ctx}/pages/share_service.jsp" style="float:right;">
						<img src="${ctx}/images/sharechj_more.png" width="61" height="42" />
						</a>
					</div>

				</div>

				<div id="corperates" class="shashare">
					<div style="height:45px;background:url(${ctx}/images/share_zhaosh.png)">
						<a href="${ctx}/pages/share_corperate.jsp" style="float:right;">
						<img src="${ctx}/images/sharechj_more.png" width="61" height="42"/></a>
					</div>
				</div>

				<div id="lifetips" class="shashare">
					 <div style="height:45px;background:url(${ctx}/images/share_shhuo.png)">
						<a href="${ctx}/pages/share_lifetips.jsp" style="float:right;">
						<img src="${ctx}/images/sharechj_more.png" width="61" height="42" /></a>
					</div>
				</div>
				<div id="policys" class="shashare">
					<div style="height:45px;background:url(${ctx}/images/share_zhengce.png)">
						
						<a href="${ctx}/pages/share_policy.jsp" style="float:right;">
						<img src="${ctx}/images/sharechj_more.png" width="61" height="42" /></a>
					</div>

				</div>
			</div>
			<div id="right">
				<div id="topic">
					<div><img src="${ctx}/images/share_weihuati.png" width="310px" height="45px" /></div>
                    <div style="background-color: white;border-bottom: solid #2bdaef;">
                        <iframe width="310" height="307" class="share_self" frameborder="0" scrolling="no" src="http://widget.weibo.com/weiboshow/index.php?language=&amp;width=310&amp;height=310&amp;fansRow=1&amp;ptype=0&amp;speed=0&amp;skin=5&amp;isTitle=0&amp;noborder=0&amp;isWeibo=1&amp;isFans=0&amp;uid=2720684893&amp;verifier=500a5f1c&amp;dpc=1">
                        </iframe></div>
				</div>
				<div id="equity" style="margin-top:10px;">
					<div style="height:45px;background:url(${ctx}/images/share_gongyi.png)">
						<a href="${ctx}/pages/share_publicgoods.jsp"  style="float:right;">
						<img src="${ctx}/images/sharechj_more.png" width="61" height="42"/></a>
					</div>
					 
				</div>
				<div id="parkService">
					<div style="height:45px;background:url(${ctx}/images/share_service.png)">
					</div>
					<div style="background-color:#ffffff;width: 310px;height: 680px;float: left;;">
						<a href="http://www.caohejingibi.com/zh-cn/">
						<img style="margin: 10px 0 0 0;" alt="园区配套服务机构" title="园区配套服务机构" src="/chjservice/images/parkService_1.png" />
						</a>
						<a href="http://ea.caohejing.com/">
						<img style="margin: 5px 0 0 0;" alt="企业协会" title="企业协会" src="/chjservice/images/parkService_2.png" />
						</a>
						<a href="http://www.hrstage.com/">
						<img style="margin: 5px 0 0 0;" alt="人力资源服务" title="人力资源服务" src="/chjservice/images/parkService_3.png" />
						</a>
						<a href="http://www.chjpm.com/">
						<img style="margin: 5px 0 0 0;" alt="物业配套服务" title="物业配套服务" src="/chjservice/images/parkService_4.png" />
						</a>
						<a href="http://www.chjyy.cn">
						<img style="margin: 5px 0 0 0;" alt="园艺绿化服务"  title="园艺绿化服务" src="/chjservice/images/parkService_5.png" />
						</a>
 

						<%--<ul id="nav">--%>
							<%--<li id="Child1" class="back1"><a href="#Menu=ChildMenu1"  onclick="DoMenu('ChildMenu1')">园区配套服务机构</a>--%>
								<%--<ul id="ChildMenu1" class="collapsed">--%>
                                    <%--<li class="color1"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=61&t=67#">餐饮</a></li>--%>
                                    <%--<li class="color2"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=61&t=134">酒店</a></li>--%>
                                    <%--<li class="color1"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=61&t=68">便利超市</a></li>--%>
                                    <%--<li class="color2"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=61&t=69">金融证券</a></li>--%>
                                    <%--<li class="color1"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=61&t=70">运动休闲</a></li>--%>
                                    <%--<li class="color2"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=61&t=71">宾馆会所</a></li>--%>
                                    <%--<li class="color1"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=61&t=71">宾馆会所</a></li>--%>
                                    <%--<li class="color2"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=61&t=72">邮政通讯</a></li>--%>
                                    <%--&lt;%&ndash;<li class="color1"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=61&t=73">生活文化</a></li>&ndash;%&gt;--%>
								<%--</ul>--%>
							<%--</li>--%>
							<%--<li  id="Child2" class="back2"><a href="#Menu=ChildMenu2" onclick="DoMenu('ChildMenu2')">开发区企业协会</a>--%>
								<%--<ul id="ChildMenu2" class="collapsed">--%>
                                    <%--<li class="color1"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=62&t=75">协会简介</a></li>--%>
                                    <%--<li class="color2"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=62&t=76">组织架构</a></li>--%>
                                    <%--<li class="color1"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=62&t=79">加入协会</a></li>--%>
								<%--</ul>--%>
							<%--</li>--%>
							<%--<li  id="Child3" class="back1"><a href="#Menu=ChildMenu3" onclick="DoMenu('ChildMenu3')">人力资源服务</a>--%>
								<%--<ul id="ChildMenu3" class="collapsed">--%>
									<%--<li class="color1"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=63&t=80#">漕河泾人才网</a></li>--%>
									<%--<li class="color2"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=63&t=81">上海漕河泾开发区人力资源服务有限公司</a></li>--%>
									<%--<li class="color1"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=63&t=82">上海市人才服务中心漕河泾分中心</a></li>--%>
								<%--</ul>--%>
							<%--</li>--%>
							<%--<li  id="Child4" class="back2"><a href="#Menu=ChildMenu4" onclick="DoMenu('ChildMenu4')">物业配套服务</a>--%>
								<%--<ul id="ChildMenu4" class="collapsed">--%>
									<%--<li class="color1"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=64&t=83">物业公司简介</a></li>--%>
									<%--<li class="color2"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=64&t=84">客户服务热线</a></li>--%>
									<%--<li class="color1"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=64&t=85">“一卡通”服务</a></li>--%>
									<%--<li class="color2"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=64&t=86">管控中心</a></li>--%>
									<%--<li class="color1"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=64&t=87">酒店服务</a></li>--%>
									<%--<li class="color1"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=64&t=88">会所服务</a></li>--%>
									<%--<li class="color1"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=64&t=89">团膳服务</a></li>--%>
								<%--</ul>--%>
							<%--</li>--%>
							<%--<li  id="Child5" class="back1"><a href="#Menu=ChildMenu5" onclick="DoMenu('ChildMenu5')">园艺绿化服务</a>--%>
								<%--<ul id="ChildMenu5" class="collapsed">--%>
									<%--<li class="color1"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=65&t=90">园艺公司简介</a></li>--%>
									<%--<li class="color2"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=65&t=91">绿化业务</a></li>--%>
									<%--<li class="color1"><a href="http://www.caohejing.com/item/Default.aspx?f=6&s=65&t=92">园林休闲服务</a></li>--%>
								<%--</ul>--%>
							<%--</li>--%>
						<%--</ul>--%>
					</div>
				</div>
			</div>
			<!-- 
			<div id="bottom">
				<div class="bottomTitle">
					<span>您感兴趣的服务</span>
					<img src="${ctx}/images/sharechj_more.png" width="61" height="42" style=""/>
				</div>
				<div class="interesting">
					<div id="interest">

					</div>
					<div id="more">请登录后查看</div>
				</div>

			</div>
           -->
		</div>


		<jsp:include page="/common/bottom.jsp"/>


	</div>
</div>


</body>
</html>
<script type="text/javascript">
var beginindex = 1;
var endindex = 2;

$(document).ready(function () {
	findServiceList(1);
	findlifeTipsList(2);
	findpolicyList(3);
	findCooperatorList(5);
	findequity(4);
	
});

function findServiceList(type) {
	$.ajax({
		type: "POST",
		url: '${ctx}/share!findUserServiceList.action?serviceType='+type,
		dataType: 'json',
		success: function (msg) {
			//load servcieList
			if (msg.status == 200) {
				var array = [];
				array.push('<div class="content">');
				for (var i = 0; i < msg.rows.length; i++) {
					var data = msg.rows[i];
					if (i == 0) {
						array.push('<div class="tip tipLeft">');
					} else {
						array.push('<div class="tip">');
					}
					 var title=data["title"];
					if(title.length>17){
						title=title.substr(0,16)+"...";
					}
					array.push('<div class="logo"><a href="${ctx}/pages/share_serviceinfo.jsp?serviceType='+type+'&serviceId=' + data["service_id"] + '">');
					array.push('<img alt="' + data["title"] + '"  src="${imageStorePath}' + data["image"] + '" /></a></div>');
					array.push('<div class="tipTitle"><a href="${ctx}/pages/share_serviceinfo.jsp?serviceType='+type+'&serviceId=' + data["service_id"] + '"> ' + title + '</a></div>');
					array.push('<div class="breakline"></div><div class="show">');
					array.push('<img style="float: left" src="${ctx}/images/chj_15.png"/>');
					array.push('<span style="width:  168px;float: left">' + data["release_time"] + '</span>');
					array.push('<span style="float: right">' + data["see_count"] + '</span><img style="float: right" src="${ctx}/images/personal_02.png"/>');
					array.push('</div>');
					array.push('<div class="tags">');

					var tags = data["tagList"];
					for (var j = 0; j < tags.length; j++) {
						 if(j<2)
						array.push('<input type="button" class="tag button-flat-primary" onclick=""  value="' + tags[j]["tag_name"] + '" />');
					}
					array.push('</div></div>');
				}
				array.push('</div>');

				$('#services').append(array.join(''));
			} else {
				altert(msg.msg);
			}
		}
	});
}

function findlifeTipsList(type) {
	$.ajax({
		type: "POST",
		url: '${ctx}/share!findUserServiceList.action?serviceType='+type,
		dataType: 'json',
		success: function (msg) {
			//load servcieList
			if (msg.status == 200) {
				var array = [];
				array.push('<div class="content">');
				for (var i = 0; i < msg.rows.length; i++) {
					var data = msg.rows[i];
					if (i == 0) {
						array.push('<div class="tip tipLeft">');
					} else {
						array.push('<div class="tip">');
					}

					var title=data["title"];
					if(title.length>17){
						title=title.substr(0,16)+"...";
					}
					array.push('<div class="logo"><a href="${ctx}/pages/share_serviceinfo.jsp?serviceType='+type+'&serviceId=' + data["service_id"] + '">');
					array.push('<img alt="' + data["title"] + '"  src="${imageStorePath}' + data["image"] + '" /></a></div>');
					array.push('<div class="tipTitle"><a href="${ctx}/pages/share_serviceinfo.jsp?serviceType='+type+'&serviceId=' + data["service_id"] + '"> ' + title + '</a></div>');
					array.push('<div class="breakline"></div><div class="show">');
					array.push('<img style="float: left" src="${ctx}/images/chj_15.png"/>');
					array.push('<span style="width:  168px;float: left">' + data["release_time"] + '</span>');
					array.push('<span style="float: right">' + data["see_count"] + '</span><img style="float: right;" src="${ctx}/images/personal_02.png"/>');
					array.push('</div>');
					array.push('<div class="tags">');

					var tags = data["tagList"];
					for (var j = 0; j < tags.length; j++) {
						 
						array.push('<input type="button" class="tag button-flat-primary" onclick=""  value="' + tags[j]["tag_name"] + '" />');
					}
					array.push('</div></div>');

				}
				array.push('</div>');

				$('#lifetips').append(array.join(''));
			} else {
				altert(msg.msg);
			}
		}
	});
}


function findequity(type) {
	$.ajax({
		type: "POST",
		url: '${ctx}/share!findUserServiceList.action?serviceType='+type,
		dataType: 'json',
		success: function (msg) {
			//load servcieList
			if (msg.status == 200) {
				var array = [];
				array.push('<div class="content">');
				for (var i = 0; i < msg.rows.length; i++) {
					var data = msg.rows[i];

					var title=data["title"];
					if(title.length>17){
						title=title.substr(0,16)+"...";
					}

					array.push('<div class="tip">');
					array.push('<div class="logo"><a href="${ctx}/pages/share_serviceinfo.jsp?serviceType='+type+'&serviceId=' + data["service_id"] + '">');
					array.push('<img alt="' + data["title"] + '"  src="${imageStorePath}' + data["image"] + '" /></a></div>');
					array.push('<div class="tipTitle"><a href="${ctx}/pages/share_serviceinfo.jsp?serviceType='+type+'&serviceId=' + data["service_id"] + '"> ' + title + '</a></div>');
					array.push('<div class="breakline"></div><div class="show">');
					array.push('<img style="float: left" src="${ctx}/images/chj_15.png"/>');
					array.push('<span style="width:  168px;float: left">' + data["release_time"] + '</span>');
					array.push('<span style="float: right">' + data["see_count"] + '</span><img style="float: right" src="${ctx}/images/personal_02.png"/>');
					array.push('</div>');
					array.push('<div class="tags">');

					var tags = data["tagList"];
					for (var j = 0; j < tags.length; j++) {
						 
						array.push('<input type="button" class="tag button-flat-primary" onclick=""  value="' + tags[j]["tag_name"] + '" />');
					}
					array.push('</div></div>');

				}
				array.push('</div>');

				$('#equity').append(array.join(''));
			} else {
				altert(msg.msg);
			}
		}
	});
}

function findpolicyList(type) {
	$.ajax({
		type: "POST",
		url: '${ctx}/share!findUserServiceList.action?serviceType='+type,
		dataType: 'json',
		success: function (msg) {
			//load servcieList
			if (msg.status == 200) {
				var array = [];
				array.push('<div class="content" style="background-color:#FFFFFF;">');
				for (var i = 0; i < msg.rows.length; i++) {
					var data = msg.rows[i];
					var summary =data["summary"]==null?"": data["summary"].substring(0, 100);
					if (i == 0) {
						array.push('<div class="policy" style="border-bottom: 1px solid #c0c0c0">');
					} else {
						array.push('<div class="policy">');
					}

					var title=data["title"];
					if(title.length>22){
						title=title.substr(0,16)+"...";
					}
					array.push('<div style="height: 19px; padding: 20px 0 20px 0;">');
					array.push('<div style="float:left"><a href="${ctx}/pages/share_serviceinfo.jsp?serviceType='+type+'&serviceId=' + data["service_id"] + '" style="color:#000000;font-size:16px">' + title + '</a></div>');
					array.push('<span>' + data["see_count"] + '</span><img src="${ctx}/images/personal_02.png">');
					array.push('<span>' + data["release_time"] + '</span>');
					array.push('<img src="${ctx}/images/chj_15.png"></div>');
					array.push('<div style="  font-size: 16px; color: #666;height: 50px;"><a style="color:#999;font-size:12px;line-height: 16px;" href="${ctx}/pages/share_serviceinfo.jsp?serviceType='+type+'&serviceId=' + data["service_id"] + '">' + summary + '</a></div>');
					array.push('<div class="tags">');

					var tags = data["tagList"];
					for (var j = 0; j < tags.length; j++) {
						 
						array.push('<input type="button" class="tag button-flat-primary" onclick=""  value="' + tags[j]["tag_name"] + '" />');
					}

					array.push('</div></div>');

				}
				array.push('</div>');

				$('#policys').append(array.join(''));
			} else {
				altert(msg.msg);
			}
		}
	});
}

function findCooperatorList(type) {
	$.ajax({
		type: "POST",
		url: '${ctx}/share!findUserServiceList.action?serviceType='+type,
		dataType: 'json',
		success: function (msg) {
			//load servcieList
			if (msg.status == 200) {
				var array = [];
				array.push('<div class="content">');
				for (var i = 0; i < msg.rows.length; i++) {
					var data = msg.rows[i];
					if (i == 0) {
						array.push('<div class="tip tipLeft">');
					} else {
						array.push('<div class="tip">');
					}

					var title=data["title"];
					if(title.length>17){
						title=title.substr(0,16)+"...";
					}

					array.push('<div class="logo"><a href="${ctx}/pages/share_serviceinfo.jsp?serviceType='+type+'&serviceId=' + data["service_id"] + '">');
					array.push('<img alt="' +data["title"] + '"  src="${imageStorePath}' + data["image"] + '" /></a></div>');
					array.push('<div class="tipTitle"><a href="${ctx}/pages/share_serviceinfo.jsp?serviceType='+type+'&serviceId=' + data["service_id"] + '"> ' + title + '</a></div>');
					array.push('<div class="breakline"></div><div class="show">');
					array.push('<img style="float: left" src="${ctx}/images/chj_15.png"/>');
					array.push('<span style="width:  168px;float: left">' + data["release_time"] + '</span>');
					array.push('<span style="float: right">' + data["see_count"] + '</span><img style="float: right;" src="${ctx}/images/personal_02.png"/>');
					array.push('</div>');
					array.push('<div class="tags">');

					var tags = data["tagList"];
					for (var j = 0; j < tags.length; j++) {
						 
						array.push('<input type="button" class="tag button-flat-primary" onclick=""  value="' + tags[j]["tag_name"] + '" />');
					}
					array.push('</div></div>');

				}
				array.push('</div>');

				$('#corperates').append(array.join(''));
				
			} else {
				altert(msg.msg);
			}
		}
	});
}

var index = 1;
var count = 1;
var pagesize = 0;




//园区服务
var LastLeftID = "";
var lis=new Array("ChildMenu1","ChildMenu2","ChildMenu3","ChildMenu4","ChildMenu5");
function menuFix() {
	var obj = document.getElementById("nav").getElementsByTagName("li");

	for (var i=0; i<obj.length; i++) {
		obj[i].onmouseover=function() {
			this.className+=(this.className.length>0? " ": "") + "sfhover";
		};
		obj[i].onMouseDown=function() {
			this.className+=(this.className.length>0? " ": "") + "sfhover";
		};
		obj[i].onMouseUp=function() {
			this.className+=(this.className.length>0? " ": "") + "sfhover";
		};
		obj[i].onmouseout=function() {
			this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), "");
		};
	}
}

function DoMenu(emid)
{
	var obj = document.getElementById(emid);
	obj.className = (obj.className.toLowerCase() == "expanded"?"collapsed":"expanded");
	if((LastLeftID!=="")&&(emid!=LastLeftID)) //关闭上一个Menu
	{
		document.getElementById(LastLeftID).className = "collapsed";
	}
	LastLeftID = emid;

	for(j in lis){
		if((lis[j]!=LastLeftID)&&(obj.className=="expanded")){
			document.getElementById('Child'+(lis[j].substr(9,9))).style.display ="none";
		}else{
			document.getElementById('Child'+(lis[j].substr(9,9))).style.display ="block";
		}
	}
}

function GetMenuID()
{
	var MenuID="";
	var _paramStr = new String(window.location.href);
	var _sharpPos = _paramStr.indexOf("#");

	if (_sharpPos >= 0 && _sharpPos < _paramStr.length - 1)
	{
		_paramStr = _paramStr.substring(_sharpPos + 1, _paramStr.length);
	}
	else
	{
		_paramStr = "";
	}

	if (_paramStr.length > 0)
	{
		var _paramArr = _paramStr.split("&");
		if (_paramArr.length>0)
		{
			var _paramKeyVal = _paramArr[0].split("=");
			if (_paramKeyVal.length>0)
			{
				MenuID = _paramKeyVal[1];
			}
		}
	}

	if(MenuID!=="")
	{
		DoMenu(MenuID);
	}
}
GetMenuID();
//menuFix();


</script>

