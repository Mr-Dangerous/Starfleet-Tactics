///move to the positionting timeline


///@description Create first projectile
//return the changed variables to normal
if (timeline_running = false){
	timeline_running = true
}

spell_effect = scr_spell_effect_ghost_blade


var _length = 60
var _direction = image_angle + 45
var _x = x + lengthdir_x(_length, _direction)
var _y = y + lengthdir_y(_length, _direction)
var _projectile = (instance_create_layer(_x, _y, "Effects_Over", o_spell_projectile))
_projectile.image_angle = _direction - 90
_projectile.sprite_index = s_laser_heavy_27
_projectile.direction = image_angle
_projectile.turn_speed = -7
_projectile.speed = 8
_projectile.duration = 18
_projectile.spell_manager = self
_projectile.after_image = true
_projectile.owner = owner
_projectile.spell_target = SPELL_TARGET_ENEMY