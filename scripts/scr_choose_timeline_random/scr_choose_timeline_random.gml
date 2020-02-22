///@param list_of_timelines
var _timeline_list = argument0
var _timeline_list_size = ds_list_size(_timeline_list)
var _random_number = irandom(_timeline_list_size-1)
var _timeline_string = ds_list_find_value(_timeline_list, _random_number)
var _timeline = asset_get_index(_timeline_string)


return _timeline