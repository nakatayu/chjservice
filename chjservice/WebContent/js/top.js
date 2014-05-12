function a(x,y){
	l = $('#main_content').offset().left;
	w = $('#main_content').width();
	$('#tbox').css('left',(l + w + x) + 'px');
	$('#tbox').css('bottom',y + 'px');
}
function b(){

	
//	h = $(document.body).height();
//	t = $(document.body).scrollTop();
//
//	if(t > h){
//		$('#gotop').fadeIn('slow');
//	}else{
//		$('#gotop').fadeOut('slow');
//	}
	$('#gotop').fadeIn('slow');
}

     

