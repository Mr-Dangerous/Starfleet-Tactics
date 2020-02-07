///@param Message
///@param Arguments..

if (LOG_LEVEL > LogLevel.Debug) return;

var _message = private_log_format("[DEBUG] {} ::: ") + argument[0];

for (var _i = 1; _i < argument_count; _i++)
{
	_message = string_replace(_message, FORMAT_TOKEN, string(argument[_i]));	
}

show_debug_message(_message);