///@desc Get the username associated with a connection.
///@param {number} ConnectionId The identifier of the connection to get the username of.
///@return {String} Username Returns the username of the connection id or null if the connection was not found

var _connectionId = argument0;

var _connInst = gnet_get_connection_by_id(_connectionId);

if (_connInst == null) return null;

with (_connInst)
{
	return username;	
}