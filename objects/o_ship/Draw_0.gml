/// @description Insert description here
// You can write your code in this editor

for (var  i = 0; i < ds_list_size(extra_sprite_list); i++){
	var _sprite = ds_list_find_value(extra_sprite_list, i)
	draw_sprite_ext(_sprite[0], _sprite[1], _sprite[2], _sprite[3],
	_sprite[4], _sprite[5], _sprite[6], _sprite[7], _sprite[8])
}
draw_self()

//just for a moment
/*
if (instance_exists(ship_target)){
	draw_line(x, y, ship_target.x, ship_target.y)
}
*/

var total_hp = armor + shields
var _max_hp = max_armor + max_shields
var _display_string = string_build("{}/{}", total_hp, max_armor)
var _energy_string = string_build("{}/{}", energy, max_energy)
var _text_color = c_aqua
if (total_hp < max_armor){
	_text_color = c_white
}
draw_set_halign(fa_center)
draw_text_ext_color(x, y+(70*image_scale), _display_string, 0, 20, _text_color, _text_color, _text_color, _text_color, 1)
draw_text_ext_color(x, y+(90*image_scale), _energy_string, 0, 20, c_purple, c_purple, c_purple, c_purple, 1) 
draw_set_halign(fa_left)


#region post draw_self() - universal graphics that appear over the ship

#endregion

ds_list_clear(extra_sprite_list)

if ( display_timeline = true){
	var _timeline_string = ""
	if (timeline_index < 0){
		_timeline_string = "No timeline!"
	} else {
		_timeline_string = timeline_get_name(timeline_index)
	
	}
	draw_text(x, y, _timeline_string)
}

