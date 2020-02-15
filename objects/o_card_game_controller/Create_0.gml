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
	var _ship_map_level = _ship_map[? "Level"]
	ds_map_add(global.ship_maps, _ship_map_key, _ship_map)	

	switch(_ship_map_level){
		case 1:
			ds_map_add(global.level_1_ships, _ship_map_key, _ship_map)	
		break;
				
		case 2:
			ds_map_add(global.level_2_ships, _ship_map_key, _ship_map)	
		break
			
		case 3:
			ds_map_add(global.level_3_ships, _ship_map_key, _ship_map)	
		break
	}
}




//GUI positions

//Left side is info window position

//next in line are the shop buttons - shop refresh and level up

//next in line are the five shop slots, on top of them the economy

//the final window will be a grid of all of the items.  It will need a page function



