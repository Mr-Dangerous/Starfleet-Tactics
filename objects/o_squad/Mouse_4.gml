/// @description Insert description here
// You can write your code in this editor

//squad reposition clone

var _squad_reposition_clone = instance_create_layer(x, y, LAYER_GUI_LOW, o_squad_reposition_clone)

with (_squad_reposition_clone){
	reference_squad  = other
	owner = other.owner
}