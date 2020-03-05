/// @description Insert description here
// You can write your code in this editor
var _projectile_location = array_create(3, 0)
_projectile_location[0] = x
_projectile_location[1] = y
_projectile_location[2] = image_angle

ds_list_add(graphic_position_list, _projectile_location)
if (ds_list_size(graphic_position_list) > 30){
	ds_list_delete(graphic_position_list, 0)
}
send_out_duration--
if (instance_exists(origin_ship)){
	target_x = origin_ship.x
	target_y = origin_ship.y
}
if (send_out_duration <= 0){
	if (send_out_duration =0){
		if (!instance_exists(origin_ship)){
			instance_destroy()
		}
	}
	if (send_out_duration = -20){
		ds_list_clear(ships_hit)
	}
	desired_direction = point_direction(x, y, target_x, target_y)
	if (point_distance(x, y, target_x, target_y) < 50){
		instance_destroy()
	}
	if (send_out_duration < -300){
		instance_destroy()
	}
}
motion_add(desired_direction, acceleration_rate)
scr_limit_speed()
if (image_angle != desired_direction){
	scr_turn_to_face_direction(desired_direction)
}