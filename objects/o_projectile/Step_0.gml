/// @description Insert description here

//effects
if(rotate){
	switch(rotate_case){
		case 1:
		image_angle +=15
		break;
		
		case 2:
		image_angle -=15
		break;
	}
}
if (flip){
	switch(flip_case){
		case 1:
		image_yscale *= -1
		break;
	}
}





duration--

if (duration < 10){
	var _image_alpha = duration/10
	image_alpha = _image_alpha
}
if (duration <= 0){
	instance_destroy()
}



//package it up for the network draw event!
var _networking_sprite_array = [sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha]
ds_list_add(sprite_list, _networking_sprite_array)


