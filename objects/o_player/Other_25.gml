/// @description INJECT VARIABLES

if (owner = 0){
	x = 0
	y = 0
}
if (owner = 1){
	x = 3840
	y = 0
}
if (owner = 2){
	x = 0
	y = 2160
}

if (owner = 3){
	x = 3840
	y = 2160
}

#region battlefield
var _x_offset = 270
var _y_offset = 60
var _spacing = 200
grid_square_size = _spacing-10

for (var i = 0; i < ds_grid_width(battlefield); i++){
	for (var j = 0; j < ds_grid_height(battlefield); j++){
		var _grid_position_array = []
		_grid_position_array[BATTLEFIELD_X_POSITION] = x + _x_offset + (_spacing * i)
		_grid_position_array[BATTLEFIELD_Y_POSITION] = y + _y_offset + (_spacing * j)
		_grid_position_array[BATTLEFIELD_SQUAD_CONTAINED] = noone
		_grid_position_array[BATTLEFIELD_PLAYER] = owner
		battlefield[# i, j] = _grid_position_array
	}
}
battle_map_created = true





#endregion