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
