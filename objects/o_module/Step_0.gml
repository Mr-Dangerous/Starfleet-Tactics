/// @description Insert description here
// You can write your code in this editor

image_angle += spin_speed

image_xscale += swell_direction*swell_speed
image_yscale += swell_direction*swell_speed

if (image_xscale >= max_swell and swell_direction = 1){
	swell_direction = 0
	swell_pause = 60
}
if (swell_pause > 0){
	swell_pause--
	if (swell_pause = 1){
		swell_pause--
		swell_direction = -1
	}
}
if (image_xscale <= min_swell and swell_direction = -1){
	swell_direction = 1
}
