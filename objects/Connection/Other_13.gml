/// @description On Connection Failed
#macro EVENT_CONNECTION_RESULT_FAILED event_user(3);

log_debug("Connection Failed For Connection {}", connectionId);
instance_destroy();