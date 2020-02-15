/// @description Creation and notes
//Eventaully, this object may be folded into the card game manager
player_list = ds_list_create()
currently_selected_player = 0
var _number_of_players = 4
for (var i = 0; i < _number_of_players; i++){
	var _player = instance_create_layer(0, 0, LAYER_GUI_HIGH, o_player)
	_player.owner = i
	with(_player){
		event_user(INJECT_VARIABLES)
	}
	
	ds_list_add(player_list, _player)
}

players_to_fight_list = ds_list_create()


camera = instance_find(o_camera, 0)
camera.focused_player = player_list[|0]





#region player buttons
select_player_buttons_list = ds_list_create()
select_player_button_zone = []
player_select_button_width = 80
player_select_button_height = 36
max_player_buttons_in_row = 2

var _select_player_button_x_offset = 4
var _select_player_button_y_offset = view_hport[0] - 200
var _horizontal_spacing = player_select_button_width + 4
var _vertical_spacing = player_select_button_height + 4

var _current_row = 0
var _current_column = 0

for (var i = 0; i < _number_of_players; i++){
	var _button_position_array = []
	
	_button_position_array[BUTTON_X] = _select_player_button_x_offset + (_current_column*_horizontal_spacing)
	_button_position_array[BUTTON_Y] = _select_player_button_y_offset + (_current_row*_vertical_spacing)
	_button_position_array[BUTTON_DISPLAY_STRING] = string_build("Player {}", i)
	_button_position_array[BUTTON_COLOR] = c_gray
	_button_position_array[BUTTON_HOVER] = false

	if (i = 0){
		select_player_button_zone[ZONE_X] = _button_position_array[BUTTON_X] - 4
		select_player_button_zone[ZONE_Y] = _button_position_array[BUTTON_Y] - 4
	}
	if (_current_column = max_player_buttons_in_row-1 and i+1 <= _number_of_players){
		_current_column = 0
		_current_row++
		select_player_button_zone[ZONE_XX] = _button_position_array[BUTTON_X] + player_select_button_width + 4
		select_player_button_zone[ZONE_YY] = _button_position_array[BUTTON_Y] + (_vertical_spacing) * (_current_row) - 4
	} else {
		_current_column++
	}
	
		
	ds_list_add(select_player_buttons_list, _button_position_array)
}
#endregion



#region ship spawn buttons
ship_spawn_button_position_list = ds_list_create()
ship_spawn_button_zone = []
ship_spawn_button_width = 136
ship_spawn_button_height = 36
max_ship_spawn_buttons_in_row = 7

var _spawn_button_x_offset = 200
var _spawn_button_y_offset = view_hport[0] - 140
_horizontal_spacing = 144
_vertical_spacing = 44

_current_row = 0
_current_column = 0
var _current_map = ds_map_find_first(global.ship_maps)



for (var i = 0; i < ds_map_size(global.ship_maps); i++){
	var _button_position_array = []
	var _ship_name = _current_map

	
	_button_position_array[BUTTON_X] = _spawn_button_x_offset + (_current_column*_horizontal_spacing)
	_button_position_array[BUTTON_Y] = _spawn_button_y_offset + (_current_row*_vertical_spacing)
	_button_position_array[BUTTON_DISPLAY_STRING] = _ship_name
	_button_position_array[BUTTON_SCRIPT] = scr_on_create_ship_clicked
	_button_position_array[BUTTON_COLOR] = c_gray
	_button_position_array[BUTTON_HOVER] = false
	if (i = 0){
		ship_spawn_button_zone[ZONE_X] = _button_position_array[BUTTON_X] - 4
		ship_spawn_button_zone[ZONE_Y] = _button_position_array[BUTTON_Y] - 4
	}
	if (_current_column >= max_ship_spawn_buttons_in_row-1 and i+1 <=ds_map_size(global.ship_maps)){
		_current_column = 0
		_current_row++
		ship_spawn_button_zone[ZONE_XX] = _button_position_array[BUTTON_X] + ship_spawn_button_width + 4
		ship_spawn_button_zone[ZONE_YY] = _button_position_array[BUTTON_Y] + (_vertical_spacing) * (_current_row+1) - 4
	} else {
		_current_column++
	}
	
		
	ds_list_add(ship_spawn_button_position_list, _button_position_array)
	_current_map = ds_map_find_next(global.ship_maps, _ship_name)
}
#endregion

#region fight button

fight_button_x_offset = view_wport[0]/2 - 100
fight_button_y_offset = +40
fight_button_width = 250
fight_button_height = 40
fight_button_zone[ZONE_X] = fight_button_x_offset
fight_button_zone[ZONE_Y] = fight_button_y_offset
fight_button_zone[ZONE_XX] = fight_button_x_offset+fight_button_width
fight_button_zone[ZONE_YY] = fight_button_y_offset+fight_button_height
fight_button[BUTTON_X] = fight_button_x_offset
fight_button[BUTTON_Y]= fight_button_y_offset
fight_button[BUTTON_DISPLAY_STRING] = "Fight!"



#endregion








