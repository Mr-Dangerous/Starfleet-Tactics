/**
@desc Use this function to create layout data for a packet type. This is used to automatically
      write and read the correct types from the buffer allowing you to only specify the data
      of a packet when writing, and when you receive a packet type with a defined layout type,
      you will not need to unpack the data yourself, it will be given to you in an array, and that
      array will be sent to a script that you define, so you can handle it!
@example
   // Ready for x, and y data!
   gnet_packet_layout_create(Gnet_PacketId.position_update, buffer_s16, buffer_s16);
*/
///@param {Number} PacketId A unique packet identifier. This must be an integer between 0 - 219. 220 - 255 is reserved for system packets
///@param {ScriptId} Script The script to call when this type of packet is received. An array of the data will be sent to that script as argument0
///@param {Buffer Type...} DataTypes A series of buffer_data_types that will be stored in this packet.

if (argument_count < 2)
{
	log_error("gnet_packet_layout_create() needs to have at least 2 parameters defining its PacketType and callback script.");
	return;
}

if (ds_map_exists(NetworkManager.m_packetLayoutMap, argument[0])) 
{
	log_error("The data layout cannot be re-registered, it has already been done for packetType {}", argument[0]);	
	return;
}

// Return empty array if there is no data to be sent with this message
if (argument_count == 2)
{
	ds_map_add(NetworkManager.m_packetLayoutMap, argument[0], []);
	ds_map_add(NetworkManager.m_packetCallbackMap, argument[0], argument[1]);
	return [];
}

// If there is data we need to build the array
var _array = array_create(argument_count - 2);

for (var _i = 0; _i < argument_count - 2; _i++)
{
	_array[_i] = argument[_i + 2];
}

ds_map_add(NetworkManager.m_packetLayoutMap, argument[0], _array);
ds_map_add(NetworkManager.m_packetCallbackMap, argument[0], argument[1]);	// Holds script to be executed
return _array;
