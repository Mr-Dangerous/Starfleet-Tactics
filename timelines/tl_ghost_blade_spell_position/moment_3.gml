///@desc check for move towards target

target_x = ship_target.x
target_y = ship_target.y
turn_speed = base_turn_speed
desired_direction = point_direction(x, y, target_x, target_y)
max_speed = base_max_speed * 3
acceleration_rate = base_acceleration_rate*3
desired_motion = acceleration_rate

if (point_distance(x, y, target_x, target_y) < 50){
	companion_spell_manager.timeline_position = 0
	companion_spell_manager.timeline_index = tl_ghost_blade_spell
	companion_spell_manager.timeline_running = true
	timeline_position = 0
	
	timeline_index = scr_choose_timeline_random(basic_attack_patterns)
	max_speed = base_max_speed
	acceleration_rate = base_acceleration_rate
} else {
	timeline_position = 2
}