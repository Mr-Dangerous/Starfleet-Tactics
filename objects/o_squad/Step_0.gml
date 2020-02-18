/// @description

switch(state){
	case squad.locked:
	if (mouse_check_button_pressed(mb_left)){
		var _squad_reposition_clone = instance_create_layer(x, y, LAYER_GUI_LOW, o_squad_reposition_clone)

		with (_squad_reposition_clone){
			reference_squad  = other
			owner = other.owner
		}
	}
	break;
	
	case squad.battle:
		//check to see if teh squad target exists
		
		var _desired_speed = 0
		var _desired_direction = 0
		if (!instance_exists(squad_target)){
			squad_target = scr_find_nearest_squad_target(TARGET_NORMAL)//to be changed later to target behavior adjusted by items	
		}
		var _max_engagment_range = 250 //Also to be in the JSON later
		var _min_engagment_range = 100
		if (instance_exists(squad_target)){
			if (point_distance(x, y, squad_target.x, squad_target.y) > _max_engagment_range){
				_desired_direction += point_direction(x, y, squad_target.x, squad_target.y)
				_desired_speed += 1 //Also to be in the JSON later.  Needs to be slightly slower than the ships max_speed	
			}
			if (point_distance(x,y, squad_target.x, squad_target.y) < _max_engagment_range and point_distance(x, y, squad_target.x, squad_target.y) > _min_engagment_range){
				_desired_direction += point_direction(x, y, squad_target.x, squad_target.y)+90
				_desired_speed += 1
			}
			if (point_distance(x, y, squad_target.x, squad_target.y) < _min_engagment_range){
				_desired_direction += point_direction(squad_target.x, squad_target.y, x, y) - 180
				_desired_speed += 1
			}
			for (var i = 0; i < ds_list_size(ships_in_squad); i++){
				var _ship = ships_in_squad[|i]
				if (!instance_exists(_ship.ship_target)){
					var _ship_target = scr_assign_ship_target(_ship)
					_ship.ship_target = _ship_target
					if (_ship.state = ship.patrolling){
						_ship.state = ship.battle
					}
				}
			}
		} else {
			state = squad.post_combat
		}
		
		speed = _desired_speed
		direction = _desired_direction
	break;
	
	case squad.post_combat:
	
	break;
}
