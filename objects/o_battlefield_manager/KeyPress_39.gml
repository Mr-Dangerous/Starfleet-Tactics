/// @description page forward

current_module_page++
if (current_module_page > number_of_module_pages){
	current_module_page = number_of_module_pages
}
show_debug_message(current_module_page)