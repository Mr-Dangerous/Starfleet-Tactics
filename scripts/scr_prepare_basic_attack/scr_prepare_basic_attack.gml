///@param target
var _target = argument0
if (_target = TARGET_ANY){
	if (basic_attack_speed_counter <= 0){
		basic_attack_speed_counter = basic_attack_speed_interval
		var _attack_cost = basic_attack_thermal_unit_cost
		if (first_attack = true){
			first_attack = false
			_attack_cost -= weapon_heatsink
		}
		if (_attack_cost < 0) _attack_cost = 0
		basic_attack_thermal_capacity_used += _attack_cost
		//determine criticla hit here too?
		scr_fire_basic_attack()
	}
} else {
	if (basic_attack_speed_counter <= 0){
		basic_attack_speed_counter = basic_attack_speed_interval
		var _attack_cost = basic_attack_thermal_unit_cost
		if (first_attack = true){
			first_attack = false
			_attack_cost -= weapon_heatsink
		}
		if (_attack_cost < 0) _attack_cost = 0
	
		basic_attack_thermal_capacity_used += _attack_cost
		//determine criticla hit here too?
		scr_fire_basic_attack(_target)
	}
}