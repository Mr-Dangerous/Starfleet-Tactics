///@param ship_class

var ship_type = argument0
var _return_script = 0
switch (ship_type){
	case SPEED_CLASS_FAST:
		_return_script = choose(tl_fast_disengage,tl_fast_hard_turn_loop, tl_fast_zig_zag)
	break;
	
	case SPEED_CLASS_MEDIUM:
		_return_script = choose(tl_fast_disengage,tl_fast_hard_turn_loop)
	break;
	
	case SPEED_CLASS_SLOW:
		_return_script = choose(tl_fast_disengage,tl_fast_hard_turn_loop)
	break;
}

return _return_script