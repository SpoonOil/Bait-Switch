/// @description Insert description here
// You can write your code in this editor

hoverTop = min(objDepthUpgrade.y, top)
hoverBot = max(objDepthUpgrade.y+objDepthUpgrade.sprite_height, bot)
hoverLeft = objDepthUpgrade.x
hoverRight = x + width + arrowOffset

if (
    mouse_x < hoverLeft || 
    mouse_x > hoverRight || 
    mouse_y < hoverTop ||
    mouse_y > hoverBot) {
    objDepthUpgrade.hovered = false
    instance_destroy()
}
