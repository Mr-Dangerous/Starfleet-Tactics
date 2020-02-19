///@desc intialize vars
//first check to see which direction has more enemies, left or right
evasion_counter = 0
target_x = reference_squad.x
target_y = reference_squad.y
evade_direction = point_direction(x, y, reference_squad.x, reference_squad.y) + irandom_range(-35, 35)
if (ds_list_size(enemy_ships_targeting) > 0){
	for (var i = 0; i < ds_list_size(enemy_ships_targeting); i++){
		var _enemy_ship_targeting = enemy_ships_targeting[|i]
		var _direction = point_direction(_enemy_ship_targeting.x, _enemy_ship_targeting.y, x, y)
		var _correction = sign(angle_difference(evade_direction, _direction))*5 
		evade_direction+= _correction
	}
} 
desired_direction = evade_direction


