///@desc Private Method only to be used by the GNET framework
///      Sends a connection request to a port and ip
///@param ip
///@param port

if (connectionState == ConnectionState.Connected)
{
	repeat_function_remove(priv_gnet_send_conn_request, id);
	log_debug("Connection {} Already connected", connectionId);
	return;
}

log_debug("Sending a connection request... Attempts left: {}", connectionAttempts);

var _buff = gnet_packet_build(Gnet_PacketId.connection_request,  NetworkManager.username);
priv_gnet_packet_send(_buff, argument0, argument1);
buffer_delete(_buff);

if (variable_instance_exists(id, "connectionAttempts"))
	connectionAttempts -= 1;

if (connectionAttempts <= 0)
{
	instance_destroy();	
}