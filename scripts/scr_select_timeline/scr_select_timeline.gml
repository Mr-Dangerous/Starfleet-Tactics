abort_counter = 180
var timeline = scr_choose_evasive_timeline(ship_speed_class)
if (weapons_ready){
	if (energy >= max_energy and spell_timeline_script != -1){
	timeline = spell_timeline_script
	timeline_position = 0
	energy = 0
	
	} else {
		timeline = scr_choose_timeline_random(basic_attack_patterns)
		
	}
	weapons_ready = false
	basic_attack_coolant_counter = 0
} 
return timeline
	