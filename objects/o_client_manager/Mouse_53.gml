/// @description Insert description here
// You can write your code in this editor
var _mouse_x = device_mouse_x_to_gui(0)
var _mouse_y = device_mouse_y_to_gui(0)
if (room = r_firing_range){
	var _owner = local_client.m_client_id

	scr_console_add_message(string_build("Left click command sent from connection {}", _owner))
	gnet_rpc_send(0, scr_cb_client_left_mouse_pressed, _mouse_x, _mouse_y, local_client.m_username)
	//test function
	var spawn_button = instance_position(mouse_x, mouse_y, o_temp_button)
	if (instance_exists(spawn_button)){
		var _ship_name = spawn_button.ship_name
		
		scr_console_add_message(string_build("Request to make {} from connection {}", _ship_name, _owner))
		gnet_rpc_send(0, scr_cb_create_ship_firing_range, _ship_name, _owner)
	}
	

}