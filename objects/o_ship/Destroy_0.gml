/// @description Insert description here
// You can write your code in this editor
for (var i = 0; i < ds_list_size(paired_effects); i++){
	var _effect = ds_list_find_value(paired_effects, i)
	instance_destroy(_effect)
	ds_list_destroy(paired_effects)
}

if (instance_exists(ship_target)){
	var _target_list = ship_target.enemy_ships_targeting
	var _index = ds_list_find_index(_target_list, self)
	ds_list_delete(_target_list, _index)
	
}