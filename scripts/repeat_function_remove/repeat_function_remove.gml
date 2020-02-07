///@desc Remove a repeating function from the repeater
///@param ScriptName The script to unregister (Stop) repeating
///@param instanceId The instance that called for the function to repeat

var _script = argument0;
var _instId = argument1;

var _funcKey = string(_script) + string(_instId);

with (FunctionRepeater)
{
	if (is_undefined(functionMap[? _funcKey]))
	{
		log_debug("Called remove repeating function on a script that is not currently repeating, or an impropper instance id that owns the script");
		return;
	}
	
	ds_map_delete(functionMap, _funcKey);
}