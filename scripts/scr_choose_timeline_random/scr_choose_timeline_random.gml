///@param list_of_timelines
var _timeline_list = argument0

var _random_number = irandom(ds_list_size(_timeline_list) - 1)
var _timeline_string = ds_list_find_value(_timeline_list, _random_number)
var _timeline = asset_get_index(_timeline_string)

return _timeline