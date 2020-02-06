/// @description Insert description here
// You can write your code in this editor
for (var i = 0; i < ds_list_size(paired_effects); i++){
	var _effect = ds_list_find_value(paired_effects, i)
	instance_destroy(_effect)
	ds_list_destroy(paired_effects)
}