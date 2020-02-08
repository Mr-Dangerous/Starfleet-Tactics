///@description  add a message to our consoles list

///@param {string} Message The message to display

with(o_console){
	ds_list_add(m_message_list, argument0)
	
	if (ds_list_size(m_message_list) > MAX_MESSAGES){
		ds_list_delete(m_message_list, 0)
		
	}
}