///@desc Send a packet across the network to all established connections.
///@param {Buffer} Packet The buffer containing the data to send. Generally this buffer is created with gnet_packet_build()

if (argument0 == null)
{
	log_error("Undefined buffer passed in when trying to send a packet, are you sure it built correctly? (Value is undefined). It was not sent.");
	return;
}

if (global.gnet_mySocket < 0)
{
	log_error("Attempting to send data with no socket setup.");
	return;
}

var buff_size = buffer_get_size(argument0);
for (var i = 0; i < instance_number(Connection); i++)
{
	var inst = instance_find(Connection, i);
	if (inst.connectionState == ConnectionState.Connected)
		network_send_udp(global.gnet_mySocket, inst.ip, inst.port, argument0, buff_size);
}