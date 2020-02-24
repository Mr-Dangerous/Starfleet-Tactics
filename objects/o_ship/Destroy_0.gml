/// @description Insert description here
// You can write your code in this editor
for (var i = 0; i < ds_list_size(paired_effects); i++){
	var _effect = ds_list_find_value(paired_effects, i)
	instance_destroy(_effect)
	ds_list_destroy(paired_effects)
}
instance_destroy(companion_shield_object)
instance_destroy(companion_spell_manager)
if (instance_exists(ship_target)){
	var _target_list = ship_target.enemy_ships_targeting
	var _index = ds_list_find_index(_target_list, self)
	ds_list_delete(_target_list, _index)
	
}
if (instance_exists(turret_1)){
	instance_destroy(turret_1)
}
if (instance_exists(turret_2)){
	instance_destroy(turret_2)
}
var _list_index = ds_list_find_index(reference_squad.ships_in_squad, self)
ds_list_delete(reference_squad.ships_in_squad, _list_index)