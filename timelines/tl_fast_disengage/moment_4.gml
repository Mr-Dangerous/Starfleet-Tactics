///@desc check to see if movement is done

evasion_counter--
desired_direction = evade_direction
desired_motion +=acceleration_rate
if (evasion_counter <= 0){
	timeline_index = scr_select_timeline()
	timeline_position = 0
} else {
	timeline_position = 3
}