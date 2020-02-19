///@desc check to see if evasive conditions are met

desired_direction = evade_direction
desired_motion += acceleration_rate

if (speed >= max_speed*.9 and abs(angle_difference(image_angle, evade_direction) < 5)){
	timeline_position = 3
	evasion_counter = irandom_range(60, 120)//maybe minus pilot reflexes
} else {
	timeline_position = 2
}