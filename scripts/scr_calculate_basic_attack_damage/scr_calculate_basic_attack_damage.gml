///@param basic_attack_damage
var _base_damage = argument0

if (shields > 0){
	shields -= _base_damage
	_base_damage = 0
	if (sign(shields) = -1){
		_base_damage = shields * -1
		shields = 0
	}
	generate_shields = true
}
if (_base_damage > 0){
	armor -= _base_damage
	_base_damage = 0
	generate_physical_damage = true
}
