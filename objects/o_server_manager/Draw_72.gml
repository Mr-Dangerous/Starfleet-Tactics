/// @description Insert description here
// You can write your code in this editor
if(global.isServer){
	if (!ds_list_empty(sprite_list)){
		var _sprite_array = []
		for(var i =0; i < ds_list_size(sprite_list); i++){
			_sprite_array[i] = sprite_list[| i]
		}
		
		var _sprite_packet = gnet_packet_build(game_packet_type.send_sprite_data, array_length_1d(_sprite_array), _sprite_array)
		gnet_packet_send_all(_sprite_packet)
	}
}