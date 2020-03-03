/// @description Insert description here
// You can write your code in this editor
if (other = ship_target and !attached){
	attached = true
	length_offset = point_distance(x, y, other.x, other.y)
	direction_offset = point_direction(x, y, other.x, other.y)
}