/// @description page forward

current_module_page++
if (current_module_page > number_of_module_pages-1){
	current_module_page = number_of_module_pages-1
}
show_debug_message(current_module_page)