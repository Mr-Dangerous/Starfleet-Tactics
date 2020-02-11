/// @description Insert description here
// You can write your code in this editor
duration = 1
fade = false

sprite_list= ds_list_create()
server_manager = instance_find(o_server_manager, 0)
if (instance_exists(server_manager)){
	sprite_list = server_manager.sprite_list
}