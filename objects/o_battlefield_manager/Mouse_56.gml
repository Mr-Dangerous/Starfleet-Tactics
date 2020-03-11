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
	
if (fight_button_zone_clicked and fight_button[@ BUTTON_HOVER] = true){
	scr_start_fight()
	
}
fight_button[@ BUTTON_HOVER] = false

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
if (module_spawn_button_zone_clicked){
	for (var i = 0; i < ds_list_size(module_spawn_button_position_list); i++){
		var _module_button = ds_list_find_value(module_spawn_button_position_list, i)
		
		if (_module_button[BUTTON_HOVER]= true and point_in_rectangle(_mouse_x, _mouse_y, _module_button[BUTTON_X],
		_module_button[BUTTON_Y], _module_button[BUTTON_X] + module_spawn_button_width,
		_module_button[BUTTON_Y] + module_spawn_button_height)){
			var _module_page = module_pages[|current_module_page]
			var _module_name = _module_page[|i]
			if (_module_name != undefined){
				scr_spawn_module_from_name(_module_name, currently_selected_player)
			}
		}
	}
}
if (module_ui_button_zone_clicked){
	for (var i = 0;  i < ds_list_size(module_button_ui_position_list); i++){
		var _module_ui_button = ds_list_find_value(module_button_ui_position_list, i)
		
		if (_module_ui_button[BUTTON_HOVER]	= true and point_in_rectangle(_mouse_x, _mouse_y, _module_ui_button[BUTTON_X],
		_module_ui_button[BUTTON_Y], _module_ui_button[BUTTON_X] + module_spawn_button_width,
		_module_ui_button[BUTTON_Y] + module_spawn_button_height)){
			if (_module_ui_button[BUTTON_DISPLAY_STRING] = "Previous Page"){
				current_module_page--
				if (current_module_page < 0){
					current_module_page = 0
				}
				show_debug_message(current_module_page)
			}
			if (_module_ui_button[BUTTON_DISPLAY_STRING] = "Next Page"){
				current_module_page++
				if (current_module_page > number_of_module_pages-1){
					current_module_page = number_of_module_pages-1
				}
				show_debug_message(current_module_page)
			}
		}
	}
}

if(player_button_zone_clicked){
	for (var i = 0; i < ds_list_size(select_player_buttons_list); i++){
		var _button = ds_list_find_value(select_player_buttons_list, i)

		if (_button[BUTTON_HOVER]= true and point_in_rectangle(_mouse_x, _mouse_y, _button[BUTTON_X] - 2, _button[BUTTON_Y] - 2,
			_button[BUTTON_X]+ 2 + player_select_button_width, _button[BUTTON_Y] +player_select_button_height +2)){
			currently_selected_player = i
			currently_selected_player_object = instance_find(o_player, i)
			var _squad_spawner = instance_find(o_squad_spawner, 0)
			_squad_spawner.owner_to_create_for = i
			var _focused_player = player_list[| i]
		
			camera.focused_player = _focused_player
			camera.camera_focus_change = true
			
			
			show_debug_message(string_build("Player set to {}", _squad_spawner.owner_to_create_for))
		}
	}
}

//should change all button colors and hovers to false
for (var i = 0; i < ds_list_size(list_of_all_ui_buttons); i++){
	var _button_list = list_of_all_ui_buttons[|i]
	for (var j = 0; j < ds_list_size(_button_list); j++){
		var _button = _button_list[|j]
		_button[@ BUTTON_HOVER] = false
		_button[@ BUTTON_COLOR] = c_gray //TODO:  buttons shoudl have a default color stored in the array
	}
}

