///@desc Returns a connection object associated with the given ip and port
///@param ip
///@param port

var _connId = NetworkManager.m_connectionMap[? (string(argument0) + ":" + string(argument1))];

if (is_undefined(_connId))
	return null;


var _inst = NetworkManager.connectionSlots[_connId];
if (!instance_exists(_inst)) {
	show_error("A Connection has been destroyed, but the data structure not cleared out. Please report this as a bug \n if you did not manually accidently destroy a Connection instance", false);
	return null;
}

return _inst;