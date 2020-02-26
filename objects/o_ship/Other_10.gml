/// @description PREPARE FOR FIGHT
if (instance_exists(turret_1)){
	turret_1.battle_manager = battle_manager
	turret_1.battle_player_number = battle_player_number
}
if (instance_exists(turret_2)){
	turret_2.battle_manager = battle_manager
	turret_2.battle_player_number = battle_player_number
}
