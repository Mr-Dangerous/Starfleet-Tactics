/// @description Insert description here
// You can write your code in this editor
for(var i = ds_list_size(graphic_position_list)-1; i > 0; i--){
	var _array = graphic_position_list[|i]
	var image_scale_multiplier = base_size + (-i*.005)
	draw_sprite_ext(sprite_index, 0, _array[0], _array[1], image_scale_multiplier, image_scale_multiplier, _array[2], c_white, 1)
}
draw_self()