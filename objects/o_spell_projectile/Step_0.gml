/// @description Insert description here
// You can write your code in this editor
duration--

if (duration <= 0){
	instance_destroy()
}
direction += turn_speed
image_angle += turn_speed

if(after_image = true){
	var _afterimage = instance_create_layer(x, y, "Effects_Over", o_spell_afterimage){
		_afterimage.duration = 8
		_afterimage.fade = true
		_afterimage.image_angle = image_angle
		_afterimage.sprite_index = sprite_index
	}
}
