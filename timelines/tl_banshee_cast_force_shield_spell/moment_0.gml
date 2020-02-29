///@desc create the spell effect in teh spell manager
var force_shield_effect = instance_create_layer(x, y, LAYER_EFFECTS_OVER, o_force_shield)
force_shield_effect.reference_ship = self
var _duration = 180 + (caster_level*60)
force_shield_effect.owner = owner
force_shield_effect.duration = _duration
force_shield_effect.image_xscale = image_scale
force_shield_effect.image_yscale = image_scale
override_timeline = tl_stationary_pivot_override
movement_override_counter = _duration 
desired_motion = 0
speed = 0
timeline_index = scr_select_timeline()


