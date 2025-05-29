/// @description Insert description here
// You can write your code in this editor
show_debug_message(offset)

leftTime++

if (oldx != undefined) {
    var dist = (mouse_x - oldx) * scrollFactor
    offset += dist
    targetOffset += dist
} else {
    var dist = (mouse_x) * scrollFactor
    offset += dist
    targetOffset += (mouse_x) * scrollFactor
}


show_debug_message(offset)