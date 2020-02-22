///@param ship_looking_for_target
var _ship = argument0
var _ship_target = noone
var _enemy_ships_in_squad = squad_target.ships_in_squad
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