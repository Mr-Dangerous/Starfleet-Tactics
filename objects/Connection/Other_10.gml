/// @description (Create) Send Connection
/// Used in place of create event so we can use instance_create() -> assign variables -> then have it initialize

#macro EVENT_CONNECTION_SEND event_user(0);

// This event will send a connection message and repeat it 2 extra times if needed.

connectionState    = ConnectionState.Connecting;
connectionAttempts = 3;
lastUpdate		   = current_time;
lastPing           = current_time;

// 1 connection attempt
priv_gnet_send_conn_request(ip, port);

// 2 more connection attempts
repeat_function(connectionAttempts, room_speed / 2, 1, priv_gnet_send_conn_request, ip, port);