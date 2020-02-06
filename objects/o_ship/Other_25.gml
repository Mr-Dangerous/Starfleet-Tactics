///@description Inject values from the JSON

var _ship_map = global.ship_maps[? name]
var _sprite = asset_get_index(_ship_map[? "Sprite"])
sprite_index = _sprite
graphic_resource_array = scr_return_origin_offset_array(name)

//check for effects
if (_ship_map[? "Effect Coordinate 1"] != "null"){
	has_effects = true
	//should check to see what kind of effects here
}


max_speed = _ship_map[? "Max Speed"]
acceleration_rate = _ship_map[? "Acceleration Rate"]
turn_speed = _ship_map[? "Turn Speed"]

basic_attack_projectile_duration = _ship_map[? "Basic Attack Projectile Duration"]
basic_attack_projectile_speed = _ship_map[? "Basic Attack Projectile Speed"]


created = true