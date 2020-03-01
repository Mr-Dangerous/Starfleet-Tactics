///@param primary_target_ship
var _primary_target = argument0
var _damage = 100
var _blind_duration = 120
var _area_of_effect_range = 400
if (caster_level = 2){
	_damage = 200
	_blind_duration = 180
}
if (caster_level = 3){
	_damage = 300
	_blind_duration = 240
}
//intitial damage to the target ship
with (_primary_target){
	scr_calculate_basic_attack_damage(_damage)
	blind_counter = _blind_duration
}
var aoe_blind_duration = _blind_duration/2

with(o_ship){
	var _p_distance = point_distance(other.x, other.y, x, y)
	var _aoe_damage = (_damage * _p_distance/_area_of_effect_range)/2
	if (_p_distance < _area_of_effect_range and owner != other.owner and id !=_primary_target){
		scr_calculate_basic_attack_damage(_aoe_damage)
		blind_counter = aoe_blind_duration
	}
}

explode_flag = true
show_debug_message("It has been done!")