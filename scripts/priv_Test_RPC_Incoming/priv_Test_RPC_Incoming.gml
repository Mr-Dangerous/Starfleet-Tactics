///@desc A script to call for an incoming RPC to test the different argument types
///@param {u8}
///@param {u16}
///@param {u32}
///@param {string}
///@param {f32}
///@param {f64}
///@param {Bool}
///@param {s8}
///@param {s16}


var smallInt = argument0;
var medInt   = argument1;
var largeInt = argument2;
var str      = argument3;
var smallF   = argument4;
var medF     = argument5;
var boolean  = argument6;
var sInt     = argument7;
var sMedInt  = argument8;


show_message(string_build("Values {}, {}, {}, {}, {}, {}, {}, {}, {}", smallInt, medInt, largeInt, str, smallF, medF, boolean, sInt, sMedInt));