///@desc intitalize the starting vars

nova_blast = true
var _spell_point = (instance_create_layer(x, y, "Effects_Over", o_spell_point))
ds_list_add(spell_point_list, _spell_point)
show_debug_message("spell point created!")

with (_spell_point){
	spell_manager = other
	nova_blast = true
}
