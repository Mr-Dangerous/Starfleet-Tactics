///@desc intialize vars
//first check to see which direction has more enemies, left or right
evasion_counter = 0

evade_direction = point_direction(ship_target.x, ship_target.y, x, y) + irandom_range(-35, 35)

desired_direction = evade_direction


