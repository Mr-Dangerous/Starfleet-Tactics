///@param TARGETING_BEHAVIOR
///@param TIE_BREAKER_BEHAVIOR
///@param squad




/*
The purpose of this script is to unify all targeting scripts.
use the TARGET_(x) macros.
IGNORE_SQUAD means the targetign algo can occur outside of the currently targteted squad.


*/

var _targeting_case = argument0
var _tiebreaker_case = argument1
var _squad_to_target = argument2

var _ship_target = noone
var _enemy_squad_list = scr_return_enemy_squad_list()
switch(_targeting_case){
	#region TARGET_NEAREST
	case TARGET_NEAREST:
	var _distance_to_target = 0
	if (IGNORE_SQUADS){
		for (var i = 0; i < ds_list_size(_enemy_squad_list); i++){
			var _squad = _enemy_squad_list[|i]
			for (var j = 0; j < ds_list_size(_squad.ships_in_squad); j++){
				var _new_target = _squad.ships_in_squad[|j]
				if (_ship_target = noone){
					_ship_target = _new_target
					_distance_to_target = point_distance(x, y, _ship_target.x, _ship_target.y)
				} else {
					var _distance_to_new_target = point_distance(x, y, _new_target.x, _new_target.y)
					if (_distance_to_new_target < _distance_to_target){
						_ship_target = _new_target
						_distance_to_target = _distance_to_new_target
					}
				}
			}
		}
	} else {
		for (var j = 0;  j < ds_list_size(_squad_to_target); j++){
			var _new_target = _squad_to_target.ships_in_squad[|j]
			if (_ship_target = noone){
					_ship_target = _new_target
					_distance_to_target = point_distance(x, y, _ship_target.x, _ship_target.y)
				} else {
				var _distance_to_new_target = point_distance(x, y, _new_target.x, _new_target.y)
				if (_distance_to_new_target < _distance_to_target){
					_ship_target = _new_target
					_distance_to_target = _distance_to_new_target
				}
			}
		}
		
	}
	
	break;
	#endregion
	
	#region Target_furthest
	case TARGET_FURTHEST:
	var _distance_to_target = 0
	var _max_distance = basic_attack_range * 1.5
	if (IGNORE_SQUADS){
		for (var i = 0; i < ds_list_size(_enemy_squad_list); i++){
			var _squad = _enemy_squad_list[|i]
			for (var j = 0; j < ds_list_size(_squad.ships_in_squad); j++){
				var _new_target = _squad.ships_in_squad[|j]
				if (_ship_target = noone){
					_ship_target = _new_target
					_distance_to_target = point_distance(x, y, _ship_target.x, _ship_target.y)
				} else {
					var _distance_to_new_target = point_distance(x, y, _new_target.x, _new_target.y)
					if (_distance_to_new_target > _distance_to_target and _distance_to_new_target < _max_distance){
						_ship_target = _new_target
						_distance_to_target = _distance_to_new_target
					}
				}
			}
		}
	} else {
		for (var j = 0; j < ds_list_size(_squad_to_target.ships_in_squad); j++){
				var _new_target = _squad_to_target.ships_in_squad[|j]
				if (_ship_target = noone){
					_ship_target = _new_target
					_distance_to_target = point_distance(x, y, _ship_target.x, _ship_target.y)
				} else {
					var _distance_to_new_target = point_distance(x, y, _new_target.x, _new_target.y)
					if (_distance_to_new_target > _distance_to_target){
						_ship_target = _new_target
						_distance_to_target = _distance_to_new_target
					}
				}
			}
	}
	
	break;
	#endregion
	case TARGET_HIGHEST_ARMOR:
	
	
	break;
	case TARGET_LOWEST_ARMOR:
	
	
	break;
	case TARGET_HIGHEST_SHIELD:
	
	
	break;
	case TARGET_LOWEST_SHIELD:
	
	
	break;
	case TARGET_HIGHEST_THREAT:
	
	
	break;
	case TARGET_LOWEST_THREAT:
	
	
	break;
}




return _ship_target
