///@param name_of_ship

var _ship_map = ship_maps[? argument0]

var _origin_offsets = array_create(3, 0)
var _exhaust_offsets = ds_list_create()
var _weapon_offsets = ds_list_create()
var _effects_offsets = ds_list_create()

//pull the exhaust offsets
for (var i = 0; i < 4; i++){
	var _accessor_string = string("Exhaust Coordinate " + string(i+1))
	var _element_data = _ship_map[? _accessor_string]
	if (_element_data != "null"){
		var _element_offset_array = 0
		_element_offset_array[ELEMENT_X_COORDINATE] = ds_list_find_value(_element_data, 0)
		_element_offset_array[ELEMENT_Y_COORDINATE] = ds_list_find_value(_element_data, 1)
		_element_offset_array[IS_UNDER] = ds_list_find_value(_element_data, 2)
		//may need the sprite....
		ds_list_add(_element_offset_array)
	}
}
//pull the weapon coordinates
for (var i = 0; i < 4; i++){
	var _accessor_string = string("Weapon Coordinate " + string(i+1))
	var _element_data = _ship_map[? _accessor_string]
	if (_element_data != "null"){
		var _element_offset_array = 0
		_element_offset_array[ELEMENT_X_COORDINATE] = ds_list_find_value(_element_data, 0)
		_element_offset_array[ELEMENT_Y_COORDINATE] = ds_list_find_value(_element_data, 1)
		_element_offset_array[IS_UNDER] = ds_list_find_value(_element_data, 2)
		//may need the sprite....
		ds_list_add(_element_offset_array)
	}
}

for (var i = 0; i < 8; i++){
	var _accessor_string = string("Effect Coordinate " + string(i+1))
	var _element_data = _ship_map[? _accessor_string]
	if (_element_data != "null"){
		var _element_offset_array = 0
		_element_offset_array[ELEMENT_X_COORDINATE] = ds_list_find_value(_element_data, 0)
		_element_offset_array[ELEMENT_Y_COORDINATE] = ds_list_find_value(_element_data, 1)
		_element_offset_array[IS_UNDER] = ds_list_find_value(_element_data, 2)
		//may need the sprite....
		ds_list_add(_element_offset_array)
	}
}



_origin_offsets[EXHAUST_OFFSETS] = _exhaust_offsets
_origin_offsets[EFFECT_OFFSETS] = _effects_offsets
_origin_offsets[WEAPON_OFFSETS] = _weapon_offsets

return _origin_offsets


