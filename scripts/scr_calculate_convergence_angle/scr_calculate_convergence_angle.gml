///@param weapon_x_offset
///@param weapon_y_offset



//This function is going to require some math later!

var _weapon_x = x+argument0
var _weapon_y = y+argument1




var _convergence_point_x = x+lengthdir_x(basic_attack_range * 1.5, image_angle) 
var _convergence_point_y = y+lengthdir_y(basic_attack_range * 1.5, image_angle)

var _convergence_angle = +point_direction(_weapon_x, _weapon_y, _convergence_point_x, _convergence_point_y)//this angle here needs to be dynamically calculated


return _convergence_angle

