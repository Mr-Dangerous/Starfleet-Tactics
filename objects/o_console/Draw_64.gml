/// @description Insert description here
// You can write your code in this editor

var _list_size = ds_list_size(m_message_list)
var _y_offset = window_get_height() - 10
var _spacing = 15
	draw_set_color(c_white)
for (var i = _list_size-1; i > -1; i--){
	var _string = ds_list_find_value(m_message_list, i)
	draw_set_alpha(1 - ((_list_size - i)*.15))
	draw_text(10, _y_offset-((_list_size - i)*_spacing), _string)
	draw_set_alpha(1)
}