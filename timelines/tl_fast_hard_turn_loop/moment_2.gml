///@desc check to see if evasive conditions are met

evade_direction = image_angle + 90*choose(-1, 1)
if (ds_list_size(enemy_ships_targeting) > 0){		
	var _enemy_ship_targeting = enemy_ships_targeting[|0]
	var _direction = point_direction(_enemy_ship_targeting.x, _enemy_ship_targeting.y, x, y)
	var _correction = sign(angle_difference(image_angle, _direction))
	evade_direction = image_angle + 90*_correction
	
} 
desired_direction = evade_direction
desired_motion += acceleration_rate
evasion_counter--
if (evasion_counter <= 0 and abs(angle_difference(image_angle, orginal_angle) < 5)){
	timeline_position = 3
} else {
	timeline_position = 1
}