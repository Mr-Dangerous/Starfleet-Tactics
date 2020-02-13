/// @description Insert description here
// You can write your code in this editor
if (instance_exists(reference_squad)){
	var _p_dir = point_direction(reference_squad.x, reference_squad.y, x, y)
	var _upper_left_point_x = x + lengthdir_x(10, _p_dir+170)
	var _upper_left_point_y = y + lengthdir_y(10, _p_dir+170)
	var _bottom_left_point_x = x+ lengthdir_x(10, _p_dir+190)
	var _bottom_left_point_y = y +lengthdir_y(10, _p_dir+190)
	draw_triangle_color(x, y, _upper_left_point_x, _upper_left_point_y, _bottom_left_point_x, _bottom_left_point_y, c_white, c_white, c_white, false)
	draw_line_width_color(reference_squad.x, reference_squad.y, x, y, 4, c_red, c_white)
}