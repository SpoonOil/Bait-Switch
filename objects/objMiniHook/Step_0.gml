/// @description 
image_angle = direction + 90

if (speed = 0 || reeling) {
    direction = point_direction(targetX,targetY, x, y)
    if (objHook.state() = "reeling") {
        targetY+= objHook.vy
        speed = objHook.vy
        reeling = true
    } else {
        y++;
    }
}
