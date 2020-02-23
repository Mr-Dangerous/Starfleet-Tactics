reinforce_shields_counter--
desired_motion -= acceleration_rate
desired_direction = image_angle
if (reinforce_shields_counter <= 0){
	reinforce_shields = false
	companion_shield_object.reinforce_shields = false
	timeline_index = scr_select_timeline()
	timeline_position = 0
} else {
	timeline_position = 1
}