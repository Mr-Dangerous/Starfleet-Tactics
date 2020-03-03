///@param basic_attack_damage


var _base_damage = argument0

var damage_notification = instance_create_layer(x, y, LAYER_EFFECTS_OVER, o_damage_notification)
damage_notification.string_to_display = string(_base_damage)

if (shields > 0){
	
	shields -= _base_damage
	_base_damage = 0
	
	if (sign(shields) = -1){
		_base_damage = shields * -1
		shields = 0
	} else {
		damage_notification.text_color = c_blue
	}
	generate_shields = true
}
if (_base_damage > 0){
	armor -= _base_damage
	_base_damage = 0
	generate_physical_damage = true
}


