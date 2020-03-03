///@param amount

var _shield_damage = argument0
var _dealt_damage = false


if (shields > 0){
	var damage_notification = instance_create_layer(x, y, LAYER_EFFECTS_OVER, o_damage_notification)
	damage_notification.string_to_display = string(_shield_damage)
	damage_notification.text_color = c_blue
	shields -= _shield_damage
	
	if (sign(shields) = -1){
		_shield_damage = shields * -1
		shields = 0
	} 
	generate_shields = true
	_dealt_damage = true
}

return _dealt_damage