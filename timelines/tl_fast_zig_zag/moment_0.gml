///@desc intialize vars
var _enemy_ships_on_tail = ds_list_size(enemy_ships_targeting)

if (_enemy_ships_on_tail > 0){
	var _enemy_ship = enemy_ships_targeting[|0]
	if (_enemy_ships_on_tail > 1){
		for (var i = 1; i < _enemy_ships_on_tail; i++){
			var _new_enemy_ship = enemy_ships_targeting[|i]
			var _distance_to_old_enemy = point_distance(x, y, _enemy_ship.x, _enemy_ship.y)
			var _distance_to_new_enemy = point_distance(x, y, _enemy_ship.x, _enemy_ship.y)
			if (_distance_to_old_enemy>_distance_to_new_enemy){
				_enemy_ship = _new_enemy_ship
			}
		}
	}
	evade_direction = point_direction(_enemy_ship.x, _enemy_ship.y, x, y)
	evasion_counter = 30
	number_of_evades = 3
} else {
	timeline_position = 0
	timeline_index = scr_choose_evasive_timeline("fast")
}
