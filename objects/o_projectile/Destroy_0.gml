/// @description Insert description here
// You can write your code in this editor
image_angle = direction

if (image_number > 1){
	with(instance_create_layer(x, y, LAYER_PROJECTILES_HIGH, o_destroyed_projectile)){
		
		speed = random_range(5, 7)
		direction = other.image_angle + irandom_range(-30, 30)
		image_angle = direction
		sprite_index = other.sprite_index
		image_xscale = other.image_xscale
		image_yscale = other.image_yscale
		image_alpha = other.image_alpha
	}
	
}

