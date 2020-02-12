/// @description Insert description here
// You can write your code in this editor
/*
if (current_zoom_level != selected_zoom_level){
	
	
}
*/



selected_zoom = zoom_levels[selected_zoom_level]
var _differential = 1
if (abs(selected_zoom - current_zoom) > .3){
	var _divisor = abs(selected_zoom - current_zoom)
	_differential *= _divisor/.3
	_differential = clamp(_differential, 1, 10)
}
if (current_zoom < selected_zoom){
	current_zoom += .01 * _differential
}
if (current_zoom > selected_zoom){
	current_zoom -= .01 * _differential
}

var _new_camera_width = round(base_camera_width*current_zoom)
var _new_camera_height = round(base_camera_height*current_zoom)

camera_set_view_size(view_camera[0], _new_camera_width,_new_camera_height)

if (!arrived_at_player){
	selected_zoom = 1
	var _camera_x = camera_get_view_x(view_camera[0])
	var _camera_y = camera_get_view_y(view_camera[0])
	var _p_dir = point_direction(_camera_x, _camera_y, focused_player.x, focused_player.y)
	var _distance_to_player = point_distance(_camera_x, _camera_y, focused_player.x, focused_player.y)
	if (_distance_to_player > 100){
		camera_speed += camera_acceleration
		camera_speed = clamp(camera_speed, 0, camera_max_speed)
		camera_x_speed = lengthdir_x(camera_speed, _p_dir)
		camera_y_speed = lengthdir_y(camera_speed, _p_dir)
	} else {
		arrived_at_player = true
		camera_x_speed = 0
		camera_y_speed = 0
		current_zoom = 1
		camera_set_view_pos(view_camera[0], focused_player.x, focused_player.y)
			
	}
}

//find the new x position and y position of the camera
var _new_x = -((_new_camera_width - base_camera_width)/2) + camera_x_speed
var _new_y = -((_new_camera_height - base_camera_height)/2) + camera_y_speed

camera_set_view_pos(view_camera[0], _new_x, _new_y)



