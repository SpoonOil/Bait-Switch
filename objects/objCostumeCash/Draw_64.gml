/// @description Insert description here
// You can write your code in this editor

draw_set_font(fontDisplay)

var _text = string(global.cash)
var _tilt = 5

scribble(_text).starting_format("fontDisplay", c_black).transform(1, 1, _tilt).draw(x, y)