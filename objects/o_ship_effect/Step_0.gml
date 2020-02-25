/// @description Insert description here
// You can write your code in this editor


if (rotate){
	
	if (rotate_effect > 359){
		rotate_effect = 0
	}
	switch(rotate_case){
		case 1:
			rotate_effect += 2
		break;
		
		case 2:
			rotate_effect +=-5
		break;
		
	}
}
if (glow){
	glow_effect = glow_counter/1000
	if (glow_counter >= 1000){
		glow_direction = -1
	}
	if (glow_counter <= 0){
		glow_direction = 1
	}
		
	switch(glow_case){
		case 1:
			glow_counter += 2 * glow_direction
			glow_effect = clamp(glow_effect, .15, 1)
		break;
		case 2: 
			glow_counter += 5*glow_direction
			glow_effect = clamp(glow_effect, 0, .5)
		break;
	}
}

var _x_offset = lengthdir_x(graphic_length_offset_from_origin, image_angle + graphic_direction_offset_from_origin)
var _y_offset = lengthdir_y(graphic_length_offset_from_origin, image_angle + graphic_direction_offset_from_origin)
x = paired_ship.x + _x_offset
y = paired_ship.y + _y_offset
image_angle = paired_ship.image_angle + rotate_effect
image_alpha = 1 - glow_effect
image_xscale = image_scale
image_yscale = image_scale

/*var _networking_sprite_array = [sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha]
ds_list_add(sprite_list, _networking_sprite_array)
*/	