/// @description Insert description here
// You can write your code in this editor

height      = 300
width       = 200
arrowOffset = 50

title           = "Depth Select"
verticalMargin  = 10
titleHeight     = string_height(title) + verticalMargin*2

mapSprite = sprLevelThumbnails
mapAmount = sprite_get_number(sprLevelThumbnails)

rowHeight = (height-titleHeight)/mapAmount

top = y-height/2
bot = y+height/2
currentDepth = global.line

draw_set_font(fontDisplay)