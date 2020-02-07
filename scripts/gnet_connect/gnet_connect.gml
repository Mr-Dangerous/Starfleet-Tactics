/**
@desc Attempt to make a connection to the given ip and port.
@returns {Array} Array where index 0 is the connectionId if connection attempt has been started, or null otherwise.
                        index 1 is a string message with details on what happened.
@example
	   // Example showing how a connection result can be used
       _result		  = gnet_connect("127.0.0.1", "3000");
	   _connectionId = _result[0];					// Assigned connection id to reference this connection
	   _resultMsg    = _result[1];					// String message of the result

	   if (_result == null) { Connection attempt not started. resultMsg will tell you why! }
       else { connection attempt started, waiting on reply! }
*/
///@param {String} IP The IP address to attempt to connect to
///@param {Number} Port The port to connect to
///@returns {Array} Result Returns a 2 element array where index[0] is null if we were unable to send a connection request, and index[1] is a String that is a message containing information about the result

var _ip   = argument0;
var _port = argument1;

if (!instance_exists(NetworkManager))
{
	show_message("ERROR: NetworkManager has not been initialized. Please use gnet_start_network().");
	return[null, "Network Manager not initialized."];
}

if (!variable_global_exists("gnet_mySocket") ||  global.gnet_mySocket < 0)
{
	log_warn("You have not successful established a socket. Cannot establish connection");
	return[null, "Socket has not been established. If using gnet_start_network() then there may be a bug!"];
}

if (global.gnet_myPort == _port && _ip == "127.0.0.1")
{
	log_warn("You cannot connect to your own socket!");
	return[null, "Attempting to connect to our own socket"];
}	

// Send a connection packet
var _result = priv_gnet_add_connection(_ip, _port, true);
var _MSG    = "";

switch (_result[0])
{
	case ConnectionAddResult.AlreadyConnected:
		_MSG = "Already connected to the given ip and port";
		break;
	case ConnectionAddResult.MaxPlayer:
		_MSG = "We already have the maximum amount of connectinos allowed";
		break;
	case ConnectionAddResult.Success:
		_MSG = "Successfully started Connection process, waiting for response..";
		break;
	case ConnectionAddResult.Error:
		_MSG = "Error trying to add a new connection";
		break;
	default: _MSG = "Unknown Error From gnet_connect"; break;
}

return [_result[1], _MSG];