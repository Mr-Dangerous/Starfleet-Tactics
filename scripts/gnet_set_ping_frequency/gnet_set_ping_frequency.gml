/**
@desc Set the ping frequency in seconds. This is how much time there shoudld be between sending ping
	  packets. Note that when no other information is going on, these packets keep the connection alive.
	  If you change this setting you may want to also extend the connectionTimeoutTimer using gnet_set_connection_timeout()
*/
///@param {Number} Seconds Amount of seconds between sending ping packets

NetworkManager.pingFrequency = 1000 * argument0;