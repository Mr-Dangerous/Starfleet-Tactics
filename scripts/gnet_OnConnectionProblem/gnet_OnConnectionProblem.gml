/**
@desc **System Callback**
	  This function is called when communication with a client has been interupted
   This means that no data has been received from the given connection even though
	  it has been tryed. (Time can be configured with gnet_set_connection_timeout. Default is 8 seconds)
	  **NOTE:** Maybe you have peer to peer. You cant just disconnect yours, what if that
	            connection is communicating to other people just fine? You would do that logic
	            here to perform checks and things.
*/		
///@param {Connection} Connection This is the "Connection" instance. This is passed in so that you can have access to all of that instances properties. In general you should only need to access Connection.connectionId.

var _connectionInst = argument0;	// This is the actual Connection Instance! To get its id you can use _connectionInst.connectionId;

gnet_disconnect_id(_connectionInst.connectionId); // Default behaviour. In a p2p or host situation may need to handle differently
