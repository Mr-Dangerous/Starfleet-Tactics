/// @description Clean up connection

log_info("Connection {} has been removed.", connectionId);

priv_gnet_remove_connection(id);

ds_list_destroy(unackedPackets);