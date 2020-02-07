// Packet Ids, Must add an ID for each new packet type

#macro null    -10		// I use null a lot in other languages, just made a null identifier
#macro SEND		0		// Used for ping message. Send on.. send.
#macro RESPONSE 1		// Response on receiving the response to the send

// Change LogLevel Here
#macro LOG_LEVEL LogLevel.Debug

// Type of value the seq number uses.
#macro SEQ_NUM_TYPE buffer_u32

// Length off possible packet types
#macro GNET_ARRAY_COUNT 125
