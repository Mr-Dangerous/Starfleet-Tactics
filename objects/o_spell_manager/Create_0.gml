/// @description Insert description here
enemy_ships_impacted_by_spell = ds_list_create()
ds_list_clear(enemy_ships_impacted_by_spell)
allied_ships_impacted_by_spell = ds_list_create()
ds_list_clear(allied_ships_impacted_by_spell)
owner = -1
spell_point_list = ds_list_create()
origin_ship = 0
caster_level = 0
spell_target_list = ds_list_create()	//this list contains the id of instance to be effected by the spell
spell_effect = noone	//this is a reference to a damage script called in the timeline of the spell
timeline_running = false