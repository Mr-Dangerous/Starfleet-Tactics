/// @description Insert description here
// You can write your code in this editor
image_angle = direction

if (image_number > 1){
	with(instance_create_layer(x, y, LAYER_PROJECTILES_HIGH, o_destroyed_projectile)){
		image_angle = other.image_angle
		speed = random_range(.5, 2)
		direction = other.image_angle
		sprite_index = other.sprite_index
		image_speed = 1
		image_xscale = other.image_xscale
		image_yscale = other.image_yscale
		image_alpha = other.image_alpha
	}
	
}

