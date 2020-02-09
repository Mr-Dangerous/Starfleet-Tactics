/// @description Insert description here
// You can write your code in this editor
if(!assert_singleton()){
	return
}
global.isServer = true

m_game_console = instance_create_depth(-50, -50, -100, o_console)

MAX_PLAYERS = 8



var _result = gnet_start_network(MAX_PLAYERS, PROTOCOL_ID, DEFAULT_PORT, "Server" )

if(!_result){
	show_debug_message("the provided port may not be open.  Coudl not intitalize network")
	instance_destroy()
} else {
	room_goto(r_firing_range)
}

sprite_list = ds_list_create()