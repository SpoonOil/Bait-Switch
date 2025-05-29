/// @description 

if (sprite_index == -1) exit // safeguard for nospriters
    
if (image_index = 0) {
    if (!pressed) draw_sprite_ext(sprite_index,image_index,x+1,y+7,image_xscale,image_yscale, image_angle, c_black, 1) 
    if (hover) {
        show_debug_message(shader_is_compiled(shdTest))
        //var u_texelSize = shader_get_uniform(shdTest, "texelSize");
        //var u_outlineColor = shader_get_uniform(shdTest, "outlineColor");
        //var u_thickness = shader_get_uniform(shdTest, "thickness");
        shader_set(shdTest)
        
        var tex = sprite_get_texture(sprite_index, image_index);
        //shader_set_uniform_f(u_texelSize, texture_get_texel_width(tex), texture_get_texel_height(tex));
        //shader_set_uniform_f(u_outlineColor, 0.0, 0.0, 0.0, 1.0);
        //shader_set_uniform_f(u_thickness, 5.0);
        
        draw_self()
        shader_reset()
    }
}

draw_self()