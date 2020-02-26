/// @description Insert description here
// You can write your code in this editor
var _number_of_effects = array_length_2d(effect_array, 0)
var i = 0
repeat(_number_of_effects){
	effect_array[EFFECT_IMAGE_ALPHA, i] += effect_array[EFFECT_IMAGE_ALPHA_CHANGE_RATE, i]
	effect_array[EFFECT_IMAGE_SCALE, i] += effect_array[EFFECT_IMAGE_SCALE_CHANGE_RATE, i]
	effect_array[EFFECT_ROTATION, i] += effect_array[EFFECT_ROTATION_CHANGE_RATE, i]
	i++
}
