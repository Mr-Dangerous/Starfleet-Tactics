/// @description Insert description here
// You can write your code in this editor
if (spell_target = SPELL_TARGET_ALLY){
	
}

if (spell_target = SPELL_TARGET_ENEMY){
	if (!instance_exists(spell_manager)){
		exit;
	}
	var _ship = ds_list_find_index(spell_manager.enemy_ships_impacted_by_spell, other)
	if (_ship = -1){
		ds_list_add(spell_manager.enemy_ships_impacted_by_spell, other)
		ds_list_add(spell_manager.spell_target_list, other)
		with(spell_manager){
			event_user(EVENT_SPELL_EFFECT)
		}
	}
}

if (spell_target = SPELL_TARGET_ANY){

}