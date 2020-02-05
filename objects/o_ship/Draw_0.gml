/// @description Insert description here
// You can write your code in this editor
#region pre draw_self() - universal graphics that appear under the ship
if (speed > 0){
	var _exhaust_sprite_number = array_length_2d(graphic_offsets, EXHAUST_OFFSETS)
	for (var i = 0; i < _exhaust_sprite_number; i++){
		var _exhaust_array = graphic_offsets[EXHAUST_OFFSETS, i]
		var _x = lengthdir_x(_exhaust_array[GRAPHIC_LENGTH_OFFSET],_exhaust_array[GRAPHIC_DIRECTION_OFFSET])
		var _y = lengthdir_y(_exhaust_array[GRAPHIC_LENGTH_OFFSET], _exhaust_array[GRAPHIC_DIRECTION_OFFSET])
		var _s = _exhaust_array[SPRITE_IMAGE_SCALE]
		draw_sprite_ext(_exhaust_array[SPRITE_TO_CREATE], 0, _x, _y, _s, _s, image_angle, c_white, 1)
	}
}
	
#endregion

#region post draw_self() - universal graphics that appear over the ship

#endregion
