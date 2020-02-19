///@desc fire the attack

var _lead_target_x = ship_target.x //obv needs to change
var _lead_target_y = ship_target.y

desired_direction = point_direction(x, y, _lead_target_x, _lead_target_y)

if (basic_attack_speed_counter <= 0){
	basic_attack_speed_counter = basic_attack_speed_interval
	attack_counter++
	scr_fire_basic_attack()
}
basic_attack_speed_counter--
if (attack_counter >= basic_attack_burst_number){
	timeline_position = 100
} else {
	timeline_position = 5
}