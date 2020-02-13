/// @description Insert description here
// You can write your code in this editor
with(instance_find(o_camera, 0)){
	object_following = other
	state = camera_state.following
}