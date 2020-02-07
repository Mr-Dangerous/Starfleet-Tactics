///@desc Receive a response to a connection request message we sent to an endpoint
///@param connectionId
///@param receivedDataArray

var _connectionId  = argument0;
var _receivedData  = argument1;

var _result = _receivedData[0];
var _ip     = async_load[? "ip"];
var _port   = async_load[? "port"];

var _connectionInst = priv_gnet_get_connection(_ip, _port);

// If not good result.. Disconnect possibly?
if (_result == ConnectionAddResult.AlreadyConnected)
{
	show_message_async("You are already connected with this connection. Maybe an issue here.");
}
else if (_result == ConnectionAddResult.MaxPlayer) 
{
	show_message_async("This connection is all full. Cannot connect");
	with (_connectionInst) { EVENT_CONNECTION_RESULT_FAILED }
}
else if (_result == ConnectionAddResult.Success) 
{
	if (_connectionInst == null) {
		log_error("We received a ConnectionSuccess message from an address that we do not have a created Connection for: {}:{}", _ip, _port);	
		return;
	}
	
	with (_connectionInst) { 
		username = _receivedData[1];
		EVENT_CONNECTION_RESULT_SUCCESS 
	};
}
		
gnet_OnConnectionReply(_result, gnet_get_connection_id(_ip, _port));	// Function for custom user handling