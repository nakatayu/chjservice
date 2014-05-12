var imageStorePath="http://222.66.234.51/chjservice/common!findPicture.action?path=";
var page=0;
//辛巴克公司Id，固定的
var companyId=254;
var companyShopId=192;//星巴克店铺Id，用于右边产品促销
var XBUXProductId=1373;//注册有礼商品编号，productId
var statusMsg = '';
var deliverOk='';

function  findrecProduct(num,controlId){
	page=page+num;
	if(page<1){page=4; return;
	}else if(page>4){page=1; return;}
	var info={};
	info["page"]=page;
	info["size"]=3;
	info["companyId"]=companyId;
	info["companyShopId"]=companyShopId;
	$.ajax({
		type : "POST",
		url : '/chjservice/product!findProductInfo.action',
		dataType : 'json',
		data :info,
		success : function(msg, status) {
			if(msg.status == 200){
				var array=[];
				array.push('<table width="100%" border="0" cellspacing="0" cellpadding="0">');
				for(var i=0;i<msg.rows.length;i++){
					var data=msg.rows[i];
					array.push('<tr onclick="intoProduct('+data["product_id"]+','+data["company_shop_product_id"]+','
							+msg.append+')"><td width="40%" height="74" align="center">');
					array.push('<img src="'+imageStorePath+data["file_path"]+'" width="66" height="66" /></td>');
					array.push('<td width="60%" height="80">'+data["name"]+'</td></tr>');
				}	
				array.push('</table>');
				$('#'+controlId).html(array.join(''));
			}
		}
	});
}
function intoProduct(productId,shopProductId,result){
	if(result!=1){
		alert('店铺正在调整中！');
		return;
	}
	window.location.href="/chjservice/pages/orderpage.jsp?companyShopProductId="+shopProductId+"&companyShopId="+companyShopId+"&productId="+productId;
}

