/// @description 


if (stuck) {  
    image_xscale = base_xscale  
    speed = 0 
    resetStars(100)
    switch (stuckTo.object_index) {
        case objHook:
            image_angle = 90
            x = objHook.x
            y = objHook.y
        break;
        case objHarpoon:
            var _offset = 150
            x = stuckTo.x + lengthdir_x(_offset, stuckTo.image_angle)
            y = stuckTo.y + lengthdir_y(_offset, stuckTo.image_angle)
        break;
        case objMiniHook:
            x = stuckTo.x;
            y = stuckTo.y;
        break;
    }
} else {
    
    state()
    
}


if (speed <= 0 ) {
    speed = 0
}

var _followDistance = 80
