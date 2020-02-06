/// @description Insert description here
// You can write your code in this editor

#region pre draw_self() - universal graphics that appear under the ship
	
//Thrusters
if (speed > 0){
	var _exhaust_list = graphic_resource_array[EXHAUST_OFFSETS] 
	var _exhaust_number = ds_list_size(_exhaust_list)
	var _reference_exhaust = ds_list_find_value(_exhaust_list, 0)
	var _exhaust_sprite_size = sprite_get_number(_reference_exhaust[SPRITE_INDEX])
	
	var _image_speed_multiplier = 3 
	var _sub_image_reset_number = (_image_speed_multiplier * _exhaust_sprite_size)
	thrust_counter++
	if (thrust_counter > _sub_image_reset_number){
		thrust_counter = 0
	}
	var _sub_image = floor(thrust_counter/_image_speed_multiplier)
	var _x_scale_multiplier = floor(thrust_counter%8)/2
	if (_x_scale_multiplier = 3) _x_scale_multiplier = 1
	var _x_scale_adjuster = .1*(_x_scale_multiplier)
	
		
	for (var i = 0; i < _exhaust_number; i++){
		var _individual_exhaust_array = ds_list_find_value(_exhaust_list, i)
		var _x = x+ lengthdir_x(_individual_exhaust_array[GRAPHIC_LENGTH_OFFSET],_individual_exhaust_array[GRAPHIC_DIRECTION_OFFSET]+image_angle)
		var _y = y+ lengthdir_y(_individual_exhaust_array[GRAPHIC_LENGTH_OFFSET],_individual_exhaust_array[GRAPHIC_DIRECTION_OFFSET]+image_angle)
		var _x_scale = _individual_exhaust_array[SPRITE_IMAGE_SCALE]+_x_scale_adjuster
		var _y_scale = _individual_exhaust_array[SPRITE_IMAGE_SCALE]
		var _sprite = _individual_exhaust_array[SPRITE_INDEX]
		draw_sprite_ext(_sprite, _sub_image, _x, _y, _x_scale, _y_scale, image_angle, c_white, 1)
	}
} else {
	thrust_counter = 0
}

//Effects
if (has_effects){
	var _effect_list = graphic_resource_array[EFFECT_OFFSETS] 
	var _effect_number = ds_list_size(_effect_list)
	
	
	for (var i = 0; i < _effect_number; i++){
		var _individual_effect_array = ds_list_find_value(_effect_list, i)
		if (_individual_effect_array != "null"){
			var _x = x+ lengthdir_x(_individual_effect_array[GRAPHIC_LENGTH_OFFSET],_individual_effect_array[GRAPHIC_DIRECTION_OFFSET]+image_angle)
			var _y = y+ lengthdir_y(_individual_effect_array[GRAPHIC_LENGTH_OFFSET],_individual_effect_array[GRAPHIC_DIRECTION_OFFSET]+image_angle)
			var _x_scale = _individual_effect_array[SPRITE_IMAGE_SCALE]
			var _y_scale = _individual_effect_array[SPRITE_IMAGE_SCALE]
			var _sprite = _individual_effect_array[SPRITE_INDEX]
			draw_sprite_ext(_sprite, 0, _x, _y, _x_scale, _y_scale, image_angle, c_white, 1)
		}
	}
	
}
	
	
#endregion

draw_self()

#region post draw_self() - universal graphics that appear over the ship

#endregion

