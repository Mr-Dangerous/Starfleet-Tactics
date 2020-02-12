/// @description INJECT VARIABLSE

var _squad_map = global.ship_maps[? ship_name]

var _number_of_ships_in_squad = _squad_map[? "Units In Squad"]

for (var i = 0; i < _number_of_ships_in_squad; i++){
	var _length = unit_offset[i, FORMATION_LENGTH]
	var _direction = direction + unit_offset[i, FORMATION_DIRECTION]
	var _x = x + lengthdir_x(_length, _direction)
	var _y = y + lengthdir_y(_length, _direction)
	var _ship = instance_create_layer(_x, _y, LAYER_SHIPS, o_ship)
	with(_ship){
		name = other.ship_name
		owner = other.owner
		event_user(INJECT_VARIABLES)
	}
	ds_list_add(ships_in_squad, _ship)
}