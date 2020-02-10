/// @description Insert description here
// You can write your code in this editor
//check for inputs
var w_pressed = keyboard_check_pressed(ord("W"))
var a_pressed = keyboard_check_pressed(ord("A"))
var s_pressed = keyboard_check_pressed(ord("S"))
var d_pressed = keyboard_check_pressed(ord("D"))
var q_pressed = keyboard_check_pressed(ord("Q"))
var e_pressed = keyboard_check_pressed(ord("E"))

var w_released = keyboard_check_released(ord("W"))
var a_released = keyboard_check_released(ord("A"))
var s_released = keyboard_check_released(ord("S"))
var d_released = keyboard_check_released(ord("D"))
var q_released = keyboard_check_released(ord("Q"))
var e_released = keyboard_check_released(ord("E"))


if (room = r_firing_range){
	if (w_pressed){
		gnet_rpc_send(0, scr_cb_send_w_pressed, local_client.m_client_id)
	}
	if (a_pressed){
		gnet_rpc_send(0, scr_cb_send_a_pressed, local_client.m_client_id)
	}
	if (s_pressed){
		gnet_rpc_send(0, scr_cb_send_s_pressed, local_client.m_client_id)
	}
	if (d_pressed){
		gnet_rpc_send(0, scr_cb_send_d_pressed, local_client.m_client_id)
	}
	if (q_pressed){
		gnet_rpc_send(0, scr_cb_send_q_pressed, local_client.m_client_id)
		show_debug_message("FIRE BUTTON PRESSED!")
	}
	if (e_pressed){
		gnet_rpc_send(0, scr_cb_send_e_pressed, local_client.m_client_id)
	}
	
	if (w_released){
		gnet_rpc_send(0, scr_cb_send_w_released, local_client.m_client_id)
	}
	if (a_released){
		gnet_rpc_send(0, scr_cb_send_a_released, local_client.m_client_id)
	}
	if (s_released){
		gnet_rpc_send(0, scr_cb_send_s_released, local_client.m_client_id)
	}
	if (d_released){
		gnet_rpc_send(0, scr_cb_send_d_released, local_client.m_client_id)
	}
	if (q_released){
		gnet_rpc_send(0, scr_cb_send_q_released, local_client.m_client_id)
	}
	if (e_released){
		gnet_rpc_send(0, scr_cb_send_e_released, local_client.m_client_id)
	}
	
}
