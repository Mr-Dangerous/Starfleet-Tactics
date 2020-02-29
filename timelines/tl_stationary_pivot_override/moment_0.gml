if (instance_exists(ship_target)){
	desired_direction = point_direction(x, y, ship_target.x, ship_target.y)
} else {
	ship_target = scr_return_ship_target(TARGET_NEAREST, TARGET_LOWEST_ARMOR, squad_target)
}