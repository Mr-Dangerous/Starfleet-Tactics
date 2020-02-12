///@param ship_name_to_spawn

var _ship_name = argument0

var _squad_spawner = instance_find(o_squad_spawner, 0)

if (room = r_battlefield){
	var _battlefield_manager_instance = instance_find(o_battlefield_manager, 0)
	var _owner = _battlefield_manager_instance.currently_selected_player
	with (_squad_spawner){
			ship_to_spawn = _ship_name
			owner = _owner
			event_user(CREATE_SHIP)
	}
}

_squad_spawner.ship_name = _ship_name
show_debug_message("Ship loaded!")