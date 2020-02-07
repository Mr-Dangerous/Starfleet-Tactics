///@desc Recieve a ping message. Send or Receive both happen here.
///@param ConnectionId
///@param ReceivedDataArray

var _connectionId = argument0;
var data		 = argument1;

var _connectionInst = gnet_get_connection_by_id(_connectionId);

if (data[0] == SEND) 
{
	// Received Ping Request, We should respond
	log_debug("Received Ping request {}. Current Time {} , Time Offset {}, Other Time {}", _connectionId, current_time, data[1]);
	var _buff = gnet_packet_build(Gnet_PacketId.ping, RESPONSE, data[1]);
	priv_gnet_packet_send(_buff, async_load[? "ip"], async_load[? "port"]);
	buffer_delete(_buff);
} 
else if (data[0] == RESPONSE)
{
	if (_connectionInst != null)
	{
		_connectionInst.ping = floor((current_time - data[1]) / 2);
		log_debug("Received Ping response {}. Send Time {} , Current Time {}, Round Trip / 2 {}", _connectionId, data[1], current_time, _connectionInst.ping);
	}
}