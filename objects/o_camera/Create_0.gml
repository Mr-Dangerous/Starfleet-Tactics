zoom_levels = array_create(20, 1)
for (var i = 0; i < array_length_1d(zoom_levels); i++){
	var _zoom_offset = i*.1
	zoom_levels[i]+=_zoom_offset
}
current_zoom = 1
selected_zoom_level = 1
view_camera_number = 0

base_camera_width = camera_get_view_width(view_camera[view_camera_number])
base_camera_height = camera_get_view_height(view_camera[view_camera_number])

battlefield_manager = instance_find(o_battlefield_manager, 0)
focused_player = noone
camera_focus_change = true




