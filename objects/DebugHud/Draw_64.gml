/// @description Draw Gui Info

var connectionInfoX = 10;
var dataStructsX = window_get_width() / 2;
var ySpacing        = 15;

var str, inst;

if (drawConnectionInfo)
{
	#region Connection Info Drawing
	draw_set_color(c_white);
	for (var i = 0; i < instance_number(Connection); i++)
	{
		inst = instance_find(Connection, i);
		str  = string_build("Connection: {} | {}:{} | {}",  inst.connectionId, 
															inst.ip, 
															inst.port, 
															global.ENUM_NAME_CONNECTION_STATE[inst.connectionState]);
		draw_text(connectionInfoX, 10 + (i * ySpacing), str);	
	}

	i += 2; // Spacing

	var key = ds_map_find_first(NetworkManager.m_connectionMap);
	
	while (!is_undefined(key))
	{
		var _connId = NetworkManager.m_connectionMap[? key];
	
		str = key + " | " + string(_connId);
		draw_text(connectionInfoX, 10 + (i++ * ySpacing), str);	
		
		key = ds_map_find_next(NetworkManager.m_connectionMap, key);
	}

	i++; // Spacing

	for (a = 0; a < array_length_1d(NetworkManager.connectionSlots); a++)
	{
		var _inst = NetworkManager.connectionSlots[a];
		if (_inst != null)
			str = string_build("Slot [{}] = {} | Ping: {} | Last Update: {}", a, _inst, _inst.ping, _inst.lastUpdate);
		else
			str = string_build("Slot [{}] = {} | Ping: 0", a, _inst);
		draw_text(connectionInfoX, 10 + (i++ * ySpacing), str);	
	}
	#endregion
	
	draw_set_halign(fa_right);
	draw_text(room_width - 10, 10, "Bytes Per Second: "   + string(NetworkManager.m_AverageBytesPerSecond));
	draw_text(room_width - 10, 40, "Packets Per Second: " + string(NetworkManager.m_AveragePacketsPerSecond));
	draw_set_halign(fa_left);
}

