///@desc Cleanly remove a connection from NetworkManager data structures. Connection instance still exists
///@param Connection Instance of connection to remove
var _connInst = argument0;
var _myKey = string(_connInst.ip) + ":" + string(_connInst.port);
var _conId = _connInst.connectionId;


with (NetworkManager)
{
	if (_conId != null)
	{
		connectionSlots[_conId] = null;
	}
	
	ds_map_delete(m_connectionMap, _myKey);
}

log_debug("Connection {} has been removed", _conId);

if (_connInst.connectionState == ConnectionState.Connected)
{
	gnet_OnDisconnection(_conId);
}

_connInst.connectionState = ConnectionState.Disconnected;
_connInst.ip           = null;
_connInst.port         = null;
_connInst.connectionId = null;