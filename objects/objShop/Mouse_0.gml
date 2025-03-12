/// @description Insert description here
// You can write your code in this editor

leftTime++
if (oldx != undefined) {
    offset += (mouse_x - oldx) * scrollFactor
    targetOffset += (mouse_x - oldx) * scrollFactor
} else {
    offset += (mouse_x) * scrollFactor
    targetOffset += (mouse_x) * scrollFactor
}
oldx = mouse_x