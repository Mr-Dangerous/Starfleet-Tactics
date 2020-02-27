///@desc intialize vars
if (!instance_exists(ship_target)){
	if (basic_attack_targets_squads){
		ship_target = scr_return_ship_target(basic_attack_targeting_behavior, TARGET_LOWEST_ARMOR, squad_target)
	} else {
		ship_target = scr_return_ship_target(basic_attack_targeting_behavior, TARGET_LOWEST_ARMOR, IGNORE_SQUADS)
	}
}
desired_direction = point_direction(x, y, ship_target.x, ship_target.y)
desired_motion += acceleration_rate