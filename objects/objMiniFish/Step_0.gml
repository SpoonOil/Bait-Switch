/// @description 

if (stuck) {
    speed = 0
    switch (stuckTo.object_index) {
        case objHook:
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

} else if (magnetized) {
    
} else {
    updatePosition()
}



