///@description Create first projectile
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