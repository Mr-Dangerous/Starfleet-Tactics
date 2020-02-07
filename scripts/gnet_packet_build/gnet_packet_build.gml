/**
@desc Creates a packet(buffer) using the data layout defined by using gnet_packet_layout_create
@example
 // Example of how this function can be called
 var packet = gnet_packet_build(PacketType.PositionUpdate, player.x, player.y);
 gnet_packet_send_to_all(packet);
*/
///@param {Number} PacketId A packet identifier. This must be an integer between 0 - 219. 220 - 255 is reserved for system packets
///@param {Value...} Data The data to store in the packet. The types of these arguments must match the types in given in this packets definition

if (argument_count < 1)
{
	log_error("Cannot use gnet_send_registered() without a MessagePacketId identifier parameter");
	return null;
}

var _packetId = argument[0];

// Array of data types that were registered with packet_layout_register
var _dataTypes = NetworkManager.m_packetLayoutMap[? _packetId];
if (is_undefined(_dataTypes))
{
	log_warn("There is no registered Packet Layout for packet type: {}", _packetId);
	return null;
}

// Check to see if parameter length matches the number of data arguments provided
if (array_length_1d(_dataTypes) != argument_count - 1)
{
	log_error("When calling gnet_packet_build for packetId {}, the amount of expected arguments: {}, did not equal the amount given: {}", 
				_packetId, 
				array_length_1d(_dataTypes), 
				argument_count - 1);
	return null;
}

var _buffer = priv_gnet_packet_create();

buffer_write(_buffer, buffer_u8, _packetId);

for (var _i = 1; _i < argument_count; _i++)
{
	var _type  = _dataTypes[_i - 1];
	var _value = argument[_i];
	
	
	if (_type == buffer_string && !is_string(_value))
		log_error("When building a registered message, a string was expected but a 'real' number was passed.");	
	if (is_string(_value) && _type != buffer_string)
		log_error("When building a registered message, a string was passed in but a 'real' number was expected.");
	
	// Handle reading array types
	if (_type == GNET_ARRAY_COUNT)
	{
		var _arraySize = _value;						// Number of entries in array
		buffer_write(_buffer, buffer_u8, _arraySize);	// Write buffer and increment i since we need to find the array data
		_i += 1;
	
		var _dataArray    = argument[_i];
		var _arrayOfTypes = _dataTypes[_i - 1];			// Have to maintain the data types offset.. unfortunately
		
		for (var a = 0; a < array_length_1d(_dataArray); a++)
		{
			var _subDataArray = _dataArray[a];
			if (array_length_1d(_subDataArray) != array_length_1d(_arrayOfTypes))
				show_error("Issue writing repeating array. Number of values in array did not match the number of data_types in the array definition.", true);	
			
			for (var v = 0; v < array_length_1d(_subDataArray); v++)
				buffer_write(_buffer, _arrayOfTypes[v], _subDataArray[v]);	
		}
	}
	else
	{
		buffer_write(_buffer, _type, argument[_i]);
	}
}

// TODO Keep an eye on this
buffer_resize(_buffer, buffer_tell(_buffer));
log_debug("Buffer Size Sent: " + string(buffer_get_size(_buffer)));

return _buffer;
