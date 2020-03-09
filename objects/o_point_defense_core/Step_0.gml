/// @description Insert description here
// You can write your code in this editor
if (deploy_counter > 0){
	deploy_counter--
	
}

if (!instance_exists(reference_ship)){
	instance_destroy()
}

if (deploy_counter <= 0 and !returning){
	deployed = true
	desired_direction = 0
	desired_motion = 0
	speed = 0
}
if (deployed=true){
	duration--
	with (o_projectile){
		if (owner != other.owner){
			var projectile_index = ds_list_find_index(other.projectiles_shot_down, self)
			if (projectile_index = -1){
				var _distance_to_projectile = point_distance(other.x, other.y, x, y)
				if (_distance_to_projectile < other.point_defense_range){
					ds_list_add(other.projectiles_shot_down, self)
					var _point_defense_shot = instance_create_layer(other.x, other.y, LAYER_PROJECTILES_HIGH, o_point_defense_projectile)
					_point_defense_shot.speed = other.projectile_speed
					_point_defense_shot.sprite_index = other.projectile_sprite
					_point_defense_shot.direction = point_direction(other.x, other.y, x, y)
					_point_defense_shot.image_angle = _point_defense_shot.direction
					_point_defense_shot.projectile_target = self
					_point_defense_shot.reference_object = other
				}
			}
		}
	}
	if (duration <=0){
		deployed = false
		returning = true
		show_debug_message(string_build("{} projectiles shot down!", projectiles_shot_down_counter))
	}
	
}
if (returning = true){
	_x = reference_ship.x+lengthdir_x(return_point_length_offset, return_point_direction_offset)
	_y = reference_ship.y+lengthdir_y(return_point_length_offset, return_point_direction_offset)
	desired_direction = point_direction(x, y, _x, _y)
	desired_motion += 1
	if (point_distance(x, y, _x, _y) < 3){
		//TODO make this nicer
		reference_ship.sprite_index = s_illum_default_08
		instance_destroy()
	}
}
motion_add(desired_direction, desired_motion)
scr_limit_speed()
scr_turn_to_face_direction(desired_direction)