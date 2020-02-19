///@desc intilaize angle adjustments

new_direction = evade_direction + (irandom_range(45, 135)*choose(1, -1))
desired_direction = new_direction
desired_motion +=acceleration_rate
