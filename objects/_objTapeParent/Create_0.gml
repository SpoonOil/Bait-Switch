/// @description Insert description here
// You can write your code in this editor
text = "Placeholder"

text_xscale = 1
text_yscale = 1
offsetPadding = 30 * image_xscale
offsetX = lengthdir_x(offsetPadding, image_angle-30)
offsetY = lengthdir_y(offsetPadding, image_angle-30)

priceVector = point_direction(x, y, x+sprite_width*0.625, y+sprite_height/3.5) + image_angle

priceX = x + lengthdir_x(sprite_width*0.625, priceVector)
priceY = y + lengthdir_y(sprite_width*0.625, priceVector)

priceRenderer = instance_create_depth(priceX, priceY, -1, objPriceRender)
priceRenderer.parent = undefined
priceRenderer.image_angle = image_angle
priceRenderer.image_xscale = image_xscale
priceRenderer.image_yscale = image_yscale