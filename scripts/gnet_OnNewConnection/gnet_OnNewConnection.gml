/**
@desc **System Callback**
	  This function is called when a new connection has been established successfully. This
	  is a good place to for example; Save the connection id in a list. This connectionId can
	  be used in the future to send data or identify who sent the data. For example 
@example
	// Script is called
	var _connectionId = argument0;
	
	ds_list_add(Server.clientList, _connectionId);
*/
///@param {Number} Connection This is the connectionId of the disconnected connection.

var _connectionId = argument0;

if (!global.isServer){
	show_error("A client should not be recieving a connection", true)	
	return;
}
scr_console_add_message("New Client has connected " + string(_connectionId))



//The new connection
var _new_client_notification_packet = gnet_packet_build(game_packet_type.new_client_connect_notification, _connectionId, gnet_get_username(_connectionId))
var _all_client_data_array = []
var i = 1 //reserving index 0 for our own client
with (o_client){
	gnet_packet_send_to_id(_new_client_notification_packet, m_client_id)
	_all_client_data_array[i] = [m_client_id, m_username] //needs to be an array, eventually will have opther thigns like usernames.
	i++
	
}



with(instance_create_depth(-10, -10, -100, o_client)){
	m_client_id = _connectionId
	m_username = gnet_get_username(_connectionId)
	_all_client_data_array[0] = [m_client_id, m_username]
	var _all_client_data = gnet_packet_build(game_packet_type.all_client_data, array_length_1d(_all_client_data_array), _all_client_data_array)
	gnet_packet_send_to_id(_all_client_data, m_client_id)
}











	
