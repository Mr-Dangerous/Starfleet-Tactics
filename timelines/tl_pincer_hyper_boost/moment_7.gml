///@desc slow down
if (max_speed > base_max_speed){
	max_speed -= .2
	}
if (max_speed < base_max_speed){
	max_speed = base_max_speed
}
if (max_speed = base_max_speed){
	timeline_position = 0
	timeline_index = scr_select_timeline()
	can_collide = false
	collide_force = 0
} else {
	timeline_position = 6
}