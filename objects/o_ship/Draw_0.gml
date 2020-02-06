/// @description Insert description here
// You can write your code in this editor

#region pre draw_self() - universal graphics that appear under the ship
	
//Thrusters
if (speed > 0){
	var _exhaust_list = graphic_resource_array[EXHAUST_OFFSETS] 
	var _exhaust_sprite_number = ds_list_size(_exhaust_list)
	for (var i = 0; i < _exhaust_sprite_number; i++){
		var _individual_exhaust_array = ds_list_find_value(_exhaust_list, i)
		var _x = x+ lengthdir_x(_individual_exhaust_array[GRAPHIC_LENGTH_OFFSET],_individual_exhaust_array[GRAPHIC_DIRECTION_OFFSET]+image_angle)
		var _y = y+ lengthdir_y(_individual_exhaust_array[GRAPHIC_LENGTH_OFFSET],_individual_exhaust_array[GRAPHIC_DIRECTION_OFFSET]+image_angle)
		var _s = _individual_exhaust_array[SPRITE_IMAGE_SCALE]
		var _sprite = _individual_exhaust_array[SPRITE_INDEX]
		draw_sprite_ext(_sprite, 0, _x, _y, _s, _s, image_angle, c_white, 1)
	}
}
	
	
#endregion

draw_self()

#region post draw_self() - universal graphics that appear over the ship

#endregion

