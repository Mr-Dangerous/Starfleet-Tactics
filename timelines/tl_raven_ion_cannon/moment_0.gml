///@desc acquire new vars and turn
secondary_ship_target = scr_return_ship_target(TARGET_NEAREST, TARGET_LOWEST_ARMOR, IGNORE_SQUADS)
desired_direction = point_direction(x, y, secondary_ship_target.x, secondary_ship_target.y)
desired_motion = 0


