/// @description 
if (double_click_timer > 0){
	double_click = true
	double_click_timer = 0
	show_debug_message("double click detected!")
} else {
	double_click_timer = 15
}

if (double_click){
	with(instance_find(o_camera, 0)){
		object_following = other
		state = camera_state.following
	}
	double_click = false
}

