desired_direction = point_direction(x, y, battle_manager.x, battle_manager.y)
desired_motion += acceleration_rate
return_timer--
if (return_timer <= 0){
	timeline_index = scr_select_timeline()
	timeline_position = 0
} else {
	timeline_position = 1
}

draw_line(x, y, battle_manager.x, battle_manager.y)