// Check for a free connection slot. Return "noone" if none were found.

with (NetworkManager)
{
	for (var _i = 0; _i < array_length_1d(connectionSlots); _i++)
	{
		if (connectionSlots[_i] == null)
			return _i;
	}
}

return null;