///@desc check to see if movement is done

evasion_counter--
desired_direction = evade_direction
desired_motion +=acceleration_rate
if (evasion_counter <= 0){
	timeline_position = 100
} else {
	timeline_position = 3
}