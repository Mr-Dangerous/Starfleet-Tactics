///@desc move to satisfy conditions
desired_direction = point_direction(x, y, ship_target.x, ship_target.y)
desired_motion -= acceleration_rate
evasion_counter--