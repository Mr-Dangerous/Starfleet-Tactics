var _sprite = s_illum_default_10
var _graphic_offsets = array_create(4, 0)
//Exhausts
var _exhaust_1 = scr_calculate_graphic_offset(_sprite, 30, 70, s_normal_single_exhaust, 1)
//Weapons
var _weapon_1 = scr_calculate_graphic_offset(_sprite, 48, 55, s_laser_light_001, 1)
var _weapon_2 = scr_calculate_graphic_offset(_sprite, 48, 84, s_laser_light_001, 1)



_graphic_offsets[EXHAUST_OFFSETS, 0] = _exhaust_1
_graphic_offsets[EFFECT_OFFSETS, 0] = 0
_graphic_offsets[WEAPON_OFFSETS, 0] = _weapon_1
_graphic_offsets[WEAPON_OFFSETS, 1] = _weapon_2
_graphic_offsets[SPRITE_INFO, SHIP_SPRITE] = _sprite
_graphic_offsets[SPRITE_INFO, SPRITE_IMAGE_SCALE] = 1
_graphic_offsets[SPRITE_INFO, DRAWING_SCRIPT] = scr_draw_phantom_graphics()

return _graphic_offsets