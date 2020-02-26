///@desc turn towards target check
desired_direction = point_direction(x, y, ship_target.x, ship_target.y)
if (abs(angle_difference(image_angle, desired_direction)) < 1){
	timeline_position = 3
} else {
	timeline_position = 1
}