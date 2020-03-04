/// @description Insert description here
// You can write your code in this editor
if (owner = other.owner){
	var _p_dir = point_direction(x, y, other.x, other.y)
	speed -= 1
	motion_add(_p_dir, 10)
	show_debug_message("motion adjusted")
}
if (can_collide){
	if (owner != other.owner){
		var collision_speed = collide_force/other.ship_mass
		other.speed = 0
		var _knockback_direction = point_direction(x, y, other.x, other.y)
		with(other){
			motion_add(_knockback_direction, collision_speed)
			if (speed_limiter = true){
				scr_calculate_basic_attack_damage((other.collide_force*2)/ship_mass)
				//enter a stunned state?
				speed_limiter = false
			}
		}
	}
}