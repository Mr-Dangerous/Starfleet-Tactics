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
		if (instance_exists(ship_target)){
			if (point_distance(x, y, ship_target.x, ship_target.y) > basic_attack_range){
				
				ship_target = scr_assign_ship_target(self)
			}
			
		} else {
			
			ship_target = scr_assign_ship_target(self)
		}
		
	break;

}