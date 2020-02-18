///@desc  Movement pattern to repeat
var _direction_to_target = point_direction(x, y, target_x, target_y) 
scr_turn_to_face_direction(_direction_to_target)
direction = image_angle
speed += acceleration_rate
scr_limit_speed()

