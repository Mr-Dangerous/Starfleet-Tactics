/// @description On Connection Success
///			     This event is called when a ConnectionResponse.Successful is received from an outgoing request
#macro EVENT_CONNECTION_RESULT_SUCCESS event_user(2);

log_info("Connection was successful for connectionId " + string(connectionId));

connectionState = ConnectionState.Connected;

lastUpdate = current_time;
alarm[0] = room_speed; // Once a second