var  _connectionID = argument0
var _data = argument1

var _sprite_data = _data[0]
var _client_manager = instance_find(o_client_manager, 0)
var _sprites_to_represent = _client_manager.sprites_to_represent
if (array_length_1d(_sprite_data) > 0){
	ds_list_clear(_sprites_to_represent)
}
if (!global.isServer){
	for (var i = 0; i < array_length_1d(_sprite_data); i++){
		var _sprite = _sprite_data[i]
		ds_list_add(_sprites_to_represent, _sprite)
	}
}