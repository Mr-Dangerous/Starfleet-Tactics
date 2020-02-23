///@desc check for completion

desired_direction = new_direction
desired_motion += acceleration_rate
flyby_counter--

if (flyby_counter <= 0){
	timeline_index = scr_select_timeline()
	timeline_position = 0
} else {
	timeline_position = 1
}