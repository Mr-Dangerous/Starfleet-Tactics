/// @description Insert description here
// You can write your code in this editor
if (other = ship_target){
	//Explode!
	script_execute(effect_script, other)
	instance_destroy()
}
