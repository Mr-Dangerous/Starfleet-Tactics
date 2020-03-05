///@desc check new vars
secondary_ship_target = scr_return_ship_target(TARGET_NEAREST, TARGET_LOWEST_ARMOR, squad_target)
desired_direction = point_direction(x, y, secondary_ship_target.x, secondary_ship_target.y)
desired_motion = 0

if (abs(angle_difference(image_angle, desired_direction)) < 2){
	var spell_projectile = instance_create_layer(x, y, LAYER_EFFECTS_OVER, o_ion_cannon_projectile)
	spell_projectile.damage = 75
	if (caster_level = 2){
		spell_projectile.damage = 110
		spell_projectile.base_size += .3
	}
	if (caster_level = 3){
		spell_projectile.damage = 150
		spell_projectile.base_size += .3
	}
	spell_projectile.image_angle = image_angle
	spell_projectile.direction = image_angle
	spell_projectile.desired_direction = image_angle
	spell_projectile.origin_ship = self
	spell_projectile.image_xscale = spell_projectile.base_size
	spell_projectile.image_yscale = spell_projectile.base_size
	spell_projectile.owner = owner
	
	timeline_position = 0
	timeline_index = scr_select_timeline()
	
} else {
	timeline_position = 0
}