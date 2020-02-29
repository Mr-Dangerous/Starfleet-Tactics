/// @description 

duration--
if (!instance_exists(reference_ship)){
	instance_destroy()
	exit
}
x = reference_ship.x
y = reference_ship.y
image_angle = reference_ship.image_angle

if (duration <= 0){
		
	instance_destroy()
}