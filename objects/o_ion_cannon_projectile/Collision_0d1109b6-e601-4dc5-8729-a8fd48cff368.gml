/// @description Insert description here
// You can write your code in this editor
if (owner != other.owner){
	if (ds_list_find_index(ships_hit, other) = -1){
		with(other){
			scr_calculate_basic_attack_damage(other.damage)
		}
		ds_list_add(ships_hit, other)
	}
}