///@desc Read a packet using a registered layout. Will return "undefined" if no layout has been registered
///      for the given _packetId.
///@param PacketType
///@param Buffer...

var _packetId = argument0;
var _buffer   = argument1;

var _layoutData = m_packetLayoutMap[? _packetId];
if (is_undefined(_layoutData))
{
	return undefined;
}

// Dont want an array count type being added to our data. It is just a notifier to treat the
// next entry as an array of X entries
// TODO Optimize this. We shouldnt iterate every layout every time
var _numOfArrayTypes = 0;
for (var _i = 0; _i < array_length_1d(_layoutData); _i++)
	if (_layoutData[_i] == GNET_ARRAY_COUNT) _numOfArrayTypes++;

// An array the size of the layout data
var _data = array_create(array_length_1d(_layoutData) - _numOfArrayTypes);	

for (var _i = 0; _i < array_length_1d(_data); _i++)
{
	// Read array in if the layout data defines an array type ELSE read normally
	if (_layoutData[_i] == GNET_ARRAY_COUNT)
	{
		var _numOfArrayEntries = buffer_read(_buffer, buffer_u8);
		
		_i += 1;									// Increment i to skip past the count now.
		var _subLayoutData		 = _layoutData[_i];
		var _subArray			 = array_create(_numOfArrayEntries, null);
		var _subLayoutDataLength = array_length_1d(_subLayoutData);
		
		for (var _a = 0; _a < array_length_1d(_subArray); _a++)
		{
			var _subSubArray = array_create(_subLayoutDataLength, null);
			
			for (var _v = 0; _v < _subLayoutDataLength; _v++)
				_subSubArray[_v] = buffer_read(_buffer, _subLayoutData[_v]);
				
			_subArray[_a] = _subSubArray;
		}
		_data[_i - 1] = _subArray;
	}
	else
	{
		_data[_i] = buffer_read(_buffer, _layoutData[_i]); // Read single data normally
	}
}

return _data;