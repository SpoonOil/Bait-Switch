/// @description 
if (value != 0) {
    draw_set_font(fontDisplay)
    draw_text_transformed_color(x, y, "$"+string(value), image_xscale, image_yscale, image_angle, c_black, c_black, c_black, c_black, 1)
}