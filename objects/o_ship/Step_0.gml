/// @description 

switch(state){
	
	
	
	
	
	case ship.manual: // For debugging and checking graphics
	
	var _thrust =keyboard_check(ord("W"))
	var _reverse_thrust = keyboard_check(ord("S"))
	var _left_turn = keyboard_check(ord("A"))
	var _right_turn = keyboard_check(ord("D"))
	var _fire_weapons = keyboard_check_pressed(ord("Q"))
	var _use_ability = keyboard_check_pressed(ord("E"))
	var _speed_unlocked = keyboard_check(vk_lshift)

	//add motion
	var _motion_to_add = 0
	var _direction_change = 0
	if (_thrust or _reverse_thrust){
		if(_speed_unlocked){
			_motion_to_add = 5
			
		} else {
			_motion_to_add = (_thrust-_reverse_thrust)*acceleration_rate
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
