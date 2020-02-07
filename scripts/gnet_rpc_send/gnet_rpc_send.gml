///@desc Send an RPC command across the network to the specified connectionId. This type of command will
///     auto detect the value types and send the data across the network. Because of this it is not as
///	    fast as sending data with packet layouts, and you shouldn't use RPC's for data that gets sent
///     many times per second. (It is not slow but could become slow if overused, just be careful).
///@param {Number} connectionId The connectionId to send the command to
///@param {ScriptId} Script The script id that should be executed  by the receiving player
///@param {[Arguments]} Arguments Arguments that should be passed to the script

if (argument_count < 2)
{
	show_error("You cannot execute an RPC command without providing at least 2 arguments", true);	
}

var _connectionId	= argument[0];			// Connection Id To Send To
var _script			= argument[1];			// Script id to send
var _numScriptArgs	= argument_count - 2;	// Number of arguments to send

if (gnet_get_connection_by_id(_connectionId) == null)
	show_error("The connection id " + string(_connectionId) + " that you are trying to send an RPC to does not exist", true);

if (!script_exists(_script))
	show_error("The script id that you provided for an RPC is not valid. The script does not exist", true);

// Write header and packet id
var _buffer = priv_gnet_packet_create();
buffer_write(_buffer, buffer_u8, Gnet_PacketId.RPC);

// Write script
buffer_write(_buffer, buffer_u16, _script);

// Write argument count
buffer_write(_buffer, buffer_u8, _numScriptArgs);

//Write arguments
for (var i = 2; i < argument_count; i++)
{
	var val  = argument[i];
	var type = null;
	
	if (is_string(val))
		type = buffer_string;
	else 
	{
		if (is_array(val)) { show_error("RPC commands do not except arrays as arguments.", true); return; }
		
		// Determine the type of value since it is not a string
		var rem = abs(val mod 1);
		if (rem < 0.0001)
		{
			// Is an integer
			if (val >= 0) 
			{
				if (val <= 255)
					type = buffer_u8;
				else if (val <= 65535)
					type = buffer_u16;
				else if (val <= 4294967295)
					type = buffer_u32;
			}
			else
			{
				if (val >= -128 && val <= 127)
					type = buffer_s8;
				else if (val >= -32768 && val <= 32767)
					type = buffer_s16;
				else if (val >= -2147483648 && val <= 2147483647)
					type = buffer_s32;
			}
		}
		else
		{
			show_message("Writing Float: " + string(val));
			// Is a float
			if (abs(val) <= 16777216)
				type = buffer_f32;
			else
				type = buffer_f64;
		}
	}
	
	// Write type and value
	buffer_write(_buffer, buffer_u8, type);
	buffer_write(_buffer, type, val);
}
buffer_resize(_buffer, buffer_tell(_buffer));

gnet_packet_send_to_id(_buffer, _connectionId);
buffer_delete(_buffer);
