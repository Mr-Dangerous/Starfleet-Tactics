/// @description INJECT VARIABLES

var _turret_map = global.turrets[? name]
var _sprite = asset_get_index(_turret_map[? "Sprite"])
var origin_x = sprite_get_xoffset(_sprite)
var origin_y = sprite_get_yoffset(_sprite)

turn_speed = _turret_map[? "Turn Speed"]
basic_attack_projectile_speed = _turret_map[? "Projectile Speed"]
basic_attack_projectile_duration = _turret_map[? "Projectile Duration"]
basic_attack_range = basic_attack_projectile_speed * basic_attack_projectile_duration
basic_attack_damage = _turret_map[? "Projectile Damage"]
basic_attack_thermal_unit_cost = _turret_map[? "Projectile Thermal Unit Cost"]
basic_attack_speed_interval = _turret_map[? "Projectile Attack Speed Interval"]
projectile_sprite = asset_get_index(_turret_map[?"Projectile Sprite"])
projectile_image_scale = _turret_map[? "Projectile Image Scale"]

image_scale = _turret_map[? "Image Scale"]
image_xscale = image_scale
image_yscale = image_scale
sprite_index = asset_get_index(_turret_map[? "Sprite"])
owner = reference_ship.owner
has_effects = false//TODO:  needs to change

for (var i = 1; i < 5; i++){
	var _accessor_string = string_build("Weapon {} Coordinate", i)
	var _weapon_coordinate = _turret_map[? _accessor_string]
	if (_weapon_coordinate != "null"){
		var _x = _weapon_coordinate[|0]
		var _y = _weapon_coordinate[|1]
		var _turret_array = array_create(4, 0)
		_turret_array[GRAPHIC_LENGTH_OFFSET] = point_distance(origin_x, origin_y, _x, _y)
		_turret_array[GRAPHIC_DIRECTION_OFFSET] = point_direction(origin_x, origin_y, _x, _y)
		_turret_array[ASSET_INDEX] = projectile_sprite
		_turret_array[SPRITE_IMAGE_SCALE] = projectile_image_scale
		_turret_array[IS_UNDER] = _turret_map[? "Is Under"]
		//TODO  add in effects
		
		ds_list_add(graphic_resource_array[WEAPON_OFFSETS], _turret_array)
	}
	
}




