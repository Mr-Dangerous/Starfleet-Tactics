///@param name_of_ship
var _ship_map = global.ship_maps[? argument0]

var _origin_offsets = array_create(4, 0)
var _exhaust_offsets = ds_list_create()
var _weapon_offsets = ds_list_create()
var _effects_offsets = ds_list_create()
var _turret_offsets = ds_list_create()

var _origin_sprite = asset_get_index(_ship_map[? "Sprite"])
var _x_origin = sprite_get_xoffset(_origin_sprite)
var _y_origin = sprite_get_yoffset(_origin_sprite)
var _major_image_scale = _ship_map[? "Image Scale"]

var j = 0

repeat(4){
	var _accessor_string
	var _list_to_add_to
	switch(j){
		case EXHAUST_OFFSETS:
			_accessor_string = "Exhaust Coordinate "
			_list_to_add_to = _exhaust_offsets
		break;
		case WEAPON_OFFSETS:
			_accessor_string = "Weapon Coordinate "
			_list_to_add_to = _weapon_offsets
		break;
		case EFFECT_OFFSETS:
			_accessor_string = "Effect Coordinate "
			_list_to_add_to = _effects_offsets
		break;
		case TURRET_OFFSETS:
			_accessor_string = "Turret Hardpoint "
			_list_to_add_to = _turret_offsets
		break;
	}
	
	for (var i = 0; i < 4; i++){
		var _new_accessor_string = string(_accessor_string + string(i+1))
		var _element_data = _ship_map[? _new_accessor_string]
		if (_element_data != "null"){
			var _element_offset_array = []
			var _element_position_1_x = ds_list_find_value(_element_data, 0)
			var _element_position_1_y = ds_list_find_value(_element_data, 1)

			var _relative_element_position_x = _element_position_1_x-_x_origin
			var _relative_element_position_y = _element_position_1_y-_y_origin
		
			var _length = point_distance(0, 0, _relative_element_position_x, _relative_element_position_y)*_major_image_scale //needed this var because I'm a dummy
			var _p_dir =  point_direction(0, 0, _relative_element_position_x, _relative_element_position_y)
			_element_offset_array[GRAPHIC_DIRECTION_OFFSET] = _p_dir
			_element_offset_array[GRAPHIC_LENGTH_OFFSET] = _length
			_element_offset_array[IS_UNDER] = ds_list_find_value(_element_data, 2)
			var _sprite = asset_get_index(ds_list_find_value(_element_data, 3))
			_element_offset_array[ASSET_INDEX] = _sprite
			var _image_scale = ds_list_find_value(_element_data, 4)*_major_image_scale
			_element_offset_array[SPRITE_IMAGE_SCALE] = _image_scale	
			if (_accessor_string = "Effect Coordinate " and _element_data != "null"){
				has_effects = true
				var _element_data_size = ds_list_size(_element_data)
				//USING SPRITE IMAGE SCALE BECAUSE ITS THE LAST ONE IN THE ARRAY
				if (_element_data_size > SPRITE_IMAGE_SCALE){
					for (var k = 0; k < _element_data_size - (SPRITE_IMAGE_SCALE+2); k+=2){
						var _effect_type = ds_list_find_value(_element_data, SPRITE_IMAGE_SCALE+k+1)
						_element_offset_array[SPRITE_IMAGE_SCALE + k + 1] = _effect_type
						var _effect_case = ds_list_find_value(_element_data, SPRITE_IMAGE_SCALE + k + 2)
						_element_offset_array[SPRITE_IMAGE_SCALE + k + 2] = _effect_case
				
					}
				}	
			}
			if (_accessor_string = "Weapon Coordinate " and _element_data != "null"){
				weapon_effects = true
				var _element_data_size = ds_list_size(_element_data)
				//USING SPRITE IMAGE SCALE BECAUSE ITS THE LAST ONE IN THE ARRAY
				if (_element_data_size > SPRITE_IMAGE_SCALE){
					for (var k = 0; k < _element_data_size - (SPRITE_IMAGE_SCALE+2); k+=2){
						var _effect_type = ds_list_find_value(_element_data, SPRITE_IMAGE_SCALE+k+1)
						_element_offset_array[SPRITE_IMAGE_SCALE + k + 1] = _effect_type
						var _effect_case = ds_list_find_value(_element_data, SPRITE_IMAGE_SCALE + k + 2)
						_element_offset_array[SPRITE_IMAGE_SCALE + k + 2] = _effect_case
				
					}
				}	
			}
			if (_accessor_string = "Turret Hardpoint " and _element_data != "null"){
				_element_offset_array[TURRET_MAP_KEY] = _element_data[|TURRET_MAP_KEY]
			}
		ds_list_add(_list_to_add_to, _element_offset_array)
		}
	}
	j++
}

_origin_offsets[EXHAUST_OFFSETS] = _exhaust_offsets
_origin_offsets[EFFECT_OFFSETS] = _effects_offsets
_origin_offsets[WEAPON_OFFSETS] = _weapon_offsets
_origin_offsets[TURRET_OFFSETS] = _turret_offsets

return _origin_offsets


