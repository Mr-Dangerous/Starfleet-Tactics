///@desc check channel
thrust_length_multiplier += .1
if (thrust_length_multiplier > 3){
	thrust_length_multiplier = 3
}
speed = 0
desired_direction = image_angle
hyper_boost_counter--
if (hyper_boost_counter <= 60){
	timeline_position = 4
	hyper_boost_counter = 60
} else {
	timeline_position = 2
}