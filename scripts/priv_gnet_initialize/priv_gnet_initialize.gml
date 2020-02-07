///@desc Initialize the NetworkManager. Whatever instance this is called from becomes the network manager and it should only be
///      called one time.
///@param MaxConnections The maximum amount of connections that we can have.
///@param Username Username to send other connections!

if (!assert_singleton()) { 
	// If we destroying ourself, dont do any more code. 
	show_message_async("WARNING: priv_gnet_Initialize should only be called once. It seems to have been called multiple times.")
	return;
}

gnet_SystemEnums();
MAX_CONNECTIONS       = argument0;	
username              = argument1;
pingFrequency         = 5000;
connectionTimeoutTime = 13000;

// Data structures
connectionSlots	= array_create(MAX_CONNECTIONS, null);  // Create the connection slots array
m_connectionMap	= ds_map_create();						// Mapping the Ip and Port to correct slot id

signingId      = 0;										// Used to sign a reliable packet (increased with each use)
unAckedPackets = ds_map_create();						// Map used to hold all unacknowledged packets

// Create Sub Objects
instance_create_depth(x, y, 10000, FunctionRepeater);

// Register packet layouts
m_packetCallbackMap = ds_map_create();
m_packetLayoutMap = ds_map_create();
gnet_packet_layout_create(Gnet_PacketId.connection_request,  gnet_cb_ReceiveConnectionRequest, buffer_string);				   // current_time of the requester
gnet_packet_layout_create(Gnet_PacketId.connection_response, gnet_cb_ReceiveConnectionResponse, buffer_u8, buffer_string);     // Data: Response Status
gnet_packet_layout_create(Gnet_PacketId.ping,				 gnet_cb_ReceivePing, buffer_u8,  buffer_s32);                     // Data: Outgoing or Incoming | current_time 
gnet_packet_layout_create(Gnet_PacketId.disconnect,          gnet_cb_ReceiveDisconnect);									   // Data: Outgoing or Incoming | current_time 

// Initialize User Defined Packets
gnet_packet_layouts();