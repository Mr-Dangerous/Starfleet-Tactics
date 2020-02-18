///@desc position_conditions_check
//repeat movement pattern and check to see if conditions are met
var _direction_to_target = point_direction(x, y, target_x, target_y) 
scr_turn_to_face_direction(_direction_to_target)
direction = image_angle
speed += acceleration_rate
scr_limit_speed()

//check to see if position conditions are met

var _distance_to_target = point_distance(x, y, ship_target.x, ship_target.y)
if (speed >= max_speed and _distance_to_target < basic_attack_range){
	position_conditions_met = true
	abort_counter = 0
}

if (position_conditions_met){
	timeline_position = 3
	abort_counter = 0
} else {
	timeline_position = 1
	abort_counter++
}
if (abort_counter >= 60){
	//abort the timeline and go straight to evasive options
	timeline_position = 100
}

