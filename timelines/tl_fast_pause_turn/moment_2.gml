///@desc check to satisfy conditions
desired_direction = point_direction(x, y, ship_target.x, ship_target.y)
desired_motion -= acceleration_rate*2
evasion_counter--
var _timeline_selected = false
if (angle_difference(image_angle, desired_direction) < 5){
	timeline_position = 0
	timeline_index = tl_fire_basic_attack
	_timeline_selected = true
}
if (evasion_counter <= 0 and !_timeline_selected){
	timeline_position = 0
	timeline_index = scr_select_timeline()
	_timeline_selected = true
}

if (!_timeline_selected){
	timeline_position = 1	
}
