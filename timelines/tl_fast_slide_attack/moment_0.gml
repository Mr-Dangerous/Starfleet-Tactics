///@desc intialize targeting
//find movement target based on current ships position
//this attakc script should only be called when teh ship is more than 100 pixels from the target.

position_conditions_met = false
attack_conditions_met = false

var _angle_behind_target = ship_target.image_angle + 180 + irandom_range(-60, 60)

var _length_behind_target = irandom_range(40, 80)

target_x = ship_target.x + lengthdir_x(_length_behind_target, _angle_behind_target)
target_y = ship_target.y + lengthdir_y(_length_behind_target, _angle_behind_target)

	

