///@description Inject values from the JSON

var _ship_map = global.ship_maps[? name]
loading_script = asset_get_index(_ship_map[? "Loading Script"])
var _sprite = asset_get_index(_ship_map[? "Sprite"])
sprite_index = _sprite
script_execute(loading_script)

max_speed = _ship_map[? "Max Speed"]
acceleration_rate = _ship_map[? "Acceleration Rate"]
turn_speed = _ship_map[? "Turn Speed"]

created = true