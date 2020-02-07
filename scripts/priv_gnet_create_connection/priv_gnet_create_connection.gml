///@desc Create A Connection Instance
///@param ip
///@param port
///@param connectionId

if (!layer_exists("Connections"))
{
	global.connectionsLayer = layer_create(-1000, "Connections");	
}

var inst = instance_create_layer(0, 0, global.connectionsLayer, Connection);
with (inst)
{
	ip              = argument0;
	port            = argument1;
	ping	        = 0;
	lastUpdate      = current_time;
	username        = "A Player";
	connectionId    = argument2;
	connectionState = ConnectionState.Disconnected;
}

return inst;