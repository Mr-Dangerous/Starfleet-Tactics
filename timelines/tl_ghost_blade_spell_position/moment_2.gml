///@desc move towards target

target_x = ship_target.x
target_y = ship_target.y
turn_speed = base_turn_speed
desired_direction = point_direction(x, y, target_x, target_y)
max_speed = base_max_speed * 3
acceleration_rate = base_acceleration_rate*3
desired_motion = acceleration_rate