/// @description 


if (direction > 90 && direction < 270) {
    image_yscale = -0.5
    if (state = dashing) {
        if (sprite_index == sprMountedCost) {
            
        } else {
            image_yscale*=0.75
        }
    }
} else {
    image_yscale = 0.5
    if (state = dashing) {
        if (sprite_index == sprMountedCost) {
            
        } else {
            image_yscale*=0.75
        }
    }
}

if (getBagLevel() >= 1) {
    var _scaling = 0.5
    draw_sprite_ext(sprBag, getBagLevel()-1, bagX, bagY, _scaling, _scaling, 0, c_white, 1)
}

draw_self()