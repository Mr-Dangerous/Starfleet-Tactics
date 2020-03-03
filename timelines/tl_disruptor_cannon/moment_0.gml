timeline_index = scr_select_timeline()
timeline_position = 0
//check to see if the lsit has disruptor cannon
var _index = ds_list_find_index(on_hit_list, ON_HIT_DISRUPTOR_CANNON)
if (_index = -1){
	ds_list_add(on_hit_list, ON_HIT_DISRUPTOR_CANNON)
}
do_not_cast_spell = true