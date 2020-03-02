var _overkill_sprite = choose(s_laser_mixed_125, s_laser_mixed_035, s_laser_mixed_041)
var _weapon = choose (weapon_1, weapon_2, weapon_3, weapon_4)

var _x = x+lengthdir_x(_weapon[GRAPHIC_LENGTH_OFFSET], image_angle+ _weapon[GRAPHIC_DIRECTION_OFFSET])
var _y = y + lengthdir_y(_weapon[GRAPHIC_LENGTH_OFFSET], image_angle + _weapon[GRAPHIC_DIRECTION_OFFSET])

var _projectile = instance_create_layer(_x, _y, LAYER_PROJECTILES_UNDER, o_projectile)

_projectile.owner = owner
_projectile.damage = projectile_damage
_projectile.image_speed = 0
_projectile.sprite_index = _overkill_sprite
_projectile.image_xscale = 1
_projectile.image_yscale = 1
_projectile.speed = 10
_projectile.duration = 200
_projectile.ship_target = noone
_projectile.image_angle = image_angle + random_range(-7, 7)
_projectile.direction = _projectile.image_angle
_projectile.fire_through_flag = true