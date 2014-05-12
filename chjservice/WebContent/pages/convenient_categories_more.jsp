<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />
<title>漕河泾e服务</title>

<style type="text/css">
 

</style>

</head>

<body onscroll="b()">

<jsp:include page="/common/header.jsp" />


<div class="main">
<div id="main_content" class="main_content">
   
<div style="position:relative;height:100px; padding:10px 25px 0 25px;">
	     <div>
	     <div style="float:left;"><img src="${ctx}/images/menu_12.jpg" onclick="gotoPage('${ctx}/pages/convenient.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_7.jpg" onclick="gotoPage('${ctx}/pages/convenient_brand.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_8.jpg" onclick="gotoPage('${ctx}/pages/convenient_restaurant.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_9.jpg" onclick="gotoPage('${ctx}/pages/convenient_tuiguang.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_10.jpg" onclick="gotoPage('${ctx}/pages/convenient_cuxiao.jsp')"/></div>
           <div class="menu1"><img src="${ctx}/images/menu_6.jpg"  onclick="gotoPage('${ctx}/pages/convenient_categories.jsp')"  style="width:190px;" /></div>
           <div><img src="${ctx}/images/menu_14.jpg" style="width:285px;" /></div>
	    </div>
  
</div>
  


 
 <div style="float:left; padding:10px 25px 0 25px;">
      <div>
        <table border="0" cellspacing="0" cellpadding="0">
        <tr>
        <td valign="top">
        
        
	      <div style=" float:left; width:230px; background:url(${ctx}${categoryInfo.image}) no-repeat;">
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td width="71%" height="239" valign="bottom" style="color:#fff;">
	            <span style="margin:0 0 10px 4px;">${categoryInfo.name}</span>
	            </td>
	            <td width="29%" align="center" valign="bottom">
	              <img style="cursor:pointer;" onclick="history.go(-1)" src="${ctx}/dynamic/retutrn.png" width="37" height="36" />
	            </td>
              </tr>
            </table>
             <table width="100%" border="0" cellspacing="2" cellpadding="0" style=" color:#FFF;">
	        <tr ><td height="10">&nbsp;</td></tr>
	         <tr ><td>
	          <ul id="ulidcategory" style="margin-left: 0;list-style: none;text-align: justify;"> 
	           
	        <c:forEach var="item" items="${categorySecond}" varStatus="index">
	    
	         <li class="category" value="${item.productCategoryId}"   align="center" style="display: inline-block;margin-bottom:5px;margin-top:5px;font-size:14px;  padding: 4px 4px;background-color:#31a1e9;cursor:pointer;">${item.name}</li>
	          
	   
	        </c:forEach>
                        
              </ul></td></tr>
            </table>
               <script type="text/javascript">
      $(document).ready(function() {
		 var tags_a = $("#ulidcategory li");
		 var color_arr=Array("#6AA2D0","#82C28F","#F98566","#DF9798");
		 tags_a.each(function(){
			var indexl=Math.floor(Math.random()*(color_arr.length));
			 $(this).css("background",color_arr[indexl]);
			 $(this).attr("bgr",indexl);
		
		  });
      });   
   </script>
        </div>
  		</td>
  	  <td valign="top">
  		
       <div id="div_product">
       
     
       </div> 
        </td>
        </tr>
        </table>
   </div>
</div>
 
 
 <div style="float:left; padding:10px 25px 0 25px;">
     <div id="loadmore" onclick="loadMore()" style="cursor:pointer;height:55px; width:950px; background-color:#FFF;"> <p id="loadMoreText" style="text-align:center; padding-top:18px;font-size:14px;color:4c4c4c;font-family:黑体;">加载更多</p> </div>
 </div> 


  
  <jsp:include page="/common/bottom.jsp" />
  
  
</div>
</div>


 
 
 

</body>
</html>
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript">

