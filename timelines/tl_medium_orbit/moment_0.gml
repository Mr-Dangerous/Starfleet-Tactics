orbit_direction = choose (1, -1)
orbit_counter = 120

if (!instance_exists(ship_target)){
	scr_refind_target()
}

var _p_dir = point_direction(x, y, ship_target.x, ship_target.y)
desired_direction = _p_dir+(orbit_direction*90)
desired_motion += acceleration_rate