/// @description Insert description here
// You can write your code in this editor
//find the nearest grid position

var _player = instance_find(o_player, owner)
var _battlefield = _player.battlefield
for (var _x = 0; _x < ds_grid_width(_battlefield); _x++){
	for (var _y = 0; _y < ds_grid_height(_battlefield); _y++){
		var _grid_position_array = ds_grid_get(_battlefield, _x, _y)
		var _p_x = _grid_position_array[BATTLEFIELD_X_POSITION]
		var _p_y = _grid_position_array[BATTLEFIELD_Y_POSITION]
		var _squad_contained = _grid_position_array[BATTLEFIELD_SQUAD_CONTAINED]
		//handle moving first
		var _distance_to_position = point_distance(x, y, _p_x, _p_y)
		if (_distance_to_position <  25){
			if (instance_exists(_squad_contained)){
			}
			if (!instance_exists(_squad_contained)){
				_old_grid_position = _battlefield[# reference_squad.assigned_grid_x, reference_squad.assigned_grid_y]
				_old_grid_position[@ BATTLEFIELD_SQUAD_CONTAINED] = noone
				_grid_position_array[@ BATTLEFIELD_SQUAD_CONTAINED] = reference_squad
				with (reference_squad){
					assigned_grid_x = _x
					assigned_grid_y = _y
					x = _p_x
					y = _p_y
				}
				_x = 100
				_y = 100
				
			}
		}
	}
}

instance_destroy()