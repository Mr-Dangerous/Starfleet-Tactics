orbit_counter--
if (!instance_exists(ship_target)){
	scr_refind_target()
}

var _p_dir = point_direction(x, y, ship_target.x, ship_target.y)
var  _distance_to_target = point_distance(x, y, ship_target.x, ship_target.y)
var _angle_of_attack = 90
if (_distance_to_target > basic_attack_range * .8){
	_angle_of_attack -= 15	
}
if (_distance_to_target < basic_attack_range * .5){
	_angle_of_attack +=15
}
desired_direction = _p_dir+ (orbit_direction*_angle_of_attack)
desired_motion += acceleration_rate

timeline_position = 1

if (orbit_counter <= 0){
	timeline_index = scr_select_timeline()
	timeline_position = 0
}
if (weapons_ready){
	timeline_index = scr_select_timeline()
	timeline_position = 0
}