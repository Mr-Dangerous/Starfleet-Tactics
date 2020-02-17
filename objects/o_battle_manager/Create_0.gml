/// @description Insert description here
// You can write your code in this editor
player_1 = noone
player_2 = noone

player_1_squads = ds_list_create()
player_2_squads = ds_list_create()

player_1_grid = ds_grid_create(BATTLEGRID_WIDTH, BATTLEGRID_HEIGHT)
player_2_grid = ds_grid_create(BATTLEGRID_WIDTH, BATTLEGRID_HEIGHT)

//populate the grid with new positions

for (var _x = 0; _x < BATTLEGRID_WIDTH; _x++){
	for (var _y = 0; _y < BATTLEGRID_HEIGHT; _y++){
		var _grid_position_array = array_create(4, 0)
		var _x_position = x - ((BATTLEGRID_WIDTH * BATTLEGRID_SPACING)/2) + (_x*BATTLEGRID_SPACING)
		var _y_position = (y + 100) + (_y*BATTLEGRID_SPACING)
		_grid_position_array[BATTLEFIELD_X_POSITION] = _x_position
		_grid_position_array[BATTLEFIELD_Y_POSITION] = _y_position 
		_grid_position_array[BATTLEFIELD_SQUAD_CONTAINED] = noone
		_grid_position_array[BATTLEFIELD_PLAYER] = 1
		ds_grid_set(player_1_grid, _x, _y, _grid_position_array)
		
		_x_position = x + ((BATTLEGRID_WIDTH * BATTLEGRID_SPACING)/2) - ((BATTLEGRID_WIDTH - _x)*BATTLEGRID_SPACING)
		_y_position = (y - 100) - ((BATTLEGRID_HEIGHT - _y) * BATTLEGRID_SPACING)
		
		_grid_position_array[BATTLEFIELD_X_POSITION] = _x_position
		_grid_position_array[BATTLEFIELD_Y_POSITION] = _y_position 
		_grid_position_array[BATTLEFIELD_SQUAD_CONTAINED] = noone
		_grid_position_array[BATTLEFIELD_PLAYER] = 2
		ds_grid_set(player_2_grid, _x, _y, _grid_position_array)
	}
}