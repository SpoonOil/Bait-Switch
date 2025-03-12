/// @description 



if (stuck) {
    speed= 0
    x = stuckTo.x
    y = stuckTo.y
    
    image_angle = 90
} else {
    var gap = room_width
    if (x > room_width + gap) {
        y+= 250
        direction = 174
        image_yscale = -scale
    } if (x < -gap) {
        y+= 250
        direction = 6
        image_yscale= scale
    }
    image_angle = direction
}

