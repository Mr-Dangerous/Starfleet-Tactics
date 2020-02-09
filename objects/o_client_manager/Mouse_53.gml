/// @description Insert description here
// You can write your code in this editor
var _mouse_x = device_mouse_x_to_gui(0)
var _mouse_y = device_mouse_y_to_gui(0)
if (room = r_firing_range){
gnet_rpc_send(local_client.m_client_id, scr_cb_client_left_mouse_pressed, _mouse_x, _mouse_y, local_client.m_username)
}