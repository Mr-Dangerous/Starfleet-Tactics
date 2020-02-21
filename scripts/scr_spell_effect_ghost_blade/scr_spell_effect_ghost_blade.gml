//spells occurs in the spell manager

///@param ship_targets_list
///@param caster level

var _spell_targets = argument0
var _caster_level = argument1

var _base_damage = 0

switch(_caster_level){
	case 1:
		_base_damage = 200
	break;
	
	case 2:
		_base_damage = 300
	break;
	
	case 3:
		_base_damage = 400
	break;
}

//any spell moidfiers here?  in a script probably

for (var i = 0; i < ds_list_size(_spell_targets); i++){
	var _ship = ds_list_find_value(_spell_targets, i)
	with(_ship){
		scr_calculate_basic_attack_damage(_base_damage)
		show_debug_message("200 damage dealt!")
	}
	
}
ds_list_clear(_spell_targets)