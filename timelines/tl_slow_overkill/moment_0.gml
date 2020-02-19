///@desc intialize variables

//the ship finds the ship with the smallest angle difference in front of it, and then fires a burst 
target_x = 0
target_y = 0
attack_counter = 0

if (instance_exists(ship_target)){
	var _new_target = ship_target.reference_squad.ships_in_squad[|0]
	for (var i = 1; i < ds_list_size(ship_target.reference_squad.ships_in_squad); i++){
		var _target = ship_target.reference_squad.ships_in_squad[|i]
		var _direction_to_target = point_direction(x, y, _target.x, _target.y)
		var _angle_distance_to_target = abs(angle_difference(image_angle, _direction_to_target))
		var _direction_to_old_target = point_direction(x, y, _new_target.x, _new_target.y)
		var _angle_distance_to_old_target = abs(angle_difference(image_angle, _direction_to_old_target))
		if (_angle_distance_to_target < _angle_distance_to_old_target){
			_new_target = _target
		}
	}
	target_x = _new_target.x
	target_y = _new_target.y
}
