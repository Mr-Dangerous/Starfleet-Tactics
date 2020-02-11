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
client_manager = instance_find(o_client_manager, 0)
client = -1
assigned_grid_x = -1
assigned_grid_y = -1

//keypresses
sprite_list = ds_list_create()
if (room = r_firing_range){
	ds_list_destroy(sprite_list)
	sprite_list = server_manager.sprite_list
}
extra_sprite_list = ds_list_create()
owner = -1

//stats
max_speed = 0
acceleration_rate = 0
turn_speed = 0
armor = 1
basic_attack_projectile_speed = 5
basic_attack_projectile_duration = 50
basic_attack_damage = 1
spell_timeline_script = -1
speed_unlocked = false

//
state = ship.locked
if (room = r_firing_range){
	state = ship.manual
}

//graphic counters

thrust_counter = 0

