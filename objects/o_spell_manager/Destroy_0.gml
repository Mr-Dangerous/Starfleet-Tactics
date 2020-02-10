/// @description Insert description here
// You can write your code in this editor
for (var i = 0; i < ds_list_size(spell_point_list); i++){
	instance_destroy(spell_point_list[| i])
}
ds_list_destroy(spell_point_list)
