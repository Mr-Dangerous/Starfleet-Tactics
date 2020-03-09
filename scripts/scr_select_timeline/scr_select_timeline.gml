abort_counter = 180
timeline_position = 0
if (override_timeline != -1){
	timeline = override_timeline
	timeline_position = 0
	return timeline
}


var timeline = scr_choose_evasive_timeline(ship_speed_class)
if (distance_to_object(battle_manager) > 1000){
	timeline = tl_return_to_engagement
}
if (weapons_ready){
	if (energy >= max_energy and spell_timeline_script != -1 and hold_spell = false and do_not_cast_spell = false){
	timeline = spell_timeline_script
	timeline_position = 0
	energy = 0
	
	
	} else {
		timeline = scr_choose_timeline_random(basic_attack_patterns)
		
	}
	weapons_ready = false
	basic_attack_coolant_counter = 0
	hold_spell = false
} 
return timeline
	