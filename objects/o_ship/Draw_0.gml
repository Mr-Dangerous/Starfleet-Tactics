/// @description Insert description here
// You can write your code in this editor

for (var  i = 0; i < ds_list_size(extra_sprite_list); i++){
	var _sprite = ds_list_find_value(extra_sprite_list, i)
	draw_sprite_ext(_sprite[0], _sprite[1], _sprite[2], _sprite[3],
	_sprite[4], _sprite[5], _sprite[6], _sprite[7], _sprite[8])
}
draw_self()

#region post draw_self() - universal graphics that appear over the ship

#endregion

ds_list_clear(extra_sprite_list)

