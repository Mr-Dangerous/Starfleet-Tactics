desired_direction = point_direction(x, y, battle_manager.x, battle_manager.y)
desired_motion += acceleration_rate
return_timer--

draw_line(x, y, battle_manager.x, battle_manager.y)