/// @description Insert description here
// You can write your code in this editor
if(ready_to_draw){
	for (var i = 0; array_length_2d(effect_array, 0); i++){
		var _x = reference_ship.x + lengthdir_x(length_offset, reference_ship.image_angle + direction_offset)
		var _y = reference_ship.y + lengthdir_y(length_offset, reference_ship.image_angle + direction_offset)
		var _sprite = effect_array[EFFECT_SPRITE, i]
		var _image_scale = effect_array[EFFECT_IMAGE_SCALE, i]
		var _rotation = effect_array[EFFECT_ROTATION, i]
		var _image_alpha = effect_array[EFFECT_IMAGE_ALPHA, i]
		draw_sprite_ext(_sprite, 0, _x, _y, _image_scale, _image_scale, _rotation, c_white, _image_alpha)
	}
}