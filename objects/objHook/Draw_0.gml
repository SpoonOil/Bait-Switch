/// @description 

switch (orientation) {
    case "top":
        image_angle = 0
        break;
    case "left":
        image_angle = 90
        break;
    case "bot":
        image_angle = 180
        break;
    case "right":
        image_angle = 270
        break;
}

draw_self()

if (magnetLevel > 0 ) {
    drawMagnet()
}

if (baitLevel > 0) {
    draw_sprite_ext(sprBait, baitLevel-1, x, y, image_xscale, image_yscale, image_angle, c_white, 1)
}


function drawMagnet () {
    draw_sprite_ext(sprMagnet, magnetLevel-1, x, y, image_xscale, image_yscale, image_angle, c_white, 1)
}