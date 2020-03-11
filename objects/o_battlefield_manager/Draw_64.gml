/// @description Insert description here
// You can write your code in this editor

#region var draw the ship spawning buttons
draw_rectangle_color(ship_spawn_button_zone[ZONE_X], ship_spawn_button_zone[ZONE_Y],
	ship_spawn_button_zone[ZONE_XX], ship_spawn_button_zone[ZONE_YY],
	c_white, c_white, c_white, c_white, false)
draw_set_halign(fa_center)
for (var i = 0; i < ds_list_size(ship_spawn_button_position_list); i++){
	var _ship_button = ds_list_find_value(ship_spawn_button_position_list, i)
	var _button_color =_ship_button[BUTTON_COLOR]
	draw_rectangle_color(_ship_button[BUTTON_X] - 2, _ship_button[BUTTON_Y] - 2,
		_ship_button[BUTTON_X]+ 2 + ship_spawn_button_width, _ship_button[BUTTON_Y] +ship_spawn_button_height +2,
		c_white, c_white, c_white, c_white, false)
	draw_rectangle_color(_ship_button[BUTTON_X], _ship_button[BUTTON_Y],
		_ship_button[BUTTON_X] + ship_spawn_button_width, _ship_button[BUTTON_Y] +ship_spawn_button_height,
		_button_color, _button_color, _button_color, _button_color, false)
	draw_text(_ship_button[BUTTON_X]+(ship_spawn_button_width/2), _ship_button[BUTTON_Y], _ship_button[BUTTON_DISPLAY_STRING])
	
}
draw_set_halign(fa_left)
#endregion

#region draw the module buttons
draw_rectangle_color(module_spawn_button_zone[ZONE_X], module_spawn_button_zone[ZONE_Y],
	module_spawn_button_zone[ZONE_XX], module_spawn_button_zone[ZONE_YY],
	c_white, c_white, c_white, c_white, false)
draw_rectangle_color(module_button_ui_zone[ZONE_X], module_button_ui_zone[ZONE_Y],
	module_button_ui_zone[ZONE_XX], module_button_ui_zone[ZONE_YY],
	c_red, c_red, c_red, c_red, false)
	
var _module_page = module_pages[|current_module_page]
for (var i = 0; i < ds_list_size(module_spawn_button_position_list); i++){
	var _text = _module_page[|i]
	if (_text != undefined){
	var _ui_button = ds_list_find_value(module_spawn_button_position_list, i)
		var _button_color = _ui_button[BUTTON_COLOR]
		draw_rectangle_color(_ui_button[BUTTON_X], _ui_button[BUTTON_Y], 
			_ui_button[BUTTON_X]  + module_spawn_button_width, _ui_button[BUTTON_Y]  + module_spawn_button_height,
			_button_color, _button_color, _button_color, _button_color, false)
		draw_set_halign(fa_left)
		draw_text_ext(_ui_button[BUTTON_X]+2, _ui_button[BUTTON_Y]-2, _text, 20, module_spawn_button_width-4)
		
	}
}
for (var i = 0; i < ds_list_size(module_button_ui_position_list); i++){
	var _ui_button = ds_list_find_value(module_button_ui_position_list, i)
	var _x = _ui_button[BUTTON_X]
	var _y = _ui_button[BUTTON_Y]
	var _button_color = _ui_button[BUTTON_COLOR]
	draw_rectangle_color(_x, _y, _x+module_spawn_button_width, _y + module_spawn_button_height,
		_button_color, _button_color, _button_color, _button_color, false)
	draw_text(_ui_button[BUTTON_X]+2, _ui_button[BUTTON_Y]-4, _ui_button[BUTTON_DISPLAY_STRING])
}

#endregion

#region draw the player spawn buttons
draw_rectangle_color(select_player_button_zone[ZONE_X], select_player_button_zone[ZONE_Y],
	select_player_button_zone[ZONE_XX], select_player_button_zone[ZONE_YY],
	c_white, c_white, c_white, c_white, false)
draw_set_halign(fa_center)
for (var i = 0; i < ds_list_size(select_player_buttons_list); i++){
	var _button = ds_list_find_value(select_player_buttons_list, i)
	var _button_color = _button[BUTTON_COLOR]
	draw_rectangle_color(_button[BUTTON_X] - 2, _button[BUTTON_Y] - 2,
		_button[BUTTON_X]+ 2 + player_select_button_width, _button[BUTTON_Y] +player_select_button_height +2,
		c_white, c_white, c_white, c_white, false)
	draw_rectangle_color(_button[BUTTON_X], _button[BUTTON_Y],
		_button[BUTTON_X] + player_select_button_width, _button[BUTTON_Y] +player_select_button_height,
		_button_color, _button_color, _button_color, _button_color, false)
	draw_text(_button[BUTTON_X]+(player_select_button_width/2), _button[BUTTON_Y], _button[BUTTON_DISPLAY_STRING])
	
}
draw_set_halign(fa_left)
#endregion

#region draw the fight button
draw_set_halign(fa_center)

var _button = fight_button
var _button_color =c_gray
draw_rectangle_color(_button[BUTTON_X] - 2, _button[BUTTON_Y] - 2,
	_button[BUTTON_X]+ 2 + fight_button_width, _button[BUTTON_Y] +fight_button_height +2,
	c_white, c_white, c_white, c_white, false)
draw_rectangle_color(_button[BUTTON_X], _button[BUTTON_Y],
	_button[BUTTON_X] + fight_button_width, _button[BUTTON_Y] +fight_button_height,
	_button_color, _button_color, _button_color, _button_color, false)
draw_text(_button[BUTTON_X]+(fight_button_width/2), _button[BUTTON_Y], _button[BUTTON_DISPLAY_STRING])
	

draw_set_halign(fa_left)
#endregion

//draw squad information
if (instance_exists(currently_selected_player_object)){
	var _squad_list = currently_selected_player_object.squads_in_field
	for (var i = 0; i < ds_list_size(_squad_list); i++){
		var _position_list = squad_information_position_list[|i]
		var _x = _position_list[SQUAD_GUI_X]
		var _y = _position_list[SQUAD_GUI_Y]
		var _currently_selected_squad = _squad_list[|i]
		var _squad_name = _currently_selected_squad.ship_name
		
		
		draw_text(_x, _y, _squad_name)
		//will have offsets later for armor and shields and what not.
	}
}
