var _player_1 = players_to_fight_list[|0]
var _player_2 = players_to_fight_list[|1]

if (_player_1 != undefined and _player_2 != undefined){
	show_debug_message("Time to fight!")
	var _battle_x = room_width/2
	var _battle_y = room_height/2
	var _battle_manager = instance_create_layer(_battle_x, _battle_y, LAYER_INSTANCES, o_battle_manager)
	with(_battle_manager){
		player_1 = _player_1
		player_2 = _player_2
		event_user(PREPARE_FIGHT)
		
	}
} else {
	show_debug_message("Players not added to fight list, right click a player first")
}
