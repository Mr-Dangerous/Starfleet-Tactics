/// @description Insert description here
// You can write your code in this editor

//eventually will be its own state
var _thrust =keyboard_check(ord("W"))
var _reverse_thrust = keyboard_check(ord("S"))
var _left_turn = keyboard_check(ord("A"))
var _right_turn = keyboard_check(ord("D"))

//add motion
var _motion_to_add = 0
var _direction_change = 0
if (_thrust or _reverse_thrust){
	_motion_to_add = (_thrust-_reverse_thrust)*acceleration_rate
}
if (_left_turn or _right_turn){
	_direction_change = (_left_turn - _right_turn)*turn_speed
}

image_angle += _direction_change
direction = image_angle
motion_add(direction, _motion_to_add)

//limit speed
if (speed > max_speed){
	speed = max_speed
}
if (speed < 0){
	speed = 0
}
