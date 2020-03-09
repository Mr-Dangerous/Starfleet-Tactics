///@param load/unload

var load_status = argument0

if (load_status = LOAD_MODULE){
	
	for (var i = 0; i < ds_list_size(ships_in_squad); i++){
		var _ship = ships_in_squad[|i]
		_ship.basic_attack_base_thermal_capacity += 10
	}
}

if (load_status = UNLOAD_MODULE){
	
	for (var i = 0; i < ds_list_size(ships_in_squad); i++){
		var _ship = ships_in_squad[|i]
		_ship.basic_attack_base_thermal_capacity -= 10
	}


}