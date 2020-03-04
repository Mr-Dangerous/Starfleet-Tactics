///@desc check target
ship_target = scr_return_ship_target(TARGET_FURTHEST, TARGET_LOWEST_ARMOR, IGNORE_SQUADS)
speed = 0
desired_direction = point_direction(x, y, ship_target.x, ship_target.y)

if (abs(angle_difference(image_angle, desired_direction)) < 3){
	timeline_position = 2
	target_x = ship_target.x
	target_y = ship_target.y
	can_collide = true
	max_speed = base_max_speed*3
	acceleration_rate = base_acceleration_rate * 3
	collide_force = max_speed * (caster_level*3) * 2
} else {
	timeline_position = 0
}