var  _connectionID = argument0
var _data = argument1

var _sprite_data = _data[0]

if (!global.isServer){
	for (var i = 0; i < array_length_1d(_sprite_data); i++){
		var _sprite = _sprite_data[i]
		ds_list_add(sprites_to_represent, _sprite)
	}
}