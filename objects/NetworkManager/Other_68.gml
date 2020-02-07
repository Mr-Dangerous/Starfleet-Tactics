/// @description Recieve Data

var _ip				= async_load[? "ip"];
var _port			= async_load[? "port"];
var _buffer		    = async_load[? "buffer"];

m_PacketsThisSecond += 1;
m_BytesThisSecond   += buffer_get_size(_buffer);

buffer_seek(_buffer, buffer_seek_start, 0);
var _protoId		= buffer_read(_buffer, buffer_u16);			// ProtocolId (Should always remain the same)
var _channel	    = buffer_read(_buffer, buffer_u8);			// Channel (NetChannel)
var _packetId	    = buffer_read(_buffer, buffer_u8);			// PacketId

// If it is an RPC we need to handle it differently
if (_packetId == Gnet_PacketId.RPC)
{
	priv_gnet_rpc_receive(_buffer);
	return;
}

// If it is not an RPC we look for the callback
var _callback       = m_packetCallbackMap[? _packetId];

if (is_undefined(_callback))
{
	show_error("A packet has been received with a packetId of {}, but has not been registered in gnet_packet_layouts() \n Make sure you register this packet type! No data read", true);
	return;
}

// Debug log packet Name
var _packetName = global.GNET_PACKET_ID_NAMES[? _packetId];
if (!is_undefined(_packetName))
	log_debug("PacketId Recieved: {} on channel {}", _packetName, global.CHANNEL_ENUM_NAME[_channel]);

// Check to make sure protocol ID is correct
if (_protoId != global.gnet_protocolId) {
	log_warn("Recieved Network Message, but the protocolId was incorrect. Not parsing data. : {}", _protoId);
	return;
}

var _connectionInst = priv_gnet_get_connection(_ip, _port);

// Update last update
if (_connectionInst != null) _connectionInst.lastUpdate = current_time;

// If the sender is sending something that is not a connection request.. they need to already have
// a connection initialized.
if (_connectionInst == null && _packetId != Gnet_PacketId.connection_request)
{
	log_debug("Received a packet from an unconnected address, and it is not a connection request. Ignoring");
	return;
}

// If this packet has a registered layout lets read it in
var received_data = priv_gnet_packet_read_registered(_packetId, _buffer);

if (is_undefined(received_data))
{
	// Manually read the data
	log_info("No registered layout for this packetId. Please register the packet int gnet_packet_layouts()");
	return;
}
if (_connectionInst != null)
	script_execute(_callback, _connectionInst.connectionId, received_data);
else
	script_execute(_callback, null, received_data);