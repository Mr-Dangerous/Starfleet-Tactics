#region Reference to Instances
card_game_controller = instance_find(o_card_game_controller, 0)
battle_player_number = 0
battle_manager = noone
reference_squad = noone
#endregion


#region Non combat stats
name = ""
image_scale = 1
created = false
assigned_grid_x = -1
assigned_grid_y = -1
formation_length_offset = 0
formation_direction_offset = 0
owner = -1
ship_speed_class = 0
#endregion

#region Graphic variables
graphic_resource_array = 0
has_effects = false
weapon_effects = false
glow_effect = false
increasing_glow_effect = false
decreasing_glow_effect = false
paired_effects = ds_list_create()
generate_shields = false
generate_physical_damage = false
thrust_counter = 0
blind_effect = false
display_timeline = false
#endregion

#region Networking vars
server_manager = instance_find(o_server_manager, 0)
client_manager = instance_find(o_client_manager, 0)
client = -1
sprite_list = ds_list_create() //note that this is likely deprecated
extra_sprite_list = ds_list_create()
if (room = r_firing_range){
	ds_list_destroy(sprite_list)
	sprite_list = server_manager.sprite_list
}




#endregion

#region Input Vars
double_click = false
double_click_timer = 0


#endregion

#region Combat vars
ship_target = noone
enemy_ships_targeting = ds_list_create()
evasion_counter = 0
evade_direction = 0
original_angle = 0
new_direction = 0
number_of_evades = 0
energy = 0
starting_energy = 0
max_energy = 0
flyby_counter = 0
abort_counter = 180
reinforce_shields = false //note that this is also a graphic var
reinforce_shields_counter = 0
squad_target = noone
formation_number = -1
gimbal_fire_angle = 3
max_speed = 0
acceleration_rate = 0
turn_speed = 0
shields = 1
max_shields = 1
armor = 1
max_armor = 1
caster_level = 0
basic_attack_projectile_speed = 5
basic_attack_projectile_duration = 50
basic_attack_damage = 1
spell_timeline_script = -1
speed_unlocked = false
number_of_attacks = 0
basic_attack_speed_interval = 0//in frames
basic_attack_speed_interval = 0
basic_attack_patterns = 0
basic_attack_speed_counter = 0
basic_attack_thermal_unit_cost = 0
basic_attack_base_thermal_capacity = 10 //limits the basic attacks
basic_attack_thermal_capacity_used = 0
basic_attack_coolant_effectiveness = 180 //the quantity of frames before the ship can attack again.
desired_motion = 0
override_motion = 0
desired_direction = 0
override_direction = 0
weapons_ready = false
basic_attack_coolant_counter = 0
basic_attack_thermal_capacity_used = 0
ship_mass = 0
override_timeline = -1
movement_override_counter = 0
blind_counter = 0
cloak = false
tracking_spike = false
hold_spell = false
disruptor_cannon = false
on_hit_list = ds_list_create()
do_not_cast_spell = false
can_collide = false
collide_force = 0
speed_limiter = true

#endregion

#region Companion objects
turret_1 = noone
turret_2 = noone
companion_spell_manager = instance_create_layer(x, y, LAYER_EFFECTS_OVER, o_spell_manager)
companion_spell_manager.origin_ship = self


#endregion


#region States
state = ship.locked
combat_state = ship.out_of_combat
if (room = r_firing_range){
	state = ship.manual
}
#endregion






























