/// @description Insert description here
// You can write your code in this editor
duration--

if (duration <= 0){
	instance_destroy()
}
if (fade = true){
	image_alpha -= .2
}
image_alpha = clamp(image_alpha, 0, .6)

var _networking_sprite_array = [sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha]
ds_list_add(sprite_list, _networking_sprite_array)
	