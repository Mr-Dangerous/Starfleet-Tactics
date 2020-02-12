#region Graphic offset macros
//These macros will represent the y positions of the grid or arrays in the grid to display
//the elements properly

#region ship graphic offsets

#macro EXHAUST_OFFSETS 0
#macro EFFECT_OFFSETS 1
#macro WEAPON_OFFSETS 2

#macro GRAPHIC_DIRECTION_OFFSET 0
#macro GRAPHIC_LENGTH_OFFSET 1
#macro IS_UNDER 2
#macro ASSET_INDEX 3
#macro SPRITE_IMAGE_SCALE 4

#endregion


#endregion

#region ship spawner macros
#macro CREATE_SHIP 0					//User Event 0 in o_ship
#macro CREATE_SQUAD 0					//User Event 0 in o_squad
#macro INJECT_VARIABLES 15				//User Event 15 for all objects that have variables injected
#endregion

#region networkings
#macro PROTOCOL_ID 1337					
#macro DEFAULT_PORT 3000
#endregion

#region layer macros
#macro LAYER_GUI_HIGH "GUI_layer_high"
#macro LAYER_GUI_LOW "GUI_layer_low"
#macro LAYER_PROJECTILES_HIGH "Projetiles_Over"
#macro LAYER_EFFECTS_OVER "Effects_Over"
#macro LAYER_SHIPS "Ships"
#macro LAYER_EFFECTS_UNDER "Effects_Under"
#macro LAYER_PROJECTILES_UNDER "Projectiles_Under"
#macro LAYER_INSTANCES "Instances"
#endregion

#region
#macro BUTTON_X 0
#macro BUTTON_Y 1
#macro BUTTON_DISPLAY_STRING 2
#macro BUTTON_SCRIPT 3
#macro BUTTON_COLOR 4
#macro BUTTON_HOVER 5

#endregion

#macro ZONE_X 0
#macro ZONE_Y 1
#macro ZONE_XX 2
#macro ZONE_YY 3

#region battlefields
#macro BATTLEFIELD_X_POSITION 0
#macro BATTLEFIELD_Y_POSITION 1
#macro BATTLEFIELD_SQUAD_CONTAINED 2
#macro BATTLEFIELD_PLAYER 3
#endregion

#region formations
#macro FORMATION_DIRECTION 1
#macro FORMATION_LENGTH 0
#macro SHIP_1 0
#macro SHIP_2 1
#macro SHIP_3 2
#macro SHIP_4 3
#macro SHIP_5 4
#endregion
