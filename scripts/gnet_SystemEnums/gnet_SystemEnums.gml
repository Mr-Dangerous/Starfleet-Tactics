///@desc Channel Id Enums. Currently only Unreliable works

enum NetChannel 
{
	Unreliable,
	Reliable,
	COUNT			// Use to get how many NetChannel's there are
}
global.CHANNEL_ENUM_NAME = ["Unreliable", "Reliable", "Count"];

enum ConnectionState 
{
	Disconnected,
	Connecting,
	Connected
}
global.ENUM_NAME_CONNECTION_STATE = ["Disconnected", "Connecting", "Connected"];


enum Gnet_PacketId 
{
	connection_request = 220,
	connection_response = 221,
	ping = 222,
	disconnect = 223,
	RPC = 224
}

// Easily reference packet id name by using..  global.PACKET_ID_NAME[? Gnet_PacketId.client_connection_request];
global.GNET_PACKET_ID_NAMES = ds_map_create();
global.GNET_PACKET_ID_NAMES[? Gnet_PacketId.connection_request] = "ConnectionRequest";
global.GNET_PACKET_ID_NAMES[? Gnet_PacketId.connection_response] = "ConnectionResponse";
global.GNET_PACKET_ID_NAMES[? Gnet_PacketId.ping] = "Ping";
global.GNET_PACKET_ID_NAMES[? Gnet_PacketId.disconnect] = "Disconnect";