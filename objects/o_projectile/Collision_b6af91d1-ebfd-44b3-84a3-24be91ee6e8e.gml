/// @description
with(other){
	if (owner != other.owner){
		armor -= other.damage
		instance_destroy(other)
		generate_shields = true
	}
	
}
