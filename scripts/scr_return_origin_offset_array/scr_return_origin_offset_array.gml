///@param name_of_ship

var _ship_map = ship_maps[? argument0]

var _origin_offsets = array_create(3, 0)
var _exhaust_offsets = ds_list_create()
var _weapon_offsets = ds_list_create()
var _effects_offsets = ds_list_create()

//CONSIDERATION:  There is defintely  abetter way to do thiis.  onwards.
//pull the exhaust offsets

var _origin_sprite = _ship_map[? "Sprite"]
var _x_origin = sprite_get_xoffset(_sprite)
var _y_origin = sprite_get_yoffset(_sprite)


for (var i = 0; i < 4; i++){
	var _accessor_string = string("Exhaust Coordinate " + string(i+1))
	var _element_data = _ship_map[? _accessor_string]
	if (_element_data != "null"){
		var _element_offset_array = 0	
		var _element_position_1_x = ds_list_find_value(_element_data, 0)
		var _element_position_1_y = ds_list_find_value(_element_data, 1)

		var _relative_element_position_x = _element_position_1_x-_x_origin
		var _relative_element_position_y = _element_position_1_y-_y_origin
		
		var _length = point_distance(0, 0, , _relative_element_position_x, _relative_element_position_y)
		var _p_dir =  point_direction(0, 0, _relative_element_position_x, _relative_element_position_y)
		_element_offset_array[GRAPHIC_DIRECTION_OFFSET] = _p_dir
		_element_offset_array[GRAPHIC_LENGTH_OFFSET] = _length
		_element_offset_array[IS_UNDER] = ds_list_find_value(_element_data, 2)
		var _sprite = asset_get_index(ds_list_find_value(_element_data, 3))
		_element_offset_array[SPRITE_INDEX] = _sprite
		_element_offset_array[SPRITE_IMAGE_SCALE] = ds_list_find_value(_element_data, 4)
		ds_list_add(_weapon_offsets, _element_offset_array)
	}
}
//pull the weapon coordinates
for (var i = 0; i < 4; i++){
	var _accessor_string = string("Weapon Coordinate " + string(i+1))
	var _element_data = _ship_map[? _accessor_string]
	if (_element_data != "null"){
		var _element_offset_array = 0	
		var _element_position_1_x = ds_list_find_value(_element_data, 0)
		var _element_position_1_y = ds_list_find_value(_element_data, 1)

		var _relative_element_position_x = _element_position_1_x-_x_origin
		var _relative_element_position_y = _element_position_1_y-_y_origin
		
		var _length = point_distance(0, 0, , _relative_element_position_x, _relative_element_position_y)
		var _p_dir =  point_direction(0, 0, _relative_element_position_x, _relative_element_position_y)
		_element_offset_array[GRAPHIC_DIRECTION_OFFSET] = _p_dir
		_element_offset_array[GRAPHIC_LENGTH_OFFSET] = _length
		_element_offset_array[IS_UNDER] = ds_list_find_value(_element_data, 2)
		var _sprite = asset_get_index(ds_list_find_value(_element_data, 3))
		_element_offset_array[SPRITE_INDEX] = _sprite
		_element_offset_array[SPRITE_IMAGE_SCALE] = ds_list_find_value(_element_data, 4)
		ds_list_add(_weapon_offsets, _element_offset_array)
	}
}

for (var i = 0; i < 4; i++){
	var _accessor_string = string("Effect Coordinate " + string(i+1))
	var _element_data = _ship_map[? _accessor_string]
	if (_element_data != "null"){
		var _element_offset_array = 0	
		var _element_position_1_x = ds_list_find_value(_element_data, 0)
		var _element_position_1_y = ds_list_find_value(_element_data, 1)

		var _relative_element_position_x = _element_position_1_x-_x_origin
		var _relative_element_position_y = _element_position_1_y-_y_origin
		
		var _length = point_distance(0, 0, , _relative_element_position_x, _relative_element_position_y)
		var _p_dir =  point_direction(0, 0, _relative_element_position_x, _relative_element_position_y)
		_element_offset_array[GRAPHIC_DIRECTION_OFFSET] = _p_dir
		_element_offset_array[GRAPHIC_LENGTH_OFFSET] = _length
		_element_offset_array[IS_UNDER] = ds_list_find_value(_element_data, 2)
		var _sprite = asset_get_index(ds_list_find_value(_element_data, 3))
		_element_offset_array[SPRITE_INDEX] = _sprite
		_element_offset_array[SPRITE_IMAGE_SCALE] = ds_list_find_value(_element_data, 4)
		ds_list_add(_weapon_offsets, _element_offset_array)
	}
}



_origin_offsets[EXHAUST_OFFSETS] = _exhaust_offsets
_origin_offsets[EFFECT_OFFSETS] = _effects_offsets
_origin_offsets[WEAPON_OFFSETS] = _weapon_offsets

return _origin_offsets


