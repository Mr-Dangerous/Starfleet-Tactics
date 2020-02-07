///@desc Set a function to repeat, and stop executing at a set point
///@param RepeatTimes
///@param FrameInterval
///@param InitialDelayFrames
///@param ScriptName
///@param [params]

var _repeatTimes    = argument[0];
var _frameInterval  = argument[1];
var _initialDelay   = argument[2];
var _func	        = argument[3];

var _arr = array_create(argument_count + 2);
_arr[0] = _repeatTimes;		// How Many Times To Repeat
_arr[1] = _initialDelay;	// Delay To Start
_arr[2] = _frameInterval;	// Max Time
_arr[3] = _frameInterval;	// Current Timer
_arr[4] = _func;
_arr[5] = id;

for (var _i = 4; _i < argument_count; _i++)
{
	_arr[_i + 2] = argument[_i];
}

var funcIdKey = string(_func) + string(id);

with (FunctionRepeater)
{
	if (!is_undefined(functionMap[? funcIdKey]))
	{
		log_warn("Functions can only be added to the repeater 1 time per instance: {}", script_get_name(_func));
		return;
	}
	
	functionMap[? funcIdKey] = _arr;
}