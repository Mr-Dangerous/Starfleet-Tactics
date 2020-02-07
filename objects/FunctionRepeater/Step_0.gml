/// @description Repeat Functions

var key = ds_map_find_first(functionMap);

var funcsToRemove = array_create(ds_map_size(functionMap), null);
var funcRemove_i = 0;

while (!is_undefined(key))
{
	var repeater = functionMap[? key];
	
	var delay = repeater[1];
	if (delay > 0)
	{
		repeater[@ 1]--;
		key = ds_map_find_next(functionMap, key);
		continue;
	}
	
	if(repeater[@ 3]-- <= 0)		 // Decrease current timer
	{
		repeater[@ 3] = repeater[2]; // Reset timer
		repeater[@ 0] -= 1;			 // Amount of times to repeat decrease.
		
		var numArgs = array_length_1d(repeater) - 6;
		
		var callingInst = repeater[5];
		
		if (!instance_exists(callingInst))
		{
			funcsToRemove[funcRemove_i++] = key;
			key = ds_map_find_next(functionMap, key);
			continue;
		}
		
		with (callingInst)
		{
			switch (numArgs)
			{
				case 0: script_execute(repeater[4]); break;
				case 1: script_execute(repeater[4], repeater[6]); break;
				case 2: script_execute(repeater[4], repeater[6], repeater[7]); break;
				case 3: script_execute(repeater[4], repeater[6], repeater[7], repeater[8]); break;
				case 4: script_execute(repeater[4], repeater[6], repeater[7], repeater[8], repeater[9]); break;
				default:
					log_warn("More than 4 arguments not allowed when creating a repeater");
					break;
			}
		}
	}
	
	if (repeater[@ 0] <= 0)
	{
		funcsToRemove[funcRemove_i++] = key;
	}
	
	key = ds_map_find_next(functionMap, key);
}

// Remove all the functions that need to be removed
for (var _i = 0; _i < array_length_1d(funcsToRemove); _i++)
{
	ds_map_delete(functionMap, funcsToRemove[_i]);	
}