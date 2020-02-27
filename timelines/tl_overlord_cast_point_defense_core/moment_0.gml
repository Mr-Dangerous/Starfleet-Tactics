
var _length = point_distance(sprite_xoffset, sprite_yoffset, 31, 100)
var _direction = image_angle+point_direction(sprite_xoffset, sprite_yoffset, 31, 100)
var _x = lengthdir_x(_length, _direction)
var _y = lengthdir_y(_length, _direction)
sprite_index = s_illum_default_08_without_core

with(instance_create_layer(x+_x, y+_y, LAYER_SHIPS, o_point_defense_core)){
	owner = other.owner
	reference_ship = other
	duration = 60 + (other.caster_level*30)
	point_defense_range = 160 + (other.caster_level *  40)
	return_point_length_offset = _length
	return_point_direction_offset = _direction
	image_angle = other.image_angle
	desired_direction = other.image_angle
	desired_motion = 2
	
}
timeline_index = scr_select_timeline()
timeline_position = 0