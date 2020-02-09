///@description Inject values from the JSON

var _ship_map = global.ship_maps[? name]
var _sprite = asset_get_index(_ship_map[? "Sprite"])
sprite_index = _sprite
graphic_resource_array = scr_return_origin_offset_array(name)



//check for effects
if (has_effects){
	var _effect_list = graphic_resource_array[EFFECT_OFFSETS]
	var _number_of_effects = ds_list_size(_effect_list)
	for (var i = 0; i < _number_of_effects; i++){
		var _effect = ds_list_find_value(_effect_list, i)
		var _effect_depth = _effect[IS_UNDER]
		var _effect_layer
		if (_effect_depth = 1){
			_effect_layer = "Effects_Under"
		}
		if (_effect_depth = 0){
			_effect_layer = "Effects_Over"
		}
		var _x= lengthdir_x(_effect[GRAPHIC_LENGTH_OFFSET], image_angle + _effect[GRAPHIC_DIRECTION_OFFSET])
		var _y= lengthdir_y(_effect[GRAPHIC_LENGTH_OFFSET], image_angle + _effect[GRAPHIC_DIRECTION_OFFSET])
		var _effect_object = instance_create_layer(_x, _y, _effect_layer, o_ship_effect)
		paired_effects = _effect_object
		_effect_object.paired_ship = self
		_effect_object.graphic_length_offset_from_origin = _effect[GRAPHIC_LENGTH_OFFSET]
		_effect_object.graphic_direction_offset_from_origin = _effect[GRAPHIC_DIRECTION_OFFSET]
		_effect_object.image_scale = _effect[SPRITE_IMAGE_SCALE]
		_effect_object.sprite_index = _effect[ASSET_INDEX]
		//parse out the effects
		var _effect_array_size = array_length_1d(_effect)
		for (var j = SPRITE_IMAGE_SCALE+1; j < _effect_array_size; j+=2){
			var _effect_to_load = _effect[j]
			switch(_effect_to_load){
				case "rotate":
					_effect_object.rotate = 1
					_effect_object.rotate_case = _effect[j+1]
				break;
				case "glow":
					_effect_object.glow = 1
					_effect_object.glow_case = _effect[j+1]
				break;
			}
		}
		
	}
	
	
	
}


max_speed = _ship_map[? "Max Speed"]
acceleration_rate = _ship_map[? "Acceleration Rate"]
turn_speed = _ship_map[? "Turn Speed"]
armor = _ship_map[? "Armor"]

basic_attack_projectile_duration = _ship_map[? "Basic Attack Projectile Duration"]
basic_attack_projectile_speed = _ship_map[? "Basic Attack Projectile Speed"]
basic_attack_damage = _ship_map[? "Basic Attack Damage"]

spell_script_string = _ship_map[? "Spell Timeline Script"]
if (spell_script_string != "null"){
	
	spell_timeline_script = asset_get_index(spell_script_string)
	
}

created = true