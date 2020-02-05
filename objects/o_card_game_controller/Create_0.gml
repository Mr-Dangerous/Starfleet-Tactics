/// @description Insert description here
__global_init()
// You can write your code in this editor
//JSON funny business
var _buffer = buffer_load("Starfleet Tactics.json");
var _json_string = buffer_read(_buffer, buffer_string)
buffer_delete(_buffer)
root_map = json_decode(_json_string)

//Create a map of all ships

ship_list = root_map[? "JSON_Ships"]
for (var i =0; i <ds_list_size(ship_list); i++){
	var _ship_map = ds_map_create()
	var _ship_map = ds_list_find_value(ship_list, i)
	var _ship_map_key = _ship_map[? "Name"]
	ds_map_add(global.ship_maps, _ship_map_key, _ship_map)	
}