///@desc turn towards target
if (!instance_exists(ship_target)){
	ship_target = scr_return_ship_target(TARGET_FURTHEST, TARGET_LOWEST_ARMOR, IGNORE_SQUADS)
}
desired_direction = point_direction(x, y, ship_target.x, ship_target.y)

