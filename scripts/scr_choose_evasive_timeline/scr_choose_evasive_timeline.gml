///@param ship_class

var ship_type = argument0
var _return_script = 0
switch (ship_type){
	case "fast":
		_return_script = choose(tl_fast_disengage,tl_fast_hard_turn_loop, tl_fast_assist_ally, tl_fast_zig_zag)
	break;
	
	case "medium":
		_return_script = choose(tl_fast_disengage,tl_fast_hard_turn_loop)
	break;
	
	case "slow":
		_return_script = choose(tl_fast_disengage,tl_fast_hard_turn_loop)
	break;
}

return _return_script