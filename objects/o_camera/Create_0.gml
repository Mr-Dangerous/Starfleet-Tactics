zoom_levels = array_create(20, 1)
for (var i = 0; i < array_length_1d(zoom_levels); i++){
	var _zoom_offset = i*.1
	zoom_levels[i]+=_zoom_offset
}
current_zoom = 1
selected_zoom_level = 1
view_camera_number = 0

base_camera_width = 1920
base_camera_height = 1080
close_up_base_width = 1280
close_up_base_height = 720

battlefield_manager = instance_find(o_battlefield_manager, 0)
focused_player = noone
camera_focus_change = true
battle_manager = noone

state = camera_state.overview
object_following = noone



