/// @description Check Connection

if (current_time - lastPing > NetworkManager.pingFrequency)
{
	lastPing = current_time;
	// Send ping packet
	log_debug("Connection {} sent ping packet with current_time {}", connectionId, current_time);
	var _buff = gnet_packet_build(Gnet_PacketId.ping, SEND, current_time);
	priv_gnet_packet_send(_buff, ip, port);
	buffer_delete(_buff);
}

if (current_time - lastUpdate > NetworkManager.connectionTimeoutTime)
{
	// After so many seconds of no information we can maybe disconnect a user.
	log_info("Connection {} is having issues. No response received in a while. CurrentTime: {}, LastUpdate: {}", connectionId, current_time, lastUpdate);
	gnet_OnConnectionProblem(id);
}

alarm[0] = room_speed;	// Execute this timer every second