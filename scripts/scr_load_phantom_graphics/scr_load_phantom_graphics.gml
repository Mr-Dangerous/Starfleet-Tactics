var _sprite = sprite_index
var _graphic_offsets = array_create(4, 0)

var _exhaust_offsets = array_create(1, 0)
var _weapon_offsets = array_create(2, 0)
//Exhausts

_exhaust_offsets[0] = scr_calculate_graphic_offset(_sprite, 30, 70, s_normal_single_exhaust, 1)
//Weapons
_weapon_offsets[0] = scr_calculate_graphic_offset(_sprite, 48, 55, s_laser_light_001, 1)
_weapon_offsets[1] = scr_calculate_graphic_offset(_sprite, 48, 84, s_laser_light_001, 1)



_graphic_offsets[EXHAUST_OFFSETS] = _exhaust_offsets
_graphic_offsets[EFFECT_OFFSETS] = 0
_graphic_offsets[WEAPON_OFFSETS] = _weapon_offsets
_graphic_offsets[SPRITE_INFO, SHIP_SPRITE] = _sprite




return _graphic_offsets