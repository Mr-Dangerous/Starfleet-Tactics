///@desc find target
//get the enemy list
var _enemy_ship_list = ds_list_create()
if (battle_player_number = 1){
	

	for (var _m=0; _m < ds_list_size(battle_manager.player_2_squads); _m++){
		var _squad = battle_manager.player_2_squads[|_m]
		for (var j = 0; j < ds_list_size(_squad); j++){
			var _ship = _squad[j]
			ds_list_add(_enemy_ship_list, _ship)
		}
	}
}
if (battle_player_number = 2){
	
	for (var i = 0; i < ds_list_size(battle_manager.player_1_squads); i++){
		var _squad = battle_manager.player_1_squads[|i]
		for (var j = 0; j < ds_list_size(_squad); j++){
			var _ship = _squad[j]
			ds_list_add(_enemy_ship_list, _ship)
		}
	}
}
var _targeted_ship = _enemy_ship_list[|0]
var _distance_to_ship = point_distance(x, y, _targeted_ship.x, _targeted_ship.y)

for (var i = 1; i < ds_list_size(_enemy_ship_list); i++){
	var _new_target = _enemy_ship_list[|i]
	var _distance_to_new_target = point_distance(x, y, _new_target.x, _new_target.y)
	if (_distance_to_new_target > _distance_to_ship){
		_targeted_ship = _new_target
		_distance_to_ship = _distance_to_new_target
	}
}
ship_target = _targeted_ship



ds_list_destroy(_enemy_ship_list)