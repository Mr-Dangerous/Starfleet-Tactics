/// @description Insert description here
// You can write your code in this editor
if (owner = other.owner){
	var _p_dir = point_direction(x, y, other.x, other.y)
	speed -= 1
	motion_add(_p_dir, 10)
	show_debug_message("motion adjusted")
}