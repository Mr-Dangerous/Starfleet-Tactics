///@desc **System Callback** This function is called when communication has stopped and the Connection destroyed.	
///@param {Number} Connection This is the connectionId of the disconnected connection.

var _connectionId = argument0;   // The id of the connection that disconnectedfrom us

if (global.isServer){
	scr_console_add_message("Client " + string(_connectionId) + " has disconnected")
	var _disconnected_client = scr_get_client_by_id(_connectionId)
	if (_disconnected_client != noone){
		
		var _disconnect_packet = gnet_packet_build(game_packet_type.client_disconnect_notification, _connectionId)
		gnet_packet_send_all(_disconnect_packet)
		
		instance_destroy(_disconnected_client)
		
	}
	
} else {
	scr_console_add_message("Server has lost connection")
}

