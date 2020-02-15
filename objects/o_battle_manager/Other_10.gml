/// @description PREPARE_FIGHT

for (var _x = 0; _x < BATTLEGRID_WIDTH; _x++){
	for (var _y = 0; _y < BATTLEGRID_HEIGHT; _y++){
		var _grid_entry = player_1.battlefield[#_x, _y] 
		var _squad = _grid_entry[BATTLEFIELD_SQUAD_CONTAINED]
		if (instance_exists(_squad)){
			ds_grid_add(player_1_grid, _x, _y, _squad)
		}
		var _new_x = BATTLEGRID_WIDTH - _x
		var _new_y = BATTLEGRID_HEIGHT - _y
		var _grid_entry = player_2.battlefield[#_new_x, _new_y]
		var _squad = _grid_entry[BATTLEFIELD_SQUAD_CONTAINED]
		if (instance_exists(_squad)){
			ds_grid_add(player_2_grid, _x, _y, _squad)
		}
	}
}

