/// @description Insert description here
// You can write your code in this editor
if (other.owner != owner){
	with (other){
		destroy_animation = false
		instance_destroy()
		show_debug_message("projectile blocked!")
	}
}