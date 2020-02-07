///@desc Receive a connection request

var senderId = argument0;
var _data    = argument1;

var _ip	  = async_load[? "ip"];
var _port = async_load[? "port"];

var _result = priv_gnet_add_connection(_ip, _port, false);

if (_result[0] == ConnectionAddResult.Success)
{
	var _newConnInst = gnet_get_connection_by_id(_result[1]);
	_newConnInst.username = _data[0];							// Set username
	gnet_OnNewConnection(_result[1]);
}

var _buff = gnet_packet_build(Gnet_PacketId.connection_response, _result[0], NetworkManager.username);
priv_gnet_packet_send(_buff, _ip, _port);
buffer_delete(_buff);