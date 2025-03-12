/// @description 
if (value != 0) {
    draw_set_font(font2)
    draw_text_transformed_color(x, y, "$"+string(value), image_xscale, image_yscale, 3, c_black, c_black, c_black, c_black, 1)
}