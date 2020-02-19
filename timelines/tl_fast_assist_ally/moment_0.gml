for (var i = 0; i < ds_list_size(reference_squad.ships_in_squad); i++){
	var _allied_ship = reference_squad.ships_in_squad[|i]
	if (instance_exists(_allied_ship)){
		var _allied_ship_target = _allied_ship.ship_target
		if (instance_exists(_allied_ship_target)){
			var _direction_to_allied_target = point_direction(x, y, _allied_ship_target.x, _allied_ship_target.y)
			var _distance_to_allied_target = point_distance(x,y, _allied_ship_target.x, _allied_ship_target.y)
			if (abs(angle_difference(image_angle, _direction_to_allied_target)) < 15 and
				_distance_to_allied_target < basic_attack_range / 4){
				var _index = ds_list_find_index(ship_target.enemy_ships_targeting, self)
				ds_list_delete(ship_target.enemy_ships_targeting, _index)
				ship_target = _allied_ship_target
				ds_list_add(ship_target.enemy_ships_targeting, self)
				break;
			}
		}
	}
		
}

timeline_position = 0
timeline_index = scr_choose_timeline_random(basic_attack_patterns)