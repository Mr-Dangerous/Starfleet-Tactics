///@param ship_looking_for_targets


var _enemy_squad_list = 0

if (battle_player_number = 1){
	_enemy_squad_list = battle_manager.player_2_squads
}

if (battle_player_number = 2){
	_enemy_squad_list = battle_manager.player_1_squads
}

return _enemy_squad_list