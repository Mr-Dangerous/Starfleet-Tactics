/// @description Create Ships
if (ship_to_spawn != ""){
	//make an empty ship
	var _deployed_ship = instance_create_layer(400, 400, LAYER_SHIPS, o_ship)
	//check for the grid
	var _assigned_grid_x = -1
	var _assigned_grid_y = -1
	var _starting_x = 400
	var _starting_y = 400
	
	if (room != r_firing_range){
		
	}
	
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

}
owner = -1