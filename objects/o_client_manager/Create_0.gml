/// @description Insert description here
// You can write your code in this editor
if(!assert_singleton()){
	return
}
global.isServer = false
m_game_console = instance_create_depth(-50, -50, -100, o_console)
local_client = noone
MAX_PLAYERS = 1




var _result = gnet_start_network(MAX_PLAYERS, PROTOCOL_ID, -1, get_string("Enter a username", "Starfleet Player") )

if(!_result){
	show_debug_message("the provided port may not be open.  Coudl not intitalize network")
	instance_destroy()
	return;
} else {
	var _port_string = string_build("My Communincatin Port: {}", global.gnet_myPort);
	show_debug_message(_port_string);
}

_result = gnet_connect("127.0.0.1", DEFAULT_PORT)//local network

if (_result[0] == null){
	show_debug_message(_result[1]);
}

sprites_to_represent = ds_list_create()
