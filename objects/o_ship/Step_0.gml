/// @description 
if (armor <= 0){
	instance_destroy()
}
switch(state){
	
	
	
	
	
	case ship.manual: // For debugging and checking graphics
	
	var _thrust = client.w_pressed
	var _reverse_thrust = client.s_pressed
	var _left_turn = client.a_pressed
	var _right_turn = client.d_pressed
	var _fire_weapons = client.q_pressed
	var _use_ability = client.e_pressed
	var _speed_unlocked = keyboard_check(vk_lshift)

	//add motion
	var _motion_to_add = 0
	var _direction_change = 0
	if (_thrust){
		if(_speed_unlocked){
			_motion_to_add = 5
			
		} else {
			_motion_to_add = (_thrust)*acceleration_rate
		}
	} else {
		speed -= acceleration_rate/2
		if (speed < 0){
			speed = 0
		}
	}
	
	if (_reverse_thrust){
		if (speed > 0){
		speed -= acceleration_rate*2
		}
		if (speed < 0){
			speed = 0
		}
		
	}
	if (_left_turn or _right_turn){
		_direction_change = (_left_turn - _right_turn)*turn_speed
	}
	if (_fire_weapons){
		scr_fire_basic_attack()	
	}
	if (_use_ability){
		if (spell_timeline_script != -1){
			show_debug_message("Timeline casting now!")
			script_execute(scr_cast_spell)
		}
	}

	image_angle += _direction_change
	direction = image_angle
	motion_add(direction, _motion_to_add)

	//limit speed
	if (!_speed_unlocked){
		if (speed > max_speed){
			speed = max_speed
		}
		if (speed < 0){
			speed = 0
		}
	}
	break;
	
	
	
}




//Drawing here, assembled into a list

#region pre draw_self() - universal graphics that appear under the ship
	
//Thrusters
if (speed > 0){
		
	thrust_length_multiplier = speed/max_speed
	thrust_length_multiplier = clamp(thrust_length_multiplier, .15, 1)
	

	var _exhaust_list = graphic_resource_array[EXHAUST_OFFSETS] 
	var _exhaust_number = ds_list_size(_exhaust_list)
	var _reference_exhaust = ds_list_find_value(_exhaust_list, 0)
	var _exhaust_sprite_size = sprite_get_number(_reference_exhaust[ASSET_INDEX])
	
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
		var _x_scale = (_individual_exhaust_array[SPRITE_IMAGE_SCALE]+_x_scale_adjuster) * thrust_length_multiplier
		var _y_scale = _individual_exhaust_array[SPRITE_IMAGE_SCALE]
		var _sprite = _individual_exhaust_array[ASSET_INDEX]
		if (image_number = 1){
			_sub_image = 0
		}
		var _sprite_array = [_sprite, _sub_image, _x, _y, _x_scale, _y_scale, image_angle, c_white, 1]
		ds_list_add(extra_sprite_list, _sprite_array)
		scr_console_add_message("extra sprite added!")
		
	}
} else {
	thrust_counter = 0
	max_thrust = 0
}
//finally, add int eh default sprite.
var _networking_sprite_array = [sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha]
ds_list_add(sprite_list, _networking_sprite_array)

for (var i = 0; i < ds_list_size(extra_sprite_list); i++){
	var _sprite = ds_list_find_value(extra_sprite_list, i)
	ds_list_add(sprite_list, _sprite)
	
}

	
#endregion
