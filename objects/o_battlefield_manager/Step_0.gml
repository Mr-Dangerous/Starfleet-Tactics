/// @description Insert description here
// You can write your code in this editor

if (ds_list_size(players_to_fight_list) > 2){
	ds_list_delete(players_to_fight_list, 0)
}
var _player_1 = players_to_fight_list[|0]
var _player_2 = players_to_fight_list[|1]

if (_player_1 != undefined and _player_2 != undefined){
	var _player_1_number = _player_1.owner
	var _player_2_number = _player_2.owner
	var _display_string = string_build("Player {} and Player {} fight!", _player_1_number, _player_2_number)
	fight_button[BUTTON_DISPLAY_STRING] = _display_string
} else {
	fight_button[BUTTON_DISPLAY_STRING] = "Right Click Players..."
}
