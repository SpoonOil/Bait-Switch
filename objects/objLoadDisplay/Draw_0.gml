/// @description Insert description here
// You can write your code in this editor

var width = scribble(" Game Loaded! ").starting_format("fontDisplay", c_white).get_width()
var height = scribble(" Game Loaded! ").starting_format("fontDisplay", c_white).get_height()

draw_set_alpha(0.3)
draw_rectangle_color(x - width/2, y, x + width/2, y + height, c_black, c_black, c_black, c_black, false)
draw_set_alpha(1)
scribble(" Game Loaded! ").starting_format("fontDisplay", c_white).align(fa_center, fa_top).draw(x, y)