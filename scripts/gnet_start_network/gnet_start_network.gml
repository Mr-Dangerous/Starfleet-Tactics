/** 
 @desc Creates everything you need for GloomyNetworking. Call this when you are ready to initialize
        your NetworkManager and socket. You should store the result of this call into a variable and handle
        it accordingly.
 @example 
 // Example server setup with a specified port
 var result = gnet_start_network(10, 1232, 3000, "Server");
 
 if (result == true)
     // You are succesfully connected!
 else
     show_message("We were not able to establish the network listening at the port 3000");
 
@example 
 // Example client setup with automatically assigned port
 var result = gnet_start_network(10, 1232, -1, "GloomyToad");
 
 if (result == true)
     show_message("Your networking has been established on port " + string(global.gnet_myPort));
 else
     show_message("We could not establish a network. We could not find an available port automatically.");
 **/

/// @param {number} MaxConnections the maximum connections you want to allow. For Client / Server, the Server would allow the number of players you want in a game. 														For the Client you would only want 1 connection. (To the server).
/// @param {number} ProtocolId This should be a number between 1 - 65535. The number doesnt matter, but you shouldnt ever change it after releasing a build of your game.
/// @param {number} Port The port to communicate through. Using a number below 0 will automatically look for a Port to use.
/// @param {string} Username  Username to use over the network! You can use this for.. usernames in games or maybe identifying connections in a way other than connectionId
/// @returns {boolean} True if the network was initialized properly, or false if it was not successful (Port not open?)

var _maxConnections = argument0;
var _protocolId     = argument1;
var _targetPort     = argument2;
var _username       = argument3;

if (instance_exists(NetworkManager))
{
	show_message_async("ERROR: A network manager exists, and you are trying to initialize another one!");
	return false;
}

var _managerInst = instance_create_depth(x, y, -1, NetworkManager);

with (NetworkManager)
{
	priv_gnet_initialize(_maxConnections, _username);

	var success;
	if (_targetPort >= 0 && _protocolId > 0)
		success = priv_gnet_socket_create(_protocolId, _targetPort);
	else if (_targetPort >= 0)
		success = priv_gnet_socket_create(12312, _targetPort);
	else if (_protocolId > 0)
		success = priv_gnet_socket_create(_protocolId);
	else
		success = priv_gnet_socket_create();

	if (success) 
	{
		log_info("Socket Creation Successful!!!! ::::: At Port: {}", global.gnet_myPort);
		return true;
	}
	else 
	{
		log_warn("Socket Creation Not Successful. The port may be taken");
		instance_destroy();
		return false;
	}
}