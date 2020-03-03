///@find the nearest target without a spike

var _ability_range = 400
ship_to_cast_on = noone



if (ship_target.tracking_spike = false){
	ship_to_cast_on = ship_target
} else {
	//go through each possible ship
	var _nearest_valid_ship = noone
	with(o_ship){
		if (owner != other.owner){
			if(!tracking_spike){
				if (_nearest_valid_ship = noone){ 
					if (point_distance(other.x, other.y, x, y) < _ability_range){
						_nearest_valid_ship = self
					}
				} else {
					if (point_distance(other.x, other.y, x, y) < _ability_range){
						var _distance_to_currently_target_ship = point_distance(other.x, other.y, _nearest_valid_ship.x, _nearest_valid_ship.y)
						var _distance_to_self = point_distance(other.x, other.y, x, y)
						if (_distance_to_self < _distance_to_currently_target_ship){
							_nearest_valid_ship = self
						}
					}
				}	
			}
		}
	}
	ship_to_cast_on = _nearest_valid_ship				
}
if (ship_to_cast_on = noone){
	hold_spell = true
} else {
	ship_to_cast_on.tracking_spike = true
	var _tracking_spike = instance_create_layer(x, y, LAYER_PROJECTILES_HIGH, o_tracking_spike)
	var _p_dir = point_direction (x, y, ship_to_cast_on.x, ship_to_cast_on.y)
	_tracking_spike.direction = _p_dir
	_tracking_spike.image_angle = _p_dir-180
	_tracking_spike.base_image_angle = _tracking_spike.image_angle
	_tracking_spike.ship_target = ship_to_cast_on
	_tracking_spike.spell_duration = 600
	_tracking_spike.spell_damage =10
	if (caster_level = 2){
	}
	if (caster_level = 3){
	}
	//cast the spell
}
timeline_position = 0
timeline_index = scr_select_timeline()
