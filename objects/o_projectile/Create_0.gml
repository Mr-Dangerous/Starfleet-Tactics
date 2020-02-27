/// @description Insert description here
// You can write your code in this editor
rotate = false
rotate_case = 0
flip = false
flip_case = 0
ship_target = noone //noone also equals any!

server_manager = instance_find(o_server_manager, 0)
sprite_list = ds_list_create()
if (instance_exists(server_manager)){
	sprite_list = server_manager.sprite_list
}
damage = 1
owner = -1