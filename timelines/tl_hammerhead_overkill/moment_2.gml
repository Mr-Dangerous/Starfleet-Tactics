var _direction_to_target = point_direction(x, y, target_x, target_y)
desired_direction = _direction_to_target
if (abs(angle_difference(image_angle, desired_direction)) < 3){
	timeline_position = 3
	override_direction = image_angle
} else {
	timeline_position = 1
}