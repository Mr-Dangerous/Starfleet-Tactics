///@desc initialize vars

var _angle_behind_target = ship_target.image_angle + 180 + (irandom_range (50, 100) * choose(-1,1))


var _length_behind_target = 100

target_x = ship_target.x + lengthdir_x(_length_behind_target, _angle_behind_target)
target_y = ship_target.y + lengthdir_y(_length_behind_target, _angle_behind_target)

new_direction = point_direction(x, y, target_x, target_y)
desired_direction = new_direction
desired_motion += acceleration_rate
flyby_counter = 60