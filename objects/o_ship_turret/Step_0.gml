/// @description

switch(state){
	case ship.locked:
		var _dir = reference_ship.image_angle
		x = reference_ship.x + lengthdir_x(graphic_length_offset_from_origin, _dir + graphic_direction_offset_from_origin)
		y = reference_ship.y + lengthdir_y(graphic_length_offset_from_origin, _dir + graphic_direction_offset_from_origin)
		image_angle = reference_ship.image_angle
		
	break;
	
	case ship.battle:
		var _dir = reference_ship.image_angle
		x = reference_ship.x + lengthdir_x(graphic_length_offset_from_origin, _dir + graphic_direction_offset_from_origin)
		y = reference_ship.y + lengthdir_y(graphic_length_offset_from_origin, _dir + graphic_direction_offset_from_origin)
		//find the nearest target
		basic_attack_coolant_counter++
		if (basic_attack_coolant_counter >= basic_attack_coolant_effectiveness){
			basic_attack_coolant_coutner = 0
			weapons_ready = true
		}
		squad_target = reference_ship.squad_target
		if (instance_exists(ship_target)){
			if (point_distance(x, y, ship_target.x, ship_target.y) > basic_attack_range){
				if (!basic_attack_targets_squads){
				ship_target = scr_return_ship_target(basic_attack_targeting_behavior, TARGET_LOWEST_ARMOR, IGNORE_SQUADS)
				} else {
					ship_target = scr_return_ship_target(basic_attack_targeting_behavior, TARGET_LOWEST_ARMOR, squad_target)
				}
			}
			
		} else {
			if (!basic_attack_targets_squads){
				ship_target = scr_return_ship_target(basic_attack_targeting_behavior, TARGET_LOWEST_ARMOR, IGNORE_SQUADS)
			} else {
				ship_target = scr_return_ship_target(basic_attack_targeting_behavior, TARGET_LOWEST_ARMOR, squad_target)
			}
		}
		if (instance_exists(ship_target)){
			var _direction_to_target = point_direction(x, y, ship_target.x, ship_target.y)
			scr_turn_to_face_direction(_direction_to_target)
			if(weapons_ready){
				timeline_index = tl_turret_fire_basic_attack
				timeline_position = 0
				timeline_running = true
			}
		}
		
	break;

}