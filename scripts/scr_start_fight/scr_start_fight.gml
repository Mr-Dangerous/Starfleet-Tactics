var _player_1 = players_to_fight_list[|0]
var _player_2 = players_to_fight_list[|1]

if (_player_1 != undefined and _player_2 != undefined){
	show_debug_message("Time to fight!")
} else {
	show_debug_message("Players not added to fight list, right click a player first")
}
