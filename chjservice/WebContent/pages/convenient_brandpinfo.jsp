<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>漕河泾e服务</title>
<link rel="stylesheet" type="text/css" href="${ctx}/css/header.css"/>
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

#companyInfo {
    position: relative;
    /*height:600px;*/
    padding: 10px 25px 0 25px;
}

#companyInfoTop {
    float: left;
    width: 950px;
    /*height: 270px;*/
    padding-top: 15px;
    border-bottom: #008076 solid 3px;
    background-color: #FFF;
}

#companyInfoDetail {
    float: left;
    width:  620px;
    background-color: #FFF;
    padding-left: 20px;
}

#companyLogo {
    float: left;
    width: 290px;
    height: 170px;
    /*background-color: #F0F0F0;*/
    text-align: center;
    padding: 50px 10px 50px 10px;
}

#logoImage {
    width: 290px;
    height: 170px;
}

#companyName {
    color:#09b3a4;
    padding-bottom: 5px;
    font-size:24px;
    font-family:'黑体';
    /*原来的直通车布局
    float: left;
    width: 500px;
    font-size: 16px;
    padding-left: 60px;
    color: #008076;
    font-weight: bold;
    line-height: 20px;
    font-family: 黑 体;
    text-align: left;*/
}

#viewCount {
    float: left;
    margin-right: 10px;
    font-size: 12px;
    font-family: 黑 体;
}

#companyDate {
    float: left;
    width: 530px;
    font-size: 12px;
    padding: 0 20px 0 30px;
    line-height: 20px;
    font-family: 黑 体;
}

#view_Tag {
    float: right;
}

#companyTag {
    float: left;
    font-size: 12px;
    line-height: 20px;
    font-family: 黑 体;
    /*margin: 20px 0px 0px 15px;*/
}

#companySummary {
    float: left;
    width: 610px;
    color: #999999;
    font-size: 14px;
    padding: 0 10px 15px 0;
    line-height: 22px;
    /*border-bottom: #008076 solid 2px;*/
}

.infoItem {
    float: left;
    width: 100%;
    /*padding: 10px 0px 0px 60px;*/
/*     padding-top:5px; */
    font-size: 14px;
    color: #999999;
}

#serviceBlock {
    float: left;
    width: 310px;
    height: 210px;
}

#serviceImage {
    margin-left: 10px;
    width: 290px;
    height: 170px;
}

#serviceName {
    padding-left: 20px;
    font-size: 14px;
    font-weight: bold;
    color: #40aabb;
    font-family: 黑 体;
}

#shopInfo{
    padding: 10px 25px 0px 25px;
    /*background-color: #FFF;*/
}

