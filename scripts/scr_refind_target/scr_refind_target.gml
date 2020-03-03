if (basic_attack_targets_squads){
	scr_return_ship_target(basic_attack_targeting_behavior, TARGET_LOWEST_ARMOR, squad_target)
} else {
	scr_return_ship_target(basic_attack_targeting_behavior, TARGET_LOWEST_ARMOR, IGNORE_SQUADS)
}

