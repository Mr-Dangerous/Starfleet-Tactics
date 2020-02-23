///@desc move to meet evasive conditions
evade_direction = image_angle + 90
if (ds_list_size(enemy_ships_targeting) > 0){		
	var _enemy_ship_targeting = enemy_ships_targeting[|0]
	var _direction = point_direction(_enemy_ship_targeting.x, _enemy_ship_targeting.y, x, y)
	var _correction = sign(angle_difference(image_angle, _direction))
	evade_direction = image_angle + 90*_correction
	
} 
desired_direction = evade_direction
desired_motion += acceleration_rate
evasion_counter--


