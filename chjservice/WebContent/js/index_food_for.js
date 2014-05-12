/* ------------------------------------------------------------------------
	底部食谱循环显示
------------------------------------------------------------------------- */
var foodIndex=0;
var foodPageMax=3;
var preFoodIndex=null;
function showFood(value){
	foodIndex=value;
	setSelectedFoodTitle(value);
	playsFood(value);
}
function setSelectedFoodTitle(value){
	for(var i=0;i<foodPageMax;i++){
	   if(value==i){
				if(document.getElementById("food"+value) !=null)
	              document.getElementById("food"+value).src=context+"/images/dot_sel.png";     
			}	else{	
			   if(document.getElementById("food"+i) !=null)
				   document.getElementById("food"+i).src=context+"/chjservice/images/dot.png"; 
			}  
	} 
}
function playsFood(value){ 
		 for(var i=0;i<foodPageMax;i++){
			  if(i==value){	
				if(document.getElementById("foodCon"+value) !=null)	
			  	    $('#foodCon'+value).fadeIn(800);
			  }else{
			     if(document.getElementById("foodCon"+i) !=null)
			    	 $('#foodCon'+i).hide();	    
			  }			
		}	
}


function clearFoodAuto(){clearInterval(autoFoodStart);}
function setAutoFood(){$('#foodCon0').fadeIn(1000);autoFoodStart=setInterval("autoFood()", 3000);}
function autoFood(){
//	foodIndex++;
//	if(foodIndex>foodPageMax-1) foodIndex=0;
//	showFood(foodIndex);
	if(preFoodIndex!=null){
		foodIndex++;
		if(foodIndex>foodPageMax-1)
			foodIndex=0;

		  document.getElementById("food"+foodIndex).src=context+"/images/dot_sel.png";    
		  document.getElementById("food"+preFoodIndex).src=context+"/images/dot.png";  
		  document.getElementById("product"+foodIndex).src=context+"/images/dot_sel.png";    
		  document.getElementById("product"+preFoodIndex).src=context+"/images/dot.png"; 
		  
		 $('#foodCon'+foodIndex).fadeIn(2000);
		 $('#foodCon'+preFoodIndex).hide();
		 //$('#productCon'+foodIndex).fadeIn(2000);
		// $('#productCon'+preFoodIndex).hide();
		
		  preFoodIndex = foodIndex;
	}
	else{
		  document.getElementById("food1").src=context+"/images/dot_sel.png";    
		  document.getElementById("food0").src=context+"/images/dot.png";  
		//  document.getElementById("product1").src=context+"/images/dot_sel.png";    
		//  document.getElementById("product0").src=context+"/images/dot.png";  
		  preFoodIndex = 0;
		  
		  $('#foodCon1').show();
		  $('#foodCon1'+foodIndex).fadeIn(2000);
		 $('#foodCon0').hide();
		 
		//  $('#productCon1').show();
		//  $('#productCon1'+foodIndex).fadeIn(2000);
		// $('#productCon0').hide();
		
	}
} 
function showFood(index){
	if(preFoodIndex == index)
		return;
	foodIndex=index;
	if(preFoodIndex==null){
		preFoodIndex = 0;
		 
	}
	  document.getElementById("food"+foodIndex).src=context+"/images/dot_sel.png";    
	  document.getElementById("food"+preFoodIndex).src=context+"/images/dot.png";  
	//  document.getElementById("product"+foodIndex).src=context+"/images/dot_sel.png";    
	//  document.getElementById("product"+preFoodIndex).src=context+"/images/dot.png"; 
	    
	$('#foodCon'+preFoodIndex).fadeOut(200);
	$('#foodCon'+foodIndex).fadeIn(1800);
	
	$('#foodCon'+foodIndex).fadeIn(1800);
	 $('#foodCon'+preFoodIndex).fadeOut(200);
	// $('#productCon'+foodIndex).fadeIn(1800);
	// $('#productCon'+preFoodIndex).fadeOut(200);
	 
	preFoodIndex = foodIndex;

	
}
//setAutoFood(); 
