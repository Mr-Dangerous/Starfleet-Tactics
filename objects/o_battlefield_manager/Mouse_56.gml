/// @description Insert description here
// You can write your code in this editor
var _mouse_x = device_mouse_x_to_gui(0)
var _mouse_y = device_mouse_y_to_gui(0)

//check to see what zone is active
var ship_spawn_button_zone_clicked = point_in_rectangle(_mouse_x, _mouse_y, 
	ship_spawn_button_zone[ZONE_X], ship_spawn_button_zone[ZONE_Y],
	ship_spawn_button_zone[ZONE_XX], ship_spawn_button_zone[ZONE_YY])


if(ship_spawn_button_zone_clicked){
	for (var i = 0; i < ds_list_size(ship_spawn_button_position_list); i++){
		var _ship_button = ds_list_find_value(ship_spawn_button_position_list, i)

		if (_ship_button[BUTTON_HOVER]= true and point_in_rectangle(_mouse_x, _mouse_y, _ship_button[BUTTON_X] - 2, _ship_button[BUTTON_Y] - 2,
			_ship_button[BUTTON_X]+ 2 + ship_spawn_button_width, _ship_button[BUTTON_Y] +ship_spawn_button_height +2)){
			scr_on_create_ship_clicked(_ship_button[BUTTON_DISPLAY_STRING])
			show_debug_message(string_build("{} sent to spawner", _ship_button[BUTTON_DISPLAY_STRING]))
		}
		
	}
}

//reset the GUIs
for (var i = 0; i <ds_list_size(ship_spawn_button_position_list); i++){
	var _ship_button = ds_list_find_value(ship_spawn_button_position_list, i)
	_ship_button[@ BUTTON_COLOR] = c_gray
	_ship_button[@ BUTTON_HOVER] = false
}

