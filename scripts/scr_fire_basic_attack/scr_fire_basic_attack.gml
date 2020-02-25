var _weapon_list = graphic_resource_array[WEAPON_OFFSETS]

for (var i = 0; i < ds_list_size(_weapon_list); i++){
	var _weapon = ds_list_find_value(_weapon_list, i)
		if (_weapon != "null"){
		var _x_offset = lengthdir_x(_weapon[GRAPHIC_LENGTH_OFFSET], image_angle + _weapon[GRAPHIC_DIRECTION_OFFSET])
		var _y_offset = lengthdir_y(_weapon[GRAPHIC_LENGTH_OFFSET], image_angle + _weapon[GRAPHIC_DIRECTION_OFFSET])
		if (_weapon[IS_UNDER]){
			_layer = LAYER_PROJECTILES_UNDER
		} else {
			_layer = LAYER_PROJECTILES_HIGH
		}
		var _projectile = instance_create_layer(x+_x_offset, y+_y_offset, _layer, o_projectile)
		_projectile.owner = owner
		_projectile.damage = basic_attack_damage
		_projectile.sprite_index = _weapon[ASSET_INDEX]
		_projectile.image_xscale = _weapon[SPRITE_IMAGE_SCALE]
		_projectile.image_yscale = _weapon[SPRITE_IMAGE_SCALE]
		_projectile.speed = basic_attack_projectile_speed
		_projectile.duration = basic_attack_projectile_duration
		var _convergence_angle = scr_calculate_convergence_angle(_x_offset, _y_offset)
		_projectile.image_angle = _convergence_angle
		_projectile.direction = _projectile.image_angle
		if (weapon_effects){
			var _number_of_effects = array_length_1d(_weapon)
			for (var k = SPRITE_IMAGE_SCALE+1; k < _number_of_effects; k+=2){
				var _effect_type = _weapon[k]
				switch(_effect_type){
					case "rotate":
						_projectile.rotate = true
						_projectile.rotate_case = _weapon[k+1]
					break;
					case "flip":
						_projectile.flip = true
						_projectile.flip_case = _weapon[k+1]
					break;
				}
				
			}
		}
	}	
}