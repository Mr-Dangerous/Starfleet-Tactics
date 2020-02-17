/// @description PREPARE_FIGHT


///get the camera ready to roll

var _camera = instance_find(o_camera, 0)
_camera.battle_manager = self
_camera.state = camera_state.battle
var _player_1_battlefield = player_1.battlefield
var _player_2_battlefield = player_2.battlefield
for (var _x = 0; _x < BATTLEGRID_WIDTH; _x++){
	for (var _y = 0; _y < BATTLEGRID_HEIGHT; _y++){
		var _grid_entry = _player_1_battlefield[# _x, _y] 
		var _new_grid_entry = player_1_grid[# _x, _y]
		var _squad = _grid_entry[BATTLEFIELD_SQUAD_CONTAINED]
		if (instance_exists(_squad)){
			_new_grid_entry[BATTLEFIELD_SQUAD_CONTAINED] = _squad
			ds_grid_set(player_1_grid, _x, _y, _new_grid_entry)
			ds_list_add(player_1_squads, _squad)
			_squad.x = _new_grid_entry[BATTLEFIELD_X_POSITION]
			_squad.y = _new_grid_entry[BATTLEFIELD_Y_POSITION]
		}
		var _new_x = BATTLEGRID_WIDTH - _x - 1
		var _new_y = BATTLEGRID_HEIGHT - _y - 1
		var _grid_entry = _player_2_battlefield[# _new_x, _new_y]
		var _new_grid_entry = player_2_grid[# _x, _y]
		var _squad = _grid_entry[BATTLEFIELD_SQUAD_CONTAINED]
		if (instance_exists(_squad)){
			_new_grid_entry[BATTLEFIELD_SQUAD_CONTAINED] = _squad
			ds_grid_set(player_2_grid, _x, _y, _new_grid_entry)
			ds_list_add(player_2_squads, _squad)
			_squad.x = _new_grid_entry[BATTLEFIELD_X_POSITION]
			_squad.y = _new_grid_entry[BATTLEFIELD_Y_POSITION]
			
			_squad.image_angle +=180
			_squad.direction +=180
		}
	}
}

