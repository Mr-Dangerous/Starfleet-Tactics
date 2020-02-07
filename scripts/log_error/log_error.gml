///@param Message
///@param Arguments..

if (LOG_LEVEL > LogLevel.Error) return;

var _message = 
	private_log_format(":::::::::::::::::::::::::::::::::::::::::::::::\n[ERROR] {} ::: ") + argument[0];

for (var _i = 1; _i < argument_count; _i++)
{
	_message = string_replace(_message, FORMAT_TOKEN, string(argument[_i]));	
}
_message += "\n:::::::::::::::::::::::::::::::::::::::::::::::";

show_debug_message(_message);