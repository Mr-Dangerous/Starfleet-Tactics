///@param module_name
///@param player_number

var _module_name = argument0
var _owner = argument1

var _player_object = instance_find(o_player, _owner)

var _module_map = global.modules[? _module_name]
var _x = _player_object.x + irandom_range(400, 1200)
var _y = _player_object.y + irandom_range(300, 600)

var _module = instance_create_layer(_x, _y, LAYER_GUI_HIGH, o_module)
_module.owner = _owner
_module.name = _module_name
_module.sprite_index = scr_return_module_sprite_by_rank(_module_map[? "Rank"])
_module.image_xscale = .25
_module.image_yscale = .25
//_module.type = _module_map[? "Type"]
show_debug_message("Module spawned!")