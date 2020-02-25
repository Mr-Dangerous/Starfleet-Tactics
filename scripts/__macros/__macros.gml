#region Graphic offset macros
//These macros will represent the y positions of the grid or arrays in the grid to display
//the elements properly

#region ship graphic offsets

#macro EXHAUST_OFFSETS 0
#macro EFFECT_OFFSETS 1
#macro WEAPON_OFFSETS 2
#macro TURRET_OFFSETS 3

#macro GRAPHIC_DIRECTION_OFFSET 0
#macro GRAPHIC_LENGTH_OFFSET 1
#macro IS_UNDER 2
#macro ASSET_INDEX 3
#macro SPRITE_IMAGE_SCALE 4
#macro TURRET_MAP_KEY 5

#endregion


#endregion

#region ship spawner macros
#macro CREATE_SHIP 0					//User Event 0 in o_ship_spawner - deprecated
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
#macro LAYER_PROJECTILES_HIGH "Projectiles_Over"
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

#macro PREPARE_FIGHT 0

#macro BATTLEGRID_WIDTH 7
#macro BATTLEGRID_HEIGHT 5
#macro BATTLEGRID_SPACING 200

#macro TARGET_NORMAL "Default"

#macro ARMOR_DAMAGE 0
#macro SHIELD_DAMAGE 1

#macro SPELL_TARGET_ENEMY "enemy"
#macro SPELL_TARGET_ALLY "ally"
#macro SPELL_TARGET_ANY "any"
#macro EVENT_SPELL_EFFECT 0

#macro SPEED_CLASS_FAST "Fast"
#macro SPEED_CLASS_MEDIUM "Medium"
#macro SPEED_CLASS_SLOW "Slow"

#macro TURRET_LENGTH 0
#macro TURRET_POSITION 0

#macro EFFECT_SPRITE 0
#macro EFFECT_ROTATION 1
#macro EFFECT_ROTATION_CHANGE_RATE 2
#macro EFFECT_IMAGE_ALPHA 3
#macro EFFECT_IMAGE_ALPHA_CHANGE_RATE 4
#macro EFFECT_IMAGE_SCALE 5
#macro EFFECT_IMAGE_SCALE_CHANGE_RATE 6


