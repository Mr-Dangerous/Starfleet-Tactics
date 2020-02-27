if (!instance_exists(ship_target)){
	timeline_index = scr_select_timeline()
	timeline_position = 0
	exit
}

var _lead_target_x = ship_target.x //obv needs to change
var _lead_target_y = ship_target.y

desired_direction = point_direction(x, y, _lead_target_x, _lead_target_y)
basic_attack_speed_counter--

if (basic_attack_speed_counter <= 0){
	basic_attack_speed_counter = basic_attack_speed_interval
	basic_attack_thermal_capacity_used += basic_attack_thermal_unit_cost
	scr_fire_basic_attack(ship_target)
}

if (basic_attack_thermal_capacity_used + basic_attack_thermal_unit_cost > basic_attack_base_thermal_capacity){
	
	weapons_ready = false
	basic_attack_coolant_counter = 0
	timeline_position = 0
	timeline_index = scr_select_timeline()
} else {
	timeline_position = 1
}