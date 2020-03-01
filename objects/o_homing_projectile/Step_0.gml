/// @description Insert description here
// You can write your code in this editor
if (instance_exists(ship_target)){
	desired_direction = point_direction(x, y, ship_target.x, ship_target.y)
	if (point_distance(x, y, ship_target.x, ship_target.y) < 100){
		turn_speed = 15
	}
}
if (!instance_exists(ship_target)){
	target_dead_false = true
	instance_destroy()
}
scr_turn_to_face_direction(desired_direction)
motion_add(desired_direction, acceleration_rate)
scr_limit_speed()