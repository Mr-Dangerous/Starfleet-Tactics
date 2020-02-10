/// @description Insert description here
// You can write your code in this editor
if (nova_blast){
	x = spell_manager.x + lengthdir_x(200, spell_manager.image_angle - direction_counter)
	y = spell_manager.y + lengthdir_y(200, spell_manager.image_angle - direction_counter)
	direction_counter+=3
	show_debug_message(direction_counter)
}