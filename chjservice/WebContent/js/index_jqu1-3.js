/* ------------------------------------------------------------------------
	www.lanrentuku.com
------------------------------------------------------------------------- */

var n=0;
var showNum = document.getElementById("num");
function Mea(value){
	n=value;
	setBg(value);
	plays(value);
}
function setBg(value){
	for(var i=0;i<3;i++){
	   if(value==i){
				if(document.getElementById("a"+value) !=null)
	              document.getElementById("a"+value).className='act';      
			}	else{	
			   if(document.getElementById("a"+i) !=null)
			      document.getElementById("a"+i).className='nor';
			}  
	} 
}
function plays(value){ 
		 for(i=0;i<4;i++){
			  if(i==value){	
				if(document.getElementById("pc_"+value) !=null)			  
					document.getElementById("pc_"+value).style.display="block";
			  	//alert(document.getElementById("pc_"+value).style.display)
			  }else{
			     if(document.getElementById("pc_"+i) !=null)
			        document.getElementById("pc_"+i).style.display="none";			    
			  }			
		}	
}


function clearAuto(){clearInterval(autoStart)}
function setAuto(){autoStart=setInterval("auto(n)", 30000)}
function auto(){
	n++;
	if(n>2)n=0;
	Mea(n);
} 
function sub(){
	n--;
	if(n<0)n=2;
	Mea(n);
} 
setAuto(); 