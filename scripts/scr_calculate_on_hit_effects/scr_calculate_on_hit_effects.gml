//will occur in the projectile before going into the with(other) that deals damage
if (owner != other.owner){
	if (ds_list_size(on_hit_list) > 0){
		for (var i = 0; i < ds_list_size(on_hit_list); i++){
			var _effect_key = on_hit_list[|i]
			//This part shoudl be a script that passes in the effect key
			switch (_effect_key){
				case ON_HIT_DISRUPTOR_CANNON:
					var _shield_damage = round(damage*(.2*origin_ship.caster_level))
					show_debug_message(_shield_damage)
					var damage_dealt = false
					with(other){
						damage_dealt = scr_return_deal_shield_damage(_shield_damage)
					}
					if (damage_dealt){
						var _x = other.x + irandom_range (-32, 32)
						var _y = other.y + irandom_range (-32, 32)
						var _effect = instance_create_layer(_x, _y, LAYER_EFFECTS_OVER, o_graphic_on_hit_effect)
						_effect.sprite_index = s_flareset2fx03
						_effect.image_angle = image_angle+ irandom_range(-32, 32)
						_effect.image_xscale = other.image_xscale
						_effect.image_yscale = other.image_yscale
						_effect.duration = 15
					}
				break;
			}
		}
	}
}