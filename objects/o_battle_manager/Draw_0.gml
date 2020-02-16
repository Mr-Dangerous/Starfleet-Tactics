/// @description Insert description here
// You can write your code in this editor
draw_self()
for (var i = 0; i < BATTLEGRID_WIDTH; i++){
	for (var j = 0; j < BATTLEGRID_HEIGHT; j++){
		var _player_1_grid_entry = player_1_grid[#i, j]
		var _player_2_grid_entry = player_2_grid[#i, j]
		
		draw_circle(_player_1_grid_entry[BATTLEFIELD_X_POSITION], _player_1_grid_entry[BATTLEFIELD_Y_POSITION], 15, true)
		draw_circle(_player_2_grid_entry[BATTLEFIELD_X_POSITION], _player_2_grid_entry[BATTLEFIELD_Y_POSITION], 15, true)

	}
}