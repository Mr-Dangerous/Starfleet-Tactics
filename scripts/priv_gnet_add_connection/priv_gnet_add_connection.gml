///@desc Creates and Adds a new connection to our data structures. Returns result of add
///@param IP
///@param PORT
///@param isOutgoingRequest Are we creating a connection for an outgoing request or incoming

enum ConnectionAddResult 
{
	Success,
	MaxPlayer,
	AlreadyConnected,
	Error
}

var _ip				   = argument0;
var _port			   = argument1;
var _isOutgoingRequest = argument2;

var _connectionKey = string(_ip) + ":" + string(_port);

with (NetworkManager)
{
	if (ds_map_exists(m_connectionMap, _connectionKey)) return [ConnectionAddResult.AlreadyConnected, null];
	
	var _connId = priv_gnet_get_free_connection();
	
	if (_connId == null) return [ConnectionAddResult.MaxPlayer, null];
	
	m_connectionMap[? _connectionKey] = _connId;
	
	// Ip, Port, Ping, Last Update (This returns an array, can be accessed using gnet_connection_get_stat);
	connectionSlots[_connId] = priv_gnet_create_connection(_ip, _port, _connId); 
	
	if (!instance_exists(connectionSlots[_connId])) {
		log_error("Uh Oh.. When creating a new Connection instance priv_gnet_create_connection did not return a valid instance");
		return [ConnectionAddResult.Error, null];
	}
	
	if (_isOutgoingRequest)
	{
		// Execute a user event that starts connection process	
		with (connectionSlots[_connId]) { EVENT_CONNECTION_SEND }  
	}
	else 
	{
		with (connectionSlots[_connId]) { EVENT_CONNECTION_RECEIVED }  
	}

	log_info("Connection Added With id {} and key {}", _connId, _connectionKey);
	
	return [ConnectionAddResult.Success, _connId];
}