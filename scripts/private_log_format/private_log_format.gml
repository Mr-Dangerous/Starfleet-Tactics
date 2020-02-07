///@param String
#macro FORMAT_TOKEN "{}"

enum LogLevel {
	Debug,
	Info,
	Warning,
	Error
}

return string_replace(argument0, FORMAT_TOKEN, object_get_name(object_index));