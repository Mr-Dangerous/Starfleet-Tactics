///@description Inject values from the JSON

var _ship_map = global.ship_maps[? name]
var _sprite = asset_get_index(_ship_map[? "Sprite"])
sprite_index = _sprite
graphic_resource_array = scr_return_origin_offset_array(name)
if (room = r_firing_range){
client = scr_get_client_by_id(owner)
}


image_xscale = _ship_map[? "Image Scale"]
image_yscale = _ship_map[? "Image Scale"]


//check for effects
if (has_effects){
	var _effect_list = graphic_resource_array[EFFECT_OFFSETS]
	var _number_of_effects = ds_list_size(_effect_list)
	for (var i = 0; i < _number_of_effects; i++){
		var _effect = ds_list_find_value(_effect_list, i)
		var _effect_depth = _effect[IS_UNDER]
		var _effect_layer
		if (_effect_depth = 1){
			_effect_layer = LAYER_EFFECTS_UNDER
		}
		if (_effect_depth = 0){
			_effect_layer = LAYER_EFFECTS_OVER
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
base_max_speed = max_speed
acceleration_rate = _ship_map[? "Acceleration Rate"]
base_acceleration_rate = acceleration_rate
turn_speed = _ship_map[? "Turn Speed"]
base_turn_speed = turn_speed
armor = _ship_map[? "Armor"]
shields = _ship_map[? "Shields"]

basic_attack_projectile_duration = _ship_map[? "Basic Attack Projectile Duration"]
basic_attack_projectile_speed = _ship_map[? "Basic Attack Projectile Speed"]
basic_attack_damage = _ship_map[? "Basic Attack Damage"]
basic_attack_range = basic_attack_projectile_duration*basic_attack_projectile_speed*.8
basic_attack_burst_number = _ship_map[? "Basic Attack Burst Number"]
basic_attack_speed_interval = _ship_map[? "Basic Attack Speed Interval"]
basic_attack_patterns = _ship_map[? "Basic Attack Patterns"]//this may need to become some kind of list

max_energy = _ship_map[? "Energy"]
starting_energy = _ship_map[? "Starting Energy"]
spell_script_string = _ship_map[? "Spell Timeline Script"]
caster_level = _ship_map[? "Level"]

if (spell_script_string != "null"){
	
	spell_timeline_script = asset_get_index(spell_script_string)
	companion_spell_manager.timeline_index = spell_timeline_script
	companion_spell_manager.owner = owner
	companion_spell_manager.caster_level = caster_level
	
}



companion_shield_object = instance_create_layer(x, y, LAYER_EFFECTS_OVER, o_shield_effect)
companion_shield_object.hard_shield_sprite = s_shield_hard_5
companion_shield_object.soft_shield_sprite = s_shield_soft_4
companion_shield_object.cloud_shield_sprite = s_shield_cloud_2
companion_shield_object.reference_ship = self
companion_shield_object.image_scale = image_xscale

created = true