///@desc Executes a received RPC command. By default this executes from the gnet_OnRPCReceive script
///@param {Script} ScriptId Script to excute with the given arguments
///@param {[Arguments]} Arguments Arguments to provide during execution of the script. Current max is 9 arguments

var _script    = argument0;
var _arguments = argument1;

switch(array_length_1d(_arguments))
{
	case 0: script_execute(_script); break;
	case 1: script_execute(_script, _arguments[0]); break;
	case 2: script_execute(_script, _arguments[0], _arguments[1]); break;
	case 3: script_execute(_script, _arguments[0], _arguments[1], _arguments[2]); break;
	case 4: script_execute(_script, _arguments[0], _arguments[1], _arguments[2], _arguments[3]); break;
	case 5: script_execute(_script, _arguments[0], _arguments[1], _arguments[2], _arguments[3], 
									_arguments[4]); 
	break;
	case 6: script_execute(_script, _arguments[0], _arguments[1], _arguments[2], _arguments[3], 
									_arguments[4], _arguments[5]); 
	break;
	case 7: script_execute(_script, _arguments[0], _arguments[1], _arguments[2], _arguments[3], 
									_arguments[4], _arguments[5], _arguments[6]); 
	break;
	case 8: script_execute(_script, _arguments[0], _arguments[1], _arguments[2], _arguments[3], 
									_arguments[4], _arguments[5], _arguments[6], _arguments[7]); 
	break;
	case 9: script_execute(_script, _arguments[0], _arguments[1], _arguments[2], _arguments[3], 
									_arguments[4], _arguments[5], _arguments[6], _arguments[7], _arguments[8]); 
	break;
	default: show_error("More than 9 arguments are not supported for receiving RPC calls", true);
}