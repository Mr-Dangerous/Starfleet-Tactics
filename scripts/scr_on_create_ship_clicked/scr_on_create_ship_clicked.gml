///@param ship_name_to_spawn

var _ship_name = argument0

var _ship_spawner = instance_find(o_ship_spawner, 0)

if (room = r_battlefield){
	var _battlefield_manager_instance = instance_find(o_battlefield_manager, 0)
	var _owner = _battlefield_manager_instance.currently_selected_player
	with (_ship_spawner){
			ship_to_spawn = _ship_name
			owner = _owner
			event_user(CREATE_SHIP)
	}
}

_ship_spawner.ship_to_spawn = _ship_name
show_debug_message("Ship loaded!")