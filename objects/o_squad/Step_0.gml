/// @description

switch(state){
	case squad.locked:
	if (mouse_check_button_pressed(mb_left)){
		var _squad_reposition_clone = instance_create_layer(x, y, LAYER_GUI_LOW, o_squad_reposition_clone)

		with (_squad_reposition_clone){
			reference_squad  = other
			owner = other.owner
		}
	}
	break;
	
	case squad.battle:
		//check to see it teh squad target exists
		if (squad_target = noone){
			squad_target = scr_find_nearest_squad_target()
		}
	break;
}
