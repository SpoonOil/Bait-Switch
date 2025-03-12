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
    draw_sprite_ext(sprMagnet, 0, x, y, 0.5, 0.5, 0, c_white, 1)
}

if (baitLevel > 0) {
    //draw_sprite_ext(sprBait, baitLevel-1, x, y, 0.15, 0.15, 0, c_white, 1)
}