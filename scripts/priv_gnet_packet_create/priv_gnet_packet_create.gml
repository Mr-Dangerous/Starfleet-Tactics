/**
@desc Create a buffer with the protocol header already written. The buffer returned is ready for data
      to be written to. In addition, when you read the data on the recipient side the header will have
      already been read, and the buffer seek position will be placed at the first byte of your data.
*/

#macro PACKET_HEADER_SIZE 3
#macro PACKET_PROTOCOL_POS 0
#macro PACKET_CHANNEL_POS 2

var _buffer = buffer_create(2, buffer_grow, 1);
buffer_write(_buffer, buffer_u16, global.gnet_protocolId);  // Protocol Id
buffer_write(_buffer, buffer_u8, NetChannel.Unreliable);    // Channel (Can change this before send if needed)
return _buffer;
