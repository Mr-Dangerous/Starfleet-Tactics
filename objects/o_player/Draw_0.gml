/// @description Insert description here
// You can write your code in this editor
//draw the grid
//starting with a dot jsut to prove it

if (battlefield_manager.currently_selected_player = owner and battle_map_created){
	for (var i = 0; i < ds_grid_width(battlefield); i++){
		for (var j = 0; j < ds_grid_height(battlefield); j++){
			var _grid_position = battlefield[# i, j]
			var _x = _grid_position[BATTLEFIELD_X_POSITION]
			var _y = _grid_position[BATTLEFIELD_Y_POSITION]
			draw_circle(_x, _y, 16, true)
		}
	}
}

