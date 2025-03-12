/// @description 

if (value = 0) {
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_black, 1)
} else {
    if (value <= image_number) {
        image_index = value-1
    }
    draw_self()
}