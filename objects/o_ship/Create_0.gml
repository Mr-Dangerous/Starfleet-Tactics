name = ""
image_scale = 1
card_game_controller = instance_find(o_card_game_controller, 0)
created = false
graphic_resource_array = 0
has_effects = false
weapon_effects = false
glow_effect = false
increasing_glow_effect = false
decreasing_glow_effect = false
paired_effects = ds_list_create()
server_manager = instance_find(o_server_manager, 0)
sprite_list = server_manager.sprite_list
extra_sprite_list = ds_list_create()
//stats
max_speed = 0
acceleration_rate = 0
turn_speed = 0
basic_attack_projectile_speed = 5
basic_attack_projectile_duration = 50
spell_timeline_script = -1
speed_unlocked = false
//
state = ship.manual

//graphic counters

thrust_counter = 0
