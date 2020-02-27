///@desc execute movement
if (!instance_exists(ship_target)){
	//break the timeline
	timeline_position = 0
	timeline_index = scr_select_timeline()
} else {
	desired_direction = point_direction(x, y, ship_target.x, ship_target.y)
	desired_motion += acceleration_rate
}

