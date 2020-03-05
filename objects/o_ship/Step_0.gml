/// @description 

if (movement_override_counter > 0){
	movement_override_counter--
	if (movement_override_counter = 0){
		override_timeline = -1
		timeline_index = scr_select_timeline()
	}
}


turn_speed = ship_steering_force/ship_mass

if (generate_shields){
	if (reinforce_shields){
		companion_shield_object.timeline_index = tl_draw_reinforced_shields
	} else {
		companion_shield_object.timeline_index = tl_draw_shields
	}
	companion_shield_object.timeline_running = true
	companion_shield_object.timeline_position = 0
	
}
generate_shields = false

if (generate_physical_damage){
	generate_physical_damage = false
	_random_x = x+irandom_range(-32, 32)
	_random_y = y+irandom_range(-32, 32)
	var _damage = instance_create_layer(_random_x, _random_y, LAYER_EFFECTS_OVER, o_ship_damage_effect)
	_damage.sprite_index = s_normal_single_exhaust
	_damage.image_scale = image_scale
}



if (blind_counter > 0){
	blind_counter--
	basic_attack_coolant_counter--
	if (instance_exists(turret_1)){
		turret_1.basic_attack_coolant_counter--
	}
	if (instance_exists(turret_1)){
		turret_2.basic_attack_coolant_counter--
		
	}
	
	blind_effect = true
	if (blind_counter = 1){
		blind_effect = false
		blind_counter--
		
	}
}

switch(state){
	
	case ship.locked:
		var _x = reference_squad.x + lengthdir_x(formation_length_offset, reference_squad.direction + formation_direction_offset)
		var _y = reference_squad.y + lengthdir_y(formation_length_offset, reference_squad.direction + formation_direction_offset)
		x = _x
		y = _y
		image_angle = reference_squad.image_angle
		direction = reference_squad.direction
		
	break;
	
	case ship.patrolling:
		var _x = reference_squad.x + lengthdir_x(formation_length_offset, reference_squad.direction + formation_direction_offset)
		var _y = reference_squad.y + lengthdir_y(formation_length_offset, reference_squad.direction + formation_direction_offset)
		x = _x
		y = _y
		image_angle = reference_squad.direction
		direction = reference_squad.direction
	break;
	
	case ship.battle:
	abort_counter--
	if (abort_counter <= 0){
		timeline_index = scr_select_timeline()
		timeline_position = 0
	}
	squad_target = reference_squad.squad_target
	if (!instance_exists(squad_target)){
		state = ship.locked
		combat_state = ship.out_of_combat
		break;
	}
	
	if (basic_attack_coolant_counter < basic_attack_coolant_effectiveness){
		basic_attack_coolant_counter++
	}
	
	if (basic_attack_coolant_counter >= basic_attack_coolant_effectiveness){
		weapons_ready = true
	} else { 
		weapons_ready = false 
	}
	
	if (energy <= max_energy){
		energy+=.03
		if (energy > max_energy) energy = max_energy 
	}
	
	
	if (instance_exists(ship_target)){
		switch(combat_state){
			case ship.out_of_combat:  //approach the enemy
			desired_direction = point_direction(x, y, ship_target.x, ship_target.y)
			if (distance_to_point(ship_target.x, ship_target.y) > basic_attack_range){
				desired_motion += acceleration_rate
			}
			if (distance_to_point(ship_target.x, ship_target.y) < basic_attack_range){
				combat_state = ship.executing_timeline_attack
				timeline_index = scr_select_timeline()
				//TODO:  This can eventually be some kind of loop
				if (instance_exists(turret_1)){
					turret_1.state = ship.battle
				}
				if (instance_exists(turret_2)){
					turret_2.state = ship.battle
				}
			}
				
			break;
			
			case ship.executing_timeline_attack:
			if (timeline_running = false){
				timeline_running = true
				timeline_position = 0
			}
			if (!instance_exists(ship_target)){
				timeline_index = -1
				timeline_running = false
				timeline_position = 0
				state = ship.locked
				combat_state = ship.out_of_combat
			}
			break;
		}
	}

	scr_turn_to_face_direction(desired_direction)
	direction = image_angle
	motion_add(desired_direction, desired_motion)
	scr_limit_speed()
	
	break;
	
	
	
	
	
	
	
	
	
	
	
	
	
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
if (speed > 0.1){
		
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
//finally, add in the default sprite.
var _networking_sprite_array = [sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha]
ds_list_add(sprite_list, _networking_sprite_array)

for (var i = 0; i < ds_list_size(extra_sprite_list); i++){
	var _sprite = ds_list_find_value(extra_sprite_list, i)
	ds_list_add(sprite_list, _sprite)
	
}

	
#endregion

#region
if (double_click_timer > 0){
	double_click_timer--
	show_debug_message(double_click_timer)
}
#endregion

//post checks
if (armor <= 0){
	instance_destroy()
}