///@desc Makes sure that this instance holds singleton properies. If one of its type already exists then we
///      destroy it.
///@returns True if this instance is successfully created.

if (instance_number(object_index) > 1)
{
	instance_destroy();
	return false;
}

persistent = true;
return true;