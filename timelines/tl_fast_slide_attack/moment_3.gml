///@desc move to make attack conditions true
var _lead_target_x = ship_target.x //obv needs to change
var _lead_target_y = ship_target.y

var _direction_to_face = point_direction(x, y, _lead_target_x, _lead_target_y)

scr_turn_to_face_direction(_direction_to_face)
