///@desc pre firing animations
charging_laser_effect = instance_create_layer(x, y, LAYER_EFFECTS_OVER, o_graphic_effect)
charging_laser_effect.timeline_index = tl_snipe_animation
charging_laser_effect.timeline_running = true
charging_laser_effect.length_offset = 30
charging_laser_effect.direction_offset = 0
charging_laser_effect.reference_ship = self