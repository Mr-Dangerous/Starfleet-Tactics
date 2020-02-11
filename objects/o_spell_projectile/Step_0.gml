/// @description Insert description here
// You can write your code in this editor
duration--

if (duration <= 0){
	instance_destroy()
}
direction += turn_speed
image_angle += turn_speed

if(after_image = true){
	var _afterimage = instance_create_layer(x, y, LAYER_EFFECTS_OVER, o_spell_afterimage){
		_afterimage.duration = 8
		_afterimage.fade = true
		_afterimage.image_angle = image_angle
		_afterimage.sprite_index = sprite_index
	}
}

var _networking_sprite_array = [sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha]
ds_list_add(sprite_list, _networking_sprite_array)
