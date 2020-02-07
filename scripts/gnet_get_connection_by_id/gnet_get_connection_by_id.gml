///@desc Returns a connection object associated with the given connectionId
///@param {Number} Identifier of the connection to attempt to find the instance of
///@returns {InstanceId} Connection Returns the instance id of the connection associated with the provided id, or null if the connection was not found
if (NetworkManager.connectionSlots[argument0] == null)
	return null;

return NetworkManager.connectionSlots[argument0];