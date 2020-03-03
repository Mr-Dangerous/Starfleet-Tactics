reinforce_shields = true
reinforce_shields_counter = 60
desired_motion -= acceleration_rate
if (!instance_exists(ship_target)){
	scr_refind_target()
}
desired_direction = point_direction(x, y, ship_target.x, ship_target.y)
companion_shield_object.reinforce_shields = true
shield_regen_amount = 1
ship_steering_force = base_ship_steering_force/3
if (speed >0){
	speed -= acceleration_rate
}
scr_limit_speed()

if (reinforce_shields_counter%10 = 0){
	var  notification_amount = shield_regen_amount
	if (shields + shield_regen_amount >= max_shields){
		notification_amount = max_shields - shields
		shields = max_shields
	} else {
		shields += shield_regen_amount
	}
	//TODO this shoudl eb folded into one object ideally
	var shielding_notification = instance_create_layer(x, y, LAYER_EFFECTS_OVER, o_healing_notification)
	shielding_notification.string_to_display = notification_amount
	shielding_notification.text_color = c_aqua
		
}