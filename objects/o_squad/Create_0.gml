battle_player_number = 0 //for battle purposes, player is either 1 or 2
battle_manager = noone
ship_name = ""
owner = 0

unit_offset=[]

unit_offset[SHIP_1, FORMATION_LENGTH] =50
unit_offset[SHIP_1, FORMATION_DIRECTION] = 0

unit_offset[SHIP_4, FORMATION_LENGTH] = 50
unit_offset[SHIP_4, FORMATION_DIRECTION] = 60

unit_offset[SHIP_5, FORMATION_LENGTH] = 50
unit_offset[SHIP_5, FORMATION_DIRECTION] = -60

unit_offset[SHIP_2, FORMATION_LENGTH] = 60
unit_offset[SHIP_2, FORMATION_DIRECTION] = 110

unit_offset[SHIP_3, FORMATION_LENGTH] = 60
unit_offset[SHIP_3, FORMATION_DIRECTION] = -110

ships_in_squad = ds_list_create()

assigned_grid_x = -1
assigned_grid_y = -1

state = squad.locked

squad_target = noone
