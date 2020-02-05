/// @description Insert description here
// You can write your code in this editor
if (created){
	#region pre draw_self() - universal graphics that appear under the ship
	if (speed > 0){
		var _exhaust_array = graphic_offsets[EXHAUST_OFFSETS] 
		var _exhaust_sprite_number = array_length_1d(_exhaust_array)
		for (var i = 0; i < _exhaust_sprite_number; i++){
			var _individual_exhaust_array = _exhaust_array[i]
			var _x = x+ lengthdir_x(_individual_exhaust_array[GRAPHIC_LENGTH_OFFSET],_individual_exhaust_array[GRAPHIC_DIRECTION_OFFSET]+image_angle)
			var _y = y+ lengthdir_y(_individual_exhaust_array[GRAPHIC_LENGTH_OFFSET],_individual_exhaust_array[GRAPHIC_DIRECTION_OFFSET]+image_angle)
			var _s = _individual_exhaust_array[SPRITE_IMAGE_SCALE]
			draw_sprite_ext(_individual_exhaust_array[SPRITE_TO_CREATE], 0, _x, _y, _s, _s, image_angle, c_white, 1)
		}
	}
	
	#endregion

	script_execute(graphic_drawing_script)

	#region post draw_self() - universal graphics that appear over the ship

	#endregion
}
