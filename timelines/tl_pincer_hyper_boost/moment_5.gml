///@desc check dash
desired_direction = point_direction(x, y, target_x, target_y)
desired_motion = acceleration_rate
if (point_distance(x, y, target_x, target_y) < 25 or hyper_boost_counter <= 0){
	
	timeline_position = 6
	if (max_speed > base_max_speed){
	max_speed -= .2
	}
	if (max_speed < base_max_speed){
		max_speed = base_max_speed
	}
	
} else {
	timeline_position = 4
	hyper_boost_counter--
}