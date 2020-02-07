///@desc Send a packet across the network to a given connection
///@param {Buffer} Packet The buffer containing the data to send. Generally this buffer is created with gnet_packet_build()
///@param {Number} ConnectionId Unique connection identifier defining where to send this packet.

if (argument0 == null)
{
	log_error("Undefined buffer passed in when trying to send a packet, are you sure it built correctly? (Value is undefined). It was not sent.");
	
	var _a = debug_get_callstack();
    for (var i = 0; i < array_length_1d(_a); i++)
    {
        show_debug_message(_a[i]);
    }
	return;
}

if (global.gnet_mySocket < 0)
{
	log_error("Attempting to send data with no socket setup.");
	return;
}

var _conn = gnet_get_connection_by_id(argument1);

network_send_udp(global.gnet_mySocket, _conn.ip, _conn.port, argument0, buffer_get_size(argument0));


