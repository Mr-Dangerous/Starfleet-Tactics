///@desc Returns a connectionId associated with the given ip and port
///@param {String} Ip IP Address to get the connection association
///@param {Number} Port Port of the address to get the connection association from

var _connId = NetworkManager.m_connectionMap[? (string(argument0) + ":" + string(argument1))];

if (is_undefined(_connId))
	return null;

return _connId;