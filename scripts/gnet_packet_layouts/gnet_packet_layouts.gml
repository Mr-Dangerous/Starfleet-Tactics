/**	
@desc This is a script that is empty by default but is called when the network is initialized, so you do not
	  need to call this from anywhere. Here you will define your packet layouts that will be used to pack your
	  data when you use gnet_packet_build(PacketType, data).
	  
      You should familiarize yourself with the buffer data types. Dont worry its not scary, it is how you
      can optimize the amount of bytes you send! Example data layout.
	  Packet ID integers should be between 0 - 219 since 220-255 is reserved for system level packets.

@example 
    // Example on how to define a packet made for sending x and y coordinates
	enum PacketId { pos_update = 0, death_notification }
	gnet_packet_layout_create(PacketId.pos_update, buffer_s32, buffer_s32);   
@example  
	// Example on how to define a packet made for sending a death notification of a specific client_id
	enum PacketId { pos_update = 0, death_notification }
	gnet_packet_layout_create(PacketId.death_notification, buffer_u8);
*/
enum game_packet_type{
	//Packet that is received by all clients when a new client is connected
	new_client_connect_notification, 
	//every piece of data you need to know about each connected client.
	all_client_data,
	client_disconnect_notification,
	//All of the data needed to draw a sprite.  check the draw_sprite_ext()
	send_sprite_data
	
	
}
gnet_packet_layout_create(game_packet_type.new_client_connect_notification, scr_cb_new_client_connect_notification, buffer_u8, buffer_string);
gnet_packet_layout_create(game_packet_type.all_client_data, scr_cb_all_client_data, GNET_ARRAY_COUNT, [buffer_u8, buffer_string])
gnet_packet_layout_create(game_packet_type.client_disconnect_notification, scr_cb_client_disconnect_notification, buffer_u8)
gnet_packet_layout_create(game_packet_type.send_sprite_data, scr_cb_send_sprite_data, buffer_u16, buffer_u8, buffer_s16 , buffer_s16, buffer_u8, buffer_u8, buffer_s16, buffer_string, buffer_u8) 
