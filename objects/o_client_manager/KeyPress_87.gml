/// @description Send command to the serer to accelerate ships

if (room = r_firing_range){
	gnet_rpc_send(0, scr_cb_send_w_pressed, local_client.m_client_id)
}