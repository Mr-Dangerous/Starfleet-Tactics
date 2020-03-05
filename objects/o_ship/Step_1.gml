/// @description Insert description here
// You can write your code in this editor
desired_direction = override_direction
desired_motion = 0
if (state = ship.battle){
	if (!instance_exists(ship_target)){
		if (basic_attack_targets_squads){
			ship_target = scr_return_ship_target(basic_attack_targeting_behavior, TARGET_LOWEST_ARMOR, squad_target)
		} else {
			ship_target = scr_return_ship_target(basic_attack_targeting_behavior, TARGET_LOWEST_ARMOR, IGNORE_SQUADS)
		}
	}
	if (!instance_exists(ship_target)){
		combat_state = ship.out_of_combat
		state = ship.locked
		timeline_index = -1
		timeline_position = 0
	}
}