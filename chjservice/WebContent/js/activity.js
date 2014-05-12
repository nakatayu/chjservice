
function apply_add_level_suss(data){
	if(data!=undefined){
		if(data.status ==200){
			
			addActivityUserFlag[data["objectId"]]=true;
			$('#enrolldiv'+data["activityId"]).html('已加入');
			if(data["isCheck"]=='T'){
				if(data["isQrcode"] =='T'){
					if(data["fresh"]=='fresh'){
						alert('加入成功,请耐心等待审核!审核通过后，可到我的活动中查看二维码!',function(){
	    	  				window.location.href=context+"/community!findActivityDetail.action?activityId="+data["activityId"];
	    	 			   });
					}
					else
						alert('加入成功,请耐心等待审核!审核通过后，可到我的活动中查看二维码!');
    				
				}
				else{
					if(data["fresh"]=='fresh'){
						alert('恭喜您成为该活动成员!',function(){
	    	  				window.location.href=context+"/community!findActivityDetail.action?activityId="+data["activityId"];
	 	 			   });
					}
					else
						alert('恭喜您成为该活动成员!');
					
				}
    		}
    		else{
    			if(data["isQrcode"]=='T'){
    				if(data["fresh"]=='fresh'){
    					 alert('恭喜您成为该活动成员!已生成二维码,请到我的活动中查看!',function(){
    	     	  				window.location.href=context+"/community!findActivityDetail.action?activityId="+data["activityId"];
    	  	 			   });
    				}
    				else
    					alert('恭喜您成为该活动成员!已生成二维码,请到我的活动中查看!');
    				
    			}
    			else{
    				if(data["fresh"]=='fresh'){
    					 alert('恭喜您成为该活动成员!',function(){
    	     	  				window.location.href=context+"/community!findActivityDetail.action?activityId="+data["activityId"];
    	  	 			   });
    				}
    				else
    					 alert('恭喜您成为该活动成员!');
    				
    			}
    		}
		}
		else{
			alert(data.msg);
		}
	}
}
var diag= null;
var addActivityUserFlag={};
function addActivityUser(title,doType,id,isCheck,isQrcode,fresh){
	if("${user.userId}" ==""){
		alert('请登录!');
		return;
	}
	
	if(addActivityUserFlag[id+""+doType]){
		alert('已加入成功!');
		return;
	}
	if(isCheck=='T'){
		//showPopWin(title,context+'/pages/community_upload_activity_card.jsp?isCheck='+isCheck+'&isQrcode='+isQrcode+'&doType='+doType+'&type=2&activityId='+id, 500, 200, apply_add_level_suss);
		diag = new Dialog();
		diag.Width = 500;
		diag.Height = 180;
		diag.Title = title;
		diag.URL = context+'/pages/community_upload_activity_card.jsp?fresh='+fresh+'&isCheck='+isCheck+'&isQrcode='+isQrcode+'&doType='+doType+'&type=2&activityId='+id;
		diag.show();
			
	}
	else{
		var data={};
		data["isCheck"]=isCheck
		data["isQrcode"]=isQrcode;
		data["doType"]=doType;
		data["activityId"]=id;
		data["reason"]="";
		data["type"]="";
		$.ajax({
			type : "POST",
			url : context+'/community!addActivityUser.action',
			dataType : 'json',
			data :data,
			success : function(msg, status) {
				if(msg.status == 200){
					addActivityUserFlag[id+""]=true;
					$('#enrolldiv'+id).html('已加入');
					if(isCheck =='T'){
						if(isQrcode =='T'){
							if(fresh=='fresh'){
								alert('加入成功,请耐心等待审核!审核通过后，可到我的活动中查看二维码!',function(){
			    	  				window.location.href=context+"/community!findActivityDetail.action?activityId="+id;
			    	 			});
							}
							else{
								alert('加入成功,请耐心等待审核!审核通过后，可到我的活动中查看二维码!');
							}
		    			
						}
						else{
							if(fresh=='fresh'){
								alert('恭喜您成为该活动成员!',function(){
			    	  				window.location.href=context+"/community!findActivityDetail.action?activityId="+id;
			    	 			});
							}
							else
								alert('恭喜您成为该活动成员!');
						}
		    		}
		    		else{
		    			if(isQrcode =='T'){
		    				if(fresh=='fresh'){
		    					alert('恭喜您成为该活动成员!已生成二维码,请到我的活动中查看!',function(){
			    	  				window.location.href=context+"/community!findActivityDetail.action?activityId="+id;
			    	 			});
		    				}
		    				else
		    				 alert('恭喜您成为该活动成员!已生成二维码,请到我的活动中查看!');
		    			}
		    			else{
		    				if(fresh=='fresh'){
		    					 alert('恭喜您成为该活动成员!',function(){
				    	  				window.location.href=context+"/community!findActivityDetail.action?activityId="+id;
				    	 		});
		    				}
		    				else
		    				 alert('恭喜您成为该活动成员!');
		    			}
		    		}
				}
				else{
					alert(msg.msg);
				}
			}
		});
		
	}
	 	
}