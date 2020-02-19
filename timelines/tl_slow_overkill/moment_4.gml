///@desc fire attack


desired_direction = point_direction(x, y, target_x, target_y)

if (basic_attack_speed_counter <= 0){
	basic_attack_speed_counter = basic_attack_speed_interval
	attack_counter++
	scr_fire_basic_attack()
}
basic_attack_speed_counter--
if (attack_counter >= basic_attack_burst_number){
	timeline_index = scr_choose_evasive_timeline("slow")
	timeline_position = 0
} else {
	timeline_position = 3
}