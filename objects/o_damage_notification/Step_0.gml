/// @description 
// You can write your code in this editor

motion_add(270, .1)
duration--
if (duration < 10){
	image_alpha_adjuster -= .05
	if (image_alpha_adjuster < 0){
		image_alpha_adjuster = 0
	}
}
if (duration <= 0){
	instance_destroy()
}