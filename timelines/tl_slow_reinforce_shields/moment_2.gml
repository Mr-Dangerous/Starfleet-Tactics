reinforce_shields_counter--
desired_motion -= acceleration_rate
if (!instance_exists(ship_target)){
	scr_refind_target()
}
desired_direction = point_direction(x, y, ship_target.x, ship_target.y)
ship_steering_force = base_ship_steering_force/3
if (speed >0){
	speed -= acceleration_rate
}

if (reinforce_shields_counter%10 = 0){
	var  notification_amount = shield_regen_amount
	if (shields + shield_regen_amount >= max_shields){
		notification_amount = max_shields - shields
		shields = max_shields
	} else {
		shields += shield_regen_amount
	}
	//TODO this should be folded into one object ideally
	var shielding_notification = instance_create_layer(x, y, LAYER_EFFECTS_OVER, o_healing_notification)
	shielding_notification.string_to_display = notification_amount
	shielding_notification.text_color = c_aqua
		
}

if (reinforce_shields_counter <= 0){
	reinforce_shields = false
	companion_shield_object.reinforce_shields = false
	ship_steering_force = base_ship_steering_force
	timeline_index = scr_select_timeline()
	timeline_position = 0
} else {
	timeline_position = 1
}

