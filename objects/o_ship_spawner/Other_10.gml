/// @description Create Ships
if (ship_to_spawn != ""){
	if (room != r_firing_range){
		//determine which player is getting the ship
		var _player_object = instance_find(o_player, owner_to_create_for)
		var _battlefield_grid_to_attach_to = _player_object.battlefield
	
		//find an empty slot - will eventually be click and drag.
		var _ship_position = noone
		var _assigned_grid_x = -1
		var _assigned_grid_y = -1
		var j = 0
		while (_ship_position = noone){
			for(var i = 0; i < ds_grid_width(_battlefield_grid_to_attach_to); i++){
				var _grid_spot = _battlefield_grid_to_attach_to[# i, j]
				if (_grid_spot[BATTLEFIELD_SQUAD_CONTAINED] = noone){
					_ship_position = _grid_spot 
					_assigned_grid_x = i
					_assigned_grid_y = j
					break;
				}
			}
			j++
		}
	

		var _deployed_ship = instance_create_layer(400, 400, LAYER_SHIPS, o_ship)
		_ship_position[@ BATTLEFIELD_SQUAD_CONTAINED] = _deployed_ship
	
		var _starting_x = _ship_position[BATTLEFIELD_X_POSITION]
		var _starting_y = _ship_position[BATTLEFIELD_Y_POSITION]
	
		
	
		//load the ship up!
		with(_deployed_ship){
			name = other.ship_to_spawn
			owner = other.owner_to_create_for
			image_angle = 90
			direction = 90
			x = _starting_x
			y = _starting_y
			assigned_grid_x = _assigned_grid_x
			assigned_grid_y = _assigned_grid_y
			event_user(INJECT_VARIABLES)
		
		}
	} else {
		if (room = r_firing_range){
			var _deployed_ship = instance_create_layer(400, 400, LAYER_SHIPS, o_ship)
		
			with(_deployed_ship){
				name = other.ship_to_spawn
				owner = other.owner_to_create_for
				image_angle = 90
				direction = 90
				event_user(INJECT_VARIABLES)
		
			}
		}
	}
	

}
owner = -1