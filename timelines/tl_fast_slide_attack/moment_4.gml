///@desc attack_conditions_check
var _lead_target_x = ship_target.x //obv needs to change
var _lead_target_y = ship_target.y

var _direction_to_face = point_direction(x, y, _lead_target_x, _lead_target_y)
var _distance_to_target_ship = point_distance(x, y, ship_target.x, ship_target.y)

scr_turn_to_face_direction(_direction_to_face)
if (abs(angle_difference(image_angle, _direction_to_face)) < 5 and _distance_to_target_ship < basic_attack_range){
	attack_conditions_met = true
}

if (attack_conditions_met = true){
	timeline_position = 5
	abort_counter = 0
} else {
	timeline_position =4
	abort_counter++
}

if(abort_counter >= 15){
	timeline_position = 100
}
