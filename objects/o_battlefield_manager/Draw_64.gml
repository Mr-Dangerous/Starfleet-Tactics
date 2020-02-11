/// @description Insert description here
// You can write your code in this editor

//var draw the buttons
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
