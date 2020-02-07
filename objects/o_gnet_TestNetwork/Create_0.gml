/// @description Initialize

var res = gnet_start_network(2, 1232, 3000, "Owner");

if (!res)
{
	show_debug_message("Joining");	
	res = gnet_start_network(2, 1232, -1, "Owner");
	var connSucc = gnet_connect("127.0.0.1", 3000);
	
	if (connSucc[0] == null)
	{
		show_message("Test Failed");
		show_message(connSucc[1]);
	}
}
else
{
	show_debug_message("Hosting");	
}