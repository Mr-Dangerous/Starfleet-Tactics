///@desc check to see if ship is lined up to boost

target_x = ship_target.x
target_y = ship_target.y
ship_steering_force = base_ship_steering_force*5
desired_direction = point_direction(x, y, target_x, target_y)

if (angle_difference(image_angle, desired_direction) < 2){
	timeline_position = 2
} else {
	timeline_position = 0
}