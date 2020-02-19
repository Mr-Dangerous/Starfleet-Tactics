desired_motion = -acceleration_rate
timeline_position = 5

if (speed <= 0){
	combat_state = ship.out_of_combat
	state = ship.battle
	timeline_position = 0
}