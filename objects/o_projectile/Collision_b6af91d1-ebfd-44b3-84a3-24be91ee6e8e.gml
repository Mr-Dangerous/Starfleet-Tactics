/// @description
if (ship_target != noone){
	if (ship_target = other){
		with(other){
			scr_calculate_basic_attack_damage(other.damage)
			instance_destroy(other)
		}
	}
} else {
	
	with(other){
		if (owner != other.owner){
		
			scr_calculate_basic_attack_damage(other.damage)
			instance_destroy(other)
	
		}
	
	}
}

