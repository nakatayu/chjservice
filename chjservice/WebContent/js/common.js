var context="/chjservice";
var selectLable={};
var pageinfo={size:16,page:1,t:0,tp:0,more:true,userTag:true,emtMsg:'未查询到数据!'};
String.prototype.startWith=function(str){     
	 if(this.indexOf(str)==0){
		 return true;
	 }       
	 else{
		 return false;
	 }
}  
String.prototype.endWith=function(str){
	if(this.substr(this.length-1,this.length-1)==str){
		 return true;
	 }       
	 else{
		 return false;
	 }  
} 
function initWorkServiceTime(worktime){
	var array=[];
	var worktimeTemp = worktime.split("||")[0];
	
	if(worktimeTemp.startWith("{") && worktimeTemp.endWith("}")){
		var worktimeTemp1 = eval("("+worktimeTemp+")");
		$.each(worktimeTemp1,function(key,value){
			array.push('<tr><td width="100" valign="top" align="left">'+key+":</td><td>"+value.replace(',','<br/>')+'</td></tr>');
		});
		return "<table>"+array.join('')+"</table>";
	}
	else{
		if(worktimeTemp.startWith("[") || worktimeTemp.endWith("]") || worktimeTemp.endWith("}")){
			return "";
		}
		else{
			return worktimeTemp;
		}
		
	}
	
}
function initWorkServiceTimeNoTable(worktime){
	var array=[];
	var worktimeTemp = worktime.split("||")[0];
	
	if(worktimeTemp.startWith("{") && worktimeTemp.endWith("}")){
		var worktimeTemp1 = eval("("+worktimeTemp+")");
		$.each(worktimeTemp1,function(key,value){
			array.push(key+":"+value);
		});
		return array.join('');
	}
	else{
		if(worktimeTemp.startWith("[") || worktimeTemp.endWith("]") || worktimeTemp.endWith("}")){
			return "";
		}
		else{
			return worktimeTemp;
		}
	}
	
}
function shopStatusMsg(statusMsg,deliverOk){
	if(deliverOk !='T' && deliverOk !='L'){
		var msg="店铺状态有误!";
		for(var i=0;i<statusMsg.length;i++){
			if(statusMsg[i]["code"]==deliverOk){
				msg =statusMsg[i]["value"];
				break;
			}
			if(statusMsg[i]["code"]=='Z' &&(deliverOk=='TZ'||deliverOk=='LZ'||deliverOk=='FZ')){
				msg =statusMsg[i]["value"];
				break;
			}
		}
		alert(msg);
		return false;
	}
	return true;
}
function removeHTMLTag(str) {
	if(str==null || str =="" || str==undefined){
		return "";
	}
	else{
		 str = str.replace(/<\/?[^>]*>/g,''); //去除HTML tag
		    str = str.replace(/[ | ]*\n/g,'\n'); //去除行尾空白
		    str = str.replace(/\n[\s| | ]*\r/g,'\n'); //去除多余空行
		    str=str.replace(/&nbsp;/ig,'');//去掉&nbsp;
		    str=str.replace(/\\r/ig,'');//去掉&nbsp;
		    str=str.replace(/\\n/ig,'');//去掉&nbsp;
		    return str;
	}
   
}

function gotoPage(page){
	window.location.href=page;
}
function circleTopicDetail(userId,id,topicUserId,status,examineResult,circleId){
	var flag=false,msg='';
	if (status=="2"	&& (examineResult=="3" || 
			examineResult == "2")) {
		if(circleId>0){
			flag=true;
		}
		else{
			if (userId != ""
				&& userId ==topicUserId) {
			flag = true;
		} else {
			flag = false;
			if (examineResult == "2")
				msg= "话题信息审核未通过!";
			else if (examineResult == "3")
				msg= "话题信息正在审核!";
		}
		}
		
	}
	else{
		flag=true;
	}
	if(flag){
		$('#formturn').attr('method',"GET");
		$('#formturn').attr('action',context+"/community!circleTopicDetail.action");
		$('#topicIdHidden').val(id);
		$('#circleIdHidden').val(circleId);
		$('#formturn').submit();
	}
	else{
		alert(msg);
	}
}

