///@desc turn towards target check
if (!instance_exists(ship_target)){
	ship_target = scr_return_ship_target(TARGET_FURTHEST, TARGET_LOWEST_ARMOR, IGNORE_SQUADS)
}
desired_direction = point_direction(x, y, ship_target.x, ship_target.y)
if (abs(angle_difference(image_angle, desired_direction)) < 1){
	timeline_position = 3
} else {
	timeline_position = 1
}