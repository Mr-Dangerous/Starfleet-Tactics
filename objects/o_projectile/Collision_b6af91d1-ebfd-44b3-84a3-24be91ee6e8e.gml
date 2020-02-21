/// @description
with(other){
	if (owner != other.owner){
		
		scr_calculate_basic_attack_damage(other.damage)
		instance_destroy(other)
	
	}
	
}
