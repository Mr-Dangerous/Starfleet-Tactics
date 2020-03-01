/// @description Insert description here
// You can write your code in this editor
if (count_down_timer > 0){
	count_down_timer--
}
if (count_down_timer = 1){
	with(o_squad){
		state = squad.battle
		for (var i = 0; i < ds_list_size(ships_in_squad); i++){
			var _ship = ds_list_find_value(ships_in_squad, i)
			_ship.state = ship.patrolling
		}
	}
	grids_visible = false
}