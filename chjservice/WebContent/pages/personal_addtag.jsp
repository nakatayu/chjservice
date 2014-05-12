<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
<script language="javascript" src="${ctx}/js/JQueryHexBackgroundColor.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/css/header.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/bottom.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/btn.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/buttons.css" />
<style type="text/css">
html {
width: 100%;
height: 100%;
margin:0;
overflow-y: auto;
font-family:微软雅黑;
background:#fff;
}
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
<body> 
<div style="position:relative;padding:10px 25px 0 25px;">
<div style="float:center; width:948px; background-color:#fffef9;padding-bottom:20px;">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td valign="top" align="center">
      
      <table width="880" border="0" cellpadding="0" cellspacing="0">
      <tr>
      <td valign="top" align="left" style="width:880px;color:#9a9a9c;border-bottom:1px solid #ccc;padding-right:10px;">
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
       <td width="90%" align="left" valign="top"  style="color:#9a9a9c;border-bottom:1px solid #ccc;padding-top:20px;padding-right:10px;">
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
       <td  valign="top" align="left" style="color:#9a9a9c;border-bottom:1px solid #ccc;padding-top:20px;padding-right:10px;">
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
         
		</ul>
        </td>
        
        </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td align="right">
      <table width="400" border="0" align="right" cellpadding="0" cellspacing="0">
      
        <tr>
          <td colspan="2" width="400" align="right" style="padding-left:73px;">
            <ul class="ul-button">
             <li onclick="sure_circle()"><div>确定</div></li>
             <li onclick="top.diag.close();"><div>取消</div></li>
            </ul>
          </td>
        </tr>
      </table></td>
    </tr>
  </table>
</div>
</div>




</body>
</html>

<script type="text/javascript">
var tagList=${tagList};
var colorStr=['#F5BCA9','#8181F7','#4E9AFE'];
	$(function(){
		initTagList();

	});
	
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
				 $('#tag2').html('');
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
function sure_circle(){
	
	var array=[];
	$.each($('#ul_tag_select li'),function(){
		array.push(this.getAttribute("value"));
	});
	if(array.length==0){
		alert('请选择标签!');
		return;
	}
	
	 $.ajax({
	     type: "POST",
	     url : '${ctx}/user!addUserTag.action',
	     dataType:'json',
	     data:{tagIds:array.join(',')},
	     success: function(msg,status){
	    	if(msg.status == 200){
	    	  alert('添加成功!');
	    	  top.diag.close();
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
	     }
	 });
	 
	
	
}
</script>

