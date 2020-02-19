///@desc check to see if evasion needs to continue or if it is over

evasion_counter--
desired_direction = new_direction
desired_motion +=acceleration_rate
timeline_position = 2

if (evasion_counter < 0){
	evasion_counter = 30
	timeline_position = 1
	number_of_evades--
}
if (number_of_evades <= 0 or ds_list_size(enemy_ships_targeting) = 0){
	timeline_position = 0
	timeline_index = scr_choose_timeline_random(basic_attack_patterns)
}
