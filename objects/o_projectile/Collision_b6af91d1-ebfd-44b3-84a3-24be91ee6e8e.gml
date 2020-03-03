/// @description
//calculate on hit effects





if (ship_target != noone and active){
	if (ship_target = other){
		if (fire_through_flag){
			image_alpha = .5
			active = false
		}
		scr_calculate_on_hit_effects()
		with(other){
			scr_calculate_basic_attack_damage(other.damage)
			
			if (!other.fire_through_flag){
				instance_destroy(other)
			}
		}
	}
} else {
	if (active){
		scr_calculate_on_hit_effects()
		with(other){
			if (owner != other.owner){
				if (other.fire_through_flag){
					other.image_alpha = .5
					other.active = false
				}
				scr_calculate_basic_attack_damage(other.damage)
				if (!other.fire_through_flag){
					instance_destroy(other)
				}
	
			}
	
		}
	}
}

