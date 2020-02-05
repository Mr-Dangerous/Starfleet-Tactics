/// @description Create Ships
if (ship_to_spawn != ""){
	//make an empty ship
	var _deployed_ship = instance_create_layer(40, 40, "Ships", o_ship)
	//load the ship up!
	with(_deployed_ship){
		name = other.ship_to_spawn
		event_user(INJECT_VARIABLES)
	}
}