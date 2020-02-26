///@param ship_looking_for_target
var _ship = argument0
var _ship_target = noone
var _distance_to_target = 0
var _enemy_squad_list = scr_return_enemy_squad_list()
for (var i = 0; i < ds_list_size(_enemy_squad_list); i++){
	var _squad = _enemy_squad_list[|i]
	for (var j = 0; j < ds_list_size(_squad); j++){
		var _new_target = _squad[|j]
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

return _ship_target






var _target_assigned = false
var _number_of_enemies_in_squad = ds_list_size(_enemy_ships_in_squad)
for (var i=0; i < _number_of_enemies_in_squad; i++){
	var _enemy_ship = _enemy_ships_in_squad[|i]
	if (instance_exists(_enemy_ship)){
		var _number_of_enemies_targeting_ship = ds_list_size(_enemy_ship.enemy_ships_targeting)
		if (_number_of_enemies_targeting_ship = 0){
			//assign this ship as a target
			_target_assigned = true
			_ship_target = _enemy_ship
	
		}
	}
}
if (!_target_assigned){
	var _enemy_ships_remaining = ds_list_size(_enemy_ships_in_squad)
	if ( _enemy_ships_remaining > 0){
		var _random_seed = irandom(_number_of_enemies_in_squad-1)
		var _ship_target = ds_list_find_value(_enemy_ships_in_squad, _random_seed)
		
	}
		
}

if (instance_exists(_ship_target)){
	ds_list_add(_ship_target.enemy_ships_targeting, _ship)
}

return _ship_target