$(document).ready(function(){
	findProductList();
	initCategoryHover();
});
function randomColor() {	//16进制方式表示颜色0-F	
	var arrHex = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"];	
	var strHex = "#";	
	var index;	
	for(var i = 0; i < 6; i++) {	//取得0-15之间的随机整数	
		index = Math.round(Math.random() * 15);		
		strHex += arrHex[index];
	}	
	return strHex;
}
var selectCategoryValue='';
var rgb;
var cliRgb;
function initCategoryHover(){
	$(".category").hover(function() {
		rgb = $(this).css('background-color'); 
		$(this).css({background:"#f63"});
		 var color_arrhover=Array("#2181d0","#1abe3b","#fb5528","#dc6062");
		 var bgrindex = this.getAttribute("bgr");
		 $(this).css("background",color_arrhover[bgrindex]);
	},
	function(){
		var selVal = this.getAttribute("value");
		if(selectCategoryValue !=selVal)
		$(this).css({background:rgb});
	});
	
	$(".category").click(function(index) {
		var selVal = this.getAttribute("value");
		selectCategoryValue = selVal;
		$.each($(".category"),function(){
			var cate = this.getAttribute("value");
			if(cate == selVal){
				$(this).css({background:rgb});
			}
			//else{
				//$(this).css({background:cliRgb});
			//}
		});
		
		pageinfo["categoryId"]=selectCategoryValue;
		pageinfo["page"]=1;
		$('#div_product').html('');
		findProductList();
	});
}
function loadMore(){
	if(pageinfo["more"]){
		findProductList();
	}
}
function secondProductList(id){
	pageinfo["categoryId"]=id;
	pageinfo["page"]=1;
	$('#div_product').html('');
	findProductList();
}
var load=false;
function findProductList(){
	pageinfo["size"]=9;
	pageinfo["parentId"]="${categoryId}";
	
	$.ajax({
	     type: "POST",
	     url : context+'/product!findProductByCategoryId.action',
	     dataType:'json',
	     data:pageinfo,
	     success: function(msg,status){
	    	if(msg.status == 200){
	    		var array = [];
		    	for(var i=0; i < msg.rows.length; i++){
		    		var data = msg.rows[i];
		    		if(data["productInfo"]["name"].length>11){
		    			data["productInfo"]["name"]=data["productInfo"]["name"].substr(0,11)+'...';
		    		}
		    		 var str='';
		    		   if(i%3==0){
		    			   if(i==0){
		    				   if(!load){
		    					   str ='<div style="float:left;width:710px;margin-left:10px;">';
		    					   load=true;
		    			   		}
		    			   		else
		    				   	    str ='<div style="float:left;width:710px;margin-left:10px;">';
		    			   }  
		    			   else
		    				   str ='<div style="float:right;width:710px;margin-top:10px;margin-left:10px;">';
		    			   str +='<div  style="float:left; width:230px;">';
		    		   }
		    		   else{
		    			   str +='<div style="float:left;margin-left:10px; width:230px;">';
		    		   }		
		    		   var price='',oldPrice='',companyShopProductSkuId='';
		    		   if(data["sku"]!=null){
		    			   price =data["sku"]["price"];
		    			   oldPrice =data["sku"]["oldPrice"];
		    			   companyShopProductSkuId=data["sku"]["companyShopProductSkuId"];
		    		   }
		    		  str +='<div style="cursor:pointer;background-color:#ffffff;width:230px;" onclick="productDetail(3,'+data["productId"]+','+data["companyShopProductId"]+','+data["companyShopId"]+','+companyShopProductSkuId+')"><img src="${imageStorePath}'+data["image"]+'" style="cursor:pointer;width:180px; height:180px; border:none;margin-left:25px;margin-top:10px;" /> </div>'+
		    		          '<div class="brand_pic" style="background-color:${color};">'+
		    		          '  <p style="color:#FFF;">实售价：<span class="brand_pictx" style="color:#FFF;">'+price+'元</span></p>'+
		    		           //'<p style="color:#FFF;">参考价：<span class="brand_picx" >'+oldPrice+'元</span></p>'+
		    		          '<p style="color:#FFF;cursor:pointer;" onclick="productDetail(3,'+data["productId"]+','+data["companyShopProductId"]+','+data["companyShopId"]+','+companyShopProductSkuId+')">'+data["productInfo"]["name"]+'</p></div>'+
		    		        '</div>';
		    		  
		    		  if(i%3==2 || i==msg.rows.length-1){
		    			   str +='</div></div>';
		    		   }
		    		  array.push(str);
		    	}
	    		
		    	$('#div_product').append(array.join(''));
	    	   if(msg.rows.length<pageinfo["size"]){
		    	    $('#loadMoreText').html('没有更多!');
		    	  pageinfo["more"]=false;
		       }
	    	   else{
	    		pageinfo["page"]++;
	    	   }
		    	array=[];
	    		array=null;
	    	}
	    	else{
	    		alert(msg.msg);
	    	}
	
		 } 
	});
}


</script>
