/// @description

switch(state){
	case ship.locked:
		var _dir = reference_ship.image_angle
		x = reference_ship.x + lengthdir_x(graphic_length_offset_from_origin, _dir + graphic_direction_offset_from_origin)
		y = reference_ship.y + lengthdir_y(graphic_length_offset_from_origin, _dir + graphic_direction_offset_from_origin)
		image_angle = reference_ship.image_angle
		//temp for now
		attack_counter++
		if (attack_counter >= basic_attack_speed_interval){
			scr_fire_basic_attack()
			attack_counter = 0
		}
	break;
	
	case ship.battle:
		var _dir = reference_ship.image_angle
		x = reference_ship.x + lengthdir_x(graphic_length_offset_from_origin, _dir + graphic_direction_offset_from_origin)
		y = reference_ship.y + lengthdir_y(graphic_length_offset_from_origin, _dir + graphic_direction_offset_from_origin)
		
		
	break;

}