#shopBlock{
    float: left;
    /*width: 310px;*/
    width: 230px;
    margin-top: 12px;
    margin-left: 10px;
    background-color: #FFF;
    /*height: 210px;*/
}
#shopImage{
    width: 290px;
    height: 170px;
}
#shopName{
    padding-left: 20px;
    font-size: 14px;
    font-weight: bold;
    color: #40aabb;
    font-family: 黑 体;
}
.shopItem{
    margin-top: 5px;
    margin-left:10px;
    font-size: 12px;
    font-family: 黑 体;
    /*color: rgb(9,190,164);*/
    color: #999;
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

.tag {
    float: left;
    padding: 5px 15px 5px 15px;
    text-align: center;
    background-color: #09b3a4;
    color: #ffffff;
    line-height: 14px;
    overflow: hidden;
    height: 14px;
    margin: 5px 5px 0 0;
}

    /* line 189, ../scss/partials/_buttons.scss */
.button-flat-primary {
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    -webkit-transition-property: background;
    -moz-transition-property: background;
    -o-transition-property: background;
    transition-property: background;
    -webkit-transition-duration: 0.3s;
    -moz-transition-duration: 0.3s;
    -o-transition-duration: 0.3s;
    transition-duration: 0.3s;
    background: #09b3a4;
    color: white;
    text-shadow: none;
    border: none;
}

    /* line 198, ../scss/partials/_buttons.scss */
.button-flat-primary:hover {
    background: #00b5e5;
}

    /* line 201, ../scss/partials/_buttons.scss */
.button-flat-primary:active {
    -webkit-transition-duration: 0s;
    -moz-transition-duration: 0s;
    -o-transition-duration: 0s;
    transition-duration: 0s;
    background: #1495b7;
    color: #00647f;
}

    /* line 206, ../scss/partials/_buttons.scss */
.button-flat-primary.disabled {
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
}
div.Jsu{
width:65px;float:left;
margin-right:5px;

   text-align:left;
      text-justify:distribute-all-lines;/*ie6-8*/
      text-align-last:justify;/* ie9*/
      -moz-text-align-last:justify;/*ff*/
      -webkit-text-align-last:justify;/*chrome 20+*/
  }
  @media screen and (-webkit-min-device-pixel-ratio:0){/* chrome*/
      div.cn:after{
          content:".";
          display: inline-block;
          width:100%;
          overflow:hidden;
          height:0;
      }
  }
  

</style>
</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp"/>

<div class="main">
    <div id="main_content" class="main_content">
 

<div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	     <div style="float:left;"><img src="${ctx}/images/menu_12.jpg" onclick="gotoPage('${ctx}/pages/convenient.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_2.jpg" style="width:190px;"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_8.jpg" onclick="gotoPage('${ctx}/pages/convenient_restaurant.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_9.jpg" onclick="gotoPage('${ctx}/pages/convenient_tuiguang.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_10.jpg" onclick="gotoPage('${ctx}/pages/convenient_cuxiao.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_11.jpg" onclick="gotoPage('${ctx}/pages/convenient_categories.jsp')"/></div>
           <div><img src="${ctx}/images/menu_14.jpg" style="width:285px;" /></div>
	    </div>
  
</div>
 


        <div id="companyInfo">
            <div>
           
                <div id="companyInfoLeft">

                </div>
                <div id="companyInfoDetail">
                    <div id="companyName">

                    </div>
                    <div id="viewCount"></div>
                    <div id="companyDate"></div>
                    <div id="companySummary"></div>
                </div>
            
            </div>
          
        </div>

        <div id="shopInfo">
           <table id="table_shop"></table>
        </div>

        <div id="more">
            加载更多
        </div>

 
 <div class="shareweb"">
<div class="jiathis_style_24x24">
	<a class="jiathis_button_qzone" ><span style="font-size:14px; font-family: 微软雅黑;">qq空间</span></a>
	<a class="jiathis_button_tsina"><span style="font-size:14px; font-family: 微软雅黑;">新浪</span></a>
	<a class="jiathis_button_tqq"><span style="font-size:14px; font-family: 微软雅黑;">腾讯微博</span></a>
	<a class="jiathis_button_renren"><span style="font-size:14px; font-family: 微软雅黑;">人人网</span></a>
<img src="${ctx}/images/close.gif" onclick="$('.shareweb').hide()"/>
</div>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
</div>

        <jsp:include page="/common/bottom.jsp"/>


    </div>
</div>


</body>
</html>
<script type="text/javascript">
    var companyId="";
    var pageIndex=0;
    var pageSize=8;
    $(document).ready(function () {

        findCooperatorDetail();

        $("#more").click(function () {
            findCooperatorShopList();
        });
    });
    function findCooperatorDetail() {
        companyId = request("companyId");

        //companyId=164;

        if (companyId == "") {
            return;
        }
        $.ajax({
            type: "POST",
            url: '${ctx}/share!findCooperatorDetailByCompanyId.action?companyId=' + companyId,
            dataType: 'json',
            data: {},
            success: function (msg, status) {
                if (msg.status == 200) {
                    var array = [];
                    var data;
                    if (companyId == "") {
                        data = msg.rows[0];
                    } else {
                        data = msg.rows;
                    }
                    array.push('<div>');
                    array.push('<div id="companyInfoTop">');
                    array.push('<div id="companyLogo">');
                    array.push('<image id="logoImage" src="${imageStorePath}' + data["logo"] + '" />');
                    array.push('</div>');

                    array.push('<div id="companyInfoDetail">');
                    if(data["isCollection"]>0){
                    	 // array.push('<div id="companyName">' + data["name"] + ' <img style="float:right;" alt="已收藏"  src="${ctx}/images/pro_button1.png" width="47" height="50" /> <img id="share_img" style="float:right;cursor:pointer"  src="${ctx}/images/pro_button2.png" width="46" height="50" /></div>');
                    	array.push('<div id="companyName">' + data["name"] + ' </div>');
                    }
                    else{
                    	 // array.push('<div id="companyName">' + data["name"] + ' <img style="float:right;cursor:pointer"  alt="收藏" onclick="user_collection('+data["companyId"]+',7,this)" src="${ctx}/images/pro_button1.png" width="47" height="50" /> <img id="share_img" style="float:right;cursor:pointer"  src="${ctx}/images/pro_button2.png" width="46" height="50" /></div>');
                   
                        array.push('<div id="companyName">' + data["name"] + ' </div>');
                    }
                 
                    array.push('<div class="infoItem"><div class="Jsu cn" >星级:</div><div style="float:left;">');
                    for (var i = 0; i< data["starScore"];i++){
                        array.push('<image src="${ctx}/images/brand_xx.png" />');
                    }
                    array.push('</div></div>');
                    array.push('<div class="infoItem"><div class="Jsu cn">公司类型:</div><div style="float:left;">' + data["companyType"] + '</div></div>');
                    array.push('<div class="infoItem"><div class="Jsu cn">企业邮箱:</div><div style="float:left;">' + data["email"] + '</div></div>');
                    array.push('<div class="infoItem"><div class="Jsu cn">联系人:</div><div style="float:left;">' + data["linkman"] + '</div></div>');
                    array.push('<div class="infoItem"><div class="Jsu cn">联系电话:</div><div style="float:left;">' + data["linkmanTel"] + '</div></div>');
                    array.push('<div class="infoItem"><div class="Jsu cn">企业地址:</div><div style="float:left;">' + data["address"] + '</div></div>');
                    array.push('<div class="infoItem"><div class="Jsu cn">主页:</div><div style="float:left;"><a style="color:#999999" target="_blank" href="' + data["companyURL"] + '">' + data["companyURL"] + '</a></div></div>');
                    //array.push('<div class="infoItem">注册时间：' + data["registDate"] + '</div>');
                    //array.push('<div class="infoItem">联系电话：' + data["linkmanTel"] + '</div>');

                    array.push('<div id="companyTag">');
                    var tagData;
                    for (var j = 0; j < data["tagList"].length; j++) {
                        tagData = data["tagList"][j];
                        array.push('<span style="margin-top:10px;" class="tag button-flat-primary">' + tagData["tagName"] + '</span>');
                    }
                    array.push('</div>');

                    array.push('<div id="companySummary" style="text-indent: 2em;margin-top:5px;">' + data["companyInfo"] + '</div>');

                    array.push('</div>')
                    array.push('</div>');

                    $('#companyInfo').html(array.join(''));
                    $('#share_img').mousemove(function(e){
            			$('.shareweb').show();
            			$('.shareweb').css({"left":(e.pageX-200)+"px","top":(e.pageY-104)+"px"});
            		});
                }
                else {
                   alert('未找到企业信息!');
                }
            }
        })

        findCooperatorShopList();
    }

    function findCooperatorShopList() {
        if(pageIndex == 0){
            pageIndex=1;
        } else {
            pageIndex++;
        }
        $.ajax({
            type: "POST",
            url: '${ctx}/product!findCooperatorShopByCompanyId.action?companyId=' + companyId + '&companyShopPageSize=' + pageSize + '&companyShopPageIndex=' + pageIndex,
            dataType: 'json',
            data: {},
            success: function (msg, status) {
                if (msg.status == 200) {
                    var array = [];
                    var data;
                    if (companyId == "") {
                        data = msg.rows[0];
                    } else {
                        data = msg.rows;
                    }
                    for (var k = 0; k < data.length; k++) {
                        var shopData = data[k];
                        if(k%4==0){
                        	array.push('<tr><td colspan="7" style="height:8px;line-height:8px;">&nbsp;</td></tr><tr style="margin-top:10px;"><td valign="top" style="width:230px;background:#fff;"><div>');
                        }
                        else{
                        	array.push('<td valign="top" width="10"></td><td valign="top" style="width:230px;background:#fff;"><div>');
                        }
                        array.push('<div class="flashNews">');
                        array.push('<image onclick="gotoDetail(' + shopData["companyShopId"] + ')"  width="230px" height="230px" src="${imageStorePath}' + shopData["logo"] + '" /></a>');
                        array.push('<div class="bg" style="padding-left: 20px;" onclick="gotoDetail(' + shopData["companyShopId"] + ')">' + shopData["name"] + '</div>');
                        array.push('</div>');

                        array.push('<div style="width: 230px;">');
                        array.push('<div class="shopItem"  style="margin-top: 10px;line-height:100%" ><image  width="19" height="19" src="${ctx}/images/restaurant_map.jpg"/><div style="width:189px;float:right;padding-top: 5px;">地址：' + (shopData["address"].length>12?(shopData["address"].substr(0,12)+'...'):shopData["address"]) + '</div></div>');
                        array.push('<div class="shopItem"  style="line-height:100%" ><image width="19" height="19" src="${ctx}/images/phone.png"/><div style="width:189px;float:right;padding-top: 5px;">电话：' + shopData["linkmanTel"] + '</div></div>');
						if(shopData["deliverOk"]=="T"||shopData["deliverOk"]=="N"){
							var areaList = shopData["areaList"];
	                        array.push('<div class="shopItem"><image width="19" height="19" style="float:left" src="${ctx}/images/spfw.png"/><div style="width:189px;float:right;line-height:150%">配送范围：');
	                        var str='';
	                        for (var l = 0; l < areaList.length; l++){
	                            if (l!=0){
	                            	str +='/'+areaList[l]["areaName"];
	                            }
	                            else{
	                            	str += areaList[l]["areaName"];
	                            }
	                            if(str.length>20){
	                            	str = str.substring(0,20)+'...';
	                            	break;
	                            }
	                        }
	                        array.push(str+'</div>');
						}
						else{
							 array.push('<div class="shopItem" style="margin-top: 10px;line-height:100%">&nbsp;</div>');
						}
                        
                        array.push('</div>');
                        array.push('</div>');
                        array.push('</div></td>');
                        if(k%4==3 || k==data.length-1){
                        	if(k%4 ==3){
       	    				  array.push('<td></td>');
       	    			   }
     	    			   if(k%4 ==2){
     	    				  array.push('<td></td>');
     	    				  array.push('<td></td>');
     	    			   }
     	    			  if(k%4 ==1){
     	    				  array.push('<td></td>');
     	    				  array.push('<td></td>');
    	    				  array.push('<td></td>');
     	    			   }
     	    			   
     	    			 array.push('<tr>');
     	    			}
                    }

                    $('#table_shop').append(array.join(''));
                    if(msg.rows.length<pageSize){
                        $("#more").html("没有更多内容了");
                    }
                }
                else {
                    alert(msg.message);
                }
            }
        })
    }

    function request(paras) {
        var url = location.href;
        var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
        var paraObj = {}
        for (i = 0; j = paraString[i]; i++) {
            paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=") + 1, j.length);
        }
        var returnValue = paraObj[paras.toLowerCase()];
        if (typeof (returnValue) == "undefined") {
            return "";
        } else {
            return returnValue;
        }
    }

    function gotoDetail(shopId){
        $('#formturn').attr('action',"${ctx}/product!findRestarauntDetail.action");
        $('#companyShopId').val(shopId);
        $('#formturn').submit();
    }
    var collectionFlag={};
    function user_collection(id,type,obj){
    	if(collectionFlag[id+""+type]){
    		alert('已收藏!');
    		return;
    	}
    	$.ajax({
    	     type: "POST",
    	     url : '${ctx}/user!collectionUserRestarant.action',
    	     dataType:'json',
    	     data:{objectId:id,type:type},
    	     success: function(msg,status){
    	    	if(msg.status == 200){	
    	    		collectionFlag[id+""+type]=true;
    	    		alert('收藏成功!');
    	    		
    	    	}
    	    	else
    	    	  alert(msg.msg);
    	     }
    	});
    }

</script>