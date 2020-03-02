ship_target = scr_return_ship_target(TARGET_FURTHEST, TARGET_HIGHEST_ARMOR, IGNORE_SQUADS)
target_x = ship_target.x
target_y = ship_target.y
speed = 0

base_spell_damage = 900
number_of_shots = 40
if (caster_level = 2){
	base_spell_damage = 1200
	number_of_shots = 24
}
if (caster_level = 3){
	base_spell_damage = 1500
	number_of_shots = 28
}

projectile_damage = base_spell_damage/number_of_shots

volley_counter = number_of_shots/8

weapon_1_x_coordinate = 132
weapon_1_y_coordinate = 16
weapon_1[GRAPHIC_LENGTH_OFFSET] = point_distance(sprite_xoffset, sprite_yoffset, weapon_1_x_coordinate, weapon_1_y_coordinate)
weapon_1[GRAPHIC_DIRECTION_OFFSET] = point_direction(sprite_xoffset, sprite_yoffset, weapon_1_x_coordinate, weapon_1_y_coordinate)

weapon_2_x_coordinate = 140 
weapon_2_y_coordinate = 70
weapon_2[GRAPHIC_LENGTH_OFFSET]  = point_distance(sprite_xoffset, sprite_yoffset, weapon_2_x_coordinate, weapon_2_y_coordinate)
weapon_2[GRAPHIC_DIRECTION_OFFSET] = point_direction(sprite_xoffset, sprite_yoffset, weapon_2_x_coordinate, weapon_2_y_coordinate)

weapon_3_x_coordinate = 140
weapon_3_y_coordinate = 130
weapon_3[GRAPHIC_LENGTH_OFFSET]  = point_distance(sprite_xoffset, sprite_yoffset, weapon_3_x_coordinate, weapon_3_y_coordinate)
weapon_3[GRAPHIC_DIRECTION_OFFSET]= point_direction(sprite_xoffset, sprite_yoffset, weapon_3_x_coordinate, weapon_3_y_coordinate)

weapon_4_x_coordinate = 132
weapon_4_y_coordinate = 183
weapon_4[GRAPHIC_LENGTH_OFFSET]  = point_distance(sprite_xoffset, sprite_yoffset, weapon_4_x_coordinate, weapon_4_y_coordinate)
weapon_4[GRAPHIC_DIRECTION_OFFSET] = point_direction(sprite_xoffset, sprite_yoffset, weapon_4_x_coordinate, weapon_4_y_coordinate)

