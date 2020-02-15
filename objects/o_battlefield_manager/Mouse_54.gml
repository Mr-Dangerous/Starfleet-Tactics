/// @description Insert description here
// You can write your code in this editor
var _mouse_x = device_mouse_x_to_gui(0)
var _mouse_y = device_mouse_y_to_gui(0)

var player_button_zone_clicked = point_in_rectangle(_mouse_x, _mouse_y, 
	select_player_button_zone[ZONE_X], select_player_button_zone[ZONE_Y],
	select_player_button_zone[ZONE_XX], select_player_button_zone[ZONE_YY])

if (player_button_zone_clicked){
	for (var i = 0; i < ds_list_size(select_player_buttons_list); i++){
		var _button = ds_list_find_value(select_player_buttons_list, i)
		if (point_in_rectangle(_mouse_x, _mouse_y, _button[BUTTON_X] - 2, _button[BUTTON_Y] - 2,
			_button[BUTTON_X]+ 2 + player_select_button_width, _button[BUTTON_Y] +player_select_button_height +2)){
			_button[@ BUTTON_HOVER] = true
			_button[@ BUTTON_COLOR] = c_red
		}
		
	}
}