if (!instance_exists(ship_target)){
	scr_return_ship_target(basic_attack_targeting_behavior, TARGET_LOWEST_ARMOR, squad_target)
}
if (instance_exists(ship_target)){
	desired_direction = point_direction(x, y, ship_target.x, ship_target.y)
	desired_motion = -acceleration_rate
	if (abs(angle_difference(image_angle, desired_direction)) < 5){
		//create the missile
		var _missile = instance_create_layer(x, y, LAYER_PROJECTILES_UNDER, o_homing_projectile)
		_missile.image_angle = image_angle
		_missile.ship_target = ship_target
		_missile.duration = 1000
		_missile.sprite_index = s_flareset1fx07
		_missile.direction = image_angle
		_missile.speed = speed
		_missile.effect_script = scr_spell_effect_wraith_flare_gun
		_missile.caster_level = caster_level
		_missile.owner = owner
	
		
		
		
	} else {
		timeline_position = 0	
	}
}


