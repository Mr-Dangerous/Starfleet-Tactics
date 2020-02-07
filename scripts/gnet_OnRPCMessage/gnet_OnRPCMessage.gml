/**
@desc This script is called when you receive an RPC Message. You can handle RPC messages as you would like. The buffer is passed in in case you want
	  to resend it, but the buffer has also been unpacked and data stored into the _arguments variable as an array.
@param {Buffer} Buffer The received buffer. The data in this buffer has already been unpacked into _arguments. This is
			    provided if you would like to resend the RPC instead of processing it (Client / Server).
@param {Script} Script The script to execute
@param {[Argument]} Arguments An array of arguments that should be executed with the script
*/

var _buffer    = argument0; // Received Buffer (Packet) This can be forwarded to another connection if needed
var _script    = argument1; // Script to execute
var _arguments = argument2; // Arguments for the script

// By default the RPC is executed. You can delete the below code and execute as you would like.
// For example. In a Client Server system, you may want the server to handle the command some way,
// then pass the packet on to a specified client.
gnet_rpc_execute(_script, _arguments);
