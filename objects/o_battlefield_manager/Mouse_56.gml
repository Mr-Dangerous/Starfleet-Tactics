/// @description Insert description here
// You can write your code in this editor
var _mouse_x = device_mouse_x_to_gui(0)
var _mouse_y = device_mouse_y_to_gui(0)

//check to see what zone is active
var ship_spawn_button_zone_clicked = point_in_rectangle(_mouse_x, _mouse_y, 
	ship_spawn_button_zone[ZONE_X], ship_spawn_button_zone[ZONE_Y],
	ship_spawn_button_zone[ZONE_XX], ship_spawn_button_zone[ZONE_YY])
	
var player_button_zone_clicked = point_in_rectangle(_mouse_x, _mouse_y, 
	select_player_button_zone[ZONE_X], select_player_button_zone[ZONE_Y],
	select_player_button_zone[ZONE_XX], select_player_button_zone[ZONE_YY])


if(ship_spawn_button_zone_clicked){
	for (var i = 0; i < ds_list_size(ship_spawn_button_position_list); i++){
		var _ship_button = ds_list_find_value(ship_spawn_button_position_list, i)

		if (_ship_button[BUTTON_HOVER]= true and point_in_rectangle(_mouse_x, _mouse_y, _ship_button[BUTTON_X] - 2, _ship_button[BUTTON_Y] - 2,
			_ship_button[BUTTON_X]+ 2 + ship_spawn_button_width, _ship_button[BUTTON_Y] +ship_spawn_button_height +2)){
			scr_on_create_ship_clicked(_ship_button[BUTTON_DISPLAY_STRING])
			show_debug_message(string_build("{} sent to spawner", _ship_button[BUTTON_DISPLAY_STRING]))
		}
		//reset
		_ship_button[@ BUTTON_COLOR] = c_gray
		_ship_button[@ BUTTON_HOVER] = false
		
	}
}

if(player_button_zone_clicked){
	for (var i = 0; i < ds_list_size(select_player_buttons_list); i++){
		var _button = ds_list_find_value(select_player_buttons_list, i)

		if (_button[BUTTON_HOVER]= true and point_in_rectangle(_mouse_x, _mouse_y, _button[BUTTON_X] - 2, _button[BUTTON_Y] - 2,
			_button[BUTTON_X]+ 2 + player_select_button_width, _button[BUTTON_Y] +player_select_button_height +2)){
			currently_selected_player = i
			var _squad_spawner = instance_find(o_squad_spawner, 0)
			_squad_spawner.owner_to_create_for = i
			var _focused_player = player_list[| i]
		
			camera.focused_player = _focused_player
			camera.camera_focus_change = true
			
			
			show_debug_message(string_build("Player set to {}", _squad_spawner.owner))
		}
		if (_button[BUTTON_HOVER] = true){
			_button[@ BUTTON_COLOR] = c_olive
			_button[@ BUTTON_HOVER] = false
		} else {
			_button[@ BUTTON_HOVER] = false
			_button[@ BUTTON_COLOR] = c_gray
		}
		
		
	}
}

