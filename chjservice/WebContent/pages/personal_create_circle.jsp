<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/input.css" />
<link rel="stylesheet" href="${ctx}/xheditor/common.css" type="text/css" media="screen" />
<style type="text/css">


.personal_fr1{
float:left;margin-left:10px;
}
.personal_dataf{ font-size:14px; color:#999;}
.input-color{color:#ccc;}
.input-color-focus{color:#000;}

.tag-title li {
text-align:center;
padding-left:4px;
padding-right:4px;
float:left;
height:30px;
line-height:30px;
list-style: none;
border:1px solid #ccc;
width: 60px;/*具体数值自行修改，下一行相同*/
background: #2ecedd;
margin-left:10px;margin-top:10px;
color:#fff;
}
.circle-level li{
text-align:left;
padding-left:10px;
padding-right:10px;
float:left;
height:30px;
line-height:30px;
list-style: none;
border:1px solid #ccc;
max-width: 200px;/*具体数值自行修改，下一行相同*/
word-break:keep-all;
color:#fff;
background: #71cec8;
margin-left:100px;margin-top:10px;
color:#fff;
cursor:pointer;
}
.ul-tag li {
text-align:left;
padding-left:10px;
padding-right:10px;
float:left;
height:30px;
line-height:30px;
list-style: none;
border:1px solid #ccc;
max-width: 200px;/*具体数值自行修改，下一行相同*/
word-break:keep-all;
margin-left:10px;margin-top:10px;
color:#fff;
cursor:pointer;
}
.ul-tag li:hover {background:#00b36b;}


.ul_tag_select li{
	color:#fff;
	padding-left:4px;
	padding-right:4px;
	font-size:12px;
	font-weight:bold;
	text-align:center;
	float:left;
	height:30px;
	line-height:30px;
	max-width: 200px;/*具体数值自行修改，下一行相同*/
	word-break:keep-all;
	background:#00b36b;
	margin-left:10px;
	margin-top:10px;
	list-style:none;
	cursor:pointer;
}

ul.ul-button{marigin:0;}
ul.ul-button li{
width:120px;
height:30px;
list-style: none;
float:left;margin-top:20px;margin-left:10px;
color:#fff;
float:left;
background:#65d8bd;
font-weight:bold;
border-left: #ccc solid 1px;
}
ul.ul-button li:hover{
cursor:pointer;
background:#00b36b;
}
ul.ul-button li div{
text-align: center;
padding-top:5px;
}

ul.ul-image li{
 width:80px;
 height:90px;
 float:left;
 list-style: none;
 margin:10px;
}
</style>



</head>
<body onscroll="b()">

<jsp:include page="/common/header.jsp" />
<script type="text/javascript" src="${ctx }/js/ajaxupload.js"></script>
<script type="text/javascript" src="${ctx}/xheditor/xheditor-1.1.14-zh-cn.js"></script>
<script language="javascript" src="${ctx}/js/JQueryHexBackgroundColor.js"></script>

<div class="main">
<div id="main_content" class="main_content">

<div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	     <div style="float:left;"><img src="${ctx}/images/menu_68.jpg" onclick="gotoPage('${ctx}/community!communityHome.action')" /></div>
           <div class="menu1"><img src="${ctx}/images/menu_62.jpg" onclick="gotoPage('${ctx}/pages/community_topiclist.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_65.jpg" onclick="gotoPage('${ctx}/pages/community_activitylist.jsp')"/></div>           
           <div class="menu1"><img src="${ctx}/images/menu_59.jpg" onclick="gotoPage('${ctx}/pages/community_circlelist.jsp')" style="width:190px;"/></div>
           <div><img src="${ctx}/images/menu_66.png" style="width:473px;height: 100px;" /></div>
	    </div>
  
</div>

<div style="position:relative;height:675px; padding:0 25px 0 25px;">
  <div>
  <form id="formSubmit" method="post" action="">
	<input type="hidden" value="${circle.circleId}" name="circleId" id="hiddenCircleId" />
	<input type="hidden" name="imgChanged" id="hiddenImgChanged" value="0" />
	<input type="hidden" name="circleCardImage" id="hiddenCircleCardImage" value="[]" />
	
	<input type="hidden" name="isCheck" id="hiddenIsCheck" />
	<input type="hidden" name="circleImage" id="hiddenCircleImage" />
	<input type="hidden" name="tagList" id="hiddenTagList" />
	<input type="hidden" name="level" value="1" id="hiddenLevel" />
	<input type="hidden" name="cardImage" id="hiddenCardImage"/>
	
    <div style="float:left; width:572px; height:675px; background-color:#fffef9; border-bottom:#00b38a 3px solid;">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
          <td  width="80" style="font-size:16px; padding:40px 0 0 20px;font-weight:bold;">圈子名称</td>
          <td style="padding:40px 0 0 0;">
           <c:if test="${circle==null}">
            <input name="title" class="input-color" style="width:392px;height:20px;line-height:20px;padding:4px 0 0 4px;" type="text" id="txtTitle" value="标题40字以内" size="45" maxlength="40" />
            <span id="spanTitle" style="color:#ccc;">0/40</span>
            </c:if>
             <c:if test="${circle!=null}">
            <input name="title" class="input-color" style="width:392px;height:20px;line-height:20px;padding:4px 0 0 4px;" type="text" id="txtTitle"
            value="${circle.name}"  size="45" maxlength="40" />
            <span id="spanTitle" style="color:#ccc;">${fn:length(circle.name)}/40</span>
            </c:if>
            
          </td>
        </tr>
        <tr>
          <td   style="font-size:16px; padding:10px 0 0 20px;font-weight:bold;">圈子摘要</td>
          <td style="padding:10px 0 0 0;">
           <c:if test="${circle==null}">
            <textarea name="summary" style="height:50px;width:392px;maxwidth:392px;maxheight:50px;" id="txtSummary" class="address">摘要40字以内</textarea>
            <span id="spanSummary" style="color:#ccc;">0/40</span>
            </c:if>
             <c:if test="${circle!=null}">
              <textarea name="summary" style="height:50px;width:392px;maxwidth:392px;maxheight:50px;" id="txtSummary" class="address">${circle.summary}</textarea>
            <span id="spanSummary" style="color:#ccc;">${fn:length(topic.summary)}/40</span>
             </c:if>
          </td>
        </tr>
        <tr>
          <td  width="80" valign="top" style="font-size:16px; padding-top:10px; padding-left:20px;font-weight:bold;">圈子介绍</td>
        
          <td  height="96" style="width:400px;padding-top:10px; ">
          <textarea name="content" id="txtContent" style="width:400px;height:300px;"><c:if test="${circle!=null}">${circle.circleContent}</c:if>
          </textarea>
        
          </td>
      
          </td>
        </tr>
        <tr>
          <td height="62" colspan="2" style="font-size:16px;  padding:0 0 0 20px;font-weight:bold;">对圈子成员是否进行审核</td>
        </tr>
        <tr>
          <td colspan="2" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
            <c:if test="${circle!=null}">
              <td width="26%" align="right">
               <c:if test="${circle.isCheck=='T'}">
              		<img id="check_ok" onclick="check_ok_fun(1)" src="${ctx}/images/is_check_ok.png" />
               </c:if>
                <c:if test="${circle.isCheck !='T'}">
                <img id="check_ok" onclick="check_ok_fun(1)" src="${ctx}/images/is_check.png" />
               </c:if>
              </td>
              <td width="9%" align="center">是</td>
              <td width="9%" align="center">
              	<c:if test="${circle.isCheck=='T'}">
              	 <img id="check_not" onclick="check_ok_fun(0)" src="${ctx}/images/is_check.png" />
               </c:if>
                <c:if test="${circle.isCheck !='T'}">
                <img id="check_not" onclick="check_ok_fun(0)" src="${ctx}/images/is_check_ok.png" />
               </c:if>
              <td width="56%"> 否</td>
              </c:if>
              
              <c:if test="${circle==null}">
              <td width="26%" align="right">
              <img id="check_ok" onclick="check_ok_fun(1)" src="${ctx}/images/is_check.png" />
              </td>
              <td width="9%" align="center">是</td>
              <td width="9%" align="center">
              <img id="check_not" onclick="check_ok_fun(0)" src="${ctx}/images/is_check_ok.png" /></td>
              <td width="56%"> 否</td>
              </c:if>
            </tr>
          </table></td>
        </tr>
      </table>
    </div>
       
  </form>  
    
    <div class="personal_fr1" style="width:366px; height:675px; background-color:#fffef9; border-bottom:#00b38a 3px solid;">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="48" style="font-size:16px;  padding:20px 0 0 20px;font-weight:bold;">上传圈子图片</td>
        </tr>
        <tr>
          <td height="37" align="center">
         	<div  id="upload">
         	 <img  src="${ctx}/images/create_1.jpg" style="cursor:pointer;" width="194" height="30" />
          	</div>
           	大小(230*230,300K内)
          </td>
        </tr>
        <tr>
          <td height="34" style="font-size:16px;  padding:0 0 0 20px;font-weight:bold;">
          <img  src="${ctx}/images/create_7.png" width="25" height="23" /> 图片</td>
        </tr>
        <tr>
          <td height="96" align="center">
           <div id="div_image" style="text-align:center;width:100px;height:100px;padding:10px;border:1px solid #00b36b;">
          		<c:if test="${circle!=null}">
          			<div style="position:absolute;margin-left:70px;margin-top:4px;">
            	      <img src="${ctx}/images/lable_del.png" style="cursor:pointer;" onclick="removeCircleImage()"/>
            	    </div>
            	 <span>
            	     <img id="circleImage" style="border:1px solid #ccc;" src="${imageStorePath}${circle.circleImage}" width="94" height="95" />
            	 </span>
            	 </c:if>
           </div>
             
          </td>
        </tr>
        
        <tr>
          <td height="48" style="font-size:16px;  padding:20px 0 0 20px;font-weight:bold;">上传证件照</td>
        </tr>
        <tr>
          <td height="37" align="center">
         	<div  id="uploadCard">
         	 <img  src="${ctx}/images/create_1.jpg" style="cursor:pointer;" width="194" height="30" />
          	</div>
           <span style="font-size:14px;color:#9a9a9a;">大小(230*230,300K内)</span>
          </td>
        </tr>
        <tr>
          <td height="34" style="font-size:16px;  padding:0 0 0 20px;font-weight:bold;">
          <img  src="${ctx}/images/create_7.png" width="25" height="23" /> 图片</td>
        </tr>
        <tr>
          <td  align="center" style="padding-left:20px;">
           <div style="border:1px solid #00b36b;height:230px;width:300px;">
           	<ul class="ul-image" id="ul-image">
          		<c:forEach var="item" items="${cardImage}" varStatus="index1">
          		<li id="ul-image-${index1.index}">
            	          		<div style="position:absolute;margin-left:60px;margin-top:2px;">
                        	    <img src="${ctx}/images/lable_del.png" style="cursor:pointer;" onclick="removeTopicImage(${index1.index})"/>
                        	</div>
                        	<span>
                        	   <img id="topicImage${index1.index}" style="border:1px solid #ccc;" src="${imageStorePath}${item}" width="80" height="80" />
                        	  <c:if test="${index1.index<5 && index1.index==fn:length(cardImage)-1}">
                        	  	<span  style="font-size:12px;color:#9a9a9c;">还可以添加${6-fn:length(cardImage)}</span>
                        	   </c:if>
                        	</span>
                      		</li>
          		</c:forEach>  
          		
            </ul>
         </div> 
          </td>
        </tr>
        
        </table>
    </div>
    
   </div>
 </div>
 
<div style="position:relative; height:300px;padding:10px 25px 0 25px;">
<div style="float:left; width:948px;height:300px; background-color:#fffef9;padding-bottom:20px;border-bottom:#00b38a 3px solid; ">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="45"><span style="font-size:16px;  padding:0 0 0 20px;font-weight:bold;">圈子等级</span></td>
    </tr>
    <tr>
    <td>
      <ul class="circle-level">
      <li value="0">
        <div align="center">
			 <div style="float:left;margin:0px;">一级</div>
			 
			   <c:if test="${circle==null}">
			    <div style="float:left;margin-right:-4px;margin-top:-2px;">
			 	<img style="width:30px;height:30px;"  src="${ctx}/images/tag_select.png"/>
			 	</div>
			   </c:if>
			   
			   <c:if test="${circle!=null}">
			    <c:if test="${circle.level!=1}">
			 <div style="display:none;float:left;margin-right:-4px;margin-top:-2px;">
			 	<img style="width:30px;height:30px;"  src="${ctx}/images/tag_select.png"/>
			 </div>
			 </c:if>
			  <c:if test="${circle.level==1}">
			   <div style="float:left;margin-right:-4px;margin-top:-2px;">
			 	<img style="width:30px;height:30px;"  src="${ctx}/images/tag_select.png"/>
			 </div>
			  </c:if>
			   </c:if>
		</div>
	  </li>
      <li value="1">
        <div align="center">
			 <div style="float:left;margin:0px;">二级</div>
			 <c:if test="${circle.level!=2}">
			 <div style="display:none;float:left;margin-right:-4px;margin-top:-2px;">
			 	<img style="width:30px;height:30px;"  src="${ctx}/images/tag_select.png"/>
			 </div>
			 </c:if>
			  <c:if test="${circle.level==2}">
			  <div style="float:left;margin-right:-4px;margin-top:-2px;">
			 	<img style="width:30px;height:30px;"  src="${ctx}/images/tag_select.png"/>
			 </div>
			  </c:if>
		</div>
	  </li>
      <li value="2">
      <div align="center">
			 <div style="float:left;margin:0px;">三级</div>
			  <c:if test="${circle.level!=3}">
			 <div style="display:none;float:left;margin-right:-4px;margin-top:-2px;">
			 	<img style="width:30px;height:30px;"  src="${ctx}/images/tag_select.png"/>
			 </div>
			 </c:if>
			  <c:if test="${circle.level==3}">
			   <div style="float:left;margin-right:-4px;margin-top:-2px;">
			 	<img style="width:30px;height:30px;"  src="${ctx}/images/tag_select.png"/>
			 </div>
			  </c:if>
		</div>
	  </li>
      <li value="3">
      <div align="center">
			 <div style="float:left;margin:0px;">四级</div>
			<c:if test="${circle.level!=4}">
			 <div style="display:none;float:left;margin-right:-4px;margin-top:-2px;">
			 	<img style="width:30px;height:30px;"  src="${ctx}/images/tag_select.png"/>
			 </div>
			 </c:if>
			  <c:if test="${circle.level==4}">
			   <div style="float:left;margin-right:-4px;margin-top:-2px;">
			 	<img style="width:30px;height:30px;"  src="${ctx}/images/tag_select.png"/>
			 </div>
			  </c:if>
		</div>
	  </li>
      <li value="4">
      <div align="center">
			 <div style="float:left;margin:0px;">五级</div>
			 <c:if test="${circle.level!=5}">
			 <div style="display:none;float:left;margin-right:-4px;margin-top:-2px;">
			 	<img style="width:30px;height:30px;"  src="${ctx}/images/tag_select.png"/>
			 </div>
			 </c:if>
			  <c:if test="${circle.level==5}">
			   <div style="float:left;margin-right:-4px;margin-top:-2px;">
			 	<img style="width:30px;height:30px;"  src="${ctx}/images/tag_select.png"/>
			 </div>
			  </c:if>
		</div>
	 </li>
      </ul>
    </td>
    </tr>
    <tr>
      <td height="45"><span style="font-size:16px;  padding:0 0 0 20px;font-weight:bold;">圈子说明</span></td>
    </tr>
    <tr>
    <td>
     <div id="div_levelinfo"  style="height:140px;margin-left:100px;margin-right:20px;border:1px solid #ccc;">
     
     </div>
    </td>
    </tr>
    </table>
  </div>
</div>
 
<div style="clear:both;position:relative;padding:10px 25px 0 25px;">
<div style="float:center; width:948px; background-color:#fffef9;padding-bottom:20px;">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="45">
      <span style="font-size:16px;  padding:0 0 0 20px;font-weight:bold;">选择标签</span></td>
    </tr>
    <tr>
      <td valign="top" align="center">
      
      <table width="90%" border="0" cellpadding="0" cellspacing="0">
      <tr>
      <td valign="top"  style="text-align:left;color:#9a9a9c;border-bottom:1px solid #ccc;padding-right:10px;">
      	一级
      </td>
      </tr>
      <tr>
       <td valign="top">
       	<div >
          
          <ul class="ul-tag" id="tag0">
          
          </ul>
        </div>
       </td> 
       </tr>
      <tr>
       <td width="90%" valign="top"  style="text-align:left;color:#9a9a9c;border-bottom:1px solid #ccc;padding-top:20px;padding-right:10px;">
      		二级
      </td>
      </tr>
      <tr>
       <td valign="top">
   		<div>
          <ul class="ul-tag" id="tag1">
          
          </ul>
        </div>
       </td> 
       </tr>
       <tr>
       <td  valign="top"  style="text-align:left;color:#9a9a9c;border-bottom:1px solid #ccc;padding-top:20px;padding-right:10px;">
      		三级
      </td>
      </tr>
      <tr>
       <td valign="top">
        <div>
          <ul class="ul-tag" id="tag2">
           
          </ul>
        </div>
        </td>
        </tr>
       <tr><td height="20">&nbsp;</td></tr>
        <tr>
        <td style="height:60px;border:1px solid #ccc;">
        <ul  class="ul_tag_select" id="ul_tag_select">
          <c:forEach var="item" items="${circle.tagList}">
          <li value="${item.tagId}" onclick="removeSelectTag(this)">
		   <div  style="padding:2px 0 0 4px;">
		 	<div style="float:left;margin:0px;margin-right:4px;">${item.tagName}</div>
		 	<div style="float:left;margin-right:-4px;margin-top:-2px;">
		 		<img style="width:30px;height:30px;"  src="${ctx}/images/create_8.png"/>
		 	</div>
		    </div>
		 </li>
          </c:forEach>
		</ul>
        </td>
        
        </tr>
        </table>
      </td>
    </tr>

    <tr>
      <td align="right">
      <table width="40%" border="0" align="right" cellpadding="0" cellspacing="0">
      <tr>
           <td width="150" align="right">
              <img id="create_ok"  src="${ctx}/images/is_check.png"  /></td>
           <td width="150" align="left" style="color:red;cursor:pointer;" onclick="turnpage()">申请圈子须知</td>
        </tr>
        <tr>
          <td colspan="2" width="300" align="right" style="padding-left:73px;">
            <ul class="ul-button">
             <li onclick="sure_circle()"><div>提交审核</div></li>
             <li onclick="history.go(-1)"><div>取消</div></li>
            </ul>
          </td>
        </tr>
      </table></td>
    </tr>
  </table>
</div>
</div>

<div style="position:relative;padding:10px 25px 0 25px;">
<div style="display:none;color:red;background:#fff;padding:10px;" id="divkeyword"></div>
</div>
 <p> <br/><br/><br/></p>
	  
  <jsp:include page="/common/bottom.jsp" />

</div>
</div>


<br />
<br />
<br />




</body>
</html>

<script type="text/javascript">
var tagList=${tagList};
var circleImage="${circle.circleImage}";
var colorStr=['#F5BCA9','#8181F7','#4E9AFE'];
var levelInfo=${levelList};

	$(function(){
		var level = "${circle.level}";
		if(level.length>0){
			level=parseInt(level,10);
		}
		else{
			level=1;
		}
		$('#div_levelinfo').html('最大人数:'+levelInfo[level-1]["num"]+'<br/>'+levelInfo[level-1]["info"]);
		
		$(pageInit);
		function pageInit()
		{
			var str = "Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,SelectAll,Removeformat";
			str +=",Align,List,Outdent,Indent,Link,Unlink,Anchor,Img,Flash,Media,Hr,Emot,Table,Source,Preview";
			$('#txtContent').xheditor({tools:str,upLinkUrl:"${ctx}/common!uploadHtmlFile.action",upLinkExt:"word,pdf,zip,rar,txt",upImgUrl:"${ctx}/common!uploadHtmlFile.action",upImgExt:"jpg,jpeg,gif,png,JPG,JPEG,GIF,PNG",upFlashUrl:"${ctx}/common!uploadHtmlFile.action",upFlashExt:"swf",upMediaUrl:"${ctx}/common!uploadHtmlFile.action",upMediaExt:"MP4,mp4,MP3,mp3,avi,AVI"});
		}
		
		initInput('txtTitle','spanTitle','标题40字以内',40);
		initInput('txtSummary','spanSummary','摘要40字以内',40);
		initTagList();
		initCircleLevel();
		$('#create_ok').toggle(function(){
			$(this).attr('src','${ctx}/images/is_check_ok.png');
		},function(){
			$(this).attr('src','${ctx}/images/is_check.png');
			
		});
		
		
		 // 创建AJAX方式上传文件
        var $uploadBtn = $("#upload");
        new AjaxUpload($uploadBtn, {
            action: '${ctx}/common!uploadFile.action',
            name: 'uploadFile',
            data:{type:"circle"},
            responseType:'json',
            onChange: function (file, extension) {
            	  if($('#circleImage').length>0){
                	  alert('请删除图片!');
                	  return false;
                  }
            },
            onSubmit: function(file, ext){
                  //ext 文件后缀
                
		    },
            onComplete: function(file, response){
            	if(response.status == 200){
            		circleImage=response.msg;
            		  $('#div_image').append('<div style="position:absolute;margin-left:70px;margin-top:4px;">'+
            	                '<img src="${ctx}/images/lable_del.png" style="cursor:pointer;" onclick="removeCircleImage()"/>'+
            	                '</div>'+
            	                '<span>'+
            	                '<img id="circleImage" style="border:1px solid #ccc;" src="${imageStorePath}'+response.msg+'" width="94" height="95" />'+
            	                '</span>');
            	}else{
            		  alert(response.msg);
            	  }
           
            }
        });
        
        
        // 创建AJAX方式上传文件
        var $uploadBtn = $("#uploadCard");
        new AjaxUpload($uploadBtn, {
            action: '${ctx}/common!uploadFile.action',
            name: 'uploadFile',
            data:{type:"card"},
            responseType:'json',
            onChange: function (file, extension) {
            	  if($('#ul-image li').length>=6){
                	  alert('最多选择6张图片!');
                	  return false;
                  }
            },
            onSubmit: function(file, ext){
                  //ext 文件后缀
                
		    },
            onComplete: function(file, response){
            	if(response.status == 200){
            		  var index = $('#ul-image li').length;
            		  var info='';
            		  if(index<5){
            			  info = '<span  style="font-size:12px;color:#9a9a9c;">还可以添加'+(6-index-1)+'张</span>';
            		  }
            		  else{
            			  info = '<span  style="font-size:12px;color:#9a9a9c;"></span>';
            		  }
            		  changedFlag["img"]=true;
            		  $('#ul-image').append('<li id="ul-image-'+index+'">'+
            	          		'<div style="position:absolute;margin-left:60px;margin-top:2px;">'+
                        	    '<img src="${ctx}/images/lable_del.png" style="cursor:pointer;" onclick="removeTopicImage('+index+')"/>'+
                        	'</div>'+
                        	'<span>'+
                        	 '  <img id="topicImage'+index+'" style="border:1px solid #ccc;" src="${imageStorePath}'+response.msg+'" width="80" height="80" />'+
                        	 info+
                        	'</span>'+
                      		'</li>');
            		  
            		  initImageInfo();
            		
            		  
            	}else{
            		  alert(response.msg);
            	  }
           
            }
        });
        
	});
 
	function initCircleLevel(){
		$('.circle-level li').click(function(){
			var index= this.getAttribute("value");
			$('#hiddenLevel').val(parseInt(index,10)+1);
			$('#div_levelinfo').html('最大人数:'+levelInfo[index]["num"]+'<br/>'+levelInfo[index]["info"]);
			$('.circle-level li').each(function(){
				var index2= this.getAttribute("value");
				if(index==index2){
					$(this).find('div:first div:eq(1)').show();
				}
				else{
					$(this).find('div:first div:eq(1)').hide();
				}
				
			});
			
		});
	}

	var preTagLi=null;
	var preTagLiColor=null;
	var preFirstTagLi=null;
	var preFirstTagLiColor=null;
	var selectColor='#00b36b';
	
	function initTagList(){
		var array0=[];
		for(var i=0;i<tagList.length;i++){
			var str='<li value="'+i+'" style="background-color:'+colorStr[0]+'">'+tagList[i]["tagName"]+'</li>';
			array0.push(str);
		
		}
		$('#tag0').html(array0.join(''));
		
		initTag0Click();	
		
	}
	function initTag0Click(){
		 /**$('#tag0 li').hover(function(){
				$(this).css({background:'#00b36b'});
			},function(){
				if(this != preTagLi){
					$(this).css({background:'#fff'});
				}
		});*/
			$('#tag0 li').click(function(){
				if(preFirstTagLi !=null){
					$(preFirstTagLi).css({background:preFirstTagLiColor});
				}
				
				preFirstTagLi = this;
				preFirstTagLiColor = $(this).getHexBackgroundColor();
				$(this).css({background:selectColor});
				
				var index= this.getAttribute("value");
				var array2=[];
				 for(var h=0;h<tagList[index]["child"].length;h++){
					  array2.push('<li value="tag1'+index+'_'+h+'" style="background-color:'+colorStr[1]+'">'+tagList[index]["child"][h]["tagName"]+'</li>');
				  }
				 $('#tag1').html(array2.join(''));
				 iniTag1Click();
			});
	}
	function iniTag1Click(){
	
	/**$('#tag1 li').hover(function(){
		$(this).css({background:'#00b36b'});
	},function(){
		if(this != preTagLi){
			$(this).css({background:'#fff'});
		}
	});*/
	
	$('#tag1 li').click(function(){
		if(preTagLi !=null){
			$(preTagLi).css({background:preTagLiColor});
		}
	
		
		preTagLi = this;
		preTagLiColor = $(this).getHexBackgroundColor();
		$(this).css({background:selectColor});
		
		var index = this.getAttribute("value");
		index = index.replace('tag1','').split('_');
		var array2=[];
		var data=tagList[index[0]]["child"][index[1]]["child"];
		 for(var h=0;h<data.length;h++){
			  
			 array2.push('<li id="tag2'+index[0]+'_'+index[1]+'_'+h+'" value="tag2'+index[0]+'_'+index[1]+'_'+h+'" style="background-color:'+colorStr[2]+'">'+
			 '<div  style="padding:2px 0 0 4px;">'+
			 '	<div style="float:left;margin:0px;">'+data[h]["tagName"]+'</div>'+
			 '	<div style="display:none;float:left;margin-right:-4px;margin-top:-2px;">'+
			 '		<img style="width:30px;height:30px;"  src="${ctx}/images/tag_select.png"/>'+
			 '	</div>'+
			 ' </div>'+
			 '</li>');
			 
		  }
		 $('#tag2').html(array2.join(''));
		 iniTag2Click();
	});
}
function iniTag2Click(){
	$('#tag2 li').click(function(){
		var index = this.getAttribute("value");
		
		index = index.replace('tag2','').split('_');
		var data=tagList[index[0]]["child"][index[1]]["child"][index[2]];
		var tagId =data["tagId"];
		if($('#ul_tag_select li').length>=6){
			alert('最多选择6个标签!');
			return;
		}
		var count=0;
		$.each($('#ul_tag_select li'),function(){
			var tagId1 = this.getAttribute("value");
			if(tagId1 == tagId){
				count++;
			}
		});
		if(count>0){
			alert('已选择!');
			return;
		}
	
		var tagName = data["tagName"];
		$(this).find('div:first div:eq(1)').show();
		changedFlag["tag"]=true;
		$('#ul_tag_select').append(
		 '<li value="'+tagId+'" onclick="removeSelectTag(this,\''+$(this).attr("id")+'\')">'+
		 '<div  style="padding:2px 0 0 4px;">'+
		 '	<div style="float:left;margin:0px;margin-right:4px;">'+tagName+'</div>'+
		 '	<div style="float:left;margin-right:-4px;margin-top:-2px;">'+
		 '		<img style="width:30px;height:30px;"  src="${ctx}/images/create_8.png"/>'+
		 '	</div>'+
		 ' </div>'+
		 '</li>');
	});
}
var changedFlag={tag:false,img:false};
function removeSelectTag(obj,objId){
	if(objId){
		$('#'+objId).find('div:first div:eq(1)').hide();
	}
	changedFlag["tag"]=true;
	$(obj).remove();
}

function removeCircleImage(){
	if("${circle.circleId}"!=""){
		 $('#div_image').html('');
		 circleImage='';
		return;
	}
	
	$.ajax({
	     type: "POST",
	     url : context+'/common!deleteUploadFile.action',
	     dataType:'json',
	     data:{upliadFilePath:circleImage},
	     success: function(msg,status){
	    	 if(msg.status == 200){
	    		 circleImage='';
	    		 $('#div_image').html('');
	    	 }	    		
	    	 else
	    		 alert(msg.msg);
	     }
	});

}
function removeTopicImage(index){
	
	if("${circle.circleId}"!=""){
		 $('#ul-image-'+index).remove();
		 initImageInfo();
		changedFlag["img"]=true;
		return;
	}
	
	$.ajax({
	     type: "POST",
	     url : context+'/common!deleteUploadFile.action',
	     dataType:'json',
	     data:{upliadFilePath:$('#topicImage'+index).attr('src')},
	     success: function(msg,status){
	    	 if(msg.status == 200){
	    		 $('#ul-image-'+index).remove();
	    		 initImageInfo();
	    	 }	    		
	    	 else
	    		 alert(msg.msg);
	     }
	});

}
function initImageInfo(){
	 var length = $('#ul-image li').length;
	 if(length<=6){
		var span = $('#ul-image li');
		for(var index=1;index<=span.length;index++){
			if(index < length){
				$($(span[index-1]).find('span span')[0]).html('');
			}
			else{
				if(index<6)
					$($(span[index-1]).find('span span')[0]).html('还可以添加'+(6-length)+'张');
				else
					$($(span[index-1]).find('span span')[0]).html('');
			}
		}
	 }
	 
}
function check_ok_fun(type){
	if(type==1){
		$('#check_ok').attr('src','${ctx}/images/is_check_ok.png');
		$('#check_not').attr('src','${ctx}/images/is_check.png');
	}
	else{
		$('#check_ok').attr('src','${ctx}/images/is_check.png');
		$('#check_not').attr('src','${ctx}/images/is_check_ok.png');
	}
}
function sure_circle(){
	var param={circleId:"${circle.circleId}",imgChanged:"0",level:1,circleCardImage:"[]"};
	
	if($.trim($('#txtTitle').val()).length==0 || $.trim($('#txtTitle').val())=='标题40字以内'){
		alert('需要填写标题!');
		return;
	}
	param["title"]=$.trim($('#txtTitle').val());
	if($.trim($('#txtSummary').val()).length==0 || $.trim($('#txtSummary').val())=='摘要40字以内'){
		alert('需要填写摘要!');
		return;
	}
	param["summary"]=$.trim($('#txtSummary').val());
	if($.trim($('#txtContent').val()).length==0){
		alert('需要填写内容!');
		return;
	}
	param["content"]=$.trim($('#txtContent').val());
	if($('#check_ok').attr('src').indexOf('is_check_ok')!=-1){
		param["isCheck"]="T";
	}
	if($('#check_not').attr('src').indexOf('is_check_ok')!=-1){
		param["isCheck"]="F";
	}
	if(circleImage==''){
		alert('请上传图片!');
		return;
	}
	else{
		param["circleImage"]=circleImage;
	}
	var arrayImage=[];
	$.each($('#ul-image li'),function(){
		var path = $(this).find('span img:last').attr('src');
		path=path.substr((path.lastIndexOf("path=")+"path=".length));
		arrayImage.push({path:path});
	});
	
	if(arrayImage.length == 0){
		alert('请选择证件照!');
		return;
	}
	if("${circle.circleId}"!="" && changedFlag["img"]){
		param["imgChanged"]="1";
	}
	else{
		if(changedFlag["img"]){
			param["imgChanged"]="1";
		}
	}
	param["circleCardImage"]=JSON.stringify(arrayImage);
	
	param["level"]=$('#hiddenLevel').val();
	var array=[];
	$.each($('#ul_tag_select li'),function(){
		array.push(this.getAttribute("value"));
	});
	if(array.length==0){
		alert('请选择标签!');
		return;
	}
	
	if("${circle.circleId}"!="" && !changedFlag["tag"]){
		param["tagList"]="";
	}
	else{
		param["tagList"]=array.join(',');
	}
	
	if($('#create_ok').attr('src').indexOf('is_check_ok.png')==-1){
		alert('请选择申请圈子须知!');
		return;
	}
	$.ajax({
	    type: "POST",
	    url : '${ctx}/user!KeywordFliter.action',
	    dataType:'json',
	    data:{word:param["title"]+param["summary"]+param["content"]},
	    beforeSend: function(){
	    	show_loading();
	    },
	    success: function(msg,status){
	    	
	    	if(msg.status==200){
	    		if(msg.rows.length>0){
	    			$('#divkeyword').show();
	    			$('#divkeyword').html(msg.rows.join(','));
	    			if(loadding_dialog!=null){
	    	    		loadding_dialog.close();
	    	    	}
	    			alert('您提交的内容含有敏感词!');
	    		}
	    		else{
	    			$('#divkeyword').hide();
	    			$('#divkeyword').html('');
	        		
	    			$.ajax({
	    			    type: "POST",
	    			    url : '${ctx}/community!createCircleData.action',
	    			    dataType:'json',
	    			    data:param,
	    			    success: function(msg,status){
	    			   		if(msg.status == 200){
	    			   			alert(msg.msg,function(){
	    			   				if("${circle.circleId}".length>0){
	 	    			   			   window.history.go(-1);
	 	    			   			}
	 	    			   			else{
	 	    			   				window.location.href="${ctx}/community!findLableListCircle.action";
	 	    			   			}
	    			   			});
	    			   			
	    			   		}
	    			   		else{
	    			   			alert(msg.msg);
	    			   		}
	    			    },
	    			    complete:function (XMLHttpRequest, textStatus) {
	    			    	if(loadding_dialog!=null){
	    			    		loadding_dialog.close();
	    			    	}
	    			    }
	    			});
	    		}
	    	}
	    	}
	    });
	
	
	
}

var loadding_dialog=null;
function show_loading(){
	if(loadding_dialog==null){
		loadding_dialog = new Dialog();
		loadding_dialog.Width = 300;
		loadding_dialog.Height = 100;
		loadding_dialog.Title = "";
		loadding_dialog.InnerHtml='<div style="text-align:center;font-size:14px;padding-top:20px;">loading......</div>';
		loadding_dialog.show();
	}
	else{
		loadding_dialog.show();
	}
	
}
function turnpage(){
	$('#formturn').attr('target',"_blank");
	$('#formturn').attr('action',"${ctx}/pages/community_circlecheck.jsp");
	$('#formturn').submit();
}
</script>

