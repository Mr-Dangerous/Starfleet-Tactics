/// @description Calculate Stats

if (m_AverageBytesPerSecond == 0)
	m_AverageBytesPerSecond = m_BytesThisSecond;
else
	m_AverageBytesPerSecond = (m_AverageBytesPerSecond + m_BytesThisSecond) / 2;

if (m_AveragePacketsPerSecond == 0)
	m_AveragePacketsPerSecond = m_PacketsThisSecond;
else
	m_AveragePacketsPerSecond = (m_AveragePacketsPerSecond + m_PacketsThisSecond) / 2;

m_BytesThisSecond   = 0;
m_PacketsThisSecond = 0;

alarm[0] = room_speed;