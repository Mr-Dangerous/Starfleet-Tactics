///@description Create second projectile

var _length = 80
var _direction = image_angle - 45
var _x = x + lengthdir_x(_length, _direction)
var _y = y + lengthdir_y(_length, _direction)
var _projectile = (instance_create_layer(_x, _y, LAYER_EFFECTS_OVER, o_spell_projectile))
_projectile.image_angle = _direction + 90
_projectile.sprite_index = s_laser_heavy_27
_projectile.direction = image_angle
_projectile.turn_speed =20
_projectile.speed = 20
_projectile.duration = 8
_projectile.spell_manager = self
_projectile.after_image = true