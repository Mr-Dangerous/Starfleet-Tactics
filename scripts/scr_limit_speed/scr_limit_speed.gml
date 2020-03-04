if (speed_limiter){
	if (abs(speed) > max_speed){
		speed = max_speed*sign(speed)
	}
} else {
	if (abs(speed) > 8){
		speed = 8
	}
	speed -= .1
	if (speed <= max_speed){
		speed_limiter = true
	}
}
if (speed < 0){
	speed = 0
}