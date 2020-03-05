///@desc acquire new vars and turn
laser_ship_target = scr_return_ship_target(TARGET_NEAREST, TARGET_LOWEST_ARMOR, IGNORE_SQUADS)
desired_direction = point_direction(x, y, laser_ship_target.x, laser_ship_target.y)
desired_motion = 0


