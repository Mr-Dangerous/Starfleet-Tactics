/// @description Insert description here
// You can write your code in this editor

var _current_ship = ds_map_find_first(global.ship_maps)
var _x_offset = 150
var _y_offset = 400
var _spacing = 130
var _position_x = 0
var _position_y = 0
var _max_columns = 3

if (!is_undefined(_current_ship)){
	do{
		var _x = _x_offset +(_position_x * _spacing)
		var _y = _y_offset +(_position_y * _spacing)
		var _new_button = instance_create_layer(_x, _y, "Instances", o_temp_button)
		_new_button.ship_name = _current_ship
		_position_x++
		
		if (_position_x > _max_columns){
			_position_x = 0
			_position_y++
		}
		_current_ship = ds_map_find_next(global.ship_maps, _current_ship)
	} until is_undefined(_current_ship)
	
}