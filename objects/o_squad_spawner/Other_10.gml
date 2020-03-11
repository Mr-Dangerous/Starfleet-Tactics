/// @description Create Ships
if (ship_name != ""){
	//determine which player is getting the ship
	var _player_object = instance_find(o_player, owner_to_create_for)
	var _battlefield_grid_to_attach_to = _player_object.battlefield
	
	//check to see if there are 2 other of the same unit - if there are, level up!
	
	
	//find an empty slot - will eventually be click and drag.
	var _squad_position = noone
	var _assigned_grid_x = -1
	var _assigned_grid_y = -1
	var j = 0
	while (_squad_position = noone){
		for(var i = 0; i < ds_grid_width(_battlefield_grid_to_attach_to); i++){
			var _grid_spot = _battlefield_grid_to_attach_to[# i, j]
			if (_grid_spot[BATTLEFIELD_SQUAD_CONTAINED] = noone){
				_squad_position = _grid_spot 
				_assigned_grid_x = i
				_assigned_grid_y = j
				break;
			}
		}
		j++
	}
	

	var _deployed_squad = instance_create_layer(400, 400, LAYER_SHIPS, o_squad)
	_squad_position[@ BATTLEFIELD_SQUAD_CONTAINED] = _deployed_squad
	ds_list_add(_player_object.squads_in_field, _deployed_squad)
	
	var _starting_x = _squad_position[BATTLEFIELD_X_POSITION]
	var _starting_y = _squad_position[BATTLEFIELD_Y_POSITION]
	
	//load the ship up!
	with(_deployed_squad){
		ship_name = other.ship_name
		owner = other.owner_to_create_for
		image_angle = 90
		direction = 90
		x = _starting_x
		y = _starting_y
		assigned_grid_x = _assigned_grid_x
		assigned_grid_y = _assigned_grid_y
		event_user(INJECT_VARIABLES)
		
	}
	

}
ship_to_spawn = ""

