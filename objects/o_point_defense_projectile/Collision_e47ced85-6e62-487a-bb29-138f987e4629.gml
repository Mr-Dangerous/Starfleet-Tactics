/// @description Insert description here
// You can write your code in this editor
if (other = projectile_target){
	instance_destroy(other)
	reference_object.projectiles_shot_down_counter++
	var index= ds_list_find_index(reference_object.projectiles_shot_down, other)
	ds_list_delete(reference_object.projectiles_shot_down, index)
	instance_destroy()
}