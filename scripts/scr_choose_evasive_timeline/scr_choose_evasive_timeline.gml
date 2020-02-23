///@param ship_class

var ship_type = argument0
var _return_script = 0
switch (ship_type){
	case SPEED_CLASS_FAST:
	//if distance is less than....
	var _distance_to_target = point_distance(x, y, ship_target.x, ship_target.y)
	if (_distance_to_target > basic_attack_range * .7){
		_return_script = choose (tl_fast_flyby)
	}
	if (_distance_to_target <= basic_attack_range * .7){
		_return_script = choose(tl_fast_disengage,tl_fast_hard_turn_loop, tl_fast_zig_zag)
	}
	if (_distance_to_target <= 75){
		_return_script = choose(tl_fast_disengage)
	}
		
	//if distance is greater than....
	break;
	
	case SPEED_CLASS_MEDIUM:
		_return_script = choose(tl_fast_disengage,tl_fast_hard_turn_loop)
	break;
	
	case SPEED_CLASS_SLOW:
		_return_script = choose(tl_slow_reinforce_shields)
	break;
}

return _return_script