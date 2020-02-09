var _ship_name = argument0
var _owner_client_id = argument1


if (room = r_firing_range){
	var _ship_spawner = instance_find(o_ship_spawner, 0)
	
	with (_ship_spawner){
		ship_to_spawn = _ship_name
		owner = _owner_client_id
		
		event_user(CREATE_SHIP)
		
	}
}