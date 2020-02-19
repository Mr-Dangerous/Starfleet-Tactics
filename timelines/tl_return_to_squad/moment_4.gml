///@desc check to see if there

desired_direction = point_direction(x, y, reference_squad.x, reference_squad.y)
desired_motion += acceleration_rate

if (point_distance(x, y, reference_squad.x, reference_squad.y) < 25){
	timeline_position = 5
}