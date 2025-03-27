/// @description Insert description here
// You can write your code in this editor

var hoverTop = min(objDepthUpgrade.y, top)
var hoverBot = max(objDepthUpgrade.y+objDepthUpgrade.sprite_height, bot)
var hoverLeft = objDepthUpgrade.x
var hoverRight = x + width + arrowOffset

if (
    mouse_x < hoverLeft || 
    mouse_x > hoverRight || 
    mouse_y < hoverTop ||
    mouse_y > hoverBot) {
    objDepthUpgrade.hovered = false
    instance_destroy()
}
