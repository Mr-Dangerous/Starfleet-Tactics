if (!instance_exists(ship_target)){
	exit
}

var _lead_target_x = ship_target.x //obv needs to change
var _lead_target_y = ship_target.y

desired_direction = point_direction(x, y, _lead_target_x, _lead_target_y)
basic_attack_speed_counter--