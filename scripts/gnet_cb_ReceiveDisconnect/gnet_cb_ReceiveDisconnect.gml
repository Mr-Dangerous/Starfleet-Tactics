///@desc Received Disconnect Message. Destroys Connection
///@param ConnectionId
///@param ReceivedDataArray

var _connectionId = argument0;
var _receivedData = argument1;
var _connectionInstance = gnet_get_connection_by_id(_connectionId);

with(_connectionInstance) { instance_destroy(); }