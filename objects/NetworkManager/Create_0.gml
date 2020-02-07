/// @description Basic Vars

m_PacketsThisSecond = 0;
m_BytesThisSecond   = 0;

m_AveragePacketsPerSecond = 0;
m_AverageBytesPerSecond   = 0;

alarm[0] = room_speed;

instance_create_depth(-100, -100, -1000, DebugHud);