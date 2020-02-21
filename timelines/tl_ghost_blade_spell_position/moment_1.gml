///@desc check to see if ship is lined up to boost

target_x = ship_target.x
target_y = ship_target.y
turn_speed = base_turn_speed*5
desired_direction = point_direction(x, y, target_x, target_y)

if (angle_difference(image_angle, desired_direction) < 2){
	timeline_position = 2
} else {
	timeline_position = 0
}