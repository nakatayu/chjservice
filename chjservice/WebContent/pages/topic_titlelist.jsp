<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/css.css" />
<title>漕河泾e服务</title>
<style type="text/css">
/* 我的订单 */

.myorder_font{ color:#00b38a; font-size:14px;  font-weight:bold; text-align:center; padding-top:15px;}
.myorder_font1{ color:#00b38a; font-size:14px;  font-weight:bold; text-align:center; padding-top:45px;}
.myorder_font2{  font-size:14px;  font-weight:bold; text-align:center; padding-top:45px;}
.myorder_font02{ color:#00b38a; font-size:14px; font-weight:bold; }
.myorder1{
float:left;margin-left:10px;
}
.myorder1 img{
width:110px;height:115px;cursor:pointer;
}

.personal_fr1{
float:left;margin-left:10px;
}

.conv1{
float:left;margin-left:10px;
}
.conv1 img{
width:110px;height:110px;cursor:pointer;
}

.comm2{
float:left;margin-left:10px;
}

ul.ul-button li{
width:40px;
list-style: none;
color:#fff;
background:#00b38b;
text-align: center;
}
ul.ul-button li:hover{
cursor:pointer;
background:#00b36b;
}
</style>
</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />

<div class="main">
<div id="main_content" class="main_content">
   
<div
				style="position: relative; height: 100px; padding: 10px 25px 0 25px;">
				<div>
					<div style="float: left;">
						<img src="${ctx}/images/menu_68.jpg"
							onclick="gotoPage('${ctx}/community!communityHome.action')" />
					</div>
					<div class="menu1">
						<img src="${ctx}/images/menu_69.jpg" style="width: 190px;" />
					</div>
					<div class="menu1">
						<img src="${ctx}/images/menu_65.jpg"
							onclick="gotoPage('${ctx}/pages/community_activitylist.jsp')" />
					</div>
					<div class="menu1">
						<img src="${ctx}/images/menu_63.jpg"
							onclick="gotoPage('${ctx}/community!findLableListCircle.action')" />
					</div>
					<div>
						<img src="${ctx}/images/menu_66.png" style="width: 473px;height: 100px;" />
					</div>
				</div>

			</div>

 
<div style="position:relative;height:1350px; padding:10px 25px 0 25px;">
   <div>
    <div style="float:left; width:590px; height:1350px; ">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; padding:10px;border-bottom:#d6d6d1 3px solid;">
      <tr>
        <td width="3%" align="center"><img src="${ctx}/dynamic/topic_left.png" width="13" height="33" /></td>
        <td width="31%" style="padding-left:4px;"><img src="${ctx}/dynamic/topic_butt1.png" width="176" height="176" /></td>
        <td width="31%" style="padding-left:4px;"><img src="${ctx}/dynamic/topic_butt1.png" width="176" height="176" /></td>
        <td width="32%" style="padding-left:4px;"><img src="${ctx}/dynamic/topic_butt1.png" width="176" height="176" /></td>
        <td width="3%" align="center"><img src="${ctx}/dynamic/topic_right.png" width="13" height="33" /></td>
      </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF;border-bottom:#ffbf00 1px solid;">
      <tr>
        <td style="padding:15px 0 0 20px; font-size:20px; font-weight:bold;">大家对义务劳动怎么看？</td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="14%" rowspan="2" style="padding:10px 0 0 20px;"><img src="${ctx}/dynamic/topic_6.jpg" width="48" height="48" /></td>
            <td height="30" colspan="10" valign="bottom" style="color:#ffbf00; font-size:16px; font-weight:bold;"> 发布者：leona_life  <span style="color:#999; font-size:12px;">2013年03月06日18:17</span></td>
            </tr>
          <tr>
            <td width="5%"  style="color:#999; font-size:12px;"><img src="${ctx}/dynamic/circle_but1.png" width="28" height="28" /></td>
            <td width="11%" style="color:#666; font-size:14px;">39042次</td>
            <td width="5%"  style="color:#999; font-size:12px;"><img src="${ctx}/dynamic/circle_but2.png" width="28" height="28" /></td>
            <td width="5%"><img src="${ctx}/dynamic/circle_but3.png" width="28" height="28" /></td>
            <td width="8%" style="color:#999; font-size:12px;"><img src="${ctx}/dynamic/circle_but4.png" width="28" height="28" /></td>
            <td width="10%" style="color:#666; font-size:14px;">编辑</td>
            <td width="10%" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
            <td width="5%"></td>
            <td width="10%" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
            <td width="11%">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="409" style="color:#999; font-size:14px; line-height:22px; text-indent:2em; padding:10px 10px 0 20px;"><p>腾讯&quot;龙腾树起，益植有你&quot;公益活动崇明东平国家森林公园在3月11日（周日）启动，通过环保活动，提倡上海市民树立和巩固绿色环保意识，进一步优化、美化我们的城市环境，进一步督促自己的环保行为，并且通过腾讯游戏用户带动大众，争创低碳出行，绿色之旅。</p>
          <p>&nbsp;</p>
          <p>腾讯&quot;龙腾树起，益植有你&quot;公益活动火爆开启<br />
            活动地点介绍：东平国家森林公园&mdash;&mdash;&mdash;天人合一的诱惑<br />
            东平国家森林公园位于我国第三大岛崇明岛的中北部，距县城（南门港）12公里，总面积为5400亩，是目前华东地区已成形的最大的平原人造森林，上海著名旅游胜地，国家4A级旅游景区，全国农业旅游示范点，上海市&quot;十佳休闲旅游新景点&quot;，&quot;上海市文明单位&quot;称号，青少年科普教育基地等。其前身是东平林场，1993年建成国家森林公园。</p>
          <p>&nbsp;</p>
          <p>园内森林繁茂、湖水澄碧、百鸟鸣唱、野趣浓郁，以&quot;幽、静、秀、野&quot;为特色，集森林观光、会议旅游、康复疗养、休闲度假、参与性娱乐等多功能为一体，是人们&quot;回归大自然&quot;的最佳胜地。特色项目有草上飞&mdash;&mdash;森林滑草、岩上芭蕾&mdash;&mdash;攀岩、网球场、沙滩排球场、森林滑索、彩弹射击、天旋地转、森林骑马、快乐林卡丁车、野外烧烤、森林童话园以及增强团队协作精神的森林定向活动等。周边有多家森林度假村为您提供幽雅的环境、优质的服务，使您享受到家的感受。</p></td>
      </tr>
     
     </table>
     <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#fff; font-size:20px; padding:20px 0 0 30px;">
  <tr>
    <td>评论<span style="font-size:16px;">(共56条)</span></td>
  </tr>
</table>

     <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#fff; border-bottom:1px solid #CCC; padding:0 0 10px 10px;">
          <tr>
            <td width="14%" rowspan="2" style="padding:10px 0 0 20px;"><img src="${ctx}/dynamic/topic_6.jpg" width="48" height="48" /></td>
            <td width="29%" height="42" style="color:#ffbf00; font-size:14px;">发布者：leona_life</td>
            <td width="57%" style="color:#00c0c8; font-size:12px;"><span style="color:#999; font-size:12px;">2013年03月06日18:17</span></td>
          </tr>
          <tr>
            <td height="34" colspan="2"  style="color:#999; font-size:12px;">设计师公共基础- 从&quot;0基础&quot;到设计高手的快速蜕变 <span style=" float:right; color:#ffbf00; padding-right:50px;">回复</span></td>
            </tr>
        </table>
         <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#fff; border-bottom:1px solid #CCC; padding:0 0 10px 10px;">
          <tr>
            <td width="14%" rowspan="2" style="padding:10px 0 0 20px;"><img src="${ctx}/dynamic/topic_6.jpg" width="48" height="48" /></td>
            <td width="29%" height="42" style="color:#ffbf00; font-size:14px;">发布者：leona_life</td>
            <td width="57%" style="color:#00c0c8; font-size:12px;"><span style="color:#999; font-size:12px;">2013年03月06日18:17</span></td>
          </tr>
          <tr>
            <td height="34" colspan="2"  style="color:#999; font-size:12px;">设计师公共基础- 从&quot;0基础&quot;到设计高手的快速蜕变 <span style=" float:right; color:#ffbf00; padding-right:50px;">回复</span></td>
            </tr>
        </table>
         <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#fff; border-bottom:1px solid #CCC; padding:0 0 10px 10px;">
          <tr>
            <td width="14%" rowspan="2" style="padding:10px 0 0 20px;"><img src="${ctx}/dynamic/topic_6.jpg" width="48" height="48" /></td>
            <td width="29%" height="42" style="color:#ffbf00; font-size:14px;">发布者：leona_life</td>
            <td width="57%" style="color:#00c0c8; font-size:12px;"><span style="color:#999; font-size:12px;">2013年03月06日18:17</span></td>
          </tr>
          <tr>
            <td height="34" colspan="2"  style="color:#999; font-size:12px;">设计师公共基础- 从&quot;0基础&quot;到设计高手的快速蜕变 <span style=" float:right; color:#ffbf00; padding-right:50px;">回复</span></td>
            </tr>
        </table>
       <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#f9f9f7;">
  <tr>
    <td height="50" valign="middle" style="padding:10px 0 0 20px; font-size:20px; color:#666;">说点什么吧</td>
  </tr>
   <tr align="center">
    <td height="67" valign="top" style="background-color:#f9f9f7;"><form id="form1" name="form1" method="post" action="">
      <textarea name="textarea" id="textarea" cols="66" rows="3"></textarea>
    </form></td>
  </tr>
  <tr>
    <td style="float:right; padding:20px;cursor: pointer; "><img src="${ctx}/dynamic/topic_title_4.jpg" width="129" height="32"  /></td>
  </tr>
</table>
 
    </div>
   </div>
    <div style="float:right; width:350px; height:1250px;">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="height:50px; background-color:#f0b543;">
        <tr>
          <td width="59%" align="right" style="font-size:20px; color:#FFF; font-family:'黑体'">发表话题</td>
          <td width="41%">　<img src="${ctx}/dynamic/activ_3.png" width="23" height="20" /></td>
        </tr>
      </table>
      
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="height:50px; background-color:#ffbf00; ">
        <tr>
          <td width="71%" style="font-size:20px; color:#FFF; padding-left:12px; font-family:'黑体'">最新发现</td>
          <td width="29%">　<img src="${ctx}/dynamic/actity_more1.png" width="76" height="21" /></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; margin-top:2px;">
        <tr>
          <td width="12%" rowspan="4" align="center" valign="top" style="padding:10px 5px 0 2px;"><img src="${ctx}/dynamic/topic_but1.png" width="63" height="63" /></td>
          <td width="85" height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" style="font-size:16px; font-weight:bold; padding-top:5px; font-family:'黑体'">喜欢这部电影的人也喜欢</td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td height="25" style="font-size:14px;color:#666;  font-family:'黑体'">穆里根不像富家女。把晚宴拍的有点像</td>
        </tr>
        <tr>
          <td height="25"><span style="font-size:14px;color:#666;  font-family:'黑体'">发起人：小猫爱吃鱼</span>　<span style="font-size:14px;color:#666;  font-family:'黑体'">2013.11.30 15:50</span></td>
        </tr>
        <tr>
          <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0 0 5px 0 ;">
            <tr>
              <td width="33" style="font-size:14px;color:#666;  font-family:'黑体'">评论</td>
              <td width="30" align="center" background="${ctx}/images/button122.png" style="width:30px; height:25px; color:#FFF;" >99</td>
              <td width="16">&nbsp;</td>
              <td width="77" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
              <td width="14"></td>
              <td width="77" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
              <td width="33"></td>
            </tr>
          </table></td>
        </tr>
      </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; margin-top:2px;">
        <tr>
          <td width="12%" rowspan="4" align="center" valign="top" style="padding:10px 5px 0 2px;"><img src="${ctx}/dynamic/topic_but1.png" width="63" height="63" /></td>
          <td width="85" height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" style="font-size:16px; font-weight:bold; padding-top:5px; font-family:'黑体'">喜欢这部电影的人也喜欢</td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td height="25" style="font-size:14px;color:#666;  font-family:'黑体'">穆里根不像富家女。把晚宴拍的有点像</td>
        </tr>
        <tr>
          <td height="25"><span style="font-size:14px;color:#666;  font-family:'黑体'">发起人：小猫爱吃鱼</span>　<span style="font-size:14px;color:#666;  font-family:'黑体'">2013.11.30 15:50</span></td>
        </tr>
        <tr>
          <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0 0 5px 0 ;">
            <tr>
              <td width="33" style="font-size:14px;color:#666;  font-family:'黑体'">评论</td>
              <td width="30" align="center" background="${ctx}/images/button122.png" style="width:30px; height:25px; color:#FFF;" >99</td>
              <td width="16">&nbsp;</td>
              <td width="77" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
              <td width="14"></td>
              <td width="77" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
              <td width="33"></td>
            </tr>
          </table></td>
        </tr>
      </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; margin-top:2px;">
        <tr>
          <td width="12%" rowspan="4" align="center" valign="top" style="padding:10px 5px 0 2px;"><img src="${ctx}/dynamic/topic_but1.png" width="63" height="63" /></td>
          <td width="85" height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" style="font-size:16px; font-weight:bold; padding-top:5px; font-family:'黑体'">喜欢这部电影的人也喜欢</td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td height="25" style="font-size:14px;color:#666;  font-family:'黑体'">穆里根不像富家女。把晚宴拍的有点像</td>
        </tr>
        <tr>
          <td height="25"><span style="font-size:14px;color:#666;  font-family:'黑体'">发起人：小猫爱吃鱼</span>　<span style="font-size:14px;color:#666;  font-family:'黑体'">2013.11.30 15:50</span></td>
        </tr>
        <tr>
          <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0 0 5px 0 ;">
            <tr>
              <td width="33" style="font-size:14px;color:#666;  font-family:'黑体'">评论</td>
              <td width="30" align="center" background="${ctx}/images/button122.png" style="width:30px; height:25px; color:#FFF;" >99</td>
              <td width="16">&nbsp;</td>
              <td width="77" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
              <td width="14"></td>
              <td width="77" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
              <td width="33"></td>
            </tr>
          </table></td>
        </tr>
      </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; margin-top:2px;">
        <tr>
          <td width="12%" rowspan="4" align="center" valign="top" style="padding:10px 5px 0 2px;"><img src="${ctx}/dynamic/topic_but1.png" width="63" height="63" /></td>
          <td width="85" height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" style="font-size:16px; font-weight:bold; padding-top:5px; font-family:'黑体'">喜欢这部电影的人也喜欢</td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td height="25" style="font-size:14px;color:#666;  font-family:'黑体'">穆里根不像富家女。把晚宴拍的有点像</td>
        </tr>
        <tr>
          <td height="25"><span style="font-size:14px;color:#666;  font-family:'黑体'">发起人：小猫爱吃鱼</span>　<span style="font-size:14px;color:#666;  font-family:'黑体'">2013.11.30 15:50</span></td>
        </tr>
        <tr>
          <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0 0 5px 0 ;">
            <tr>
              <td width="33" style="font-size:14px;color:#666;  font-family:'黑体'">评论</td>
              <td width="30" align="center" background="${ctx}/images/button122.png" style="width:30px; height:25px; color:#FFF;" >99</td>
              <td width="16">&nbsp;</td>
              <td width="77" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
              <td width="14"></td>
              <td width="77" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
              <td width="33"></td>
            </tr>
          </table></td>
        </tr>
      </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#FFF; margin-top:2px;">
        <tr>
          <td width="12%" rowspan="4" align="center" valign="top" style="padding:10px 5px 0 2px;"><img src="${ctx}/dynamic/topic_but1.png" width="63" height="63" /></td>
          <td width="85" height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" style="font-size:16px; font-weight:bold; padding-top:5px; font-family:'黑体'">喜欢这部电影的人也喜欢</td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td height="25" style="font-size:14px;color:#666;  font-family:'黑体'">穆里根不像富家女。把晚宴拍的有点像</td>
        </tr>
        <tr>
          <td height="25"><span style="font-size:14px;color:#666;  font-family:'黑体'">发起人：小猫爱吃鱼</span>　<span style="font-size:14px;color:#666;  font-family:'黑体'">2013.11.30 15:50</span></td>
        </tr>
        <tr>
          <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0 0 5px 0 ;">
            <tr>
              <td width="33" style="font-size:14px;color:#666;  font-family:'黑体'">评论</td>
              <td width="30" align="center" background="${ctx}/images/button122.png" style="width:30px; height:25px; color:#FFF;" >99</td>
              <td width="16">&nbsp;</td>
              <td width="77" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
              <td width="14"></td>
              <td width="77" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
              <td width="33"></td>
            </tr>
          </table></td>
        </tr>
      </table>
      
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="height:50px; background-color:#ffbf00; padding:0 0 1px 0; ">
        <tr>
          <td width="71%" style="font-size:24px; color:#FFF; padding-left:20px; font-family:'黑体'">热门圈子</td>
          <td width="29%">　<img src="dynamic/circle_more1.png" width="80" height="22" /></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0"  style=" background-color:#FFF;">
         <tr>
           <td width="40%" height="240" valign="top"><table width="90%" border="0" cellspacing="0" cellpadding="0">
             <tr>
               <td height="143" align="center" style="padding-top:10px;"><img src="${ctx}/dynamic/topic_butt2.png" width="120" height="150" /></td>
             </tr>
             <tr>
               <td height="49" align="center">现有人数：<span style="font-size:18px; font-weight:bold; color:#333;">38人</span></td>
             </tr>
             </table></td>
           <td width="52%" valign="top"><table width="97%" border="0" cellspacing="0" cellpadding="0">
             <tr>
               <td height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                 <tr>
                   <td width="47%"><strong>每天一歌</strong></td>
                   <td width="53%">等级 1级</td>
                 </tr>
               </table></td>
             </tr>
             <tr>
               <td height="68" style="font-size:14px; color:#333;">森林定向活动等。周边有多家森林度假村为您提供幽雅的环境、优质的服务，使您享受到家的感受。</td>
             </tr>
             <tr>
          <td height="25" style="padding-top:20px;"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0 0 5px 0 ;">
            <tr>
              <td width="29" style="font-size:14px;color:#666;  font-family:'黑体'">评论</td>
              <td width="30" align="center" background="${ctx}/images/button122.png" style="width:30px; height:25px; color:#FFF;" >99</td>
              <td width="16">&nbsp;</td>
              <td width="33" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
              <td width="20"></td>
              <td width="35" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
              <td width="27"></td>
            </tr>
          </table></td>
        </tr>
            </table></td>
         </tr>
         </table>
         <table width="100%" border="0" cellspacing="0" cellpadding="0"  style=" margin-top:1px;background-color:#FFF;">
         <tr>
           <td width="40%" height="240" valign="top"><table width="90%" border="0" cellspacing="0" cellpadding="0">
             <tr>
               <td height="143" align="center" style="padding-top:10px;"><img src="${ctx}/dynamic/topic_butt2.png" width="120" height="150" /></td>
             </tr>
             <tr>
               <td height="49" align="center">现有人数：<span style="font-size:18px; font-weight:bold; color:#333;">38人</span></td>
             </tr>
             </table></td>
           <td width="52%" valign="top"><table width="97%" border="0" cellspacing="0" cellpadding="0">
             <tr>
               <td height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                 <tr>
                   <td width="47%"><strong>每天一歌</strong></td>
                   <td width="53%">等级 1级</td>
                 </tr>
               </table></td>
             </tr>
             <tr>
               <td height="68" style="font-size:14px; color:#333;">森林定向活动等。周边有多家森林度假村为您提供幽雅的环境、优质的服务，使您享受到家的感受。</td>
             </tr>
             <tr>
          <td height="25" style="padding-top:20px;"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0 0 5px 0 ;">
            <tr>
              <td width="29" style="font-size:14px;color:#666;  font-family:'黑体'">评论</td>
              <td width="30" align="center" background="${ctx}/images/button122.png" style="width:30px; height:25px; color:#FFF;" >99</td>
              <td width="16">&nbsp;</td>
              <td width="33" align="center" bgcolor="#dcdcdc" style="color:#FFF; height:15px; font-size:12px;padding:2px;">电影</td>
              <td width="20"></td>
              <td width="35" align="center" bgcolor="#dcdcdc" style="color:#FFF; padding:2px;font-size:12px; height:15px;">娱乐</td>
              <td width="27"></td>
            </tr>
          </table></td>
        </tr>
            </table></td>
         </tr>
         </table>
    </div>
    
 </div>
 
 
  <jsp:include page="/common/bottom.jsp" />
  
</div>
</div>


</body>
</html>
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>

