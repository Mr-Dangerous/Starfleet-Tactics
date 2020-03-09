/// @description Insert description here
// You can write your code in this editor
if (currently_selected){
	currently_selected = false
	var _nearest_ship = instance_nearest(x, y, o_ship)
	if (instance_exists(_nearest_ship)){
		if (distance_to_object(_nearest_ship) < 5){
			var _nearest_squad = _nearest_ship.reference_squad
			show_debug_message ("ready to add item!")
			if (state = module_state.collecting and _nearest_squad.owner = owner){//to change later to unattached
				if (ds_list_find_index(_nearest_squad.attached_module_list, name) = -1){
					ds_list_add(_nearest_squad.attached_module_list, name)
						
						with (_nearest_squad){
							script_execute(other.loading_script, LOAD_MODULE)
						}
					attached_squad = _nearest_squad
					state = module_state.attached
					
				}
			}
		}
	}
}

