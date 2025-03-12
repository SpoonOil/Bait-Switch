/// @description 



if (stuck) {
    speed= 0
    
    x = stuckTo.x
    y = stuckTo.y
    
    image_angle = 120
} else {
    direction+=vangle
    image_angle+=vangle
    if (direction == 0 || direction == 320) {
        vangle*=-1
    }
}