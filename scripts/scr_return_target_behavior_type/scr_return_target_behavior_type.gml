///@param behavior_string

//beahvior string is fetched from the ship or turret map.

var _behavior_string = argument0
var _return_behavior = -1
switch(_behavior_string){
	case "Nearest":
	_return_behavior = TARGET_NEAREST
	break;
	case "Furthest":
	_return_behavior = TARGET_FURTHEST
	break;
}

return _return_behavior