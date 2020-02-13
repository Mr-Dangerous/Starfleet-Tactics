/// @description Insert description here
// You can write your code in this editor
/*
if (current_zoom_level != selected_zoom_level){
	
	
}
*/


switch(state){
	case camera_state.overview:
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

	var camera_x = camera_get_view_x(view_camera[0])
	var camera_y = camera_get_view_y(view_camera[0])
	if (instance_exists(focused_player) and camera_focus_change){
	
	
		camera_set_view_pos(view_camera[0], focused_player.x, focused_player.y)
		current_zoom = 1
		selected_zoom_level = 1
		camera_focus_change = false
	
	}

	
	//find the new x position and y position of the camera
	var _new_x = -((_new_camera_width - base_camera_width)/2)
	var _new_y = -((_new_camera_height - base_camera_height)/2)
	var _base_x = 0
	var _base_y = 0
	if (instance_exists(focused_player)){
		_base_x = focused_player.x
		
		_base_y = focused_player.y
	}
	camera_set_view_pos(view_camera[0], _base_x+_new_x,  _base_y+_new_y)
	break;
	
	case camera_state.following:
	if(instance_exists(object_following)){
		camera_set_view_target(view_camera[0], object_following)
		camera_set_view_size(view_camera[0], close_up_base_width, close_up_base_height)
		camera_set_view_border(view_camera[0], (close_up_base_width/2) - 100, (close_up_base_height/2) - 100)
	}
	break;
}


