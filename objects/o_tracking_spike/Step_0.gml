/// @description Insert description here
// You can write your code in this editor
if (!attached){
	flight_duration--
	if(flight_duration < 0){
		ship_target.tracking_spike = false
		instance_destroy()
	}
}
if (attached){
	if (!instance_exists(ship_target)){
		instance_destroy()
		exit
	}
	if (spell_duration%60 = 0){
		with (ship_target){
			 scr_calculate_basic_attack_damage(other.spell_damage)
			 cloak = false
		}
	}
	x = ship_target.x + lengthdir_x(length_offset, image_angle + direction_offset)
	y = ship_target.y + lengthdir_y(length_offset, image_angle + direction_offset)
	image_angle = base_image_angle + ship_target.image_angle
	spell_duration--
	if (spell_duration <=0){
		ship_target.tracking_spike = false
		instance_destroy()
	}
	
}