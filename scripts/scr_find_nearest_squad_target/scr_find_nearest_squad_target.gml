///@param TARGET_PARAMETER
//use TARGET_NROMAL FOR TYPICAL TARGETING.

var _targeting_behavior = argument0

var _squad_target = noone // the ultimate reutrn value
var _battle_manager = instance_find(o_battle_manager, 0)
var _enemy_squad_list = 0
if (owner = 0){
	_enemy_squad_list = _battle_manager.player_2_squads
}
if (owner = 1){
	_enemy_squad_list = _battle_manager.player_1_squads
}

switch(_targeting_behavior){
	case TARGET_NORMAL:
	var _distance_to_target = 10000
	var _target = noone
	for (var i = 0; i < ds_list_size(_enemy_squad_list); i++){
		var _current_target = _enemy_squad_list[|i]
		var _distance_to_current_target = point_distance(x, y, _current_target.x, _current_target.y)
		if (_distance_to_current_target < _distance_to_target){
			_target = _current_target
		}
	}
	if (_target != noone){
		_squad_target = _target
	}
	break;
}

return _squad_target