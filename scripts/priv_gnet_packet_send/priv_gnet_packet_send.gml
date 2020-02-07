///@desc Send a packet across the network
///@param Buffer
///@param IP
///@param Port

if (argument0 == null)
{
	log_error("Undefined buffer passed in when trying to send a packet, are you sure it built correctly? (Value is undefined). It was not sent.");
	
	var _a = debug_get_callstack();
    for (var i = 0; i < array_length_1d(_a); i++)
    {
        show_debug_message(_a[i]);
    }
	return;
}

if (global.gnet_mySocket < 0)
{
	log_error("Attempting to send data with no socket setup.");
	return;
}

network_send_udp(global.gnet_mySocket, argument1, argument2, argument0, buffer_get_size(argument0));


