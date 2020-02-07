///@desc Send an RPC command across the network to the specified connectionId
///@param {Number} connectionId The connectionId to send the command to
///@param {ScriptId} Script The script id that should be executed  by the receiving player
///@param {[Arguments]} Arguments Arguments that should be passed to the script

var _buff = argument0;

var _buffBeginPos = buffer_tell(_buff);

var _scrId    = buffer_read(_buff, buffer_u16); // Script Id
var _argCount = buffer_read(_buff, buffer_u8);  // Argument Count

var args = array_create(_argCount, null);

for (var i = 0; i < _argCount; i++)
{
	var _type = buffer_read(_buff, buffer_u8);
	args[i] = buffer_read(_buff, _type);
}

buffer_seek(_buff, buffer_seek_start, 0);

gnet_OnRPCMessage(_buff, _scrId, args);