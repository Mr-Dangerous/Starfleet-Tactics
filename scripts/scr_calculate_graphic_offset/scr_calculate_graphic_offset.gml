///@param base_sprite
///@param element_x
///@param element_y
///@param element_sprite
///@param image_scale

var _graphic_offset_array = array_create(4, 0)

var _sprite = argument0
var _x_origin = sprite_get_xoffset(_sprite)
var _y_origin = sprite_get_yoffset(_sprite)

var _element_position_1_x = argument1
var _element_position_1_y = argument2

var _relative_element_position_x = _element_position_1_x-_x_origin
var _relative_element_position_y = _element_position_1_y-_y_origin


_graphic_offset_array[GRAPHIC_DIRECTION_OFFSET] = point_direction(0, 0, _relative_element_position_x, _relative_element_position_y)
_graphic_offset_array[GRAPHIC_LENGTH_OFFSET] = point_distance(0, 0, _relative_element_position_x, _relative_element_position_y)
_graphic_offset_array[SPRITE_TO_CREATE] = argument3
_graphic_offset_array[SPRITE_IMAGE_SCALE] = argument4



return _graphic_offset_array