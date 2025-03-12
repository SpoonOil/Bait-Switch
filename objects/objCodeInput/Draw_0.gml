/// @description Insert description here
// You can write your code in this editor

draw_set_font(fontCostumes)

draw_set_halign(fa_center)
draw_text_color(x+ sprite_width/2 - 5, y - 50, "Enter Text", c_white, c_white, c_white, c_white, 1)
draw_set_halign(fa_left)

draw_set_font(fontCode)
var _charWidth = string_width("A")
var _gap = 3
var _thickness = 5
var _charHeight = string_height("A")

drawCode(_gap)
drawUnderline(_charWidth, _gap, _thickness)

if (active && string_length(codeText) < 8) {
    var _offset = 10
    var _arrowPos = string_length(codeText)*_charWidth + string_length(codeText)*_gap
    draw_triangle(x + _arrowPos, y + _offset, x + _arrowPos + _charWidth, y + _offset, x + _arrowPos + _charWidth/2, y + _offset + _charWidth, false) 
}

function drawUnderline (cw, g, thick) {
    var _charWidth = cw
    var _gap = g
    var _thickness = thick
    for (var _i = 0; _i < 8; _i++) {
        draw_line_width(x+_charWidth*_i+_gap*_i, y+sprite_height, x+_charWidth*(_i+1)+_gap*_i, y + sprite_height, _thickness)
    }
}

function drawCode (gap) {
    var _offset = 50
    var _charLength = 0
    for (var _i = 0; _i < string_length(codeText); _i++) {
        var _currentChar = string_char_at(codeText, _i+1)
        var _textOffset = 2
        
        draw_text(x + _textOffset+ _i*gap + _charLength, y + sprite_height - _offset, _currentChar)
        
        _charLength += string_width(_currentChar)
    }
}
