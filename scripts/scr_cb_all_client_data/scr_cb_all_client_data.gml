//recieved all client data

var _connection_id = argument0
var _data = argument1

var _all_client_data = _data[0]

for (var i = 0; i < array_length_1d(_all_client_data); i++){
	var _current_client_data = _all_client_data[i]
	var _current_client_id = _current_client_data[0]
	var _current_client_username = _current_client_data[1]
	if (scr_get_client_by_id(_current_client_id) == noone){
		
		with (instance_create_depth(-100, -100, -100, o_client)){
			m_client_id = _current_client_id
			m_username = _current_client_username
			scr_console_add_message(string_build("{} has connected with connection id {}", m_username, m_client_id ))
			if (i = 0){
				client_manager = instance_find(o_client_manager, 0)
				client_manager.local_client = id
				scr_console_add_message("My Client id is added at: " + string(m_client_id))
			}
		}
	}
		
}