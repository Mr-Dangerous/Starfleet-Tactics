/// @description (Create) Received Connection
///              This is called when this connection was created from a received connection request. (incoming)

#macro EVENT_CONNECTION_RECEIVED event_user(1);

connectionState = ConnectionState.Connected;
lastUpdate      = current_time;
lastPing        = current_time;

alarm[0] = room_speed; // Once a second