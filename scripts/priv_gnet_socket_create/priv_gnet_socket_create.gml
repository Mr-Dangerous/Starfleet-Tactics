///@desc Sets up a socket to use for connections, and protocol
///@param ProtocolId
///@param Port

// Protocol Id - 16 bit positive number
if (!variable_global_exists("gnet_protocolId"))
{
	if (argument_count > 0)
		global.gnet_protocolId = argument[0];
	else
		global.gnet_protocolId = 12312;
		
	if (global.gnet_protocolId > 65535) 
	{
		log_error("Specified gnet_protocolId is too large. Maximum value is 65535. Using 65534. External connected applications might not work.");
		global.gnet_protocolId = 65534;
	}
}
else
{
	log_warn("gnet_create has already been called, or global.gnet_protocalId is initialized somewhere else");	
}

// Return true or false depending on if the initialization was successful
var _result;

if (argument_count > 1) {
	_result = network_create_socket_ext(network_socket_udp, argument[1]);
	if (_result >= 0) {
		global.gnet_myPort   = argument[1];
		global.gnet_mySocket = _result;
	}
}
else {
	// Search for a port between the port range above
	for (var _i = 3000; _i <= 6000; _i++)
	{
		_result = network_create_socket_ext(network_socket_udp, _i);
	
		if (_result >= 0)
		{
			global.gnet_myPort = _i;
			global.gnet_mySocket = _result;
			break;
		}
	}
}

return _result >= 0;

