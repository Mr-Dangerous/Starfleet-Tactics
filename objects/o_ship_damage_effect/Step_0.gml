/// @description Insert description here
// You can write your code in this editor
image_xscale = (image_scale/4)*image_scale_multiplier
image_yscale = (image_scale/4)*image_scale_multiplier
duration--
image_angle += rotation_speed
image_speed = 0
if (duration < 20){
	image_alpha-=.05
}

if (duration <= 0){
	instance_destroy()
}
if (speed > 2){
	speed -= .1
}