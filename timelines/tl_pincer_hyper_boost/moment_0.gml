///@desc find target
ship_target = scr_return_ship_target(TARGET_FURTHEST, TARGET_LOWEST_ARMOR, IGNORE_SQUADS)
speed = 0
desired_direction = point_direction(x, y, ship_target.x, ship_target.y)
hyper_boost_counter = 60