///@desc check to see if direction is correct

desired_direction = point_direction(x, y, target_x, target_y)

if (abs(angle_difference(image_angle, desired_direction)) < 3){
	timeline_position = 3
} else {
	timeline_position = 1
}