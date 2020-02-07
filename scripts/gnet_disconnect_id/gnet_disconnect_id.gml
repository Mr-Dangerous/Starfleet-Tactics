///@desc Disconnect a specific connectionId. This will send them a message saying you disconnect, and remove all connection data for that id.
///@param {Number} ConnectionId The id of the connection to to disconnect from.

var _connId = argument0;

with (NetworkManager)
{
	var _connInst = gnet_get_connection_by_id(_connId);
	
	if (_connInst == null) {
		log_debug("There is no established connection for connectionId {} ", _connId);
		return;
	}
	
	var _buff = gnet_packet_build(Gnet_PacketId.disconnect);
	priv_gnet_packet_send(_buff, _connInst.ip, _connInst.port);
	buffer_delete(_buff);
	
	with (_connInst) { instance_destroy(); } // Destroy connection properties
}