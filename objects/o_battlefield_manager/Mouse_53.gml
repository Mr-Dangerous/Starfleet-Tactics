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
	
var fight_button_zone_clicked = point_in_rectangle(_mouse_x, _mouse_y,
	fight_button_zone[ZONE_X], fight_button_zone[ZONE_Y],
	fight_button_zone[ZONE_XX], fight_button_zone[ZONE_YY])
	
var module_ui_button_zone_clicked = point_in_rectangle(_mouse_x, _mouse_y,
	module_button_ui_zone[ZONE_X], module_button_ui_zone[ZONE_Y],
	module_button_ui_zone[ZONE_XX], module_button_ui_zone[ZONE_YY])
	
var module_spawn_button_zone_clicked = point_in_rectangle(_mouse_x, _mouse_y,
	module_spawn_button_zone[ZONE_X], module_spawn_button_zone[ZONE_Y],
	module_spawn_button_zone[ZONE_XX], module_spawn_button_zone[ZONE_YY])
	
	
if (fight_button_zone_clicked){
	fight_button[@ BUTTON_HOVER] = true
}


if(ship_spawn_button_zone_clicked){
	for (var i = 0; i < ds_list_size(ship_spawn_button_position_list); i++){
		var _ship_button = ds_list_find_value(ship_spawn_button_position_list, i)

		if (point_in_rectangle(_mouse_x, _mouse_y, _ship_button[BUTTON_X] - 2, _ship_button[BUTTON_Y] - 2,
			_ship_button[BUTTON_X]+ 2 + ship_spawn_button_width, _ship_button[BUTTON_Y] +ship_spawn_button_height +2)){
			_ship_button[@ BUTTON_HOVER] = true
			_ship_button[@ BUTTON_COLOR] = c_olive
			show_debug_message(string_build("{} button clicked!", _ship_button[BUTTON_DISPLAY_STRING]))
		}
	}
}

if (module_spawn_button_zone_clicked){
	
}

if (module_ui_button_zone_clicked){
	for (var i = 0; i < ds_list_size(module_button_ui_position_list); i++){
		var _module_button = ds_list_find_value(module_button_ui_position_list, i)
		
		if (point_in_rectangle(_mouse_x, _mouse_y, _module_button[BUTTON_X], _module_button[BUTTON_Y],
		_module_button[BUTTON_X] + module_spawn_button_width, _module_button[BUTTON_Y] + module_spawn_button_height)){
			_module_button[@ BUTTON_HOVER] = true
			_module_button[@ BUTTON_COLOR] = c_red
		}
	}
}

if (module_spawn_button_zone_clicked){
	for (var i = 0; i < ds_list_size(module_spawn_button_position_list); i++){
		var _module_button = ds_list_find_value(module_spawn_button_position_list, i)
		
		if (point_in_rectangle(_mouse_x, _mouse_y, _module_button[BUTTON_X], _module_button[BUTTON_Y],
		_module_button[BUTTON_X] + module_spawn_button_width, _module_button[BUTTON_Y] + module_spawn_button_height)){
			_module_button[@ BUTTON_HOVER] = true
			_module_button[@ BUTTON_COLOR] = c_red
		}
	}
}

if(player_button_zone_clicked){
	for (var i = 0; i < ds_list_size(select_player_buttons_list); i++){
		var _button = ds_list_find_value(select_player_buttons_list, i)

		if (point_in_rectangle(_mouse_x, _mouse_y, _button[BUTTON_X] - 2, _button[BUTTON_Y] - 2,
			_button[BUTTON_X]+ 2 + player_select_button_width, _button[BUTTON_Y] +player_select_button_height +2)){
			_button[@ BUTTON_HOVER] = true
			_button[@ BUTTON_COLOR] = c_olive
			show_debug_message(string_build("{} button clicked!", _button[BUTTON_DISPLAY_STRING]))
		}
	}
}