function loadUserAddress(){
	$.ajax({
	     type: "POST",
	     url : '/chjservice/user!loadUserAddress.action',
	     dataType:'json',
	     data:{},
	     success: function(msg,status){
	    	if(msg.status == 200){
	    		var array=[];
	    		addressArray=msg.rows;
	    		for(var i=0; i <msg.rows.length;i++){
	    			
	    			if(msg.rows[i]["parentArea"].length>0){
	    				msg.rows[i]["parentArea"] = "&nbsp;"+msg.rows[i]["parentArea"];
	    			}
	    			if(msg.rows[i]["childArea"].length>0){
	    				msg.rows[i]["childArea"] = "&nbsp;"+msg.rows[i]["childArea"];
	    			}
	    			if(msg.rows[i]["address"].length>0){
	    				msg.rows[i]["address"] = "&nbsp;"+msg.rows[i]["address"];
	    			}
	    			if(msg.rows[i]["isSelected"]==2){
	    				selectAddress=i;
	    			}
	    			var str='<div style="float:left; width:950px;margin-top:10px;">'
	    		       +'<div style="float:left;padding-left:15px; width:525px; height:65px; background-color:#FFF;border-bottom:#57ae97 solid 2px;">'
	    		       +'<table style="color:#9a9a9c; font-size:14px;"  border="0" cellspacing="0" cellpadding="0"><tr><td valign="middle"><img onclick="selectAddress_fun('+i+')"  id="address'+i+'" width="28" height="28" src="/chjservice/images/'+(msg.rows[i]["isSelected"]==2?'check_box_sel':'check_box')+'.png"/></td>'
	    		       +'<td align="left" style="padding-left:10px;height:65px;" valign="middle">'+msg.rows[i]["parentArea"]+msg.rows[i]["childArea"]+msg.rows[i]["address"]+'</td></tr></table></div> '
	    		       
	    		       +'<div class="conv1" style="text-align:center;width:180px; height:65px; background-color:#FFF;border-bottom:#57ae97 solid 2px;">'
	    		       +'<p style="margin-top:20px;font-size:14px;color:#9a9a9c;">  '+msg.rows[i]["name"]+'</p></div> '
	    		       +'<div class="conv1" style="text-align:center;width:210px; height:65px; background-color:#FFF;border-bottom:#57ae97 solid 2px;">'
	    		       +'<p style="margin-top:20px;font-size:14px;color:#9a9a9c;">'+msg.rows[i]["phone"]+'</p></div>  '          
	    		       +'</div>'; 
	    			array.push(str);
	    		}
	    		$('#div_address').html(array.join(''));
	    	}
	    	else{
	    		
	    	}
		 } 
	});
}
function selectAddress_fun(index){
	selectAddress=index;
	for(var i=0;i<addressArray.length;i++){
		if(i==index){
			$('#td-address'+i).css('color','#00b38b');
			$('#address'+i).attr('src',"/chjservice/images/check_box_sel.png");
		}
		else{
			$('#td-address'+i).css('color','#9a9a9c');
			$('#address'+i).attr('src',"/chjservice/images/check_box.png");
		}
	}
}
var payTypeArray=["到店支付","货到付款(现金)","货到付款(一卡通)","货到付款(银行卡)","线上支付(一卡通)","线上支付(银行卡)"];
var shopPayType=[];
function findShopPayTypeAndisDeliver(id){
	$.ajax({
	     type: "POST",
	     url : '/chjservice/product!findShopPayTypeAndisDeliver.action',
	     dataType:'json',
	     data:{companyShopId:id},
	     success: function(msg,status){
	    	if(msg.status == 200){
	    		
	    		if( msg.rows["serviceTime"]!=null && msg.rows["serviceTime"].length>0){
	    			if($('#serviceTime').length>0){
	    				
	    				$('#serviceTime').html(initWorkServiceTimeNoTable(msg.rows["serviceTime"]));
	    			}
	    				
	    		}
	    	   
	    		if(msg.rows["serviceTime"]!=null && msg.rows["serviceTime"].length==0)
	    			if($('#mm').length>0)
	    				$('#mm').remove();
	    	
	    		
	    		shopPayType = msg.rows["payType"].split(",");
	    		
	    		 
	    		if(id==198){
	    			$('#sendType').html('<option value="2">自取</option>');
	    			 var str=[];
    	    		 for(var i=0;i<shopPayType.length;i++){
    	    			 var type=$.trim(shopPayType[i]);
    	    			 if(type=="1" || type =="5" || type=="6"){
    	    				 str.push('<option value="'+$.trim(shopPayType[i])+'">'+payTypeArray[shopPayType[i]-1]+'</option>');
	    	    		 } 
    	    		 }
    	    			 
    	    		 $('#payType').html(str.join(""));
	    		}
	    		else{
	    			var str=[];
		    		 for(var i=0;i<shopPayType.length;i++){
		    			 if($.trim(shopPayType[i])!="1"){
		    				 str.push('<option value="'+$.trim(shopPayType[i])+'">'+payTypeArray[shopPayType[i]-1]+'</option>');
			    		 }
		    		}
		    		 $('#payType').html(str.join(""));
	    		}
	    		 $('#sendType').change(function(){ 
	    			 
	    			 var p1=$(this).children('option:selected').val();//这就是selected的值 
	    			 if(p1=="1"){
	    				 var str=[];
	    	    		 for(var i=0;i<shopPayType.length;i++){
	    	    			 if($.trim(shopPayType[i])!="1"){
	    	    				 str.push('<option value="'+$.trim(shopPayType[i])+'">'+payTypeArray[shopPayType[i]-1]+'</option>');
		    	    		 } 
	    	    		 }
	    	    		 $('#payType').html(str.join(""));
	    			 }
	    			 else{
	    				 var str=[];
	    	    		 for(var i=0;i<shopPayType.length;i++){
	    	    			 var type=$.trim(shopPayType[i]);
	    	    			 if(type=="1" || type =="5" || type=="6"){
	    	    				 str.push('<option value="'+$.trim(shopPayType[i])+'">'+payTypeArray[shopPayType[i]-1]+'</option>');
		    	    		 } 
	    	    		 }
	    	    			 
	    	    		 $('#payType').html(str.join(""));
	    			 }
	    		 });
	    		 
	    		cartItem["deliverOK"]=msg.rows["deliverOk"];
	    	}else{
	    		alert(msg.msg);
	    	};
		 } 
	});
}

function gotodianpupage(shopId){
	
	$('#companyIdHidden').val(254);
	$('#companyShopId').val(shopId);
	$('#formturn').attr("action","/chjservice/product!sbuxShopInfo.action");
	$('#formturn').submit();
	
}
/*
function checkProduct(productId){		 
	if(productId!='205'){		
		b=true;
	}else{	
		$.ajax({
		     type: "POST",
		     async:false,
		     url : '/chjservice/product!checkProduct.action',
		     dataType:'json',
		     data:{productId:productId},
		     success: function(msg,status){
		    	if(msg.status == 200){
		    		var obj=msg.rows;
		    		if(obj==1){
		    			alert('活动期间，该商品每人限制购买一次，每次限制一个。你已将其加入购物车，请前往购物车购买！');
		    		}else if(obj==2){
		    			alert('活动期间，该商品每人限制购买一次，每次限制一个。你已将其加入订单中，请您完成订单或取消！');
		    		}
		    	}else{
		    		alert(msg.msg);
		    	}	    		
		     }	     
		});		
	}
}*/

