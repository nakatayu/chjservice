$.fn.getHexBackgroundColor = function() { 
	var rgb = $(this).css('background-color'); 
	if(rgb.indexOf('#')>-1){
		return rgb;
	}
		rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/); 
		rgb= "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
		function hex(x) {
			return ("0" + parseInt(x).toString(16)).slice(-2);
		}
	return rgb; 
}
