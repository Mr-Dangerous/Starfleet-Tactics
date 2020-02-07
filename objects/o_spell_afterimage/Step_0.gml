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