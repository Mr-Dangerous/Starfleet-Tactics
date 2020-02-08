var _connection_id = argument0
var _data = argument1

var _disconnected_id = _data[0]

var _disconnected_client = scr_get_client_by_id(_disconnected_id)
if (_disconnected_client != noone){
	scr_console_add_message(string_build("{} has left the game!", _disconnected_client.m_username))
	instance_destroy(_disconnected_client)
} else {
	scr_console_add_message(string_build("ERROR: Client {} does not exist!", _disconnected_id))
}