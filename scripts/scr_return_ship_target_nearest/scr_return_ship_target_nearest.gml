var _ship_target = noone
var _distance_to_target = 0
var _enemy_squad_list = scr_return_enemy_squad_list()
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

return _ship_target
