// Packet recevied by already connected clients about a newly connected client

var _connection_id = argument0
var _recieved_data = argument1

var _new_client_id = _recieved_data[0]
var _new_client_username = _recieved_data[1]

if(scr_get_client_by_id(_new_client_id)!= noone){
	show_message_async("WARNING:  RECEIVED NEW CLIENT MESSAGE FOR A CLIENT ID THAT ALREADY EXISTS.")
	return;
}

with (instance_create_depth(-100, -100, -100, o_client))
{
	m_client_id = _new_client_id
	m_username = _new_client_username
	scr_console_add_message(string_build("{} has connected with ID {}", m_username, m_client_id ))
}