function activity_detail(userId,id,circleUserId,status,examineResult){
	
	var flag = false;
	if ((status=="2" || status=="3")
			&& (examineResult == "2" || examineResult == "3")) {
		if (userId != ""
			&& userId ==circleUserId) {// 发起人
			flag = true;
		} else {
			flag = false;
			if (status == "2")
				msg = "活动信息正在维护!";
			if (status == "3")
				msg = "活动已申请关闭!";
		}
	}
	else{
		flag=true;
	}
	
	if (flag) {	
		$('#formturn').attr('method',"GET");
		$('#formturn').attr('action',context+"/community!findActivityDetail.action");
		$('#activityIdHidden').val(id);
		$('#formturn').submit();
	}
	else{
		alert(msg);
	}
}
function circle_detail(userId,id,circleUserId,status,examineResult){
	var flag=false,msg='';
	if ((status=="2" || status=="4" || status =="3")
			&& (examineResult == "3" || examineResult == "2")) {
		if (userId != ""
			&& userId ==circleUserId) {
			flag = true;
		} else {
			flag = false;
			if(status=="2" || status =="4"){
				if (status == "2")
					msg = "圈子信息正在维护!";
				if (status == "4")
					msg = "圈子已申请关闭!";
			}
			else if(status == "3"){
				msg = "圈子正在升级!";
			}
		}

	}
	else{
		flag=true;
	}
	if(flag){
		$('#formturn').attr('method',"GET");
		$('#formturn').attr('action',context+"/community!findCircleDetail.action");
		$('#circleIdHidden').val(id);
		$('#formturn').submit();
	}
	else{
		alert(msg);
	}
	
}
function gotoUserDetail(id1,id){
	if(id1==''){
		alert('请您登陆!');
		return;
	}
	if(id1==id){
	window.location.href=context+"/pages/myhome.jsp";
	}
	else{
	$('#userIdHidden').val(id);
	$('#formturn').attr('action',context+"/user!findUserFriendHomeInfo.action");
	$('#formturn').submit();
   }
}
function productDetail(type,id,hiddenCompanyShopProductId,companyShopId,companyShopProductSkuId){
	if(companyShopProductSkuId==''){
		alert('数据错误!');
		return;
	}
	$('#typeHidden').val(type);
	$('#companyShopId').val(companyShopId);
	$('#hiddenProductId').val(id);
	$('#hiddenCompanyShopProductId').val(hiddenCompanyShopProductId);
	$('#hiddenCompanyShopProductSkuId').val(companyShopProductSkuId);
	$('#formturn').attr('method',"GET");
	$('#formturn').attr('action',context+"/product!findProductDetail.action");
	$('#formturn').submit();
}
function initInput(txtId,spanId,text,lengthTxt){
	var title=document.getElementById(txtId);
	if(title!=null && title!= undefined){
		title.onfocus=function(){
			if(this.value ==text){
				this.value='';
			}
			else
				this.className='input-color-focus';
			};
			title.onblur=function(){
			if(this.value==''){
			  this.value=text;
			  this.className='input-color';
			}
			else
				this.className='input-color-focus';
			};
			title.onkeyup=function(){
				if(this.value !=''){
					this.className='input-color-focus';
				}
				if(this.value.length <= lengthTxt)
					$('#'+spanId).html(this.value.length+'/'+lengthTxt);
				else{
					$('#'+spanId).html(lengthTxt+'/'+lengthTxt);
					this.value = this.value.substr(0,lengthTxt);
				}
					
				
			};
	}
	
	
}
function logout(){
	window.confirm('您确定退出吗?', function(){
		$.ajax({
		     type: "POST",
		     url : context+'/user!webloginOut.action',
		     dataType:'json',
		     data:{},
		     success: function(msg,status){
		    	if(msg.status == 200){
		    		window.location.href=context;
		    	}
		    	else{
		    		alert(msg.msg);
		    	}
			 } 
		});
		
	});
}
function weblogin(){
	 $.ajax({
	     type: "POST",
	     url : context+'/user!weblogin.action',
	     dataType:'json',
	     data:{username:$('#txtAccount').val(),password:$('#txtPassword').val()},
	     success: function(msg,status){
	    	if(msg.status == 200){	    
	    		SetCookie("userCartCount",msg.total);	    		
	    		window.location.reload();
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
		 } 
	});
	
}

function finduserCartItemCount(){
	 $.ajax({
	     type: "POST",
	     url : context+'/user!findUserCartItemCount.action',
	     dataType:'json',
	     data:{},
	     success: function(msg,status){
	    	if(msg.status == 200){
	    		SetCookie("userCartCount",msg.total);
	    		if(msg.total>0){
	    			$('.my-cart').show();
    				$('#mycartCount').html(msg.total);
	    		}
	    		else{
	    			$('.my-cart').hide();
	    		}
	    		
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
		 } 
	});
}
function findLableList(){
	 $.ajax({
	     type: "POST",
	     url : context+'/user!findLableList.action',
	     dataType:'json',
	     data:{},
	     success: function(msg,status){
	    	if(msg.status == 200){
	    		$('#lableFirstMenue').html('');
	    		$('#lableThirdContent').html('');
	    		for(var i=0; i<msg.rows.length;i++){
	    			var data = msg.rows[i];
	    			$('#lableFirstMenue').append('<li><a href="javascript:void(0)" onclick="showTagThird('+data["tagId"]+')">'+data["tagName"]+'</a></li>');
	    			var array=[];
	    			if(i==0)
	    				array.push('<ul  class="lable_ul"   id="tagThird'+data["tagId"]+'">');
	    			else
	    				array.push('<ul  class="lable_ul" style="display:none;"  id="tagThird'+data["tagId"]+'">');
	    			
	    			for(var j=0; j<data.child.length;j++){
	    				array.push('<li><div style="padding-right: 4px;padding-left: 4px;" onclick="addLable('+data["child"][j]["tagId"]+',this)">'+data["child"][j]["tagName"]+'</div></li>');
	    		    }
	    			array.push('</ul>');
	    		    $('#lableThirdContent').append(array.join(''));
	    		    array=null;
	    		} 
	    
	    	}
	    	
		 } 
	});
}

function showTagThird(id){
	$.each($('.lable_ul'),function(index,data){
		if(data.id == ("tagThird"+id)){
			$('#'+data.id).show();
		}
		else{
			$('#'+data.id).hide();
		}
	});

}

function a(x,y){
	l = $('#main_content').offset().left;
	w = $('#main_content').width();
	$('#tbox').css('left',(l + w + x) + 'px');
	$('#tbox').css('bottom',y + 'px');
}

function onscroll_body(){

	
// h = $(document.body).height();
// t = $(document.body).scrollTop();
//
// if(t > h){
// $('#gotop').fadeIn('slow');
// }else{
// $('#gotop').fadeOut('slow');
// }
	$('#gotop').fadeIn('slow');
	

}
function b(){

	
	// h = $(document.body).height();
	// t = $(document.body).scrollTop();
	//
	// if(t > h){
	// $('#gotop').fadeIn('slow');
	// }else{
	// $('#gotop').fadeOut('slow');
	// }
		$('#gotop').fadeIn('slow');
		

	}

function gotop(){
	$('body,html').animate({ scrollTop: 0 }, 800,function(){
		$('#gotop').fadeOut('slow');
	});
}
var showFlag = false;
function show_lable(){
	if(!showFlag){
		showSelectLable();
		findLableList();
		$('#imgLable').attr("src",context+"/images/lable_type2.png");
		$('.div_lable').show();
		$('.div_lable').animate({ height: 2300 },1000);
		$('#lable_content1').show();
		$('#lable_content1').animate({ height: 280 }, 1000,function(){
			 showFlag = true;
		});
	}
	else{
		$('#imgLable').attr("src",context+"/images/lable_type1.png");
		$('.div_lable').animate({ height: 0 },1000,function(){
			$('.div_lable').hide();
		});
		$('#lable_content1').animate({ height: 0 }, 1000,function(){
			 showFlag = false;
			 $('#lable_content1').hide();
			});
	}
	

}

function lableScroll(flag){
	if(flag==1){
		$('#lableScroll').animate({ scrollTop: $('#lableScroll').scrollTop()+30 },500);
	}
	else{
		$('#lableScroll').animate({ scrollTop: $('#lableScroll').scrollTop()-30 },500);
	}
	
}
function isPhone(s){ 
	var patrn=/^0?(13[0-9]|15[012356789]|18[0123456789]|14[57])[0-9]{8}$/;
	if (!patrn.exec(s)) return false;
	return true;
}
function isPassword(s){
	
	var patrn= /[a-zA-Z0-9_]{8,16}/; 
	if (!patrn.exec(s)) return false;
	return true;

}

function isPostCode(s){
	
	var patrn= /^[1-9][0-9]{5}$/; 
	if (!patrn.exec(s)) return false;
	return true;

}

function isEmail(s){
	var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if (filter.test(s)) return true; 
	return false;
	
}




function addLable(id,obj){
	var ov = $('#lable_ul_select').find('#lable_ul_li_'+id);
	if(ov.length == 0){
		selectLable[""+id] = $(obj).html();
		SetCookie("selectLable",JSON.stringify(selectLable));
		var array=[];
		array.push('<li id="lable_ul_li_'+id+'" onclick="removeLable('+id+')">');
		array.push(' <div  style="padding:0 0 0 4px;">');
		array.push('<div style="float:left;margin:4px;">'+$(obj).html()+'</div>');
		array.push('<div style="float:left;">');
		array.push('<img style="width:30px;height:30px;"  onclick="removeLable('+id+')" src="'+context+'/images/l_del.png"/>');
		array.push('</div>');
		array.push('</div>');
		array.push('</li>');
		
		$('#lable_ul_select').append(array.join(''));
	}
}
function removeLable(id){
	selectLable[""+id] ="";
	SetCookie("selectLable",JSON.stringify(selectLable));
	$('#lable_ul_select').find('#lable_ul_li_'+id).remove();
}
function showSelectLable(){
	var time = getCookie("timeSpace");
	if(time!=null){
		$('#time' + time).css('background', '#11a683');
	}
	
	var data = getCookie("selectLable");
	if(data !=null && data.length>0){

		selectLable = JSON.parse(data); 
		var array=[];
		$.each(selectLable,function(key,data){
			if(data.length>0){
				array.push('<li id="lable_ul_li_'+key+'" onclick="removeLable('+key+')">');
				array.push(' <div  style="padding:0 0 0 4px;">');
				array.push('<div style="float:left;margin:4px;">'+data+'</div>');
				array.push('<div style="float:left;">');
				array.push('<img style="width:30px;height:30px;"  onclick="removeLable('+key+')" src="'+context+'/images/l_del.png"/>');
				array.push('</div>');
				array.push('</div>');
				array.push('</li>');
			}
		});
		$('#lable_ul_select').html(array.join(''));
	}
	
	
}
function sel_time(index) {
	var time = getCookie("timeSpace");
	if(time!=null && time==index){
		SetCookie("timeSpace","");
		$('#time' + index).css('background', '#29becc');
		return;
	}
	for ( var i = 1; i < 4; i++) {
		if (i == index)
			$('#time' + i).css('background', '#11a683');
		else
			$('#time' + i).css('background', '#29becc');
	}
	SetCookie("timeSpace",index);
}
function curDateTime() {
	var d = new Date();
	var year = d.getFullYear();
	var month = d.getMonth() + 1;
	var date = d.getDate();
	var day = d.getDay();
	var Hours=d.getHours(); //获取当前小时数(0-23)
	var Minutes=d.getMinutes(); //获取当前分钟数(0-59)
	var Seconds=d.getSeconds(); //获取当前秒数(0-59)
	var curDateTime = year;
	if (month > 9)
		curDateTime = curDateTime +'-'+ month;
	else
		curDateTime = curDateTime +'-'+ "0" + month;
	if (date > 9)
	curDateTime = curDateTime +'-'+ date;
	else
	curDateTime = curDateTime +'-'+ "0" + date;
	if (Hours > 9)
	curDateTime = curDateTime +' '+ Hours;
	else
	curDateTime = curDateTime + ' '+ "0" + Hours;
	if (Minutes > 9)
	curDateTime = curDateTime +':'+ Minutes;
	else
	curDateTime = curDateTime + ':'+"0" + Minutes;
	if (Seconds > 9)
	curDateTime = curDateTime + ':'+Seconds;
	else
	curDateTime = curDateTime + ':'+"0" + Seconds;
	return curDateTime;
}

function SetCookie(name,value)//两个参数，一个是cookie的名子，一个是值
{
    var Days = 100; //此 cookie 将被保存 30 天
    var exp  = new Date();    //new Date("December 31, 9998");
    //exp.setTime(exp.getTime() + Days*24*60*60*1000);
    exp.setTime(exp.getTime() +60*60*1000);
    document.cookie = name + "="+ value + ";expires=" + exp.toGMTString();
}
function getCookie(name)//取cookies函数       
{
    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
     if(arr != null) return (arr[2]); return "";

}
function delCookie(name)//删除cookie
{
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval=getCookie(name);
    if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}
function resetTagTime(){
	var time = getCookie("timeSpace");
	if(time!=null){
		$('#time' + time).css('background', '#29becc');
	}
	$('#lable_ul_select').html('');
	
	delCookie("selectLable");
	delCookie("timeSpace");
	
}
//标签搜索
function searchByTag(){
	var data = getCookie("selectLable");
	var time = getCookie("timeSpace");
	if((data !=null && data.length>0) || (time!=null && time.length>0)){
		try{
		 if(typeof(eval(searchByTagImpl))=="function"){
			 show_lable();
			searchByTagImpl(data,time);
		 }
		 else{
			alert('本页暂不提供搜索!');
		 }
		}catch(e){
			alert('本页暂不提供搜索!');
		} 
	}
	else{
		alert('请选择标签或时间范围!');
	}
	
}
